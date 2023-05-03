
##############################################################
#
# LDD
#
##############################################################

# Changed reference to Assignment 7 hash
LDD_VERSION = '0e7bf0eebbc89aa19d75d7c6cd6f6ee0b6b123f1'

# Changed reference to Assignment 7
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-crankf16'
LDD_SITE_METHOD = git
LDD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Add support for building and installing misc-modules and scull components
#  From Assignment 7 Part 2 Step 3 subsection d

LDD_MODULE_SUBDIRS = scull misc-modules
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
