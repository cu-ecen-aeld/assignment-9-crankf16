
##############################################################
#
# LDD
#
##############################################################

# Changed reference to Assignment 7 hash
LDD_VERSION = '9e4adfdc2951dd668609acf9fc64978fbd81aaa1'

# Changed reference to Assignment 7
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-crankf16.git'
LDD_SITE_METHOD = git
LDD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Add support for building and installing misc-modules and scull components
#  From Assignment 7 Part 2 Step 3 subsection d

LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/

define LDD_INSTALL_TARGET_CMDS
# Load scull driver on start and unload on shutdown
#  From Assignment 7 Part 2 Step 3 subsection e line i
        $(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
        $(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin

# Load faulty driver on start and unload on shutdown
#  From Assignment 7 Part 2 Step 3 subsection e line ii
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin

endef

$(eval $(kernel-module))
$(eval $(generic-package))
