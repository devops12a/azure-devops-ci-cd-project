install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt &&\
		pip install locust

test:
	python -m pytest -vv test_hello.py

lint:
	pylint --disable=R,C,W0311 hello.py

all: install lint test

