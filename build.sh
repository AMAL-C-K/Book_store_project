#!/usr/bin/env bash

pip install -r requirements.txt

python manage.py collectstatic --noinput

python manage.py migrate

python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
username='admin';
email='admin@gmail.com';
password='1234';
User.objects.filter(username=username).exists() or User.objects.create_superuser(username, email, password)
"
