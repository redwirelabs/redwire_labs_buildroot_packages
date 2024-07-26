################################################################################
#
# linux-mods
#
################################################################################

LINUX_PRE_PATCH_HOOKS += LINUX_HELPERS_PATCH_CMD

define LINUX_HELPERS_PATCH_CMD
	echo -e '\nsource "redwire_labs/Kconfig"' >> $(@D)/Kconfig

	mkdir -p $(@D)/redwire_labs
	cp $(LINUX_HELPERS_PKGDIR)/Kconfig $(@D)/redwire_labs/Kconfig
endef

$(eval $(generic-package))
