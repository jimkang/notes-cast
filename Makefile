include config.mk

HOMEDIR = $(shell pwd)
PROJECTNAME = notes-cast
APPDIR = /opt/$(PROJECTNAME)
SSHCMD = ssh $(USER)@$(SERVER)
swcast = node $(APPDIR)/lib/static-web-cast/static-web-cast.js
# node_modules/.bin/swcast

sync:
	rsync -a $(HOMEDIR) $(USER)@$(SERVER):/opt/ --exclude node_modules/
	$(SSHCMD) "cd $(APPDIR) && npm install"

pushall: sync run-remote
	git push origin main

run:
	cd $(WEBDIR) && $(swcast) $(APPDIR)/notes-cast-config.js $(APPDIR)/file-info-cache.json > podcast.xml

run-remote:
	$(SSHCMD) "cd $(APPDIR) && make run"

set-up-app-dir:
	ssh $(USER)@$(SERVER) "mkdir -p $(APPDIR)"
