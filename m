Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 957A353D4ED
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 04:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350278AbiFDCse (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 22:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbiFDCsc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 22:48:32 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AE2201AF
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 19:48:30 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A925EC06ED;
        Sat,  4 Jun 2022 02:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654310910; bh=LVmDH0xWzSHU0E069yuBYelSJw4UX3PDAZOspgXap3U=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Ykt+fqGmDyMMqJip9/ISjtSpRQXcV1gjLempin4a2aMQzN0WgaP6hIprPmRikwjWf
         Rign/EP7x5rtwzFmsVApJi57a8aNR+E1i2F3RqsgQin//lcMLRpbGvr4r6lljzG3GA
         hWSaQk6bQvu0To/IZA50HZ4c4XZwSzDBjPWu4JghCD0+dRPtC87DPolrx5yogp58ig
         PY1QlMX3uUIb9IbhN9aPtVvm5W3wLc5GLUFIpBAQntzfN4cR1ByQNBmJ0PTZ6HmBrF
         9rbFdH8mThbroPkm4COgIKWjoaGM2kfvywGbPvF/PymU3pSWqmdFX3rKIzVX29+/Iv
         cntWpYDPucg8w==
Received: from te-lab15 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8E1DBA00A0;
        Sat,  4 Jun 2022 02:48:28 +0000 (UTC)
Received: by te-lab15 (sSMTP sendmail emulation); Fri, 03 Jun 2022 19:48:28 -0700
Date:   Fri, 03 Jun 2022 19:48:28 -0700
Message-Id: <fdd35b176f74e80fd75e4f75731e0f26c0808c89.1654310542.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 4/4] usb: xhci: Introduce Synopsys glue extension for DWC_usb3x
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Juergen Gross <jgross@suse.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Synopsys DWC_usb3x IPs are used on many different platforms. Since they
share the same IP, often the quirks are common across different
platforms and versions. This drives the need to find a way to handle all
the common (and platform specific) quirks and separate its logic from
dwc3 and xhci core logic. Hopefully this helps reduce introducing new
device properties while maintaining abstraction.

So, let's create a xhci-snps glue extension that can apply to xhci-plat
and xhci-pci glue drivers and teach it to handle DWC_usb3x hosts. For
this particular change, we'll start with xhci-plat glue driver.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/host/Kconfig     |   8 ++
 drivers/usb/host/Makefile    |   3 +
 drivers/usb/host/xhci-plat.c |  40 ++++++++
 drivers/usb/host/xhci-plat.h |   3 +
 drivers/usb/host/xhci-snps.c | 185 +++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-snps.h |  32 ++++++
 6 files changed, 271 insertions(+)
 create mode 100644 drivers/usb/host/xhci-snps.c
 create mode 100644 drivers/usb/host/xhci-snps.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 57ca5f97a3dc..efbfb79baf44 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -62,6 +62,14 @@ config USB_XHCI_PLATFORM
 
 	  If unsure, say N.
 
+config USB_XHCI_SNPS
+	bool "xHCI fine tune for Synopsys platforms"
+	help
+	  Say 'Y' to enable additional fine tune for Synopsys DWC_usb3x xHCI
+	  controllers.
+
+	  If unsure, say N.
+
 config USB_XHCI_HISTB
 	tristate "xHCI support for HiSilicon STB SoCs"
 	depends on USB_XHCI_PLATFORM && (ARCH_HISI || COMPILE_TEST)
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 2948983618fb..066b78fbc1d1 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -28,6 +28,9 @@ endif
 ifneq ($(CONFIG_USB_XHCI_RCAR), )
 	xhci-plat-hcd-y		+= xhci-rcar.o
 endif
+ifneq ($(CONFIG_USB_XHCI_SNPS), )
+	xhci-plat-hcd-y		+= xhci-snps.o
+endif
 
 ifneq ($(CONFIG_DEBUG_FS),)
 	xhci-hcd-y		+= xhci-debugfs.o
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 044855818cb1..73cc0262cc75 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -24,16 +24,20 @@
 #include "xhci-plat.h"
 #include "xhci-mvebu.h"
 #include "xhci-rcar.h"
+#include "xhci-snps.h"
 
 static struct hc_driver __read_mostly xhci_plat_hc_driver;
 
 static int xhci_plat_setup(struct usb_hcd *hcd);
 static int xhci_plat_start(struct usb_hcd *hcd);
+static int xhci_plat_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
+				  struct usb_host_endpoint *ep);
 
 static const struct xhci_driver_overrides xhci_plat_overrides __initconst = {
 	.extra_priv_size = sizeof(struct xhci_plat_priv),
 	.reset = xhci_plat_setup,
 	.start = xhci_plat_start,
+	.add_endpoint = xhci_plat_add_endpoint,
 };
 
 static void xhci_priv_plat_start(struct usb_hcd *hcd)
@@ -105,6 +109,20 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 	return xhci_run(hcd);
 }
 
+static int xhci_plat_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
+				  struct usb_host_endpoint *ep)
+{
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+	int ret;
+
+	if (priv && priv->add_endpoint_quirk)
+		ret = priv->add_endpoint_quirk(hcd, udev, ep);
+	else
+		ret = xhci_add_endpoint(hcd, udev, ep);
+
+	return ret;
+}
+
 #ifdef CONFIG_OF
 static const struct xhci_plat_priv xhci_plat_marvell_armada = {
 	.init_quirk = xhci_mvebu_mbus_init_quirk,
@@ -173,6 +191,25 @@ static const struct of_device_id usb_xhci_of_match[] = {
 MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
 #endif
 
+static int xhci_plat_setup_snps_quirks(struct usb_hcd *hcd)
+{
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_USB_XHCI_SNPS))
+		return 0;
+
+	ret = xhci_snps_init(hcd);
+	if (ret) {
+		dev_err(hcd->self.controller, "SNPS extension setup fails\n");
+		return ret;
+	}
+
+	priv->init_quirk = &xhci_snps_setup;
+	priv->add_endpoint_quirk = &xhci_snps_add_endpoint;
+	return 0;
+}
+
 static int xhci_plat_probe(struct platform_device *pdev)
 {
 	const struct xhci_plat_priv *priv_match;
@@ -301,6 +338,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "xhci-snps-quirks"))
+			xhci_plat_setup_snps_quirks(hcd);
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 1fb149d1fbce..7b49aba73833 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -17,6 +17,9 @@ struct xhci_plat_priv {
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
+	int (*add_endpoint_quirk)(struct usb_hcd *hcd,
+				  struct usb_device *udev,
+				  struct usb_host_endpoint *ep);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
diff --git a/drivers/usb/host/xhci-snps.c b/drivers/usb/host/xhci-snps.c
new file mode 100644
index 000000000000..932d914a090a
--- /dev/null
+++ b/drivers/usb/host/xhci-snps.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * xhci-snps.c - xHCI glue extension for Synopsys DWC_usb3x IPs.
+ *
+ * Copyright (C) 2022 Synopsys Inc.
+ *
+ * Author: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
+ *
+ * Contains some borrowed code from dwc3 driver.
+ */
+
+#include "xhci.h"
+#include "xhci-snps.h"
+
+#define DWC3_GSNPSID			0xc120
+#define DWC3_VER_NUMBER			0xc1a0
+#define DWC3_VER_TYPE			0xc1a4
+
+#define DWC3_GLOBALS_REGS_END		0xc6ff
+
+#define DWC3_GSNPSID_MASK		0xffff0000
+#define DWC3_GSNPS_ID(p)		(((p) & DWC3_GSNPSID_MASK) >> 16)
+
+#define DWC3_IP				0x5533
+#define DWC31_IP			0x3331
+#define DWC32_IP			0x3332
+
+#define DWC3_REVISION_ANY		0x0
+#define DWC3_REVISION_173A		0x5533173a
+#define DWC3_REVISION_175A		0x5533175a
+#define DWC3_REVISION_180A		0x5533180a
+#define DWC3_REVISION_183A		0x5533183a
+#define DWC3_REVISION_185A		0x5533185a
+#define DWC3_REVISION_187A		0x5533187a
+#define DWC3_REVISION_188A		0x5533188a
+#define DWC3_REVISION_190A		0x5533190a
+#define DWC3_REVISION_194A		0x5533194a
+#define DWC3_REVISION_200A		0x5533200a
+#define DWC3_REVISION_202A		0x5533202a
+#define DWC3_REVISION_210A		0x5533210a
+#define DWC3_REVISION_220A		0x5533220a
+#define DWC3_REVISION_230A		0x5533230a
+#define DWC3_REVISION_240A		0x5533240a
+#define DWC3_REVISION_250A		0x5533250a
+#define DWC3_REVISION_260A		0x5533260a
+#define DWC3_REVISION_270A		0x5533270a
+#define DWC3_REVISION_280A		0x5533280a
+#define DWC3_REVISION_290A		0x5533290a
+#define DWC3_REVISION_300A		0x5533300a
+#define DWC3_REVISION_310A		0x5533310a
+#define DWC3_REVISION_330A		0x5533330a
+
+#define DWC31_REVISION_ANY		0x0
+#define DWC31_REVISION_110A		0x3131302a
+#define DWC31_REVISION_120A		0x3132302a
+#define DWC31_REVISION_160A		0x3136302a
+#define DWC31_REVISION_170A		0x3137302a
+#define DWC31_REVISION_180A		0x3138302a
+#define DWC31_REVISION_190A		0x3139302a
+
+#define DWC32_REVISION_ANY		0x0
+#define DWC32_REVISION_100A		0x3130302a
+
+#define DWC31_VERSIONTYPE_ANY		0x0
+#define DWC31_VERSIONTYPE_EA01		0x65613031
+#define DWC31_VERSIONTYPE_EA02		0x65613032
+#define DWC31_VERSIONTYPE_EA03		0x65613033
+#define DWC31_VERSIONTYPE_EA04		0x65613034
+#define DWC31_VERSIONTYPE_EA05		0x65613035
+#define DWC31_VERSIONTYPE_EA06		0x65613036
+
+#define DWC3_IP_IS(_ip)							\
+	(snps->ip == _ip##_IP)
+
+#define DWC3_VER_IS(_ip, _ver)						\
+	(DWC3_IP_IS(_ip) && snps->revision == _ip##_REVISION_##_ver)
+
+#define DWC3_VER_IS_PRIOR(_ip, _ver)					\
+	(DWC3_IP_IS(_ip) && snps->revision < _ip##_REVISION_##_ver)
+
+#define DWC3_VER_IS_WITHIN(_ip, _from, _to)				\
+	(DWC3_IP_IS(_ip) &&						\
+	 snps->revision >= _ip##_REVISION_##_from &&			\
+	 (!(_ip##_REVISION_##_to) ||					\
+	  snps->revision <= _ip##_REVISION_##_to))
+
+#define DWC3_VER_TYPE_IS_WITHIN(_ip, _ver, _from, _to)			\
+	(DWC3_VER_IS(_ip, _ver) &&					\
+	 snps->version_type >= _ip##_VERSIONTYPE_##_from &&		\
+	 (!(_ip##_VERSIONTYPE_##_to) ||					\
+	  snps->version_type <= _ip##_VERSIONTYPE_##_to))
+
+/**
+ * struct xhci_snps - Wrapper for DWC_usb3x host controller
+ * @hcd: the main host device
+ * @ip: controller's ID
+ * @revision: controller's version of an IP
+ * @version_type: VERSIONTYPE register contents, a sub release of a revision
+ */
+struct xhci_snps {
+	struct usb_hcd	*hcd;
+	u32		ip;
+	u32		revision;
+	u32		version_type;
+};
+
+#define dev_to_xhci_snps(p) (container_of((p), struct xhci_snps, dev))
+
+int xhci_snps_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
+			   struct usb_host_endpoint *ep)
+{
+	struct xhci_snps *snps = dev_get_drvdata(hcd->self.controller);
+
+	if (DWC3_VER_IS_WITHIN(DWC31, ANY, 190A) &&
+	    usb_endpoint_xfer_int(&ep->desc) &&
+	    udev->speed == USB_SPEED_FULL && ep->desc.bInterval == 6)
+		ep->desc.bInterval = 5;
+
+	return xhci_add_endpoint(hcd, udev, ep);
+}
+
+static bool xhci_is_snps(struct usb_hcd *hcd)
+{
+	u32 id;
+
+	if (hcd->rsrc_len < DWC3_GLOBALS_REGS_END)
+		return false;
+
+	id = DWC3_GSNPS_ID(readl(hcd->regs + DWC3_GSNPSID));
+
+	return (id == DWC3_IP || id == DWC31_IP || id == DWC32_IP);
+}
+
+static int xhci_snps_init_version(struct xhci_snps *snps)
+{
+	void __iomem *regs = snps->hcd->regs;
+	u32 reg;
+
+	reg = readl(regs + DWC3_GSNPSID);
+	snps->ip = DWC3_GSNPS_ID(reg);
+
+	if (DWC3_IP_IS(DWC3)) {
+		snps->revision = reg;
+	} else if (DWC3_IP_IS(DWC31) || DWC3_IP_IS(DWC32)) {
+		snps->revision = readl(regs + DWC3_VER_NUMBER);
+		snps->version_type = readl(regs + DWC3_VER_TYPE);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int xhci_snps_setup(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	/* These quirks are applicable to all DWC_usb3x IPs and versions */
+	xhci->quirks |= XHCI_SKIP_PHY_INIT | XHCI_SG_TRB_CACHE_SIZE_QUIRK;
+
+	return 0;
+}
+
+int xhci_snps_init(struct usb_hcd *hcd)
+{
+	struct device *dev = hcd->self.controller;
+	struct xhci_snps *snps;
+	int ret;
+
+	if (!xhci_is_snps(hcd))
+		return -EINVAL;
+
+	snps = devm_kzalloc(dev, sizeof(*snps), GFP_KERNEL);
+	if (!snps)
+		return -ENOMEM;
+
+	snps->hcd = hcd;
+
+	ret = xhci_snps_init_version(snps);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(dev, snps);
+	return 0;
+}
diff --git a/drivers/usb/host/xhci-snps.h b/drivers/usb/host/xhci-snps.h
new file mode 100644
index 000000000000..c35a7ffdeaa3
--- /dev/null
+++ b/drivers/usb/host/xhci-snps.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Synopsys Inc.
+ */
+
+#ifndef _XHCI_SNPS_H
+#define _XHCI_SNPS_H
+
+#if IS_ENABLED(CONFIG_USB_XHCI_SNPS)
+int xhci_snps_init(struct usb_hcd *hcd);
+int xhci_snps_setup(struct usb_hcd *hcd);
+int xhci_snps_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
+			   struct usb_host_endpoint *ep);
+#else
+static inline int xhci_snps_init(struct usb_hcd *hcd)
+{
+	return 0;
+}
+
+static inline int xhci_snps_setup(struct usb_hcd *hcd)
+{
+	return 0;
+}
+
+static int xhci_snps_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
+				  struct usb_host_endpoint *ep)
+{
+	return 0;
+}
+#endif
+
+#endif /* _XHCI_SNPS_H */
-- 
2.28.0

