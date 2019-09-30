#!/bin/bash
PYTHON_BINARY=$1
PYTHON_DIR="$(dirname $PYTHON_BINARY)"

set -e

mkdir -p "$(dirname $PYTHON_BINARY)"

echo '#!/bin/bash' > $PYTHON_BINARY
echo "LD_LIBRARY_PATH=${PYTHON_DIR}/lib:\$LD_LIBRARY_PATH exec ${PYTHON_DIR}/bin/pypy \"\$@\"" >> $PYTHON_BINARY

chmod +x $PYTHON_BINARY
