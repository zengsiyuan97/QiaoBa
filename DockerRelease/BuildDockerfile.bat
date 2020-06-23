cd ./../../

pwd

git pull

mvn install

pwd

cp ./target/*.jar ./project-name.jar

docker rmi -f yk/project-name

pwd

docker build -t yk/project-name -f ./DockerRelease/test/Dockerfile .

docker stop project-name
docker rm project-name
docker run  -d  -p 8091:8091 -m 2048m --cpus=1  --name=project-name  yk/project-name 

stateCode=0
webUrl=http://139.196.194.213:8091/systemVersion/checkLine
count=1
function funWithReturn(){
   echo '开始尝试请求'
   local httpCode=0
   httpCode=$(curl -I -m 10 -o /dev/null -s -w %{http_code}  ${webUrl})
   stateCode=$httpCode
   echo $stateCode
   count=`expr $count + 1`
}
while(true)
do
	if [ $count -eq 20 ];then
		echo '请求超时'
                exit
		break
	fi
    sleep 15
	if [ $stateCode -eq 200 ];then
        echo '请求成功'
        break
    else
        funWithReturn
    fi
    echo "已请求次数:" $count
done
echo "等待30秒，等上个服务注册进eureka....."
sleep 30
echo "开始更新下一个服务"

docker stop project-name-back
docker rm project-name-back
docker run  -d  -p 8092:8091 -m 2048m --cpus=1  --name=project-name-back yk/project-name 