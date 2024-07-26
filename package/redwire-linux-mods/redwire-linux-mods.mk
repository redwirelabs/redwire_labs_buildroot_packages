################################################################################
#
# redwire-linux-mods
#
################################################################################

LINUX_PRE_PATCH_HOOKS += REDWIRE_LINUX_MODS_PATCH_CMD

define REDWIRE_LINUX_MODS_PATCH_CMD
	echo -e '\nsource "redwire_labs/Kconfig"' >> $(@D)/Kconfig

	mkdir -p $(@D)/redwire_labs
	cp $(REDWIRE_LINUX_MODS_PKGDIR)/Kconfig $(@D)/redwire_labs/Kconfig
endef

$(eval $(generic-package))
