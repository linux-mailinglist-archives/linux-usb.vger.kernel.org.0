Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3873A61E76E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 00:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiKFXFN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Nov 2022 18:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiKFXFM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Nov 2022 18:05:12 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F1CC774
        for <linux-usb@vger.kernel.org>; Sun,  6 Nov 2022 15:05:11 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d3so13804166ljl.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Nov 2022 15:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1UmvPpaovEF+oYsyI6XeFRiyjpGpJnNZ03ZS8xtxoE=;
        b=EeTZHGBaNvXZzyZ9KdTb2Ofp0qFp6+jf+tXuwv52528QCUbiuv37ABxLOmvhIen564
         6wC+BnEVPCsJO4Degy+LQotYbywZsrB20XxFYocDABgBK4HTVgrzGmv/dDrsIn2s3ISf
         FVpQ+umHkur5Bup/MAMHoujI5D7thofKECd8CfCdLtKrC3yQglcCuJuymCJPs7t2HXDC
         6Yd0oSyBA2BgyXC6nguVuSZq6YGZ7MUNhcbwv/0dyiVr9BG7uFcn/nCRdmcQbx11Gw7p
         FLbPjW+hZhNVIWdpdadR9LrOx8Y1CMcXe+7pQQ+7xCmlMHlHDUy8sCUNdVtfo6tBrNfa
         4THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1UmvPpaovEF+oYsyI6XeFRiyjpGpJnNZ03ZS8xtxoE=;
        b=h9qO9tk7va01zXWxp7SvO2gixV23JbUCo48b5e6nxAagNdmL/uDjVtIFg/TLSY3khF
         Jgfn14bHrRnPxShzN+XKWQ07Ecm7IiFXrbR9HQy+wHd35bfFp22rhXExslLUXw8bU+Uz
         516DH6H6uaRtCSXOnjelAfETWI5NIt2BdEfHOOwX4h8YdGHH9BrJlXq3p8kCJMwx0F5c
         Lh7wKTwLzPq/zPhvro97/gF1U3oEPzys/hOtw28eC/sl9feoTj1EtbSVCfpdtf3anqJw
         sKmvS4kpV7I+IjlvMN171rQBhzey6eA/tzkcwhEB/eTtrh5jKB1iboGV5E+XUWLmI2DQ
         V+NA==
X-Gm-Message-State: ACrzQf26rFLvbiTTZ40Ia8LdE/ehJTdWQmedYo43odJLhRAVR33Snqnp
        vwKw02SKlJZV8dTJvQgI02JGig==
X-Google-Smtp-Source: AMsMyM6cBYB3iKzqyiEFQBzt802VD7GV9xut6UMRe3aRz9F4S8tMFJYbgP+Nntr9wKu/fOtKuyyBCw==
X-Received: by 2002:a2e:bd0e:0:b0:268:c03b:cf56 with SMTP id n14-20020a2ebd0e000000b00268c03bcf56mr17346733ljq.393.1667775909973;
        Sun, 06 Nov 2022 15:05:09 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id f3-20020ac24e43000000b0048b1b2233ddsm911988lfr.120.2022.11.06.15.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 15:05:09 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Prashant Malani <pmalani@chromium.org>
Subject: [PATCH v2] usb: phy: phy-gpio-vbus-usb: Add device tree probing
Date:   Mon,  7 Nov 2022 00:05:06 +0100
Message-Id: <20221106230506.1646101-1-linus.walleij@linaro.org>
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

Make it possible to probe the GPIO VBUS detection driver
from the device tree compatible for GPIO USB B connectors.

Since this driver is using the "gpio-usb-b-connector"
compatible, it is important to discern it from the role
switch connector driver (which does not provide a phy),
so we add some Kconfig text and depend on !USB_CONN_GPIO.

Cc: Rob Herring <robh@kernel.org>
Cc: Prashant Malani <pmalani@chromium.org>
Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Use the existing DT binding from the gpio-usb-b-connector
---
 drivers/usb/phy/Kconfig             |  6 +++++-
 drivers/usb/phy/phy-gpio-vbus-usb.c | 12 ++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 2acbe41fbf7e..efdcafdbe46d 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -93,12 +93,16 @@ config USB_GPIO_VBUS
 	tristate "GPIO based peripheral-only VBUS sensing 'transceiver'"
 	depends on GPIOLIB || COMPILE_TEST
 	depends on USB_GADGET || !USB_GADGET # if USB_GADGET=m, this can't be 'y'
+	depends on !USB_CONN_GPIO
 	select USB_PHY
 	help
 	  Provides simple GPIO VBUS sensing for controllers with an
 	  internal transceiver via the usb_phy interface, and
 	  optionally control of a D+ pullup GPIO as well as a VBUS
-	  current limit regulator.
+	  current limit regulator. This driver is for devices that do
+	  NOT support role switch. OTG devices that can do role switch
+	  (master/peripheral) shall use the USB based connection
+	  detection driver USB_CONN_GPIO.
 
 config OMAP_OTG
 	tristate "OMAP USB OTG controller driver"
diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index f13f5530746c..12dfeff7de3d 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -366,12 +366,24 @@ static const struct dev_pm_ops gpio_vbus_dev_pm_ops = {
 
 MODULE_ALIAS("platform:gpio-vbus");
 
+/*
+ * NOTE: this driver matches against "gpio-usb-b-connector" for
+ * devices that do NOT support role switch.
+ */
+static const struct of_device_id gpio_vbus_of_match[] = {
+	{
+		.compatible = "gpio-usb-b-connector",
+	},
+	{},
+};
+
 static struct platform_driver gpio_vbus_driver = {
 	.driver = {
 		.name  = "gpio-vbus",
 #ifdef CONFIG_PM
 		.pm = &gpio_vbus_dev_pm_ops,
 #endif
+		.of_match_table = gpio_vbus_of_match,
 	},
 	.probe		= gpio_vbus_probe,
 	.remove		= gpio_vbus_remove,
-- 
2.37.3

