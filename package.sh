set -euxo pipefail

node --experimental-sea-config sea-config.json
cp $(nvm which node || command -v node) bin
codesign --remove-signature bin
npx postject bin NODE_SEA_BLOB sea-inject.blob --sentinel-fuse NODE_SEA_FUSE_fce680ab2cc467b6e072b8b5df1996b2 --macho-segment-name NODE_SEA
codesign --sign - bin
