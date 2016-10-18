#########################
# General Configuration #
#########################
SECRET_KEY = 'not-a-secr3t'

TIME_ZONE = 'America/Los_Angeles'

LOG_RENDERING_PERFORMANCE = True
LOG_CACHE_PERFORMANCE = True
LOG_METRIC_ACCESS = True

####################
# Filesystem Paths #
####################
CONF_DIR = '/etc/graphite'
CONTENT_DIR = '/usr/share/graphite-web/static'
GRAPHITE_ROOT = '/usr/share/graphite-web'
INDEX_FILE = '/var/lib/graphite/search_index'
LOG_DIR = '/var/log/graphite'
STORAGE_DIR = '/var/lib/graphite/whisper'
WHISPER_DIR = '/var/lib/graphite/whisper'

##########################
# Database Configuration #
##########################
DATABASES = {
    'default': {
        'NAME': '/var/lib/graphite/graphite.db',
        'ENGINE': 'django.db.backends.sqlite3',
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': ''
    }
}

##############################
# Additional Django Settings #
##############################
from graphite.app_settings import *

INSTALLED_APPS += (
    'corsheaders',
)

MIDDLEWARE_CLASSES += (
    'corsheaders.middleware.CorsMiddleware',
)

CORS_ORIGIN_ALLOW_ALL = True
