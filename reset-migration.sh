#!/bin/bash
set -e

db="music_stream"
username="root"
passwd="root"

echo "==== Recreating database ..."
mariadb -u $username -p${passwd} $db -e "DROP DATABASE $db; CREATE DATABASE $db"

echo "==== Removing all migration ..."
rm -rf Migrations/*

# recreate migration
echo "===== Recreating migrations ..."
migration_name="InitialCreate"
dotnet ef migrations add $migration_name
dotnet ef database update
