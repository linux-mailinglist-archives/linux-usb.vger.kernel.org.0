Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1C912DAB1
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2019 18:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfLaRol (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Dec 2019 12:44:41 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44395 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLaRol (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Dec 2019 12:44:41 -0500
Received: by mail-lj1-f195.google.com with SMTP id u71so36895092lje.11
        for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2019 09:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5gAAk9P/tcFOsy4EXXX+v22wEni3Ss3VnVf0JOSQBU=;
        b=IDxEB7263LoRzj4LqzBKBqr5Ii4umBR2/zbtkyJaZ4z3yO7My4yHBmXwCJoi0+GEgI
         ocoxlNfe4nSDN1ueawmC+aBarUCfTgNpbNzdommOZ6kUGxAJMMnfcB84/yLwuETkg3ZN
         gqcARd9Hu/aTtgQJhkII6INxCoT40wVOKn2/mwQnFC5U8FHAnsEZpYCzbjCbECqHkhoh
         G6VcfTOfCgfd45z7zdKqQSVEWn34j7YOzwIPzpgaNYk3Ckk1YSGbBdhwZSN/eXjrb523
         Y4sfPQQT9bbc/roUHKQtLbmXZHURVKeM1BkizQyXI2NmDc3U1kpo1poq4PixzkpnOS+j
         qGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5gAAk9P/tcFOsy4EXXX+v22wEni3Ss3VnVf0JOSQBU=;
        b=XvU8268JSxfFZ3wP4/eIeQBIc3ff4FwCX2U1oioFl3JCHjCpPF4fCvnnpyWyRVoL0e
         j1uRBdR/FAH2TMZH9fbKnXqEvuWP/GjWjCFr+MiV4tMz7DGKcqohLewBgmVxsqkm7nvZ
         O87IygEwVAPpDRisTBua+CpZ0Y/0qo72vXg+iggXDuVxd33GPRwRAMRTo+efx1bhvFu6
         /JB3aPMAGpni3NfDdOOR8U+KxXaZTRJBAGn6HOX6/UXwTI9NeQ6FLv+RXU8cLS7yisTZ
         nhCeMfcYiGZzf6djl8dQce3UuAqjRTqvZWtmNUk2LV5M0RUxIHthU9glnr0o96trRCIV
         v6Wg==
X-Gm-Message-State: APjAAAUdHb1fy61Kqv5tNzJYasv9hsuk/nHJAuzpKt83hJrw5ugL+VT4
        FYst0DLzQHwHN2ZLQBQtQ6nHdQ==
X-Google-Smtp-Source: APXvYqwWPDnSE7CGZwtu09zLTpkwPEcYmBODTE5YsTg1Rp24oLuiCVWSEa31haqmrqyJneia9iqtZg==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr41527095lji.93.1577814278913;
        Tue, 31 Dec 2019 09:44:38 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id x84sm20606125lfa.97.2019.12.31.09.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 09:44:38 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] usb: phy-generic: Delete unused platform data
Date:   Tue, 31 Dec 2019 18:42:35 +0100
Message-Id: <20191231174235.740571-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The last user of the phy generic platform data was
deleted in commit 1e041b6f313aaa966612a7e415cfc09c90d6b829
("usb: dwc3: exynos: Remove dead code"). So get rid of
the platform data, which rids us of another consumer of
the legacy GPIO API at the same time. Make sure we
only inlcude <linux/gpio/consumer.h> which is all we use.

Alter the usb_phy_gen_create_phy() function prototype to
not pass any platform data as this is just hardcoded to
NULL at all locations calling it in the kernel.

Move the devm_gpiod_get* calls out of the if (of_node)
parenthesis, as these calls are generic and do not depend
on device tree, they are used by any hardware description.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/phy/phy-am335x.c        |  2 +-
 drivers/usb/phy/phy-generic.c       | 39 +++++++++--------------------
 drivers/usb/phy/phy-generic.h       |  3 +--
 drivers/usb/phy/phy-keystone.c      |  2 +-
 include/linux/usb/usb_phy_generic.h | 12 ---------
 5 files changed, 15 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/phy/phy-am335x.c b/drivers/usb/phy/phy-am335x.c
index f5f0568d8533..8524475d942d 100644
--- a/drivers/usb/phy/phy-am335x.c
+++ b/drivers/usb/phy/phy-am335x.c
@@ -57,7 +57,7 @@ static int am335x_phy_probe(struct platform_device *pdev)
 
 	am_phy->dr_mode = of_usb_get_dr_mode_by_phy(pdev->dev.of_node, -1);
 
-	ret = usb_phy_gen_create_phy(dev, &am_phy->usb_phy_gen, NULL);
+	ret = usb_phy_gen_create_phy(dev, &am_phy->usb_phy_gen);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index a53b89be5324..661a229c105d 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -21,8 +21,7 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 
 #include "phy-generic.h"
@@ -204,8 +203,7 @@ static int nop_set_host(struct usb_otg *otg, struct usb_bus *host)
 	return 0;
 }
 
-int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop,
-		struct usb_phy_generic_platform_data *pdata)
+int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop)
 {
 	enum usb_phy_type type = USB_PHY_TYPE_USB2;
 	int err = 0;
@@ -221,28 +219,15 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop,
 
 		needs_vcc = of_property_read_bool(node, "vcc-supply");
 		needs_clk = of_property_read_bool(node, "clocks");
-		nop->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
-							   GPIOD_ASIS);
-		err = PTR_ERR_OR_ZERO(nop->gpiod_reset);
-		if (!err) {
-			nop->gpiod_vbus = devm_gpiod_get_optional(dev,
-							 "vbus-detect",
-							 GPIOD_ASIS);
-			err = PTR_ERR_OR_ZERO(nop->gpiod_vbus);
-		}
-	} else if (pdata) {
-		type = pdata->type;
-		clk_rate = pdata->clk_rate;
-		needs_vcc = pdata->needs_vcc;
-		if (gpio_is_valid(pdata->gpio_reset)) {
-			err = devm_gpio_request_one(dev, pdata->gpio_reset,
-						    GPIOF_ACTIVE_LOW,
-						    dev_name(dev));
-			if (!err)
-				nop->gpiod_reset =
-					gpio_to_desc(pdata->gpio_reset);
-		}
-		nop->gpiod_vbus = pdata->gpiod_vbus;
+	}
+	nop->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_ASIS);
+	err = PTR_ERR_OR_ZERO(nop->gpiod_reset);
+	if (!err) {
+		nop->gpiod_vbus = devm_gpiod_get_optional(dev,
+						 "vbus-detect",
+						 GPIOD_ASIS);
+		err = PTR_ERR_OR_ZERO(nop->gpiod_vbus);
 	}
 
 	if (err == -EPROBE_DEFER)
@@ -308,7 +293,7 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 	if (!nop)
 		return -ENOMEM;
 
-	err = usb_phy_gen_create_phy(dev, nop, dev_get_platdata(&pdev->dev));
+	err = usb_phy_gen_create_phy(dev, nop);
 	if (err)
 		return err;
 	if (nop->gpiod_vbus) {
diff --git a/drivers/usb/phy/phy-generic.h b/drivers/usb/phy/phy-generic.h
index 97289627561d..7ee80211a688 100644
--- a/drivers/usb/phy/phy-generic.h
+++ b/drivers/usb/phy/phy-generic.h
@@ -22,7 +22,6 @@ struct usb_phy_generic {
 int usb_gen_phy_init(struct usb_phy *phy);
 void usb_gen_phy_shutdown(struct usb_phy *phy);
 
-int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop,
-		struct usb_phy_generic_platform_data *pdata);
+int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop);
 
 #endif
diff --git a/drivers/usb/phy/phy-keystone.c b/drivers/usb/phy/phy-keystone.c
index 110e6e9ad621..9c226b57153b 100644
--- a/drivers/usb/phy/phy-keystone.c
+++ b/drivers/usb/phy/phy-keystone.c
@@ -76,7 +76,7 @@ static int keystone_usbphy_probe(struct platform_device *pdev)
 	if (IS_ERR(k_phy->phy_ctrl))
 		return PTR_ERR(k_phy->phy_ctrl);
 
-	ret = usb_phy_gen_create_phy(dev, &k_phy->usb_phy_gen, NULL);
+	ret = usb_phy_gen_create_phy(dev, &k_phy->usb_phy_gen);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/usb/usb_phy_generic.h b/include/linux/usb/usb_phy_generic.h
index 7408cf52c710..cd9e70a552a0 100644
--- a/include/linux/usb/usb_phy_generic.h
+++ b/include/linux/usb/usb_phy_generic.h
@@ -3,18 +3,6 @@
 #define __LINUX_USB_NOP_XCEIV_H
 
 #include <linux/usb/otg.h>
-#include <linux/gpio/consumer.h>
-
-struct usb_phy_generic_platform_data {
-	enum usb_phy_type type;
-	unsigned long clk_rate;
-
-	/* if set fails with -EPROBE_DEFER if can't get regulator */
-	unsigned int needs_vcc:1;
-	unsigned int needs_reset:1;	/* deprecated */
-	int gpio_reset;
-	struct gpio_desc *gpiod_vbus;
-};
 
 #if IS_ENABLED(CONFIG_NOP_USB_XCEIV)
 /* sometimes transceivers are accessed only through e.g. ULPI */
-- 
2.23.0

