######################################################################
# 파이썬 환경 설정 3.10 버전으로 개발했음
######################################################################
FROM python:3.10.0 
######################################################################
# DIR 변경 => hoome -> clone -> home/DjangoBlog 이동
######################################################################
RUN echo "docker compose add && 카카오접속 수정"

WORKDIR /home/
RUN git clone https://github.com/jack7141/Deploy_Django_web.git
WORKDIR /home/Deploy_Django_web/
######################################################################
# 라이브러리 설치 및 static 파일 처리를 위해서 collectstatic처리
######################################################################
RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install django-environ 

######################################################################
# DB 설치
######################################################################
RUN pip install mysqlclient

######################################################################
# 포트 노출
######################################################################
EXPOSE 8000
######################################################################
# migrate 자동화 및 settings 설정 배포판으로 수정
# --settings=config.settings.deploy
# gunicorn 설정 좌표
# https://docs.gunicorn.org/en/latest/run.html#django%20Mariadb
######################################################################
CMD ["bash", "-c", "python manage.py collectstatic --no-input --settings=config.settings.deploy && python manage.py migrate --settings=config.settings.deploy && gunicorn config.wsgi --env DJANGO_SETTINGS_MODULE=config.settings.deploy --bind 0.0.0.0:8000"]


