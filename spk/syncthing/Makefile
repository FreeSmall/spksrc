SPK_NAME = syncthing
SPK_VERS = 1.7.1
SPK_REV = 20
SPK_ICON = src/syncthing.png
DSM_UI_DIR = app

DEPENDS = cross/busybox cross/$(SPK_NAME)

UNSUPPORTED_ARCHS = $(PPC_ARCHS)

MAINTAINER = Safihre
DESCRIPTION = Automatically sync files via secure, distributed technology.
DESCRIPTION_FRE = Synchronisation automatique de fichiers via une technologie sécurisée et distribuée.
RELOAD_UI = yes
DISPLAY_NAME = Syncthing
CHANGELOG = "Update to upstream version 1.7.1."
HOMEPAGE = https://www.syncthing.net
LICENSE = MPLv2.0
STARTABLE = yes

WIZARDS_DIR = src/wizard/

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 8384
SERVICE_PORT_TITLE = $(DISPLAY_NAME)

# Admin link for in DSM UI
ADMIN_PORT = $(SERVICE_PORT)

FWPORTS = src/${SPK_NAME}.sc

POST_STRIP_TARGET = syncthing_extra_install

BUSYBOX_CONFIG = usrmng daemon nice
ENV += BUSYBOX_CONFIG="$(BUSYBOX_CONFIG)"

include ../../mk/spksrc.spk.mk

.PHONY: syncthing_extra_install
syncthing_extra_install:
	install -m 755 -d $(STAGING_DIR)/var
	install -m 600 src/config.xml $(STAGING_DIR)/var/config.xml
	install -m 644 src/options.conf $(STAGING_DIR)/var/options.conf
