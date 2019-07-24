source build.sh
pylint src/*.py --disable=C,R,W
coverage run --source src/ tests/test.py;
coverage report