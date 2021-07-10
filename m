Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DD33C2CF5
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 04:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbhGJCVR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jul 2021 22:21:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232069AbhGJCVJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Jul 2021 22:21:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A79B613D0;
        Sat, 10 Jul 2021 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625883502;
        bh=N9tg4uOowuFl6i9wi0x5B9WKbHwNGTjWXkUqtqYIuno=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D+ItXg4RY/6WzM8VE3gc04iJEsB/UKZ19jcZa/RQCTkrJY14cSoOlFsWRvVKTHI6N
         AJ5cgSdvzb5kj4lGAre5T9aPkNM2cwMflUJpyMD5LfRnIblgVfLbA82esCdF+XwYOU
         ao3v7tFCWfpOOKuXTfjVeKt/nRZxiNx2s7RlKVZE6Q7OzVkK4p2bS/QQ+Vyxaj6IQU
         1V/iWp+lTBYfVr82+12mffGfVOcy5m70FNexnaRRVQ/3YRihni87ChYg/7lT6YllPm
         vAZdN2jfpEC+nSH/1iIRd8RVUSb3c7mBTzeqmVKgEzAqAJ8t43o1gmfOwLPta+QGJ4
         QoV8dNWQabCsg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 024/114] usb: common: usb-conn-gpio: fix NULL pointer dereference of charger
Date:   Fri,  9 Jul 2021 22:16:18 -0400
Message-Id: <20210710021748.3167666-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710021748.3167666-1-sashal@kernel.org>
References: <20210710021748.3167666-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

[ Upstream commit 880287910b1892ed2cb38977893b947382a09d21 ]

When power on system with OTG cable, IDDIG's interrupt arises before
the charger registration, it will cause a NULL pointer dereference,
fix the issue by registering the power supply before requesting
IDDIG/VBUS irq.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/common/usb-conn-gpio.c | 44 ++++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 6c4e3a19f42c..c9545a4eff66 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -149,14 +149,32 @@ static int usb_charger_get_property(struct power_supply *psy,
 	return 0;
 }
 
-static int usb_conn_probe(struct platform_device *pdev)
+static int usb_conn_psy_register(struct usb_conn_info *info)
 {
-	struct device *dev = &pdev->dev;
-	struct power_supply_desc *desc;
-	struct usb_conn_info *info;
+	struct device *dev = info->dev;
+	struct power_supply_desc *desc = &info->desc;
 	struct power_supply_config cfg = {
 		.of_node = dev->of_node,
 	};
+
+	desc->name = "usb-charger";
+	desc->properties = usb_charger_properties;
+	desc->num_properties = ARRAY_SIZE(usb_charger_properties);
+	desc->get_property = usb_charger_get_property;
+	desc->type = POWER_SUPPLY_TYPE_USB;
+	cfg.drv_data = info;
+
+	info->charger = devm_power_supply_register(dev, desc, &cfg);
+	if (IS_ERR(info->charger))
+		dev_err(dev, "Unable to register charger\n");
+
+	return PTR_ERR_OR_ZERO(info->charger);
+}
+
+static int usb_conn_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct usb_conn_info *info;
 	bool need_vbus = true;
 	int ret = 0;
 
@@ -218,6 +236,10 @@ static int usb_conn_probe(struct platform_device *pdev)
 		return PTR_ERR(info->role_sw);
 	}
 
+	ret = usb_conn_psy_register(info);
+	if (ret)
+		goto put_role_sw;
+
 	if (info->id_gpiod) {
 		info->id_irq = gpiod_to_irq(info->id_gpiod);
 		if (info->id_irq < 0) {
@@ -252,20 +274,6 @@ static int usb_conn_probe(struct platform_device *pdev)
 		}
 	}
 
-	desc = &info->desc;
-	desc->name = "usb-charger";
-	desc->properties = usb_charger_properties;
-	desc->num_properties = ARRAY_SIZE(usb_charger_properties);
-	desc->get_property = usb_charger_get_property;
-	desc->type = POWER_SUPPLY_TYPE_USB;
-	cfg.drv_data = info;
-
-	info->charger = devm_power_supply_register(dev, desc, &cfg);
-	if (IS_ERR(info->charger)) {
-		dev_err(dev, "Unable to register charger\n");
-		return PTR_ERR(info->charger);
-	}
-
 	platform_set_drvdata(pdev, info);
 
 	/* Perform initial detection */
-- 
2.30.2

