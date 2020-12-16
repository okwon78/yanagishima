
set -e
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR
echo ">> DIR: ${DIR}"

$DIR/conf/yanagishima.properties

declare -A PARAMS
PARAMS=(
  ["PRESTO_COODINATOR_URL"]=${PRESTO_COODINATOR_URL}
  ["CATALOG"]=${CATALOG}
  ["SCHEMA"]=${SCHEMA}
)

for key in "${!PARAMS[@]}"; do
  sed -i -e "s|\${${key}}|${PARAMS[$key]}|g" ${CONF_FILE}
done


$DIR/script/start.sh