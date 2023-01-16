mode=""

if [ "$1" = "dev" ]; then
    mode="dev"
elif [ "$1" = "stg" ]; then
    mode="stg"
elif [ "$1" = "prod" ]; then
    mode="prod"

fi

flutter run --dart-define=FLAVOR=$mode 