PKG_NAME = gitea
PKG_VERS = 1.17.1
PKG_EXT = tar.gz
PKG_NAME_REAL = gitea
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/go-gitea/gitea/archive
PKG_DIST_FILE = $(PKG_NAME_REAL)-$(PKG_VERS).$(PKG_EXT)
PKG_DIR = $(PKG_NAME_REAL)-$(PKG_VERS)

DEPENDS = native/go

HOMEPAGE = https://gitea.io/
COMMENT  = Git with a cup of tea, painless self-hosted git service
LICENSE  = MIT License

GNU_CONFIGURE = 1

include ../../mk/spksrc.cross-go.mk
