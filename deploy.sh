echo -e "---------docker Login--------"
docker login haomingkeji-docker.pkg.coding.net --username=$1  --password=$2
echo -e "---------docker Stop--------"
docker stop nobelium
echo -e "---------docker Rm--------"
docker rm nobelium && docker rmi haomingkeji-docker.pkg.coding.net/zaixiankaoshi/public/ibule/nobelium:latest
echo -e "---------docker Pull--------"
docker pull haomingkeji-docker.pkg.coding.net/zaixiankaoshi/public/ibule/nobelium:latest
echo -e "---------docker Create and Start--------"
docker run --rm -d -p 8080:80 --name nobelium haomingkeji-docker.pkg.coding.net/zaixiankaoshi/public/ibule/nobelium:latest
echo -e "---------deploy Success--------"
