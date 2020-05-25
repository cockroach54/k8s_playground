### dockerfile 빌드

마지막으로, Docker이미지를 빌드하고 실행하기 위해 다음 명령어를 실행합시다.

docker build -t flask:latest .
docker run --rm -p 8000:8000 flask

---
### docker hub push

docker login

docker build -t flask:latest .
docker tag flask lsw0504/flask-app:latest
docker push lsw0504/flask-app:latest


---
### kubernetis
kubectl run pppp --image lsw0504/flask-app

kubectl create deployment flask --image lsw0504/flask-app


k get all -o wide
k get pods --show-labels

---
서비스는 좀 개념이 특이함
도커에서 당연히 저절로 설정되던 것이 모두 분리되어 있음
 - https://cloud.google.com/kubernetes-engine/docs/how-to/exposing-apps?hl=ko

ClusterIp(default) - 내부 통신 아이피, 명시적으로 생성해야함
 -> 같은 pod 내에서라면 로컬호스트처럼 통신 가능하지만 다른 pod사이에선 명시적인 지정 필요
NoePort - 가진 노드의 모든 포트를 개방
 -> 말 그대로 노드임... pod아님 주의, 노드포트를 열면 각 노드의 외부ip를 통해 접근 가능해짐
LoadBalancer - aws, GCE 사용 안하면 플러그인 써야함 ... 쉽지 않음
Ingerss - nginx, haproxy 등을 이용해 포트를 연결해줌
Headless