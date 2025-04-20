openssl genrsa -out reader1.key 2048
openssl req -new -key reader1.key -out reader1.csr -subj "/CN=reader1/O=viewers"
openssl x509 -req -in reader1.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out reader1.crt -days 365
kubectl config set-credentials reader1 --client-certificate=reader1.crt --client-key=reader1.key
kubectl config set-context reader1-context@minikube --cluster=minikube --user=reader1

openssl genrsa -out writer1.key 2048
openssl req -new -key writer1.key -out writer1.csr -subj "/CN=writer1/O=viewers"
openssl x509 -req -in writer1.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out writer1.crt -days 365
kubectl config set-credentials writer1 --client-certificate=writer1.crt --client-key=writer1.key
kubectl config set-context writer1-context@minikube --cluster=minikube --user=writer1