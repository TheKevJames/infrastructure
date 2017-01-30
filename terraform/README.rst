Terraform
=========

Notes
-----

kswapd0 bug
~~~~~~~~~~~

See the `kswapd0 bug issue report`_. The fix is to run the following regularly.

::

    echo 1 > /proc/sys/vm/drop_caches

This fix is in crontab.root.

.. _`kswapd0 bug issue report`: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1518457/+index?comments=all

Local Provisioning
~~~~~~~~~~~~~~~~~~

There's still some provisioning that should be done through terraform, but
given its liable to change now and then and at least partly involves secret
management... shrug. See :code:`provision.sh`.
