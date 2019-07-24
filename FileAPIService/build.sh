#!/bin/bash
export PYTHONUNBUFFERED=1
if [ ! -d "venv" ]; then
  virtualenv venv
fi
if [ -z "$VIRTUAL_ENV" ]; then
  source venv/bin/activate
fi
if [ -n "$VIRTUAL_ENV" ]; then
  venv/bin/pip install -U pip
  venv/bin/pip install -U -r requirements.txt
  venv/bin/pip freeze --local
fi