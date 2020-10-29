install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv createtest_hello.py

lint:
	pylint --disable=R,C,W0311 hello.py

all: install lint test

