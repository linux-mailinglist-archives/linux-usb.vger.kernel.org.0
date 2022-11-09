Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F273662342C
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 21:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbiKIUGR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 15:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiKIUGO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 15:06:14 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09F42E6A9
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 12:06:12 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id r12so27655700lfp.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Nov 2022 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SYyQhWxNcV28AdR8yEqxy3//HqYkoR7M2xsPGrRaNOk=;
        b=zqdUxw4+/S2Em7MTOsMjl+Sxi6DWFL9j/RUsK7ljtad4paMf9Em/hmwJ99zPBNWLTc
         RGKc625nIAybuFJ7Apv1/Tue9clEVL8hZ7p13kOkIs+YGOPc5KDyX2bbx9TbTF7agIeR
         r1SLKpm8ZLV8Npo81grG/x8GBqXJY3N2/e5xN/y/uM0a/fYERvpT720Dlb89X5eC40BZ
         decimZd8ZrD6QpJD5Q17dgwpzGMtJ5/K4LszYRuDhLwP6GYepcU440/gdz8n51SCsA4A
         XxeNTdJykn23rxiLPB/AqrtFYn3IGCThlBd/bg4EFFQSyDXHpEp1pAsN81sEBj6qZjJ6
         jm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYyQhWxNcV28AdR8yEqxy3//HqYkoR7M2xsPGrRaNOk=;
        b=zcVDIzDiq+gfTwP25OlNhVydY+GjzUGM+YInaszRDS/rNPjDr0dlV9QSNM/EOk6tiH
         wCBmonQ2jEuspifVFTgQuHSt+Gs6baZLrNrk/RbCWJsdf0L+4tqd0aI+49h9HF1AArTt
         c2VeZafkhNbimc6crhsIFuQOmKsc3qbfykVUMIiZyK03y+6p1lttU6qypQ0OqZ6TJsrc
         tpSZ61qOfbqw62tPjzbr/XGQvQV6E9YttpLrgqBMtWfxi1mgg7v3sIC3EBH20uvXV47+
         M7pOF348Td+9eO84Aqp4Px+deXW+TUuu4MtSxa2RjitsS2hfJVdjQ/a8JdoIwVrQ2S5P
         hL0g==
X-Gm-Message-State: ACrzQf0JWG9/Th9F7itwm9g1G9I/0cEzvfW4r2fguZMkxFcnw3Ob0N0S
        VXf+hMrEVsxfqSHOBurDAjJ8rhsAEslXiQ==
X-Google-Smtp-Source: AMsMyM72kVPLj+aKVMSLLKn1i+9vnhdMrNpvXieJmq5JsFqwxr1n4OT3q9wcEnfK42bnssfHb+EjFg==
X-Received: by 2002:ac2:51c4:0:b0:4a7:5a63:71e1 with SMTP id u4-20020ac251c4000000b004a75a6371e1mr837213lfm.399.1668024357670;
        Wed, 09 Nov 2022 12:05:57 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id g29-20020a0565123b9d00b004a47a92ff4csm2357712lfv.193.2022.11.09.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:05:56 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] usb: fotg2: add Gemini-specific handling
Date:   Wed,  9 Nov 2022 21:05:54 +0100
Message-Id: <20221109200554.1957185-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
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

The Cortina Systems Gemini has bolted on a PHY inside the
silicon that can be handled by six bits in a MISC register in
the system controller.

If we are running on Gemini, look up a syscon regmap through
a phandle and enable VBUS and optionally the Mini-B connector.

If the device is flagged as "wakeup-source" using the standard
DT bindings, we also enable this in the global controller for
respective port.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/Kconfig        |  1 +
 drivers/usb/fotg210/fotg210-core.c | 80 ++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/usb/fotg210/Kconfig b/drivers/usb/fotg210/Kconfig
index 933c513b5728..534206ee0d1d 100644
--- a/drivers/usb/fotg210/Kconfig
+++ b/drivers/usb/fotg210/Kconfig
@@ -5,6 +5,7 @@ config USB_FOTG210
 	depends on USB || USB_GADGET
 	depends on HAS_DMA && HAS_IOMEM
 	default ARCH_GEMINI
+	select MFD_SYSCON
 	help
 	  Faraday FOTG210 is a dual-mode USB controller that can act
 	  in both host controller and peripheral controller mode.
diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 3d07ee46f6d1..8a54edf921ac 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -5,15 +5,86 @@
  * whether to proceed with probing the host or the peripheral
  * driver.
  */
+#include <linux/bitops.h>
 #include <linux/device.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/usb.h>
 #include <linux/usb/otg.h>
 
 #include "fotg210.h"
 
+/*
+ * Gemini-specific initialization function, only executed on the
+ * Gemini SoC using the global misc control register.
+ *
+ * The gemini USB blocks are connected to either Mini-A (host mode) or
+ * Mini-B (peripheral mode) plugs. There is no role switch support on the
+ * Gemini SoC, just either-or.
+ */
+#define GEMINI_GLOBAL_MISC_CTRL		0x30
+#define GEMINI_MISC_USB0_WAKEUP		BIT(14)
+#define GEMINI_MISC_USB1_WAKEUP		BIT(15)
+#define GEMINI_MISC_USB0_VBUS_ON	BIT(22)
+#define GEMINI_MISC_USB1_VBUS_ON	BIT(23)
+#define GEMINI_MISC_USB0_MINI_B		BIT(29)
+#define GEMINI_MISC_USB1_MINI_B		BIT(30)
+
+static int fotg210_gemini_init(struct device *dev, struct resource *res,
+			       enum usb_dr_mode mode)
+{
+	struct device_node *np = dev->of_node;
+	struct regmap *map;
+	bool wakeup;
+	u32 mask, val;
+	int ret;
+
+	map = syscon_regmap_lookup_by_phandle(np, "syscon");
+	if (IS_ERR(map)) {
+		dev_err(dev, "no syscon\n");
+		return PTR_ERR(map);
+	}
+	wakeup = of_property_read_bool(np, "wakeup-source");
+
+	/*
+	 * Figure out if this is USB0 or USB1 by simply checking the
+	 * physical base address.
+	 */
+	mask = 0;
+	if (res->start == 0x69000000) {
+		mask = GEMINI_MISC_USB1_VBUS_ON | GEMINI_MISC_USB1_MINI_B |
+			GEMINI_MISC_USB1_WAKEUP;
+		if (mode == USB_DR_MODE_HOST)
+			val = GEMINI_MISC_USB1_VBUS_ON;
+		else
+			val = GEMINI_MISC_USB1_MINI_B;
+		if (wakeup)
+			val |= GEMINI_MISC_USB1_WAKEUP;
+	} else {
+		mask = GEMINI_MISC_USB0_VBUS_ON | GEMINI_MISC_USB0_MINI_B |
+			GEMINI_MISC_USB0_WAKEUP;
+		if (mode == USB_DR_MODE_HOST)
+			val = GEMINI_MISC_USB0_VBUS_ON;
+		else
+			val = GEMINI_MISC_USB0_MINI_B;
+		if (wakeup)
+			val |= GEMINI_MISC_USB0_WAKEUP;
+	}
+
+	ret = regmap_update_bits(map, GEMINI_GLOBAL_MISC_CTRL, mask, val);
+	if (ret) {
+		dev_err(dev, "failed to initialize Gemini PHY\n");
+		return ret;
+	}
+
+	dev_info(dev, "initialized Gemini PHY in %s mode\n",
+		 (mode == USB_DR_MODE_HOST) ? "host" : "gadget");
+	return 0;
+}
+
 static int fotg210_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -22,6 +93,15 @@ static int fotg210_probe(struct platform_device *pdev)
 
 	mode = usb_get_dr_mode(dev);
 
+	if (of_device_is_compatible(dev->of_node, "cortina,gemini-usb")) {
+		struct resource *res;
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		ret = fotg210_gemini_init(dev, res, mode);
+		if (ret)
+			return ret;
+	}
+
 	if (mode == USB_DR_MODE_PERIPHERAL)
 		ret = fotg210_udc_probe(pdev);
 	else
-- 
2.37.3

