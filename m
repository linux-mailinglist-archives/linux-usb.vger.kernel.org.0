Return-Path: <linux-usb+bounces-37353-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFYlAHyeA2qF8AEAu9opvQ
	(envelope-from <linux-usb+bounces-37353-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 23:41:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6A52A7B5
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 23:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6396430CE0FF
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 21:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE03E386C22;
	Tue, 12 May 2026 21:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAAteYaf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1363876AB
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622028; cv=none; b=oy/nHxZFYrM22RXRj3jz/5imryy3wgP+AljzfILevs2kNHF4/6bH4GHlRhSJvRz3mthDkY5UJDxvaqd4X32S5WHg1wuLBRFWumXnNrd2kOiyRYPuD9BlOAfeccjQaT6LfumwVcAGBrhPRJP8JpGD/H2CTX0ooTshY/ZROYNWgeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622028; c=relaxed/simple;
	bh=xERI0xkqRqL10jfHqloYlD5ENbHUKigjipBxZ5/JJnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzEM7sJLzUq5miwTBDh/Wx6PICovCn9IC8Om2MFINrMCzBB5L65xUm0Y1w0xDQEAwMr0OZbHxoIiItHMyMpRXhP/JTyblfiICHi3zzKdv4bP4JIEHaMOGGjkzgkG99wCkYhHeXOGNd3dbcAfO0D8LPjdvUSZQxBpLySDK/Ka1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAAteYaf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba856db1c0so41138335ad.3
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 14:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622025; x=1779226825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCsEI4CB6Uv8KDEyDMcVA0XDEMcgTkf23uqjxST/Hh8=;
        b=kAAteYaf9zlyCZMQDONm2muhPYNIT0tHB7srgSmgbJQbwB4jyRsCqJxRHNP199AsTU
         BHndRY5JyRvFkkmfSYxfLp2lwFZGoL0cB9XYLc1frAbXhQdOOEsg73FpgkY1e56qNZyz
         RhBBUo0nUXHWdqiGys7jTy/KlrReOXdeiEqsfi3cl41awG9s5QrFofGNIDpPHThwS/OV
         gl4ZCd/qABTk6/8QffEahcZ/EAC4tHqqVuBmkeMdNcKP1P5mlQR0zNAUz/6V8R7dhSmQ
         5NvoslTINCEFIcZ7W1yUTXlKG9dYw7cUjUFoER0gawMbn9Mi7Abq20te44NMB10CleP/
         +4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622025; x=1779226825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qCsEI4CB6Uv8KDEyDMcVA0XDEMcgTkf23uqjxST/Hh8=;
        b=HUABkcRqWzLViZyZqEclLuFxt0iGVOtIut6pmUO9FzgrvvSYDXm2nCElFPVhUBZMCq
         rRQXEsqhMfjzsmm3wKBBSSeyIfqDOOI2fJ91TGixGpHe3IJe0tojljtSFS4G7P1Z3EaA
         6CM5UG4N4w13B/Lqc5pMjGMTMvXsQ7/oRS9128/J8RNzMHzynGSCi0D0fgZOi+XDwFBe
         wTjpUX0WeR52gCO74/IvopiQMwKypwJRJ76BLa4OdSkxn7SbkM6e62xB0QVKn6yFHtH+
         HIVV2v2ZggvsuF5kl7qZEqztcZP3nPF6sR0RiBhJJLF9u31OSIi5mlV4mf68Eu8vwDBL
         LUig==
X-Forwarded-Encrypted: i=1; AFNElJ/uvBEqSXHMCUs4lHD4Ifr3uSLcRxGbMHyTEA40JCxerMMtps7ccE7ev2kxAshSRt+5Q6FnitkTcQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGhcdapXzydj5JRbVP4V806+dXDxMlcYkqmJnP9mJdOfKh/D3o
	HUsf0poHWtorZWfYUxyakJM5NHSRaVeJ7oNt7rNjqcXcXNeGeiiFrgim
X-Gm-Gg: Acq92OEE0cSsvjoHNSCAqgzKBTTdvzNIV/HDQI5Yn5uJI5z7VCNj9KkTOzus/v3t2To
	lwQqknGmI0wwS877JpauiS/KzrIk+P/Gec4hQhZX9icx0QEUNYP1pSlcY+a88sUHttKNKaBzwB9
	/XYFiLeC25P8Z36tDfpG0hPv9pazdMVoQDVVqr619Na0ZLvwBttdfYHyff5XCTq/fPAaT5P9keu
	y+Df6tC6ixMvvn6Q85qFZi+A7luiDzl74BME8PuNfUYTITkEwVk5NFgGxr7MzSRQ8kjdgeUQ4Xf
	W+yVkb/u2KxMlPCOKnc9kfXOLHP7TaWSSuEbe/8WvYO7VYLOpKkFOZNWS/V4UpiKaFlrOSJhEuH
	F0YiveSxtbYDU+7UyG9ybGvwdpvojeaHxSMZdOdU1sX33ynZqFnLNkAw1MtRYjgzAkXKdVDDQMG
	EzffOdJF16at+SIwTXL/yIzQy4U1uulwg=
X-Received: by 2002:a17:902:9a0c:b0:2bc:810b:5c0c with SMTP id d9443c01a7336-2bd2770eddfmr5688795ad.34.1778622025465;
        Tue, 12 May 2026 14:40:25 -0700 (PDT)
Received: from mincom1 ([27.232.220.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d409eesm143949895ad.32.2026.05.12.14.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:40:24 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v5 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Date: Wed, 13 May 2026 06:39:09 +0900
Message-ID: <20260512213910.871859-2-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512213910.871859-1-hurryman2212@gmail.com>
References: <20260512213910.871859-1-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7AA6A52A7B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[roeck-us.net,lwn.net,linuxfoundation.org,amd.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37353-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

AMD Promontory 21 (PROM21) xHCI controllers use generic xHCI
operation, but the PCI function also exposes optional
controller-specific sensor functionality. Add a small PROM21 PCI glue
driver for AMD 1022:43fc and 1022:43fd controllers.

The driver delegates USB host operation to the common xhci-pci core,
collects the parent-provided MMIO resource data, and creates a "hwmon"
auxiliary device for optional child drivers. Failure to create the
auxiliary device is logged but does not fail the xHCI probe, since the
auxiliary device is only needed for sensor support.

Keep the PROM21 PCI glue built-in only when enabled because it owns the
PCI binding for PROM21 xHCI controllers and must be available whenever
the common built-in xhci-pci driver hands those controllers off. This
avoids an early boot case where generic xhci-pci rejects a PROM21
controller but a modular xhci-pci-prom21 driver is not available in the
initramfs, leaving USB devices behind that controller unavailable.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/usb/host/Kconfig                      |  20 +++
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 123 ++++++++++++++++++
 drivers/usb/host/xhci-pci.c                   |  11 ++
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++++
 6 files changed, 180 insertions(+)
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0a277a07cf70..8b2ad1c27084 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -42,6 +42,26 @@ config USB_XHCI_PCI
 	depends on USB_PCI
 	default y
 
+config USB_XHCI_PCI_PROM21
+	bool "AMD Promontory 21 xHCI PCI support"
+	depends on X86
+	depends on USB_XHCI_PCI=y
+	default USB_XHCI_PCI
+	select AUXILIARY_BUS
+	help
+	  Say 'Y' to enable support for the AMD Promontory 21 xHCI PCI
+	  controller with optional sensor support. This driver does not add
+	  PROM21-specific USB or xHCI operation. It binds PROM21 xHCI PCI
+	  functions, delegates USB host operation to the common xHCI PCI core,
+	  and creates auxiliary devices for optional sensor drivers.
+
+	  This driver is built-in only because it owns the PCI binding for
+	  PROM21 xHCI controllers when enabled and must be available whenever
+	  the common xHCI PCI driver is available. The optional sensor driver
+	  can still be built as a module.
+
+	  If unsure, say 'N'.
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
index 000000000000..70847a2381b7
--- /dev/null
+++ b/drivers/usb/host/xhci-pci-prom21.c
@@ -0,0 +1,123 @@
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
+};
+
+static void prom21_xhci_auxdev_release(struct device *dev, void *res)
+{
+	struct prom21_xhci_auxdev *prom21_auxdev = res;
+
+	auxiliary_device_destroy(prom21_auxdev->auxdev);
+}
+
+static int prom21_xhci_create_auxdev(struct pci_dev *pdev)
+{
+	struct prom21_xhci_auxdev *prom21_auxdev;
+	struct usb_hcd *hcd = pci_get_drvdata(pdev);
+
+	if (!hcd)
+		return -ENODEV;
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
+	prom21_auxdev->auxdev =
+		auxiliary_device_create(&pdev->dev, KBUILD_MODNAME, "hwmon",
+					&prom21_auxdev->pdata,
+					(pci_domain_nr(pdev->bus) << 16) |
+						pci_dev_id(pdev));
+	if (!prom21_auxdev->auxdev) {
+		devres_free(prom21_auxdev);
+		return -ENOMEM;
+	}
+
+	devres_add(&pdev->dev, prom21_auxdev);
+	return 0;
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


