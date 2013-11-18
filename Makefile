SRC_DIR = .
BUILD_DIR = ./public

all: clean
	cp -r ${SRC_DIR}/img ${BUILD_DIR}/
	mkdir ${BUILD_DIR}/styles
	mkdir ${BUILD_DIR}/js
	cp ${SRC_DIR}/styles/nyroModal.css ${BUILD_DIR}/styles/
	lessc ${SRC_DIR}/styles/nyroModal.css --compress \
		> ${BUILD_DIR}/styles/nyroModal.min.css 

	cp ${SRC_DIR}/js/jquery.nyroModal-ie6.js ${BUILD_DIR}/js/
	uglifyjs -nc ${BUILD_DIR}/js/jquery.nyroModal-ie6.js \
		> ${BUILD_DIR}/js/jquery.nyroModal-ie6.min.js

	
	echo "/* Custom build: `date` /*" \
		> ${BUILD_DIR}/js/jquery.nyroModal.custom.js
	cat ${SRC_DIR}/js/jquery.nyroModal.js \
		${SRC_DIR}/js/jquery.nyroModal.anims.fade.js \
		${SRC_DIR}/js/jquery.nyroModal.filters.title.js \
		${SRC_DIR}/js/jquery.nyroModal.filters.gallery.js \
		${SRC_DIR}/js/jquery.nyroModal.filters.link.js \
		${SRC_DIR}/js/jquery.nyroModal.filters.dom.js \
		${SRC_DIR}/js/jquery.nyroModal.filters.image.js \
		${SRC_DIR}/js/jquery.nyroModal.filters.iframe.js \
		>> ${BUILD_DIR}/js/jquery.nyroModal.custom.js
	uglifyjs -nc ${BUILD_DIR}/js/jquery.nyroModal.custom.js \
		> ${BUILD_DIR}/js/jquery.nyroModal.custom.min.js

clean:
	rm -rf ${BUILD_DIR}/*

