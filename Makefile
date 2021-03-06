#
# MPContainer makefile
#

regurl=docker.pkg.github.com/${GIT_UN}/mpcontainer

build:
	docker build -t ${regurl}/mpcontainer-mpd:latest -f container-mpd/Dockerfile ./container-mpd/
	docker build -t ${regurl}/mpcontainer-shell:latest -f container-shell/Dockerfile ./container-shell/
	docker build -t ${regurl}/mpcontainer-web:latest -f container-web/Dockerfile ./container-web/
	docker build -t ${regurl}/mpcontainer-pyapp:latest -f container-pyapp/Dockerfile ./container-pyapp/
	docker build -t ${regurl}/mpcontainer-frontend:latest -f container-haproxy/Dockerfile ./container-haproxy/

publish:
	docker push ${regurl}/mpcontainer-mpd:latest
	docker push ${regurl}/mpcontainer-shell:latest
	docker push ${regurl}/mpcontainer-web:latest
	docker push ${regurl}/mpcontainer-pyapp:latest
	docker push ${regurl}/mpcontainer-frontend:latest

saveimg:
	docker save mpcontainer-mpd > /opt/mpcontainer/images/mpcontainer-mpd.tar
	docker save mpcontainer-shell > /opt/mpcontainer/images/mpcontainer-shell.tar
	docker save mpcontainer-web > /opt/mpcontainer/images/mpcontainer-web.tar
	docker save mpcontainer-frontend > /opt/mpcontainer/images/mpcontainer-frontend.tar
	docker save mpcontainer-pyapp > /opt/mpcontainer/images/mpcontainer-pyapp.tar