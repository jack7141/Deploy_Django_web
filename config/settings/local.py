"""
*개발환경만 처리합니다.
"""


from pathlib import Path
import os
from .base import *
import dotenv
dotenv.load_dotenv()
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
# 암호화 완료
# SECRET_KEY =  os.environ.get('SECRETE_KEY')
SECRET_KEY = os.environ.get('SECRETE_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
# DEBUG = True
DEBUG = True

ALLOWED_HOSTS = ['*']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
