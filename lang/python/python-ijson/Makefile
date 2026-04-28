# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-ijson
PKG_VERSION:=3.5.0
PKG_RELEASE:=1

PYPI_NAME:=ijson
PKG_HASH:=94688760720e3f5212731b3cb8d30267f9a045fb38fb3870254e7b9504246f31

PKG_MAINTAINER:=Matthew Cather <mattbob4@gmail.com>
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.txt

PKG_BUILD_DEPENDS:=python-setuptools/host

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-ijson
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Iterative JSON parser with standard Python iterator interfaces
  URL:=https://github.com/ICRAR/ijson
  DEPENDS:=+python3-light +python3-ctypes +python3-decimal +yajl
endef

define Package/python3-ijson/description
ijson is an iterative JSON parser with standard Python iterator interfaces.
It operates as a streaming parser allowing large JSON documents to be processed
without loading the entire structure into memory. It ships a pure Python backend
and optional C extension backends; this package builds with YAJL for the fastest
backend.
endef

TARGET_LDFLAGS += -L$(STAGING_DIR)/usr/lib
TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include

$(eval $(call Py3Package,python3-ijson))
$(eval $(call BuildPackage,python3-ijson))
$(eval $(call BuildPackage,python3-ijson-src))