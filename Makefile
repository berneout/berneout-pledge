TIMESTAMP=$(shell date --utc --iso-8601=minutes)
MUSTACHE=node_modules/.bin/mustache
JSON=node_modules/.bin/json

all: pledge tmp.json $(MUSTACHE)
	$(MUSTACHE) tmp.json pledge > $(TIMESTAMP)
	gpg --clearsign $(TIMESTAMP)
	mv $(TIMESTAMP) $(TIMESTAMP).txt

.INTERMEDIATE: tmp.json

tmp.json: variables.json
	cat variables.json | $(JSON) -e 'this.PLEDGE_TIMESTAMP="$(TIMESTAMP)"' > $@

$(MUSTACHE) $(JSON):
	npm install
