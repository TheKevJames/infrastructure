Infrastructure
==============

This project is used to configure my physical anything about my personal
projects which can be `terraformed`_.

.. _terraformed: https://www.terraform.io/

CI Credentials
--------------

There are no long-lived credentials in CI. ``.github/workflows/terraform.yml``
authenticates via GitHub OIDC to service accounts defined in ``ci.tf``:

* ``terraform-plan`` runs on every pull request and can be used by any workflow
  in this repo. Anyone who can push a branch can run arbitrary code with it
  (eg. through an ``external`` data source), so it is read-only and should be
  treated as public, along with everything it can read, including state. Do
  not grant it anything you would not publish.
* ``terraform-apply`` runs on pushes to ``master`` and can only be used from
  that branch. It is a project owner.

Provider secrets live in Secret Manager: a read-only variant which only
``terraform-plan`` can access and a read-write variant which only
``terraform-apply`` can access. Read them through ``ephemeral`` resources so
that they never reach state. Values are added by hand::

    pbpaste | gcloud secrets versions add cloudflare-read --data-file=-
    pbpaste | gcloud secrets versions add cloudflare-edit --data-file=-

To plan or apply locally with your own credentials, the read token is used by
default; pass ``-var cloudflare_token_secret=cloudflare-edit`` to apply.
