all:
	mkdir -p dist
	npx webpack

production:
	mkdir -p dist
	npx webpack --mode production
	cp src/embed.sh dist/embed.sh
	cp src/THIRD-PARTY-LICENSES.md dist/THIRD-PARTY-LICENSES.md

serve:
	npx webpack serve --open

init:
	npm install
	npx license-checker --production --relativeLicensePath > THIRD-PARTY-LICENSES.md

clean:
	rm dist -f -r

docker-run:
	./docker/run.sh

docker-build:
	cd docker; make docker-build

pack:
	make production
	sed -i.bak -e '/^__MENO_INITIAL_LOADING_DATA_PLACE_HOLDER__/{r ./work/rsd-vidado-area.txt' -e 'd}' ./dist/index.html
