o -e "---------docker Login--------"
docker login ghcr.io --username=$1  --password=$2
echo -e "---------docker Stop--------"
docker stop nobelium
echo -e "---------docker Rm--------"
docker rm nobelium && docker rmi ghcr.io/ibule/nobelium:latest
echo -e "---------docker Pull--------"
docker pull ghcr.io/ibule/nobelium:latest
echo -e "---------docker Create and Start--------"
docker run --rm -d -p 8080:80 --name nobelium ghcr.io/ibule/nobelium:latest
echo -e "---------deploy Success--------"