build:
	docker build -t my-haproxy .

check: build
	docker run -it --rm --name haproxy-syntax-check my-haproxy haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg

run: check
	docker run -d --name my-running-haproxy -p 8080:8080 my-haproxy

stop:
	docker stop my-running-haproxy
	docker rm my-running-haproxy

logs:
	docker logs -f my-running-haproxy

restart: stop run

