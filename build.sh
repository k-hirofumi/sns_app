mode=""

if [ "$1" = "dev" ]; then
    mode="dev"
    ip=`ifconfig en0 | awk '$1 == "inet" {print $2}'`
    baseUrl="http://${ip}/app.api"
elif [ "$1" = "stg" ]; then
    mode="stg"

elif [ "$1" = "prod" ]; then
    mode="prod"


fi

echo $baseUrl
flutter build --dart-define=FLAVOR=$mode --dart-define=BASE_URL=$baseUrl