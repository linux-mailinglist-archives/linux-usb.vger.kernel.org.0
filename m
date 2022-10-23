Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E137609411
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 16:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiJWOt2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 10:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiJWOtZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 10:49:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA220E09F
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 07:49:21 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r14so13010919lfm.2
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceO6/KeEiTSvtOyTleUuxrZ5D3gCyEjyz3h6xOgs+Yw=;
        b=o/q7rZ4SkthSKvfAw68Wm/jbeXLtcEntoZLGqeao1qoFqBznQu2p5kRM0K2hNXKQZ8
         vHAZN8TMwdLMgJaRUnzemAATS2aqQou+jDYwrqT3DhpcleAFRweJjsPXC/y2snwIenQz
         0cGsnlefoQIW5tQd+gq1frIzBb+tc45Lp9mMuMYSteSlXIsPsuOCVe5qQZ1/8jM8sQ/Z
         Pq13VMI4Q792+tSZmBepDzK+jjvOl7zfwSuBKcRmx38qjQ11/k6UdvPZtQeXIl/5wNT9
         9/lQ7E4AmVmSmwq2j24akGkU31Wm/uUCH4jk1AmhdowliPw4TomZ+kc6pfE6kI3YmKw1
         o9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceO6/KeEiTSvtOyTleUuxrZ5D3gCyEjyz3h6xOgs+Yw=;
        b=awC5yuKNkMcrB4E691ODwr5FKfIz8w0fXYuzIqjEhLf8wJ+XVm+KY+S1xge9dtKzd6
         Vmd0sLCBCubiSgcmXHqPkIctnI2ypyC5YzyUsZueRYcidk09bpCt0CCIl0dIP1IuyB90
         YEtlO+meufAtSRLf7cm3WhwXgSj5hdX2Euk1RQm8R+fKxvwQobx4SVnty5+Wc/kASvCl
         GY2Id99dWXOszpplFmo7kG3RvfbngTiyb8jckoPfvSubTfN7omALysxPD3vXHLcrb1No
         zWd2qVHlSzI8+DFwkjQzis3Eh12M5MUzHN80VdGO0IqpEUWU1uYVFQ7i9ajTBLZUzQO3
         H4Jw==
X-Gm-Message-State: ACrzQf1xdqia+EZT3hxoMDI9e0d4YyFrLJynK1GmgqfqvxhA3EsCMhl1
        OBhy31fPqCXLXOJqnJqF03lhdw==
X-Google-Smtp-Source: AMsMyM4iv5UMt5y00vhiusoq/MnGtJUI3VNzxKByfKQ452tV4oowyb2xvKhKzNUMbEfW3wcKZMASAw==
X-Received: by 2002:ac2:5445:0:b0:4a4:3c5c:f73 with SMTP id d5-20020ac25445000000b004a43c5c0f73mr9692225lfn.21.1666536560144;
        Sun, 23 Oct 2022 07:49:20 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id bx13-20020a05651c198d00b002770909be0asm263127ljb.1.2022.10.23.07.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 07:49:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Fabian Vogt <fabian@ritter-vogt.de>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 2/3 v1] usb: fotg210: Compile into one module
Date:   Sun, 23 Oct 2022 16:47:07 +0200
Message-Id: <20221023144708.3596563-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221023144708.3596563-1-linus.walleij@linaro.org>
References: <20221023144708.3596563-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is since ages perfectly possible to compile both of these
modules into the same kernel, which makes no sense since it
is one piece of hardware.

Compile one module named "fotg210.ko" for both HCD and UDC
drivers by collecting the init calls into a fotg210-core.c
file and start to centralize things handling one and the same
piece of hardware.

Stub out the initcalls if one or the other part of the driver
was not selected.

Tested by compiling one or the other or both of the drivers
into the kernel and as modules.

Cc: Fabian Vogt <fabian@ritter-vogt.de>
Cc: Yuan-Hsin Chen <yhchen@faraday-tech.com>
Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/Kconfig        |  4 +-
 drivers/usb/fotg210/Makefile       | 11 ++++-
 drivers/usb/fotg210/fotg210-core.c | 79 ++++++++++++++++++++++++++++++
 drivers/usb/fotg210/fotg210-hcd.c  | 49 +++---------------
 drivers/usb/fotg210/fotg210-udc.c  | 19 ++-----
 drivers/usb/fotg210/fotg210.h      | 42 ++++++++++++++++
 6 files changed, 142 insertions(+), 62 deletions(-)
 create mode 100644 drivers/usb/fotg210/fotg210-core.c
 create mode 100644 drivers/usb/fotg210/fotg210.h

diff --git a/drivers/usb/fotg210/Kconfig b/drivers/usb/fotg210/Kconfig
index e7a106785f5d..933c513b5728 100644
--- a/drivers/usb/fotg210/Kconfig
+++ b/drivers/usb/fotg210/Kconfig
@@ -12,7 +12,7 @@ config USB_FOTG210
 if USB_FOTG210
 
 config USB_FOTG210_HCD
-	tristate "Faraday FOTG210 USB Host Controller support"
+	bool "Faraday FOTG210 USB Host Controller support"
 	depends on USB
 	help
 	  Faraday FOTG210 is an OTG controller which can be configured as
@@ -24,7 +24,7 @@ config USB_FOTG210_HCD
 
 config USB_FOTG210_UDC
 	depends on USB_GADGET
-	tristate "Faraday FOTG210 USB Peripheral Controller support"
+	bool "Faraday FOTG210 USB Peripheral Controller support"
 	help
 	   Faraday USB2.0 OTG controller which can be configured as
 	   high speed or full speed USB device. This driver suppports
diff --git a/drivers/usb/fotg210/Makefile b/drivers/usb/fotg210/Makefile
index f4a26ca0e563..5aecff21f24b 100644
--- a/drivers/usb/fotg210/Makefile
+++ b/drivers/usb/fotg210/Makefile
@@ -1,3 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_USB_FOTG210_HCD)	+= fotg210-hcd.o
-obj-$(CONFIG_USB_FOTG210_UDC)	+= fotg210-udc.o
+
+# This setup links the different object files into one single
+# module so we don't have to EXPORT() a lot of internal symbols
+# or create unnecessary submodules.
+fotg210-objs-y				+= fotg210-core.o
+fotg210-objs-$(CONFIG_USB_FOTG210_HCD)	+= fotg210-hcd.o
+fotg210-objs-$(CONFIG_USB_FOTG210_UDC)	+= fotg210-udc.o
+fotg210-objs				:= $(fotg210-objs-y)
+obj-$(CONFIG_USB_FOTG210)		+= fotg210.o
diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
new file mode 100644
index 000000000000..ab7b8974bc18
--- /dev/null
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Central probing code for the FOTG210 dual role driver
+ * We register one driver for the hardware and then we decide
+ * whether to proceed with probing the host or the peripheral
+ * driver.
+ */
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/usb.h>
+
+#include "fotg210.h"
+
+static int fotg210_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (IS_ENABLED(CONFIG_USB_FOTG210_HCD)) {
+		ret = fotg210_hcd_probe(pdev);
+		if (ret)
+			return ret;
+	}
+	if (IS_ENABLED(CONFIG_USB_FOTG210_UDC))
+		ret = fotg210_udc_probe(pdev);
+
+	return ret;
+}
+
+static int fotg210_remove(struct platform_device *pdev)
+{
+	if (IS_ENABLED(CONFIG_USB_FOTG210_HCD))
+		fotg210_hcd_remove(pdev);
+	if (IS_ENABLED(CONFIG_USB_FOTG210_UDC))
+		fotg210_udc_remove(pdev);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id fotg210_of_match[] = {
+	{ .compatible = "faraday,fotg210" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, fotg210_of_match);
+#endif
+
+static struct platform_driver fotg210_driver = {
+	.driver = {
+		.name   = "fotg210",
+		.of_match_table = of_match_ptr(fotg210_of_match),
+	},
+	.probe  = fotg210_probe,
+	.remove = fotg210_remove,
+};
+
+static int __init fotg210_init(void)
+{
+	if (usb_disabled())
+		return -ENODEV;
+
+	if (IS_ENABLED(CONFIG_USB_FOTG210_HCD))
+		fotg210_hcd_init();
+	return platform_driver_register(&fotg210_driver);
+}
+module_init(fotg210_init);
+
+static void __exit fotg210_cleanup(void)
+{
+	platform_driver_unregister(&fotg210_driver);
+	if (IS_ENABLED(CONFIG_USB_FOTG210_HCD))
+		fotg210_hcd_cleanup();
+}
+module_exit(fotg210_cleanup);
+
+MODULE_AUTHOR("Yuan-Hsin Chen, Feng-Hsin Chiang");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("FOTG210 Dual Role Controller Driver");
diff --git a/drivers/usb/fotg210/fotg210-hcd.c b/drivers/usb/fotg210/fotg210-hcd.c
index 8fbf63e76d7d..51ac93a2eb98 100644
--- a/drivers/usb/fotg210/fotg210-hcd.c
+++ b/drivers/usb/fotg210/fotg210-hcd.c
@@ -39,8 +39,8 @@
 #include <asm/irq.h>
 #include <asm/unaligned.h>
 
-#define DRIVER_AUTHOR "Yuan-Hsin Chen"
-#define DRIVER_DESC "FOTG210 Host Controller (EHCI) Driver"
+#include "fotg210.h"
+
 static const char hcd_name[] = "fotg210_hcd";
 
 #undef FOTG210_URB_TRACE
@@ -5490,9 +5490,6 @@ static int fotg210_get_frame(struct usb_hcd *hcd)
  * functions  and in order to facilitate role switching we cannot
  * give the fotg210 driver exclusive access to those.
  */
-MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_AUTHOR(DRIVER_AUTHOR);
-MODULE_LICENSE("GPL");
 
 static const struct hc_driver fotg210_fotg210_hc_driver = {
 	.description		= hcd_name,
@@ -5560,7 +5557,7 @@ static void fotg210_init(struct fotg210_hcd *fotg210)
  * then invokes the start() method for the HCD associated with it
  * through the hotplug entry's driver_data.
  */
-static int fotg210_hcd_probe(struct platform_device *pdev)
+int fotg210_hcd_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct usb_hcd *hcd;
@@ -5652,7 +5649,7 @@ static int fotg210_hcd_probe(struct platform_device *pdev)
  * @dev: USB Host Controller being removed
  *
  */
-static int fotg210_hcd_remove(struct platform_device *pdev)
+int fotg210_hcd_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct fotg210_hcd *fotg210 = hcd_to_fotg210(hcd);
@@ -5668,27 +5665,8 @@ static int fotg210_hcd_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_OF
-static const struct of_device_id fotg210_of_match[] = {
-	{ .compatible = "faraday,fotg210" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, fotg210_of_match);
-#endif
-
-static struct platform_driver fotg210_hcd_driver = {
-	.driver = {
-		.name   = "fotg210-hcd",
-		.of_match_table = of_match_ptr(fotg210_of_match),
-	},
-	.probe  = fotg210_hcd_probe,
-	.remove = fotg210_hcd_remove,
-};
-
-static int __init fotg210_hcd_init(void)
+int __init fotg210_hcd_init(void)
 {
-	int retval = 0;
-
 	if (usb_disabled())
 		return -ENODEV;
 
@@ -5704,24 +5682,11 @@ static int __init fotg210_hcd_init(void)
 
 	fotg210_debug_root = debugfs_create_dir("fotg210", usb_debug_root);
 
-	retval = platform_driver_register(&fotg210_hcd_driver);
-	if (retval < 0)
-		goto clean;
-	return retval;
-
-clean:
-	debugfs_remove(fotg210_debug_root);
-	fotg210_debug_root = NULL;
-
-	clear_bit(USB_EHCI_LOADED, &usb_hcds_loaded);
-	return retval;
+	return 0;
 }
-module_init(fotg210_hcd_init);
 
-static void __exit fotg210_hcd_cleanup(void)
+void __exit fotg210_hcd_cleanup(void)
 {
-	platform_driver_unregister(&fotg210_hcd_driver);
 	debugfs_remove(fotg210_debug_root);
 	clear_bit(USB_EHCI_LOADED, &usb_hcds_loaded);
 }
-module_exit(fotg210_hcd_cleanup);
diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 01a4509775b2..7757aaa11d6f 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -16,6 +16,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 
+#include "fotg210.h"
 #include "fotg210-udc.h"
 
 #define	DRIVER_DESC	"FOTG210 USB Device Controller Driver"
@@ -1068,7 +1069,7 @@ static const struct usb_gadget_ops fotg210_gadget_ops = {
 	.udc_stop		= fotg210_udc_stop,
 };
 
-static int fotg210_udc_remove(struct platform_device *pdev)
+int fotg210_udc_remove(struct platform_device *pdev)
 {
 	struct fotg210_udc *fotg210 = platform_get_drvdata(pdev);
 	int i;
@@ -1085,7 +1086,7 @@ static int fotg210_udc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int fotg210_udc_probe(struct platform_device *pdev)
+int fotg210_udc_probe(struct platform_device *pdev)
 {
 	struct resource *res, *ires;
 	struct fotg210_udc *fotg210 = NULL;
@@ -1208,17 +1209,3 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 err:
 	return ret;
 }
-
-static struct platform_driver fotg210_driver = {
-	.driver		= {
-		.name =	udc_name,
-	},
-	.probe		= fotg210_udc_probe,
-	.remove		= fotg210_udc_remove,
-};
-
-module_platform_driver(fotg210_driver);
-
-MODULE_AUTHOR("Yuan-Hsin Chen, Feng-Hsin Chiang <john453@faraday-tech.com>");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/usb/fotg210/fotg210.h b/drivers/usb/fotg210/fotg210.h
new file mode 100644
index 000000000000..ef79d8323d89
--- /dev/null
+++ b/drivers/usb/fotg210/fotg210.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __FOTG210_H
+#define __FOTG210_H
+
+#ifdef CONFIG_USB_FOTG210_HCD
+int fotg210_hcd_probe(struct platform_device *pdev);
+int fotg210_hcd_remove(struct platform_device *pdev);
+int fotg210_hcd_init(void);
+void fotg210_hcd_cleanup(void);
+#else
+static inline int fotg210_hcd_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+static inline int fotg210_hcd_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+static inline int fotg210_hcd_init(void)
+{
+	return 0;
+}
+static inline void fotg210_hcd_cleanup(void)
+{
+}
+#endif
+
+#ifdef CONFIG_USB_FOTG210_UDC
+int fotg210_udc_probe(struct platform_device *pdev);
+int fotg210_udc_remove(struct platform_device *pdev);
+#else
+static inline int fotg210_udc_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+static inline int fotg210_udc_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+#endif
+
+#endif /* __FOTG210_H */
-- 
2.37.3

