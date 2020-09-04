export JEKYLL_VERSION=3.8

build:
	docker build -t jekyll/jekyll-admin:3.8 .

save:
	docker save -o docker-jekyll.img jekyll/jekyll-admin:$JEKYLL_VERSION

up:
	docker run -p 4000:4000 --name jekyll --restart always -d --volume="${PWD}:/srv/jekyll" -e JEKYLL_ENV=production -it jekyll/jekyll-admin:3.8 bundle exec jekyll serve --host 0.0.0.0 --config _config.yml,_config-datalab.yml

down:
	docker stop jekyll
	docker rm jekyll
