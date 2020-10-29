install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv createtest_hello.py

lint:
	pylint --disable=R,C,W1203 hello.py

all: install lint test

