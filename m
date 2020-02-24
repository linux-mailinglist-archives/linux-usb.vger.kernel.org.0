Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 355E2169BE2
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 02:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbgBXBkh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 20:40:37 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:48846 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgBXBkg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 20:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582508426; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ba69q4qfJBwAZRYRQjM4kMSvZn4+EOsEiCJjiO0kjOQ=;
        b=nBH5LxzixXKIrTZy/sAaPtG0Xpnyk05AzpOsP45FP0dFYNE0rfE8T5LQ79si+NuZBNe/Pn
        vodoQ4+b1TW+5HypnNVo+nOkqmPls9ytvho6KgrimxwY4hbvjINTYl+6uoxy1T5snaz5u0
        k2Gj6yAQvU+qed3lcW7E4ri5PM36WH4=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     od@zcrc.me, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 3/5] usb: musb: jz4740: Register USB role switch
Date:   Sun, 23 Feb 2020 22:40:06 -0300
Message-Id: <20200224014008.27114-3-paul@crapouillou.net>
In-Reply-To: <20200224014008.27114-1-paul@crapouillou.net>
References: <20200224014008.27114-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Register a USB role switch, in order to get notified by the connector
driver when the USB role changes. The notification is then transmitted
to the PHY.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 drivers/usb/musb/Kconfig  |  1 +
 drivers/usb/musb/jz4740.c | 46 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index c4b349e074c1..3268adb7d7cf 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -113,6 +113,7 @@ config USB_MUSB_JZ4740
 	depends on MIPS || COMPILE_TEST
 	depends on USB_MUSB_GADGET
 	depends on USB=n || USB_OTG_BLACKLIST_HUB
+	select USB_ROLE_SWITCH
 
 config USB_MUSB_MEDIATEK
 	tristate "MediaTek platforms"
diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index aa32b5af0c1f..bbfeb9881788 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -12,13 +12,16 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/usb/role.h>
 #include <linux/usb/usb_phy_generic.h>
 
 #include "musb_core.h"
 
 struct jz4740_glue {
 	struct platform_device	*pdev;
+	struct musb		*musb;
 	struct clk		*clk;
+	struct usb_role_switch	*role_sw;
 };
 
 static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
@@ -72,11 +75,38 @@ static const struct musb_hdrc_config jz4740_musb_config = {
 	.fifo_cfg_size	= ARRAY_SIZE(jz4740_musb_fifo_cfg),
 };
 
+static int jz4740_musb_role_switch_set(struct device *dev, enum usb_role role)
+{
+	struct jz4740_glue *glue = dev_get_drvdata(dev);
+	struct usb_phy *phy = glue->musb->xceiv;
+
+	switch (role) {
+	case USB_ROLE_NONE:
+		atomic_notifier_call_chain(&phy->notifier, USB_EVENT_NONE, phy);
+		break;
+	case USB_ROLE_DEVICE:
+		atomic_notifier_call_chain(&phy->notifier, USB_EVENT_VBUS, phy);
+		break;
+	case USB_ROLE_HOST:
+		atomic_notifier_call_chain(&phy->notifier, USB_EVENT_ID, phy);
+		break;
+	}
+
+	return 0;
+}
+
 static int jz4740_musb_init(struct musb *musb)
 {
 	struct device *dev = musb->controller->parent;
+	struct jz4740_glue *glue = dev_get_drvdata(dev);
+	struct usb_role_switch_desc role_sw_desc = {
+		.set = jz4740_musb_role_switch_set,
+		.fwnode = dev_fwnode(dev),
+	};
 	int err;
 
+	glue->musb = musb;
+
 	if (dev->of_node)
 		musb->xceiv = devm_usb_get_phy_by_phandle(dev, "phys", 0);
 	else
@@ -88,6 +118,12 @@ static int jz4740_musb_init(struct musb *musb)
 		return err;
 	}
 
+	glue->role_sw = usb_role_switch_register(dev, &role_sw_desc);
+	if (IS_ERR(glue->role_sw)) {
+		dev_err(dev, "Failed to register USB role switch");
+		return PTR_ERR(glue->role_sw);
+	}
+
 	/*
 	 * Silicon does not implement ConfigData register.
 	 * Set dyn_fifo to avoid reading EP config from hardware.
@@ -99,10 +135,20 @@ static int jz4740_musb_init(struct musb *musb)
 	return 0;
 }
 
+static int jz4740_musb_exit(struct musb *musb)
+{
+	struct jz4740_glue *glue = dev_get_drvdata(musb->controller->parent);
+
+	usb_role_switch_unregister(glue->role_sw);
+
+	return 0;
+}
+
 static const struct musb_platform_ops jz4740_musb_ops = {
 	.quirks		= MUSB_DMA_INVENTRA | MUSB_INDEXED_EP,
 	.fifo_mode	= 2,
 	.init		= jz4740_musb_init,
+	.exit		= jz4740_musb_exit,
 #ifdef CONFIG_USB_INVENTRA_DMA
 	.dma_init	= musbhs_dma_controller_create_noirq,
 	.dma_exit	= musbhs_dma_controller_destroy,
-- 
2.25.0

