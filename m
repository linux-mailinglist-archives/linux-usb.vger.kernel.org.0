Return-Path: <linux-usb+bounces-37654-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB+mADCqC2oGKwUAu9opvQ
	(envelope-from <linux-usb+bounces-37654-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 02:09:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2E575653
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 02:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BE36304408B
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D801B78F59;
	Tue, 19 May 2026 00:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCdACxmj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E16C81AA8
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 00:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149275; cv=none; b=CA3gMSavRCTS20MOBjnZy9jRnDFILRED1vHV6SZ5gDbBRzhptv4oMTCf/Y2/FzsRXkbdrCw3XEEo4VVPj/nOdnZfrXdJQqNkoOAmEpqD4s7lSH8m1uYXKH1CaxOOiVcolXrBkPGlIykivIVWyQVONRuecPtTyjT0r0trtjvoHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149275; c=relaxed/simple;
	bh=Kc8+aK64Ly1xvXuCc8InpT0SC3CasoBFQHQnMVAiLqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFeYE4pllZuF0Rke50HVCe2muxaIKpFw6EK/rkSXOfYjN3WC7M0sZFnGyXtBt1RjQr9JT8+MV/VyqkXY9h0G02SXTlFVyoUFhYf/3oTj5jY7y2Tz9tGeHmTxak2CuhjElH1BeKbDppzvV2Nfm9BJH1cTexK+VoGqOFfBhuMC5S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCdACxmj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so29743065ad.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 17:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779149273; x=1779754073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6tltDGo+5vtt2DKrFq/NSjTt1IvEImZu/p4oBxOfcM=;
        b=oCdACxmjZG+y3KojZnY+meoLmhW74BQYIn/99LBMNodfzeTs/K8xWoN0mN3Qspu+X7
         TdKRotk5X44rBNtEQ+wxIGSZqmB70c5K79OiVu0NZsfcxciQP8Z1jR8aQyB/TZAfoqLO
         fuCx3DN/LBwaSpKyCBio2S/cZii/yf6XnpDic2l6RK08UZN11rdVvgMNpuF+Gd5FDwU3
         3HEoGygPVBDKaFMNYLngHPYvSP++70aoDxMaPuT7IDVSqQFSnnnYEbDy59Wtyle7rQ6i
         XDAuT5OH8COP4YXeWm8L7NVjGkJzR0n3rYWUarCeUodp1xt649GdVOSjtqHDdvj0BjZJ
         nMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779149273; x=1779754073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6tltDGo+5vtt2DKrFq/NSjTt1IvEImZu/p4oBxOfcM=;
        b=n+93Fonh6/nmL+TM7BxwVE4FrXIdZbPmnIUQoro6lK3ex+akLPvNPLB3B7PjBCyVbZ
         vDi/MM78eHfTFoAV08XPxLYkQJ57yxNT+nwGMwyiceJuzyYgA1Kx4pTRgfMjOzu6F/yZ
         SCB+cBNzhiq+/KcZCQ9lFSpJSKUI/pe8zHybPnPVgy6P6OKZjNOIi532Bj8R0Lil5HAL
         tGIA/LMjICdtE0844/BBfhkV/PcOgkoNP9KAkJNoww5G28srkz+XQhWtIc4Aqbp1Bqu0
         +P9IY9BLYnZ17pUfl9ifJWqbzribnucIyV9P2TGmZxx1JjY/RBS5yxpbNqRMkZoyZTFQ
         9BvQ==
X-Forwarded-Encrypted: i=1; AFNElJ89/LpbprForRPX7B1rcXMdxUEaBtGxMWU5tQyQs8ySvLlYwwr4+3ZZNRBa2JUyOWJUVuKchfGxazE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIPevE7ZfN0MEzrpUmhLgiooD0wPSJOw/v0ypVvgr1pCHpuOMB
	NBGs4ftC9twGFfkBBLpChtVj9nHxILUd578s8JMOesKxlFnPYqP2gFO6
X-Gm-Gg: Acq92OEj+0aZFbYsxyxI8BcZyWVIS4sTerDcEpFEz841gRwjvFxAJZhmRFyDh54lpph
	x0H0h1VUKxIeJZ3zbajIF/pr9MWVUo2/zqab09IyP0TJB2EnTt6DkQrLqlVWEpnuEujojI6dF5c
	89Ts7cMMb4FweBMOVX/PcjKUiGWpgPDENQoE37A6fNIJAhBYki82Q5S8CULeiD13zXqOiBFvOrw
	AolkgabvL6dC61ow4+/37oQy5kJAeb4R5nftfG8MHhn0qMBnSSGPuQYeWP2H1t0XSBeuaFEmGja
	eIBfc44t0tAdur9tGOtvqUV7sQvVLn4JIxBfbEvoxwVXj08DwgcbnRJlA8VHhMx2+FeDvsUi751
	XLUcEJhlM50laY2ZhhB3AUQUGRHaIL1A7370vEF4wkwztPfJVWXQgKgHw2kfI5s346TSZos2upD
	Q+0KWg85r175/CymVYFd9WIA==
X-Received: by 2002:a17:902:f647:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2bd7e93872bmr191189345ad.34.1779149272692;
        Mon, 18 May 2026 17:07:52 -0700 (PDT)
Received: from mincom1 ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm79021755ad.20.2026.05.18.17.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:07:52 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Yaroslav Isakov <yaroslav.isakov@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v7 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Date: Tue, 19 May 2026 09:07:31 +0900
Message-ID: <20260519000732.2334711-2-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519000732.2334711-1-hurryman2212@gmail.com>
References: <20260519000732.2334711-1-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,lwn.net,linuxfoundation.org,amd.com,gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-37654-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5CF2E575653
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AMD Promontory 21 (PROM21) xHCI PCI functions use the common xhci-pci
core for USB operation, but also expose controller-specific sensor data.
Add a small PROM21 PCI glue driver for AMD 1022:43fc and 1022:43fd
controllers.

The glue delegates USB host operation to the common xhci-pci core and
publishes a "hwmon" auxiliary device with parent-provided MMIO data.
Auxiliary device creation failure is logged but does not fail the xHCI
probe.

Make the PROM21 glue a hidden Kconfig tristate driven by the user-visible
SENSORS_PROM21_XHCI option. If sensor support is disabled, generic
xhci-pci binds PROM21 controllers normally. If sensor support is enabled,
the glue follows USB_XHCI_PCI.

This keeps the auxiliary device available for a modular sensor driver while
avoiding a built-in xhci-pci core handing PROM21 controllers to a glue
driver that is only available as a module during initramfs.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>
---
 drivers/usb/host/Kconfig                      |   6 +
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 137 ++++++++++++++++++
 drivers/usb/host/xhci-pci.c                   |  11 ++
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 +++
 6 files changed, 180 insertions(+)
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0a277a07cf70..43f30cd867e4 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -42,6 +42,12 @@ config USB_XHCI_PCI
 	depends on USB_PCI
 	default y
 
+config USB_XHCI_PCI_PROM21
+	tristate
+	depends on USB_XHCI_PCI
+	default USB_XHCI_PCI if SENSORS_PROM21_XHCI != n
+	select AUXILIARY_BUS
+
 config USB_XHCI_PCI_RENESAS
 	tristate "Support for additional Renesas xHCI controller with firmware"
 	depends on USB_XHCI_PCI
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index a07e7ba9cd53..174580c1281a 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
 obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
 obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
 obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
+obj-$(CONFIG_USB_XHCI_PCI_PROM21)	+= xhci-pci-prom21.o
 obj-$(CONFIG_USB_XHCI_PCI_RENESAS)	+= xhci-pci-renesas.o
 obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
 obj-$(CONFIG_USB_XHCI_HISTB)	+= xhci-histb.o
diff --git a/drivers/usb/host/xhci-pci-prom21.c b/drivers/usb/host/xhci-pci-prom21.c
new file mode 100644
index 000000000000..6486f4a09345
--- /dev/null
+++ b/drivers/usb/host/xhci-pci-prom21.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Promontory 21 xHCI host controller PCI Bus Glue.
+ *
+ * This does not add any PROM21-specific USB or xHCI operation. It exists only
+ * to publish an auxiliary device for integrated temperature sensor support.
+ *
+ * Copyright (C) 2026 Jihong Min <hurryman2212@gmail.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device/devres.h>
+#include <linux/errno.h>
+#include <linux/idr.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_data/usb-xhci-prom21.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
+#include "xhci-pci.h"
+
+struct prom21_xhci_auxdev {
+	struct auxiliary_device *auxdev;
+	struct prom21_xhci_pdata pdata;
+	int id;
+};
+
+static DEFINE_IDA(prom21_xhci_auxdev_ida);
+
+static void prom21_xhci_auxdev_release(struct device *dev, void *res)
+{
+	struct prom21_xhci_auxdev *prom21_auxdev = res;
+
+	auxiliary_device_destroy(prom21_auxdev->auxdev);
+	ida_free(&prom21_xhci_auxdev_ida, prom21_auxdev->id);
+}
+
+static int prom21_xhci_create_auxdev(struct pci_dev *pdev)
+{
+	struct prom21_xhci_auxdev *prom21_auxdev;
+	struct usb_hcd *hcd = pci_get_drvdata(pdev);
+	int ret;
+
+	prom21_auxdev = devres_alloc(prom21_xhci_auxdev_release,
+				     sizeof(*prom21_auxdev), GFP_KERNEL);
+	if (!prom21_auxdev)
+		return -ENOMEM;
+
+	prom21_auxdev->pdata.pdev = pdev;
+	prom21_auxdev->pdata.regs = hcd->regs;
+	prom21_auxdev->pdata.rsrc_len = hcd->rsrc_len;
+
+	prom21_auxdev->id = ida_alloc(&prom21_xhci_auxdev_ida, GFP_KERNEL);
+	if (prom21_auxdev->id < 0) {
+		ret = prom21_auxdev->id;
+		goto err_free_devres;
+	}
+
+	prom21_auxdev->auxdev = auxiliary_device_create(&pdev->dev,
+							KBUILD_MODNAME, "hwmon",
+							&prom21_auxdev->pdata,
+							prom21_auxdev->id);
+	if (!prom21_auxdev->auxdev) {
+		ret = -ENOMEM;
+		goto err_free_ida;
+	}
+
+	devres_add(&pdev->dev, prom21_auxdev);
+	return 0;
+
+err_free_ida:
+	ida_free(&prom21_xhci_auxdev_ida, prom21_auxdev->id);
+err_free_devres:
+	devres_free(prom21_auxdev);
+	return ret;
+}
+
+static void prom21_xhci_destroy_auxdev(struct pci_dev *pdev)
+{
+	devres_release(&pdev->dev, prom21_xhci_auxdev_release, NULL, NULL);
+}
+
+static int prom21_xhci_probe(struct pci_dev *dev,
+			     const struct pci_device_id *id)
+{
+	int retval;
+
+	retval = xhci_pci_common_probe(dev, id);
+	if (retval)
+		return retval;
+
+	retval = prom21_xhci_create_auxdev(dev);
+	if (retval) {
+		/*
+		 * The auxiliary device only provides optional temperature sensor
+		 * support. Keep the xHCI controller usable if it fails.
+		 */
+		dev_err(&dev->dev,
+			"failed to create PROM21 hwmon auxiliary device: %d\n",
+			retval);
+	}
+
+	return 0;
+}
+
+static void prom21_xhci_remove(struct pci_dev *dev)
+{
+	prom21_xhci_destroy_auxdev(dev);
+	xhci_pci_remove(dev);
+}
+
+static const struct pci_device_id pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD) },
+	{ /* end: all zeroes */ }
+};
+MODULE_DEVICE_TABLE(pci, pci_ids);
+
+static struct pci_driver prom21_xhci_driver = {
+	.name = "xhci-pci-prom21",
+	.id_table = pci_ids,
+
+	.probe = prom21_xhci_probe,
+	.remove = prom21_xhci_remove,
+
+	.shutdown = usb_hcd_pci_shutdown,
+	.driver = {
+		.pm = pm_ptr(&usb_hcd_pci_pm_ops),
+	},
+};
+module_pci_driver(prom21_xhci_driver);
+
+MODULE_AUTHOR("Jihong Min <hurryman2212@gmail.com>");
+MODULE_DESCRIPTION("AMD Promontory 21 xHCI PCI Host Controller Driver");
+MODULE_IMPORT_NS("xhci");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..039c26b241d0 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -696,12 +696,23 @@ static const struct pci_device_id pci_ids_renesas[] = {
 	{ /* end: all zeroes */ }
 };
 
+/* handled by xhci-pci-prom21 if enabled */
+static const struct pci_device_id pci_ids_prom21[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD) },
+	{ /* end: all zeroes */ }
+};
+
 static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS) &&
 			pci_match_id(pci_ids_renesas, dev))
 		return -ENODEV;
 
+	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_PROM21) &&
+	    pci_match_id(pci_ids_prom21, dev))
+		return -ENODEV;
+
 	return xhci_pci_common_probe(dev, id);
 }
 
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
index e87c7d9d76b8..11f435f94322 100644
--- a/drivers/usb/host/xhci-pci.h
+++ b/drivers/usb/host/xhci-pci.h
@@ -4,6 +4,9 @@
 #ifndef XHCI_PCI_H
 #define XHCI_PCI_H
 
+#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC	0x43fc
+#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD	0x43fd
+
 int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id);
 void xhci_pci_remove(struct pci_dev *dev);
 
diff --git a/include/linux/platform_data/usb-xhci-prom21.h b/include/linux/platform_data/usb-xhci-prom21.h
new file mode 100644
index 000000000000..ee672ad452a8
--- /dev/null
+++ b/include/linux/platform_data/usb-xhci-prom21.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Promontory 21 xHCI auxiliary device platform data.
+ *
+ * Copyright (C) 2026 Jihong Min <hurryman2212@gmail.com>
+ */
+
+#ifndef _LINUX_PLATFORM_DATA_USB_XHCI_PROM21_H
+#define _LINUX_PLATFORM_DATA_USB_XHCI_PROM21_H
+
+#include <linux/compiler_types.h>
+#include <linux/types.h>
+
+struct pci_dev;
+
+struct prom21_xhci_pdata {
+	struct pci_dev *pdev;
+	void __iomem *regs;
+	resource_size_t rsrc_len;
+};
+
+#endif
-- 
2.53.0


