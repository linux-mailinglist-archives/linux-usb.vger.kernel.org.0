Return-Path: <linux-usb+bounces-29234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD4ABD4E25
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 18:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DB675350D8E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 16:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064713112C2;
	Mon, 13 Oct 2025 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dzt5F+xC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5330DD0D;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371438; cv=none; b=DdtL0vKu7nx5V95YF+/GqMrxRgACdipgpEIzjRHOvlsBYpeXkJBaiHhJCubhfW9Dah2OV0U6jy/B4Z5K8h9qoVXNij/JcwJGRvh+6R0VS3F8XfyY8JZQQ2WgslfWUjn0vfGB2a1qftQjtSYCT+GXPg2uppSCp+vav8jf1Eg9q6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371438; c=relaxed/simple;
	bh=RIBWEE3JkR/GSj0no1dERpptc6SWzMFAeXAp9B63Eq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L98M/A8g1bLHXcAyqi71Zk3NPB1f9/LVzvCgDe0BKQnfyoOgj3FFFxYcwImiyqJWWO9XRQG3jWPnR+jiz5NCmltNeU8DTC7kd6RrcZ6PfNTJasAOKm+HwE2wHAkLfVKThv5RN8EOwu7lUFolYpDCV41MXdvRtUYfytimcHT1n5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dzt5F+xC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2941EC2BC87;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760371438;
	bh=RIBWEE3JkR/GSj0no1dERpptc6SWzMFAeXAp9B63Eq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dzt5F+xCdpYRRI8E3P6McFO4EBrOn3h1sv8aMkgMZM82dc8GxspRh5HnxeCUlzMYP
	 MuT07VGxKIoCWe0S1WSl2N3AY8Zy3RKiWIlcb+hA78leTOqwiT5o/7r2lb5h/HxigD
	 +AOgWsT7bo5i9cVmoUj9YHvrYp7DQePhcHfebibsiaByOx+yNYhqOJQxCxH7cqhJLs
	 ukPI7eBD5pf1/JxX/pEeVYIAMPIRC8uA+miJcotUcjaKRvSKICtbj+qHvQh3MTF7Mp
	 qmlZUJWHOEeI4quYKnhL5KO+Dhw6kPnDzqD4HX8i2M8c6vYw6O5iOuI59L/F7Vlyk8
	 FT163rDdMRjxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21566CCD190;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Mon, 13 Oct 2025 16:03:29 +0000
Subject: [PATCH 5/5] usb: dwc3: Add Apple Silicon DWC3 glue layer driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-b4-aplpe-dwc3-v1-5-12a78000c014@kernel.org>
References: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
In-Reply-To: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20457; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=RIBWEE3JkR/GSj0no1dERpptc6SWzMFAeXAp9B63Eq8=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zbpdef50/dqL+L9aQ/8/e3Jp/qy7fs1Mh88LckaNP0F
 7XLhA7M7ChlYRDjYJAVU2TZvt/e9MnDN4JLN116DzOHlQlkCAMXpwBM5Ptrhn8WjxkazLh3r6ny
 3CNuzWe8aaE8960PIYU8wdUSNtJxspMZGRp+dt6d0CuXsCG2Xfk579cTFbc7lbnXm0RdqDB9zbf
 /NB8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The dwc3 controller present on Apple Silicon SoCs like the M1 requires
a specific order of operations synchronized between its PHY and its
Type-C controller. Specifically, the PHY first has to go through initial
bringup (which requires knowledge of the lane mode and orientation)
before dwc3 itself can be brought up and can then finalize the PHY
configuration.
Additionally, dwc3 has to be teared down and re-initialized whenever
the cable is changed due to hardware quirks that prevent a new device
from being recognized and due to the PHY being unable to switch lane
mode or orientation while dwc3 is up and running.

These controllers also have a Apple-specific MMIO region after the
common dwc3 region where some controls have to be updated. PHY bringup
and shutdown also requires SUSPHY to be enabled for the ports to work
correctly.

In the future, this driver will also gain support for USB3-via-USB4
tunneling which will require additional tweaks.

Add a glue driver that takes of all of these constraints.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 MAINTAINERS                   |   1 +
 drivers/usb/dwc3/Kconfig      |  11 +
 drivers/usb/dwc3/Makefile     |   1 +
 drivers/usb/dwc3/dwc3-apple.c | 488 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 501 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa238b5371b9c5942dc89ec4fa6b1d28e2d4dda3..28bfefd7ecb895e2721800dbb3b954c4bdd9f539 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2462,6 +2462,7 @@ F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
 F:	drivers/spmi/spmi-apple-controller.c
+F:	drivers/usb/dwc3/dwc3-apple.c
 F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 4925d15084f816d3ff92059b476ebcc799b56b51..bf3e04635131005096c6bc1802b251490ad2f483 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -200,4 +200,15 @@ config USB_DWC3_GENERIC_PLAT
 	  the dwc3 child node in the device tree.
 	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
 
+config USB_DWC3_APPLE
+	tristate "Apple Silicon DWC3 Platform Driver"
+	depends on OF && ARCH_APPLE
+	default USB_DWC3
+	select USB_ROLE_SWITCH
+	help
+	  Support Apple Silicon SoCs with DesignWare Core USB3 IP.
+	  The DesignWare Core USB3 IP has to be used in dual-role
+	  mode on these machines.
+	  Say 'Y' or 'M' if you have such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 96469e48ff9d189cc8d0b65e65424eae2158bcfe..89d46ab5006856c51b5007ecdd8fbdf431ecba40 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -43,6 +43,7 @@ endif
 ##
 
 obj-$(CONFIG_USB_DWC3_AM62)		+= dwc3-am62.o
+obj-$(CONFIG_USB_DWC3_APPLE)		+= dwc3-apple.o
 obj-$(CONFIG_USB_DWC3_OMAP)		+= dwc3-omap.o
 obj-$(CONFIG_USB_DWC3_EXYNOS)		+= dwc3-exynos.o
 obj-$(CONFIG_USB_DWC3_PCI)		+= dwc3-pci.o
diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
new file mode 100644
index 0000000000000000000000000000000000000000..e9dd6b22f485daed01618e64d93a40487fb20e3c
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-apple.c
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Silicon DWC3 Glue driver
+ * Copyright (C) The Asahi Linux Contributors
+ *
+ * Based on:
+ *  - dwc3-qcom.c Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ *  - dwc3-of-simple.c Copyright (c) 2015 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "glue.h"
+
+/*
+ * This platform requires a very specific sequence of operations to bring up dwc3 and its USB3 PHY:
+ *
+ * 1) The PHY itself has to be brought up; for this we need to know the mode (USB3,
+ *    USB3+DisplayPort, USB4, etc) and the lane orientation. This happens through typec_mux_set.
+ * 2) DWC3 has to be brought up but we must not touch the gadget area or start xhci yet.
+ * 3) The PHY bring-up has to be finalized and dwc3's PIPE interface has to be switched to the
+ *    USB3 PHY, this is done inside phy_set_mode.
+ * 4) We can now initialize xhci or gadget mode.
+ *
+ * We can switch 1 and 2 but 3 has to happen after (1 and 2) and 4 has to happen after 3.
+ *
+ * And then to bring this all down again:
+ *
+ * 1) DWC3 has to exit host or gadget mode and must no longer touch those registers
+ * 2) The PHY has to switch dwc3's PIPE interface back to the dummy backend
+ * 3) The PHY itself can be shut down, this happens from typec_mux_set
+ *
+ * We also can't transition the PHY from one mode to another while dwc3 is up and running (this is
+ * slightly wrong, some transitions are possible, others aren't but because we have no documentation
+ * for this I'd rather play it safe).
+ *
+ * After both the PHY and dwc3 are initialized we will only ever see a single "new device connected"
+ * event. If we just keep them running only the first device plugged in will ever work. XHCI's port
+ * status register actually does show the correct state but no interrupt ever comes in. In gadget
+ * mode we don't even get a USBDisconnected event and everything looks like there's still something
+ * connected on the other end.
+ * This can be partially explained because the USB2 D+/D- lines are connected through a stateful
+ * eUSB2 repeater which in turn is controlled by a variant of the TI TPS6598x USB PD chip which
+ * resets the repeater out-of-band everytime the CC lines are (dis)connected. This then requires a
+ * PHY reset to make sure the PHY and the eUSB2 repeater state are synchronized again.
+ *
+ * And to make this all extra fun: If we get the order of some of this wrong either the port is just
+ * broken until a phy+dwc3 reset, or it's broken until a full SoC reset (likely because we can't
+ * reset some parts of the PHY), or some watchdog kicks in after a few seconds and forces a full SoC
+ * reset (mostly seen this with USB4/Thunderbolt but there's clearly some watchdog that hates
+ * invalid states).
+ *
+ * Hence there's really no good way to keep dwc3 fully up and running after we disconnect a cable
+ * because then we can't shut down the PHY anymore. And if we kept the PHY running in whatever mode
+ * it was until the next cable is connected we'd need to tear it all down and bring it back up again
+ * anyway to detect and use the next device.
+ *
+ * Instead, we just shut down everything when a cable is disconnected and transition to
+ * DWC3_APPLE_NO_CABLE.
+ * During initial probe we don't have any information about the connected cable and can't bring up
+ * the PHY properly and thus also can't fully bring up dwc3. Instead, we just keep everything off
+ * and defer the first dwc3 probe until we get the first cable connected event. Until then we stay
+ * in DWC3_APPLE_PROBE_PENDING.
+ * Once a cable is connected we then keep track of the controller mode here by transitioning to
+ * DWC3_APPLE_HOST or DWC3_APPLE_DEVICE.
+ */
+enum dwc3_apple_state {
+	DWC3_APPLE_PROBE_PENDING, /* Before first cable connection, dwc3_core_probe not called */
+	DWC3_APPLE_NO_CABLE, /* No cable connected, dwc3 suspended after dwc3_core_exit */
+	DWC3_APPLE_HOST, /* Cable connected, dwc3 in host mode */
+	DWC3_APPLE_DEVICE, /* Cable connected, dwc3 in device mode */
+};
+
+/**
+ * struct dwc3_apple - Apple-specific DWC3 USB controller
+ * @dwc: Core DWC3 structure
+ * @dev: Pointer to the device structure
+ * @mmio_resource: Resource to be passed to dwc3_core_probe
+ * @apple_regs: Apple-specific DWC3 registers
+ * @resets: Reset control
+ * @role_sw: USB role switch
+ * @lock: Mutex for synchronizing access
+ * @state: Current state of the controller, see documentation for the enum for details
+ */
+struct dwc3_apple {
+	struct dwc3 dwc;
+
+	struct device *dev;
+	struct resource *mmio_resource;
+	void __iomem *apple_regs;
+
+	struct reset_control *resets;
+	struct usb_role_switch *role_sw;
+
+	struct mutex lock;
+
+	enum dwc3_apple_state state;
+};
+
+#define to_dwc3_apple(d) container_of((d), struct dwc3_apple, dwc)
+
+/*
+ * Apple Silicon dwc3 vendor-specific registers
+ *
+ * These registers were identified by tracing XNU's memory access patterns and correlating them with
+ * debug output over serial to determine their names. We don't exactly know what these do but
+ * without these USB3 devices sometimes don't work.
+ */
+#define APPLE_DWC3_REGS_START 0xcd00
+#define APPLE_DWC3_REGS_END 0xcdff
+
+#define APPLE_DWC3_CIO_LFPS_OFFSET 0xcd38
+#define APPLE_DWC3_CIO_LFPS_OFFSET_VALUE 0xf800f80
+
+#define APPLE_DWC3_CIO_BW_NGT_OFFSET 0xcd3c
+#define APPLE_DWC3_CIO_BW_NGT_OFFSET_VALUE 0xfc00fc0
+
+#define APPLE_DWC3_CIO_LINK_TIMER 0xcd40
+#define APPLE_DWC3_CIO_PENDING_HP_TIMER GENMASK(23, 16)
+#define APPLE_DWC3_CIO_PENDING_HP_TIMER_VALUE 0x14
+#define APPLE_DWC3_CIO_PM_LC_TIMER GENMASK(15, 8)
+#define APPLE_DWC3_CIO_PM_LC_TIMER_VALUE 0xa
+#define APPLE_DWC3_CIO_PM_ENTRY_TIMER GENMASK(7, 0)
+#define APPLE_DWC3_CIO_PM_ENTRY_TIMER_VALUE 0x10
+
+static inline void dwc3_apple_writel(struct dwc3_apple *appledwc, u32 offset, u32 value)
+{
+	writel(value, appledwc->apple_regs + offset - APPLE_DWC3_REGS_START);
+}
+
+static inline u32 dwc3_apple_readl(struct dwc3_apple *appledwc, u32 offset)
+{
+	return readl(appledwc->apple_regs + offset - APPLE_DWC3_REGS_START);
+}
+
+static inline void dwc3_apple_mask(struct dwc3_apple *appledwc, u32 offset, u32 mask, u32 value)
+{
+	u32 reg;
+
+	reg = dwc3_apple_readl(appledwc, offset);
+	reg &= ~mask;
+	reg |= value;
+	dwc3_apple_writel(appledwc, offset, reg);
+}
+
+static void dwc3_apple_setup_cio(struct dwc3_apple *appledwc)
+{
+	dwc3_apple_writel(appledwc, APPLE_DWC3_CIO_LFPS_OFFSET, APPLE_DWC3_CIO_LFPS_OFFSET_VALUE);
+	dwc3_apple_writel(appledwc, APPLE_DWC3_CIO_BW_NGT_OFFSET,
+			  APPLE_DWC3_CIO_BW_NGT_OFFSET_VALUE);
+	dwc3_apple_mask(appledwc, APPLE_DWC3_CIO_LINK_TIMER, APPLE_DWC3_CIO_PENDING_HP_TIMER,
+			FIELD_PREP(APPLE_DWC3_CIO_PENDING_HP_TIMER,
+				   APPLE_DWC3_CIO_PENDING_HP_TIMER_VALUE));
+	dwc3_apple_mask(appledwc, APPLE_DWC3_CIO_LINK_TIMER, APPLE_DWC3_CIO_PM_LC_TIMER,
+			FIELD_PREP(APPLE_DWC3_CIO_PM_LC_TIMER, APPLE_DWC3_CIO_PM_LC_TIMER_VALUE));
+	dwc3_apple_mask(appledwc, APPLE_DWC3_CIO_LINK_TIMER, APPLE_DWC3_CIO_PM_ENTRY_TIMER,
+			FIELD_PREP(APPLE_DWC3_CIO_PM_ENTRY_TIMER,
+				   APPLE_DWC3_CIO_PM_ENTRY_TIMER_VALUE));
+}
+
+static void dwc3_apple_set_ptrcap(struct dwc3_apple *appledwc, u32 mode)
+{
+	guard(spinlock_irqsave)(&appledwc->dwc.lock);
+	dwc3_set_prtcap(&appledwc->dwc, mode, false);
+}
+
+static int dwc3_apple_core_probe(struct dwc3_apple *appledwc)
+{
+	struct dwc3_probe_data probe_data = {};
+	int ret;
+
+	lockdep_assert_held(&appledwc->lock);
+	WARN_ON_ONCE(appledwc->state != DWC3_APPLE_PROBE_PENDING);
+
+	appledwc->dwc.dev = appledwc->dev;
+	probe_data.dwc = &appledwc->dwc;
+	probe_data.res = appledwc->mmio_resource;
+	probe_data.ignore_clocks_and_resets = true;
+	probe_data.skip_core_init_mode = true;
+
+	ret = dwc3_core_probe(&probe_data);
+	if (ret)
+		return ret;
+
+	appledwc->state = DWC3_APPLE_NO_CABLE;
+	return 0;
+}
+
+static int dwc3_apple_core_init(struct dwc3_apple *appledwc)
+{
+	int ret;
+
+	lockdep_assert_held(&appledwc->lock);
+
+	switch (appledwc->state) {
+	case DWC3_APPLE_PROBE_PENDING:
+		ret = dwc3_apple_core_probe(appledwc);
+		if (ret)
+			dev_err(appledwc->dev, "Failed to probe DWC3 Core, err=%d\n", ret);
+		break;
+	case DWC3_APPLE_NO_CABLE:
+		ret = dwc3_core_init(&appledwc->dwc);
+		if (ret)
+			dev_err(appledwc->dev, "Failed to initialize DWC3 Core, err=%d\n", ret);
+		break;
+	default:
+		/* Unreachable unless there's a bug in this driver */
+		WARN_ON_ONCE(1);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static void dwc3_apple_phy_set_mode(struct dwc3_apple *appledwc, enum phy_mode mode)
+{
+	lockdep_assert_held(&appledwc->lock);
+
+	/*
+	 * This platform requires SUSPHY to be enabled here already in order to properly configure
+	 * the PHY and switch dwc3's PIPE interface to USB3 PHY.
+	 */
+	dwc3_enable_susphy(&appledwc->dwc, true);
+	phy_set_mode(appledwc->dwc.usb2_generic_phy[0], mode);
+	phy_set_mode(appledwc->dwc.usb3_generic_phy[0], mode);
+}
+
+static int dwc3_apple_init(struct dwc3_apple *appledwc, enum dwc3_apple_state state)
+{
+	int ret, ret_reset;
+
+	lockdep_assert_held(&appledwc->lock);
+
+	ret = reset_control_deassert(appledwc->resets);
+	if (ret) {
+		dev_err(appledwc->dev, "Failed to deassert resets, err=%d\n", ret);
+		return ret;
+	}
+
+	ret = dwc3_apple_core_init(appledwc);
+	if (ret)
+		goto reset_assert;
+
+	/*
+	 * Now that the core is initialized and already went through dwc3_core_soft_reset we can
+	 * configure some unknown Apple-specific settings and then bring up xhci or gadget mode.
+	 */
+	dwc3_apple_setup_cio(appledwc);
+
+	switch (state) {
+	case DWC3_APPLE_HOST:
+		appledwc->dwc.dr_mode = USB_DR_MODE_HOST;
+		dwc3_apple_set_ptrcap(appledwc, DWC3_GCTL_PRTCAP_HOST);
+		dwc3_apple_phy_set_mode(appledwc, PHY_MODE_USB_HOST);
+		ret = dwc3_host_init(&appledwc->dwc);
+		if (ret) {
+			dev_err(appledwc->dev, "Failed to initialize host, ret=%d\n", ret);
+			goto core_exit;
+		}
+
+		break;
+	case DWC3_APPLE_DEVICE:
+		appledwc->dwc.dr_mode = USB_DR_MODE_PERIPHERAL;
+		dwc3_apple_set_ptrcap(appledwc, DWC3_GCTL_PRTCAP_DEVICE);
+		dwc3_apple_phy_set_mode(appledwc, PHY_MODE_USB_DEVICE);
+		ret = dwc3_gadget_init(&appledwc->dwc);
+		if (ret) {
+			dev_err(appledwc->dev, "Failed to initialize gadget, ret=%d\n", ret);
+			goto core_exit;
+		}
+		break;
+	default:
+		/* Unreachable unless there's a bug in this driver */
+		WARN_ON_ONCE(1);
+		ret = -EINVAL;
+		goto core_exit;
+	}
+
+	appledwc->state = state;
+	return 0;
+
+core_exit:
+	dwc3_core_exit(&appledwc->dwc);
+reset_assert:
+	ret_reset = reset_control_assert(appledwc->resets);
+	if (ret_reset)
+		dev_warn(appledwc->dev, "Failed to assert resets, err=%d\n", ret_reset);
+
+	return ret;
+}
+
+static int dwc3_apple_exit(struct dwc3_apple *appledwc)
+{
+	int ret = 0;
+
+	lockdep_assert_held(&appledwc->lock);
+
+	switch (appledwc->state) {
+	case DWC3_APPLE_PROBE_PENDING:
+	case DWC3_APPLE_NO_CABLE:
+		/* Nothing to do if we're already off */
+		return 0;
+	case DWC3_APPLE_DEVICE:
+		dwc3_gadget_exit(&appledwc->dwc);
+		break;
+	case DWC3_APPLE_HOST:
+		dwc3_host_exit(&appledwc->dwc);
+		break;
+	}
+
+	/*
+	 * This platform requires SUSPHY to be enabled in order to properly power down the PHY
+	 * and switch dwc3's PIPE interface back to a dummy PHY (i.e. no USB3 support and USB2 via
+	 * a different PHY connected through ULPI).
+	 */
+	dwc3_enable_susphy(&appledwc->dwc, true);
+	dwc3_core_exit(&appledwc->dwc);
+	appledwc->state = DWC3_APPLE_NO_CABLE;
+
+	ret = reset_control_assert(appledwc->resets);
+	if (ret) {
+		dev_err(appledwc->dev, "Failed to assert resets, err=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dwc3_usb_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct dwc3_apple *appledwc = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	guard(mutex)(&appledwc->lock);
+
+	/*
+	 * We need to tear all of dwc3 down and re-initialize it every time a cable is
+	 * connected or disconnected or when the mode changes. See the documentation for enum
+	 * dwc3_apple_state for details.
+	 */
+	ret = dwc3_apple_exit(appledwc);
+	if (ret)
+		return ret;
+
+	switch (role) {
+	case USB_ROLE_NONE:
+		/* Nothing to do if no cable is connected */
+		return 0;
+	case USB_ROLE_HOST:
+		return dwc3_apple_init(appledwc, DWC3_APPLE_HOST);
+	case USB_ROLE_DEVICE:
+		return dwc3_apple_init(appledwc, DWC3_APPLE_DEVICE);
+	default:
+		dev_err(appledwc->dev, "Invalid target role: %d\n", role);
+		return -EINVAL;
+	}
+}
+
+static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
+{
+	struct dwc3_apple *appledwc = usb_role_switch_get_drvdata(sw);
+
+	guard(mutex)(&appledwc->lock);
+
+	switch (appledwc->state) {
+	case DWC3_APPLE_HOST:
+		return USB_ROLE_HOST;
+	case DWC3_APPLE_DEVICE:
+		return USB_ROLE_DEVICE;
+	case DWC3_APPLE_NO_CABLE:
+	case DWC3_APPLE_PROBE_PENDING:
+		return USB_ROLE_NONE;
+	default:
+		/* Unreachable unless there's a bug in this driver */
+		dev_err(appledwc->dev, "Invalid internal state: %d\n", appledwc->state);
+		return USB_ROLE_NONE;
+	}
+}
+
+static int dwc3_apple_setup_role_switch(struct dwc3_apple *appledwc)
+{
+	struct usb_role_switch_desc dwc3_role_switch = { NULL };
+
+	dwc3_role_switch.fwnode = dev_fwnode(appledwc->dev);
+	dwc3_role_switch.set = dwc3_usb_role_switch_set;
+	dwc3_role_switch.get = dwc3_usb_role_switch_get;
+	dwc3_role_switch.driver_data = appledwc;
+	appledwc->role_sw = usb_role_switch_register(appledwc->dev, &dwc3_role_switch);
+	if (IS_ERR(appledwc->role_sw))
+		return PTR_ERR(appledwc->role_sw);
+
+	return 0;
+}
+
+static int dwc3_apple_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dwc3_apple *appledwc;
+	int ret;
+
+	appledwc = devm_kzalloc(&pdev->dev, sizeof(*appledwc), GFP_KERNEL);
+	if (!appledwc)
+		return -ENOMEM;
+
+	appledwc->dev = &pdev->dev;
+	mutex_init(&appledwc->lock);
+
+	appledwc->resets = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(appledwc->resets))
+		return dev_err_probe(&pdev->dev, PTR_ERR(appledwc->resets),
+				     "Failed to get resets\n");
+
+	ret = reset_control_assert(appledwc->resets);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to assert resets, err=%d\n", ret);
+		return ret;
+	}
+
+	appledwc->mmio_resource = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dwc3-core");
+	if (!appledwc->mmio_resource) {
+		dev_err(dev, "Failed to get DWC3 MMIO\n");
+		return -EINVAL;
+	}
+
+	appledwc->apple_regs = devm_platform_ioremap_resource_byname(pdev, "dwc3-apple");
+	if (IS_ERR(appledwc->apple_regs))
+		return dev_err_probe(dev, PTR_ERR(appledwc->apple_regs),
+				     "Failed to map Apple-specific MMIO\n");
+
+	/*
+	 * On this platform, DWC3 can only be brought up after parts of the PHY have been
+	 * initialized with knowledge of the target mode and cable orientation from typec_set_mux.
+	 * Since this has not happened here we cannot setup DWC3 yet and instead defer this until
+	 * the first cable is connected. See the documentation for enum dwc3_apple_state for
+	 * details.
+	 */
+	appledwc->state = DWC3_APPLE_PROBE_PENDING;
+	ret = dwc3_apple_setup_role_switch(appledwc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to setup role switch\n");
+
+	return 0;
+}
+
+static void dwc3_apple_remove(struct platform_device *pdev)
+{
+	struct dwc3 *dwc = platform_get_drvdata(pdev);
+	struct dwc3_apple *appledwc = to_dwc3_apple(dwc);
+
+	guard(mutex)(&appledwc->lock);
+
+	usb_role_switch_unregister(appledwc->role_sw);
+
+	/*
+	 * If we're still in DWC3_APPLE_PROBE_PENDING we never got any cable connected event and
+	 * dwc3_core_probe was never called and there's hence no need to call dwc3_core_remove.
+	 * dwc3_apple_exit can be called unconditionally because it checks the state itself.
+	 */
+	dwc3_apple_exit(appledwc);
+	if (appledwc->state != DWC3_APPLE_PROBE_PENDING)
+		dwc3_core_remove(&appledwc->dwc);
+}
+
+static const struct of_device_id dwc3_apple_of_match[] = {
+	{ .compatible = "apple,t8103-dwc3" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dwc3_apple_of_match);
+
+static struct platform_driver dwc3_apple_driver = {
+	.probe		= dwc3_apple_probe,
+	.remove		= dwc3_apple_remove,
+	.driver		= {
+		.name	= "dwc3-apple",
+		.of_match_table	= dwc3_apple_of_match,
+	},
+};
+
+module_platform_driver(dwc3_apple_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sven Peter <sven@kernel.org>");
+MODULE_DESCRIPTION("DesignWare DWC3 Apple Silicon Glue Driver");

-- 
2.34.1



