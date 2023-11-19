#source this file
DIR=$(realpath $(dirname "${BASH_SOURCE[0]}"))
RLROOT=$DIR
export RLROOT

if [ ! -e "$DIR/env/bin/activate" ]; then
  python3 -m venv "$DIR/env" || return # exit on error
  source "$DIR/env/bin/activate"
  echo "Activated virtual env"
  pip3 install --upgrade pip wheel
  pip3 install -r "$DIR/requirements.txt"
else
  source "$DIR/env/bin/activate"
  echo "Activated virtual env"
fi

ABOVE_DIR=$DIR/..
PYTHONPATH=$PYTHONPATH:$DIR:$ABOVE_DIR
export PYTHONPATH
