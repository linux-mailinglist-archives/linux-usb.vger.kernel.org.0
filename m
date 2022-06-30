Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDA85562348
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 21:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbiF3Tfw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 15:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236891AbiF3Tfn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 15:35:43 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDA743AED
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 12:35:40 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id h9-20020a17090a648900b001ecb8596e43so413562pjj.5
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 12:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uv8+h6yL9Evfx5UoFZXukFNFJwhKzIzJGg00ArLSjSs=;
        b=DJjv1H3dKGqOQHjo6lAMGCUuZpg/l5KUouFdbnfTGn7hmFUphFSEGY0T9Y8G/Ch249
         o0Z4jVpRQIQk+MZLaKI8A+0yCLE5vZb4R0PL0LoDQKYpeW0QZlLpSTFk9JfqQKEQ0VKE
         MHPEssqodBtfBBjh8qBZ1a4NOhGDMyHoNc7tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uv8+h6yL9Evfx5UoFZXukFNFJwhKzIzJGg00ArLSjSs=;
        b=z0yqu0bnb8TrsPiCfmSBWQWM0t/2FthAtQUYoPmfwObyxWeHiBv1AND2FrSbF4RNo8
         yJNtB4R39fzVjlKtjj14IGOe6fFdArR/UYsdvLRvJI4+zTyUhEgWCWEFLwkVRl3VpD56
         5X/LBI+NdWnQ5cT/QSipwe2eQkrXVRZ5SELfcXezV14nUhSWGJ3imhhzb29J2+jJvhIA
         TYdOScm8D0TK+lx0hvVHP3Yp1tFTkgQe0nI+l15qVDnh2gd6j9dISxL9nH8tR8xolt3T
         VR1xE0Gb2t05dInr7VS+cDtqb4ONHyshM9tvc9x6OHTV3hfCyk+/A5GmDYL9m5YDEr9q
         J0zQ==
X-Gm-Message-State: AJIora9md7q4ScXlUi+7J+P4laOtRDCepKJvBNCYyzSd3t0/nG4Haqgk
        YK4iKKZsdeRQ8Hd4wS2/Zy7Lgg==
X-Google-Smtp-Source: AGRyM1s1hh77rJ1n+hE8ZkQDlFd3CgoPo9sAbyGAmFCb4EfIlczcP9kJr0QQrgKGhDLhWF0FsTvjWA==
X-Received: by 2002:a17:902:9a44:b0:16a:585b:5a16 with SMTP id x4-20020a1709029a4400b0016a585b5a16mr15784717plv.154.1656617739859;
        Thu, 30 Jun 2022 12:35:39 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:9fbf:277c:23e1:eabb])
        by smtp.gmail.com with UTF8SMTPSA id cp2-20020a170902e78200b001664d88aab3sm13819582plb.240.2022.06.30.12.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:35:39 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Subject: [PATCH v24 3/4] usb: misc: Add onboard_usb_hub driver
Date:   Thu, 30 Jun 2022 12:35:29 -0700
Message-Id: <20220630123445.v24.3.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220630193530.2608178-1-mka@chromium.org>
References: <20220630193530.2608178-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The main issue this driver addresses is that a USB hub needs to be
powered before it can be discovered. For discrete onboard hubs (an
example for such a hub is the Realtek RTS5411) this is often solved
by supplying the hub with an 'always-on' regulator, which is kind
of a hack. Some onboard hubs may require further initialization
steps, like changing the state of a GPIO or enabling a clock, which
requires even more hacks. This driver creates a platform device
representing the hub which performs the necessary initialization.
Currently it only supports switching on a single regulator, support
for multiple regulators or other actions can be added as needed.
Different initialization sequences can be supported based on the
compatible string.

Besides performing the initialization the driver can be configured
to power the hub off during system suspend. This can help to extend
battery life on battery powered devices which have no requirements
to keep the hub powered during suspend. The driver can also be
configured to leave the hub powered when a wakeup capable USB device
is connected when suspending, and power it off otherwise.

Technically the driver consists of two drivers, the platform driver
described above and a very thin USB driver that subclasses the
generic driver. The purpose of this driver is to provide the platform
driver with the USB devices corresponding to the hub(s) (a hub
controller may provide multiple 'logical' hubs, e.g. one to support
USB 2.0 and another for USB 3.x).

Co-developed-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
Signed-off-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v24:
- changed USB_ONBOARD_HUB from bool to tristate and fixed Makefile
  entry
- renamed 'companion-hub' property to 'peer-hub'
- added comment to onboard_hub_create_pdevs() doc that explains the
  somewhat convoluted logic of the function
- only cancel the driver attach work in onboard_hub_remove() if the
  function wasn't called by the work itself

Changes in v23:
- refactored onboard_hub_create_pdevs()
  - bail out before the loop for root hubs connected to
    the secondary HCD
  - check for exisiting pdev in the companion hub branch
    instead of doing it afterwards
- added note about the role of the platform devices to
  documentation of onboard_hub_create_pdevs()
- got rid of CONFIG_USB_ONBOARD_HUB_ACTUAL, it's not needed anymore
  now that onboard_hub_create/destroy_pdevs() are linked into the USB
  core
- added some more details to comment about the need to re-attach the
  USB driver

Changes in v22:
- moved onboard_hub_create_pdevs(), onboard_hub_destroy_pdevs() and
  of_is_onboard_usb_hub() into a separate file to allow them to be
  linked into the USB core module (if CONFIG_USB=m)
- Added extra checks to ensure only one platform device is created
  for each physical hub. This is necessary because
  onboard_hub_create_pdevs() is now called from hub_probe() instead
  of usb_add_hcd(). As a result the function is called twice for
  typical USB3 hub, once for the USB3 part of the hub, and once for
  USB <= 2.x. Generally the parent hub downstream of the primary HCD
  creates the onboard hub platform device.
- use kzalloc() instead of devm_kzalloc() to allocate list entries. Using
  managed memory can cause issues since the managed memory is allocated
  before the device is probed.
- use a workqueue to (re-)attach the USB driver during/after _probe().
  This is necessary to avoid self-deadlocks on systems with nested
  onboard hubs.
- don't initialize list_head in onboard_hub_create_pdevs(), this needs
  to be done by the owner, to ensure that onboard_hub_destroy_pdevs()
  is called with a struct that was properly initialized even when
  onboard_hub_create_pdevs() is not called.
- moved 'onboard_hub_match' into an include, so it can be used
  by both the the onboard hub driver and of_is_onboard_usb_hub()
- removed note from the commit message which said that currently only
  onboard hubs connected to a root hub are supported. This isn't the
  case anymore.
- updated kernel version and date in sysfs documentation
- removed tags from Doug and Alan since this version changes quite
  a few things

Changes in v21:
- refactored _find_onboard_hub()
  - check presence of drvdata instead of using device_is_bound()
  - return -ENODEV if the platform device can't be found
  - always check drvdata, not only when looking for the companion
    hub
  - added comment explaining probe deferral
- removed 'onboard_hub_dev' symlinks from USB devices
- updated documentation of 'always_powered_in_suspend' sysfs attribute

Changes in v20:
- s/nontrivial/non-trivial/ in Kconfig doc
- added include of 'export.h'
- initialize variable 'power_off' in onboard_hub_suspend() at
  declaration time
- renamed set_udev_link_name() to get_udev_link_name()
- use kzalloc to allocate struct usbdev_node instead of devm_kzalloc()
- release the lock in onboard_hub_add_usbdev() before calling
  get_udev_link_name()
- free struct usbdev_node in onboard_hub_remove_usbdev(), now that
  it doesn't used managed memory
- make struct onboard_hub const in always_powered_in_suspend_show()
- call put_device() if pdev is not bound in _find_onboard_hub()
- get driver data before calling put_device() in _find_onboard_hub()
- log platform device name when sysfs link creation fails in
  onboard_hub_usbdev_probe()
- added kernel doc for onboard_hub_create_pdevs() and
  onboard_hub_destroy_pdevs()
- added 'Reviewed-by' tag from Doug

Changes in v19:
- added VID:PID pairs and compatible strings for RTS5414 hub
- updated comments with RTS5411 USB versions to reflect those
  reported/supported by the hub

Changes in v18:
- introduced hidden Kconfig option to align module vs. builtin
  choice with CONFIG_USB (thanks Doug!)
- refactored onboard_hub_create_pdevs()

Changes in v17:
- updated date and kernel version in ABI documentation for
  'always_powered_in_suspend' attribute
- removed obsolete .yaml entry from MAINTAINERS file
- added entry for ABI documentation to MAINTAINERS file
- renamed struct 'udev_node' to 'usbdev_node'
- changed return logic in onboard_hub_suspend/resume() to
  get rid of 'rc' variable
- added helper set_udev_link_name() to set link names for
  onboard hub USB devices
- use of_parse_phandle() instead of of_property_read_u32() +
  of_find_node_by_phandle() combo
- defer probing in _find_onboard_hub() if the platform device
  isn't bound yet
- initialize list head passed as parameter to
  onboard_hub_create_pdevs() instead of relying on the caller
  to do so
- don't require the 'companion-hub' property to be specified.
  This is needed to support hubs without companion hub
- use devm_kzalloc() to allocate platform device list entries
  and stop freeing them explicitly
- remove unnecessary INIT_LIST_HEAD() of platform device list
  entries
- use '%pOF' to print DT node name
- delete platform device list entries from the list of devices
  in onboard_hub_destroy_pdevs(). It shouldn't be strictly
  necessary, but better be on the safe side.

Changes in v16:
- none

Changes in v15:
- none

Changes in v14:
- none

Changes in v13:
- none

Changes in v12:
- use IS_ENABLED(CONFIG_USB_ONBOARD_HUB_MODULE) in onboard_hub.h to
  also check for the driver built as module
- include onboard_hub.h again from the driver to make sure there are
  prototype declarations for the public functions
- remove indentation from label in onboard_hub_create_pdevs()

Changes in v11:
- added onboard_hub_create/destroy_pdevs() helpers, to support multiple onboard
  hubs connected to the same parent hub
- don't include ‘onboard_hub.h’ from the onboard hub driver
- updated commit message
- added ‘Acked-by' from Alan

Changes in v10:
- always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=y/m

Changes in v9:
- none

Changes in v8:
- none

Changes in v7:
- don't declare stub for of_is_onboard_usb_hub() when
  CONFIG_COMPILE_TEST is defined

Changes in v6:
- use 'companion-hub' to locate the platform device, instead of
  scanning through the nodes of the parent
- added ABI documentation for 'always_powered_in_suspend'
- sysfs_emit() instead of sprintf() in always_powered_in_suspend_show()
- register sysfs attribute through driver.dev_groups
- evaluate return value of driver_attach() in _probe()
- use dev_warn() instead of WARN_ON() in _probe()
- include 'onboard_hub.h'

Changes in v5:
- the platform device is now instantiated from the same DT node
  as the 'primary' USB hub device
  - use the USB compatible strings for the platform device
  - refactored _find_onboard_hub() to search the parents child
    nodes for a platform device with a matching compatible string
  - added exported function of_is_onboard_usb_hub() to allow other
    drivers (like xhci_plat) to check if one of their child DT nodes
    is a supported hub
- use late suspend to make sure info about wakeup enabled descendants
  is updated
- call driver_attach() for the USB driver in onboard_hub_probe() to
  make sure the driver is re-attached after the device_release_driver()
  calls in onboard_hub_remove()
- renamed sysfs attribute 'power_off_in_suspend' to
  'always_powered_in_suspend'
- added sysfs symlinks between platform device and USB devices
- marked 'onboard_hub_pm_ops' as __maybe_unused
- removed 'realtek' compatible string which is not needed at this
  point
- fix log for regulator_disable() failure

Changes in v4:
- updated Kconfig documentation
- changed the loop in onboard_hub_remove() to release the hub lock
  before unbinding the USB device and make self deadlock prevention
  less clunky
- fixed return value in onboard_hub_usbdev_probe()
- added entry to MAINTAINERS file

Changes in v3:
- updated the commit message
- updated description in Kconfig
- remove include of 'core/usb.h'
- use 'is_powered_on' flag instead of 'has_wakeup_capable_descendants'
- added 'going_away' flag to struct onboard_hub
  - don't allow adding new USB devices when the platform device is going away
  - don't bother with deleting the list item in onboard_hub_remove_usbdev()
    when the platform device is going away
- don't assume in onboard_hub_suspend() that all USB hub devices are
  connected to the same controller
- removed unnecessary devm_kfree() from onboard_hub_remove_usbdev()
- fixed error handling in onboard_hub_remove_usbdev()
- use kstrtobool() instead of strtobool() in power_off_in_suspend_store()
- unbind USB devices in onboard_hub_remove() to avoid dangling references
  to the platform device
- moved put_device() for platform device to _find_onboard_hub()
- changed return value of onboard_hub_remove_usbdev() to void
- evaluate return value of onboard_hub_add_usbdev()
- register 'power_off_in_suspend' as managed device attribute
- use USB_DEVICE macro instead manual initialization
- add unwinding to onboard_hub_init()
- updated MODULE_DESCRIPTION
- use module_init() instead of device_initcall()

Changes in v2:
- check wakeup enabled state of the USB controller instead of
  using 'wakeup-source' property
- use sysfs attribute instead of DT property to determine if
  the hub should be powered off at all during system suspend
- added missing brace in onboard_hub_suspend()
- updated commit message
- use pm_ptr for pm_ops as suggested by Alan

Changes in v1:
- renamed the driver to 'onboard_usb_hub'
- single file for platform and USB driver
- USB hub devices register with the platform device
  - the DT includes a phandle of the platform device
- the platform device now controls when power is turned off
- the USB driver became a very thin subclass of the generic USB
  driver
- enabled autosuspend support

 .../sysfs-bus-platform-onboard-usb-hub        |   8 +
 MAINTAINERS                                   |   7 +
 drivers/usb/core/Makefile                     |   4 +
 drivers/usb/misc/Kconfig                      |  16 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/onboard_usb_hub.c            | 428 ++++++++++++++++++
 drivers/usb/misc/onboard_usb_hub.h            |  17 +
 drivers/usb/misc/onboard_usb_hub_pdevs.c      | 142 ++++++
 include/linux/usb/onboard_hub.h               |  18 +
 9 files changed, 641 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
 create mode 100644 drivers/usb/misc/onboard_usb_hub.c
 create mode 100644 drivers/usb/misc/onboard_usb_hub.h
 create mode 100644 drivers/usb/misc/onboard_usb_hub_pdevs.c
 create mode 100644 include/linux/usb/onboard_hub.h

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub b/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
new file mode 100644
index 000000000000..42deb0552065
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
@@ -0,0 +1,8 @@
+What:		/sys/bus/platform/devices/<dev>/always_powered_in_suspend
+Date:		June 2022
+KernelVersion:	5.20
+Contact:	Matthias Kaehlcke <matthias@kaehlcke.net>
+		linux-usb@vger.kernel.org
+Description:
+		(RW) Controls whether the USB hub remains always powered
+		during system suspend or not.
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index 3cf9842d9233..8ae44cd423a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14795,6 +14795,13 @@ S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov9734.c
 
+ONBOARD USB HUB DRIVER
+M:	Matthias Kaehlcke <mka@chromium.org>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
+F:	drivers/usb/misc/onboard_usb_hub.c
+
 ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	linux-mtd@lists.infradead.org
diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
index 18e874b0441e..7d338e9c0657 100644
--- a/drivers/usb/core/Makefile
+++ b/drivers/usb/core/Makefile
@@ -12,6 +12,10 @@ usbcore-$(CONFIG_OF)		+= of.o
 usbcore-$(CONFIG_USB_PCI)		+= hcd-pci.o
 usbcore-$(CONFIG_ACPI)		+= usb-acpi.o
 
+ifdef CONFIG_USB_ONBOARD_HUB
+usbcore-y			+= ../misc/onboard_usb_hub_pdevs.o
+endif
+
 obj-$(CONFIG_USB)		+= usbcore.o
 
 obj-$(CONFIG_USB_LEDS_TRIGGER_USBPORT)	+= ledtrig-usbport.o
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 4c5ddbd75b7e..9367c12c7e6f 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -295,3 +295,19 @@ config BRCM_USB_PINMAP
 	  This option enables support for remapping some USB external
 	  signals, which are typically on dedicated pins on the chip,
 	  to any gpio.
+
+config USB_ONBOARD_HUB
+	tristate "Onboard USB hub support"
+	depends on OF || COMPILE_TEST
+	help
+	  Say Y here if you want to support discrete onboard USB hubs that
+	  don't require an additional control bus for initialization, but
+	  need some non-trivial form of initialization, such as enabling a
+	  power regulator. An example for such a hub is the Realtek
+	  RTS5411.
+
+	  This driver can be used as a module but its state (module vs
+	  builtin) must match the state of the USB subsystem. Enabling
+	  this config will enable the driver and it will automatically
+	  match the state of the USB subsystem. If this driver is a
+	  module it will be called onboard_usb_hub.
diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
index 35bdb4b6c3b6..93581baec3a8 100644
--- a/drivers/usb/misc/Makefile
+++ b/drivers/usb/misc/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_USB_CHAOSKEY)		+= chaoskey.o
 obj-$(CONFIG_USB_SISUSBVGA)		+= sisusbvga/
 obj-$(CONFIG_USB_LINK_LAYER_TEST)	+= lvstest.o
 obj-$(CONFIG_BRCM_USB_PINMAP)		+= brcmstb-usb-pinmap.o
+obj-$(CONFIG_USB_ONBOARD_HUB)		+= onboard_usb_hub.o
diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
new file mode 100644
index 000000000000..6b9b949d17d3
--- /dev/null
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for onboard USB hubs
+ *
+ * Copyright (c) 2022, Google LLC
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/suspend.h>
+#include <linux/sysfs.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/onboard_hub.h>
+#include <linux/workqueue.h>
+
+#include "onboard_usb_hub.h"
+
+static struct usb_device_driver onboard_hub_usbdev_driver;
+
+/************************** Platform driver **************************/
+
+struct usbdev_node {
+	struct usb_device *udev;
+	struct list_head list;
+};
+
+struct onboard_hub {
+	struct regulator *vdd;
+	struct device *dev;
+	bool always_powered_in_suspend;
+	bool is_powered_on;
+	bool going_away;
+	struct list_head udev_list;
+	struct work_struct attach_usb_driver_work;
+	struct mutex lock;
+};
+
+static int onboard_hub_power_on(struct onboard_hub *hub)
+{
+	int err;
+
+	err = regulator_enable(hub->vdd);
+	if (err) {
+		dev_err(hub->dev, "failed to enable regulator: %d\n", err);
+		return err;
+	}
+
+	hub->is_powered_on = true;
+
+	return 0;
+}
+
+static int onboard_hub_power_off(struct onboard_hub *hub)
+{
+	int err;
+
+	err = regulator_disable(hub->vdd);
+	if (err) {
+		dev_err(hub->dev, "failed to disable regulator: %d\n", err);
+		return err;
+	}
+
+	hub->is_powered_on = false;
+
+	return 0;
+}
+
+static int __maybe_unused onboard_hub_suspend(struct device *dev)
+{
+	struct onboard_hub *hub = dev_get_drvdata(dev);
+	struct usbdev_node *node;
+	bool power_off = true;
+
+	if (hub->always_powered_in_suspend)
+		return 0;
+
+	mutex_lock(&hub->lock);
+
+	list_for_each_entry(node, &hub->udev_list, list) {
+		if (!device_may_wakeup(node->udev->bus->controller))
+			continue;
+
+		if (usb_wakeup_enabled_descendants(node->udev)) {
+			power_off = false;
+			break;
+		}
+	}
+
+	mutex_unlock(&hub->lock);
+
+	if (!power_off)
+		return 0;
+
+	return onboard_hub_power_off(hub);
+}
+
+static int __maybe_unused onboard_hub_resume(struct device *dev)
+{
+	struct onboard_hub *hub = dev_get_drvdata(dev);
+
+	if (hub->is_powered_on)
+		return 0;
+
+	return onboard_hub_power_on(hub);
+}
+
+static inline void get_udev_link_name(const struct usb_device *udev, char *buf, size_t size)
+{
+	snprintf(buf, size, "usb_dev.%s", dev_name(&udev->dev));
+}
+
+static int onboard_hub_add_usbdev(struct onboard_hub *hub, struct usb_device *udev)
+{
+	struct usbdev_node *node;
+	char link_name[64];
+	int err;
+
+	mutex_lock(&hub->lock);
+
+	if (hub->going_away) {
+		err = -EINVAL;
+		goto error;
+	}
+
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node) {
+		err = -ENOMEM;
+		goto error;
+	}
+
+	node->udev = udev;
+
+	list_add(&node->list, &hub->udev_list);
+
+	mutex_unlock(&hub->lock);
+
+	get_udev_link_name(udev, link_name, sizeof(link_name));
+	WARN_ON(sysfs_create_link(&hub->dev->kobj, &udev->dev.kobj, link_name));
+
+	return 0;
+
+error:
+	mutex_unlock(&hub->lock);
+
+	return err;
+}
+
+static void onboard_hub_remove_usbdev(struct onboard_hub *hub, const struct usb_device *udev)
+{
+	struct usbdev_node *node;
+	char link_name[64];
+
+	get_udev_link_name(udev, link_name, sizeof(link_name));
+	sysfs_remove_link(&hub->dev->kobj, link_name);
+
+	mutex_lock(&hub->lock);
+
+	list_for_each_entry(node, &hub->udev_list, list) {
+		if (node->udev == udev) {
+			list_del(&node->list);
+			kfree(node);
+			break;
+		}
+	}
+
+	mutex_unlock(&hub->lock);
+}
+
+static ssize_t always_powered_in_suspend_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	const struct onboard_hub *hub = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", hub->always_powered_in_suspend);
+}
+
+static ssize_t always_powered_in_suspend_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct onboard_hub *hub = dev_get_drvdata(dev);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret < 0)
+		return ret;
+
+	hub->always_powered_in_suspend = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(always_powered_in_suspend);
+
+static struct attribute *onboard_hub_attrs[] = {
+	&dev_attr_always_powered_in_suspend.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(onboard_hub);
+
+static void onboard_hub_attach_usb_driver(struct work_struct *work)
+{
+	int err;
+
+	err = driver_attach(&onboard_hub_usbdev_driver.drvwrap.driver);
+	if (err)
+		pr_err("Failed to attach USB driver: %d\n", err);
+}
+
+static int onboard_hub_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct onboard_hub *hub;
+	int err;
+
+	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
+	if (!hub)
+		return -ENOMEM;
+
+	hub->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(hub->vdd))
+		return PTR_ERR(hub->vdd);
+
+	hub->dev = dev;
+	mutex_init(&hub->lock);
+	INIT_LIST_HEAD(&hub->udev_list);
+
+	dev_set_drvdata(dev, hub);
+
+	err = onboard_hub_power_on(hub);
+	if (err)
+		return err;
+
+	/*
+	 * The USB driver might have been detached from the USB devices by
+	 * onboard_hub_remove() (e.g. through an 'unbind' by userspace),
+	 * make sure to re-attach it if needed.
+	 *
+	 * This needs to be done deferred to avoid self-deadlocks on systems
+	 * with nested onboard hubs.
+	 */
+	INIT_WORK(&hub->attach_usb_driver_work, onboard_hub_attach_usb_driver);
+	schedule_work(&hub->attach_usb_driver_work);
+
+	return 0;
+}
+
+static int onboard_hub_remove(struct platform_device *pdev)
+{
+	struct onboard_hub *hub = dev_get_drvdata(&pdev->dev);
+	struct usbdev_node *node;
+	struct usb_device *udev;
+
+	hub->going_away = true;
+
+	if (&hub->attach_usb_driver_work != current_work())
+		cancel_work_sync(&hub->attach_usb_driver_work);
+
+	mutex_lock(&hub->lock);
+
+	/* unbind the USB devices to avoid dangling references to this device */
+	while (!list_empty(&hub->udev_list)) {
+		node = list_first_entry(&hub->udev_list, struct usbdev_node, list);
+		udev = node->udev;
+
+		/*
+		 * Unbinding the driver will call onboard_hub_remove_usbdev(),
+		 * which acquires hub->lock.  We must release the lock first.
+		 */
+		get_device(&udev->dev);
+		mutex_unlock(&hub->lock);
+		device_release_driver(&udev->dev);
+		put_device(&udev->dev);
+		mutex_lock(&hub->lock);
+	}
+
+	mutex_unlock(&hub->lock);
+
+	return onboard_hub_power_off(hub);
+}
+
+MODULE_DEVICE_TABLE(of, onboard_hub_match);
+
+static const struct dev_pm_ops __maybe_unused onboard_hub_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(onboard_hub_suspend, onboard_hub_resume)
+};
+
+static struct platform_driver onboard_hub_driver = {
+	.probe = onboard_hub_probe,
+	.remove = onboard_hub_remove,
+
+	.driver = {
+		.name = "onboard-usb-hub",
+		.of_match_table = onboard_hub_match,
+		.pm = pm_ptr(&onboard_hub_pm_ops),
+		.dev_groups = onboard_hub_groups,
+	},
+};
+
+/************************** USB driver **************************/
+
+#define VENDOR_ID_REALTEK	0x0bda
+
+/*
+ * Returns the onboard_hub platform device that is associated with the USB
+ * device passed as parameter.
+ */
+static struct onboard_hub *_find_onboard_hub(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct onboard_hub *hub;
+
+	pdev = of_find_device_by_node(dev->of_node);
+	if (!pdev) {
+		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
+		if (!np) {
+			dev_err(dev, "failed to find device node for peer hub\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+
+		if (!pdev)
+			return ERR_PTR(-ENODEV);
+	}
+
+	hub = dev_get_drvdata(&pdev->dev);
+	put_device(&pdev->dev);
+
+	/*
+	 * The presence of drvdata ('hub') indicates that the platform driver
+	 * finished probing. This handles the case where (conceivably) we could
+	 * be running at the exact same time as the platform driver's probe. If
+	 * we detect the race we request probe deferral and we'll come back and
+	 * try again.
+	 */
+	if (!hub)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return hub;
+}
+
+static int onboard_hub_usbdev_probe(struct usb_device *udev)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_hub *hub;
+	int err;
+
+	/* ignore supported hubs without device tree node */
+	if (!dev->of_node)
+		return -ENODEV;
+
+	hub = _find_onboard_hub(dev);
+	if (IS_ERR(hub))
+		return PTR_ERR(hub);
+
+	dev_set_drvdata(dev, hub);
+
+	err = onboard_hub_add_usbdev(hub, udev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
+{
+	struct onboard_hub *hub = dev_get_drvdata(&udev->dev);
+
+	onboard_hub_remove_usbdev(hub, udev);
+}
+
+static const struct usb_device_id onboard_hub_id_table[] = {
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
+	{}
+};
+MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
+
+static struct usb_device_driver onboard_hub_usbdev_driver = {
+	.name = "onboard-usb-hub",
+	.probe = onboard_hub_usbdev_probe,
+	.disconnect = onboard_hub_usbdev_disconnect,
+	.generic_subclass = 1,
+	.supports_autosuspend =	1,
+	.id_table = onboard_hub_id_table,
+};
+
+static int __init onboard_hub_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&onboard_hub_driver);
+	if (ret)
+		return ret;
+
+	ret = usb_register_device_driver(&onboard_hub_usbdev_driver, THIS_MODULE);
+	if (ret)
+		platform_driver_unregister(&onboard_hub_driver);
+
+	return ret;
+}
+module_init(onboard_hub_init);
+
+static void __exit onboard_hub_exit(void)
+{
+	usb_deregister_device_driver(&onboard_hub_usbdev_driver);
+	platform_driver_unregister(&onboard_hub_driver);
+}
+module_exit(onboard_hub_exit);
+
+MODULE_AUTHOR("Matthias Kaehlcke <mka@chromium.org>");
+MODULE_DESCRIPTION("Driver for discrete onboard USB hubs");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
new file mode 100644
index 000000000000..d3a5b6938582
--- /dev/null
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (c) 2022, Google LLC
+ */
+
+#ifndef _USB_MISC_ONBOARD_USB_HUB_H
+#define _USB_MISC_ONBOARD_USB_HUB_H
+
+static const struct of_device_id onboard_hub_match[] = {
+	{ .compatible = "usbbda,411" },
+	{ .compatible = "usbbda,5411" },
+	{ .compatible = "usbbda,414" },
+	{ .compatible = "usbbda,5414" },
+	{}
+};
+
+#endif /* _USB_MISC_ONBOARD_USB_HUB_H */
diff --git a/drivers/usb/misc/onboard_usb_hub_pdevs.c b/drivers/usb/misc/onboard_usb_hub_pdevs.c
new file mode 100644
index 000000000000..a0a5f719129f
--- /dev/null
+++ b/drivers/usb/misc/onboard_usb_hub_pdevs.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * API for creating and destroying USB onboard hub platform devices
+ *
+ * Copyright (c) 2022, Google LLC
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/of.h>
+
+#include "onboard_usb_hub.h"
+
+struct pdev_list_entry {
+	struct platform_device *pdev;
+	struct list_head node;
+};
+
+static bool of_is_onboard_usb_hub(const struct device_node *np)
+{
+	return !!of_match_node(onboard_hub_match, np);
+}
+
+/**
+ * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
+ * @parent_hub	: parent hub to scan for connected onboard hubs
+ * @pdev_list	: list of onboard hub platform devices owned by the parent hub
+ *
+ * Creates a platform device for each supported onboard hub that is connected to
+ * the given parent hub. The platform device is in charge of initializing the
+ * hub (enable regulators, take the hub out of reset, ...) and can optionally
+ * control whether the hub remains powered during system suspend or not.
+ *
+ * To keep track of the platform devices they are added to a list that is owned
+ * by the parent hub.
+ *
+ * Some background about the logic in this function, which can be a bit hard
+ * to follow:
+ *
+ * Root hubs don't have dedicated device tree nodes, but use the node of their
+ * HCD. The primary and secondary HCD are usually represented by a single DT
+ * node. That means the root hubs of the primary and secondary HCD share the
+ * same device tree node (the HCD node). As a result this function can be called
+ * twice with the same DT node for root hubs. We only want to create a single
+ * platform device for each physical onboard hub, hence for root hubs the loop
+ * is only executed for the root hub of the primary HCD. Since the function
+ * scans through all child nodes it still creates pdevs for onboard hubs
+ * connected to the root hub of the secondary HCD if needed.
+ *
+ * Further there must be only one platform device for onboard hubs with a peer
+ * hub (the hub is a single physical device). To achieve this two measures are
+ * taken: pdevs for onboard hubs with a peer are only created when the function
+ * is called on behalf of the parent hub that is connected to the primary HCD
+ * (directly or through other hubs). For onboard hubs connected to root hubs
+ * the function processes the nodes of both peers. A platform device is only
+ * created if the peer hub doesn't have one already.
+ */
+void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
+{
+	int i;
+	struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
+	struct device_node *np, *npc;
+	struct platform_device *pdev;
+	struct pdev_list_entry *pdle;
+
+	if (!parent_hub->dev.of_node)
+		return;
+
+	if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
+		return;
+
+	for (i = 1; i <= parent_hub->maxchild; i++) {
+		np = usb_of_get_device_node(parent_hub, i);
+		if (!np)
+			continue;
+
+		if (!of_is_onboard_usb_hub(np))
+			goto node_put;
+
+		npc = of_parse_phandle(np, "peer-hub", 0);
+		if (npc) {
+			if (!usb_hcd_is_primary_hcd(hcd)) {
+				of_node_put(npc);
+				goto node_put;
+			}
+
+			pdev = of_find_device_by_node(npc);
+			of_node_put(npc);
+
+			if (pdev) {
+				put_device(&pdev->dev);
+				goto node_put;
+			}
+		}
+
+		pdev = of_platform_device_create(np, NULL, &parent_hub->dev);
+		if (!pdev) {
+			dev_err(&parent_hub->dev,
+				"failed to create platform device for onboard hub '%pOF'\n", np);
+			goto node_put;
+		}
+
+		pdle = kzalloc(sizeof(*pdle), GFP_KERNEL);
+		if (!pdle) {
+			of_platform_device_destroy(&pdev->dev, NULL);
+			goto node_put;
+		}
+
+		pdle->pdev = pdev;
+		list_add(&pdle->node, pdev_list);
+
+node_put:
+		of_node_put(np);
+	}
+}
+EXPORT_SYMBOL_GPL(onboard_hub_create_pdevs);
+
+/**
+ * onboard_hub_destroy_pdevs -- free resources of onboard hub platform devices
+ * @pdev_list	: list of onboard hub platform devices
+ *
+ * Destroys the platform devices in the given list and frees the memory associated
+ * with the list entry.
+ */
+void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
+{
+	struct pdev_list_entry *pdle, *tmp;
+
+	list_for_each_entry_safe(pdle, tmp, pdev_list, node) {
+		list_del(&pdle->node);
+		of_platform_device_destroy(&pdle->pdev->dev, NULL);
+		kfree(pdle);
+	}
+}
+EXPORT_SYMBOL_GPL(onboard_hub_destroy_pdevs);
diff --git a/include/linux/usb/onboard_hub.h b/include/linux/usb/onboard_hub.h
new file mode 100644
index 000000000000..d9373230556e
--- /dev/null
+++ b/include/linux/usb/onboard_hub.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_USB_ONBOARD_HUB_H
+#define __LINUX_USB_ONBOARD_HUB_H
+
+struct usb_device;
+struct list_head;
+
+#if IS_ENABLED(CONFIG_USB_ONBOARD_HUB)
+void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list);
+void onboard_hub_destroy_pdevs(struct list_head *pdev_list);
+#else
+static inline void onboard_hub_create_pdevs(struct usb_device *parent_hub,
+					    struct list_head *pdev_list) {}
+static inline void onboard_hub_destroy_pdevs(struct list_head *pdev_list) {}
+#endif
+
+#endif /* __LINUX_USB_ONBOARD_HUB_H */
-- 
2.37.0.rc0.161.g10f37bed90-goog

