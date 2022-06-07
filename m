Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F01454002C
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 15:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244816AbiFGNgE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 09:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244823AbiFGNgC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 09:36:02 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1A6D2460;
        Tue,  7 Jun 2022 06:35:59 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A7591FF808;
        Tue,  7 Jun 2022 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1654608958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=x/2MYis5whDLEikQJTsiWgIVIR/tyXFDwtuLu2I9a4U=;
        b=kGiqaTcvB3zmW/DKyC1rreLfCGQGhy7BeyOgAQmz+Qn+BMfR08J6eqetbBee36z5Bq1anf
        9T/Gu77nJKVBLXU0SJvH3fZB0f4amZq/KulUnH13ceMgJF3w5AuaJFuIG9csskQbk9B8Xv
        3ZPOgVBYjp620dMvwTgnzshBacUqgp4oUgzhcA0PoL7FbWE5ugr5o6wii9QbmaLYMTrjLz
        oyg9yVu/wINe2z9DGyLf9FAcGSd5ZRk8at3lBZQ/jTdv/Kh51k48NKcSiF4z0c5zLSNv3J
        4YZ38QHRzz6GnEl4c5We9zLC+7B8CaCkMajIfW9kDzy47mbftxkBgsJiffbf+Q==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2] usb: host: ohci-at91: add support to enter suspend using SMC
Date:   Tue,  7 Jun 2022 15:34:54 +0200
Message-Id: <20220607133454.727063-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When Linux is running under OP-TEE, the SFR is set as secured and thus
the AT91_OHCIICR_USB_SUSPEND register isn't accessible. Add a SMC to
do the appropriate call to suspend the controller.
The SMC id is fetched from the device-tree property
"microchip,suspend-smc-id". if present, then the syscon regmap is not
used to enter suspend and a SMC is issued.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---

Notes:
    Changes in V2:
     - Change check order in ohci_at91_port_suspend()
     - Renamed smc_id to suspend_smc_id for clarity

 drivers/usb/host/ohci-at91.c | 69 ++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index a24aea3d2759..98326465e2dc 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -13,6 +13,7 @@
  * This file is licenced under the GPL.
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
@@ -55,6 +56,7 @@ struct ohci_at91_priv {
 	bool clocked;
 	bool wakeup;		/* Saved wake-up state for resume */
 	struct regmap *sfr_regmap;
+	u32 suspend_smc_id;
 };
 /* interface and function clocks; sometimes also an AHB clock */
 
@@ -135,6 +137,19 @@ static void at91_stop_hc(struct platform_device *pdev)
 
 static void usb_hcd_at91_remove (struct usb_hcd *, struct platform_device *);
 
+static u32 at91_dt_suspend_smc(struct device *dev)
+{
+	u32 suspend_smc_id;
+
+	if (!dev->of_node)
+		return 0;
+
+	if (of_property_read_u32(dev->of_node, "microchip,suspend-smc-id", &suspend_smc_id))
+		return 0;
+
+	return suspend_smc_id;
+}
+
 static struct regmap *at91_dt_syscon_sfr(void)
 {
 	struct regmap *regmap;
@@ -215,9 +230,13 @@ static int usb_hcd_at91_probe(const struct hc_driver *driver,
 		goto err;
 	}
 
-	ohci_at91->sfr_regmap = at91_dt_syscon_sfr();
-	if (!ohci_at91->sfr_regmap)
-		dev_dbg(dev, "failed to find sfr node\n");
+	ohci_at91->suspend_smc_id = at91_dt_suspend_smc(dev);
+	if (!ohci_at91->suspend_smc_id)  {
+		dev_dbg(dev, "failed to find sfr suspend smc id, using regmap\n");
+		ohci_at91->sfr_regmap = at91_dt_syscon_sfr();
+		if (!ohci_at91->sfr_regmap)
+			dev_dbg(dev, "failed to find sfr node\n");
+	}
 
 	board = hcd->self.controller->platform_data;
 	ohci = hcd_to_ohci(hcd);
@@ -303,24 +322,30 @@ static int ohci_at91_hub_status_data(struct usb_hcd *hcd, char *buf)
 	return length;
 }
 
-static int ohci_at91_port_suspend(struct regmap *regmap, u8 set)
+static int ohci_at91_port_suspend(struct ohci_at91_priv *ohci_at91, u8 set)
 {
+	struct regmap *regmap = ohci_at91->sfr_regmap;
 	u32 regval;
 	int ret;
 
-	if (!regmap)
-		return 0;
+	if (ohci_at91->suspend_smc_id) {
+		struct arm_smccc_res res;
 
-	ret = regmap_read(regmap, AT91_SFR_OHCIICR, &regval);
-	if (ret)
-		return ret;
+		arm_smccc_smc(ohci_at91->suspend_smc_id, set, 0, 0, 0, 0, 0, 0, &res);
+		if (res.a0)
+			return -EINVAL;
+	} else if (regmap) {
+		ret = regmap_read(regmap, AT91_SFR_OHCIICR, &regval);
+		if (ret)
+			return ret;
 
-	if (set)
-		regval |= AT91_OHCIICR_USB_SUSPEND;
-	else
-		regval &= ~AT91_OHCIICR_USB_SUSPEND;
+		if (set)
+			regval |= AT91_OHCIICR_USB_SUSPEND;
+		else
+			regval &= ~AT91_OHCIICR_USB_SUSPEND;
 
-	regmap_write(regmap, AT91_SFR_OHCIICR, regval);
+		regmap_write(regmap, AT91_SFR_OHCIICR, regval);
+	}
 
 	return 0;
 }
@@ -357,9 +382,8 @@ static int ohci_at91_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 		case USB_PORT_FEAT_SUSPEND:
 			dev_dbg(hcd->self.controller, "SetPortFeat: SUSPEND\n");
-			if (valid_port(wIndex) && ohci_at91->sfr_regmap) {
-				ohci_at91_port_suspend(ohci_at91->sfr_regmap,
-						       1);
+			if (valid_port(wIndex)) {
+				ohci_at91_port_suspend(ohci_at91, 1);
 				return 0;
 			}
 			break;
@@ -400,9 +424,8 @@ static int ohci_at91_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 		case USB_PORT_FEAT_SUSPEND:
 			dev_dbg(hcd->self.controller, "ClearPortFeature: SUSPEND\n");
-			if (valid_port(wIndex) && ohci_at91->sfr_regmap) {
-				ohci_at91_port_suspend(ohci_at91->sfr_regmap,
-						       0);
+			if (valid_port(wIndex)) {
+				ohci_at91_port_suspend(ohci_at91, 0);
 				return 0;
 			}
 			break;
@@ -630,10 +653,10 @@ ohci_hcd_at91_drv_suspend(struct device *dev)
 		/* flush the writes */
 		(void) ohci_readl (ohci, &ohci->regs->control);
 		msleep(1);
-		ohci_at91_port_suspend(ohci_at91->sfr_regmap, 1);
+		ohci_at91_port_suspend(ohci_at91, 1);
 		at91_stop_clock(ohci_at91);
 	} else {
-		ohci_at91_port_suspend(ohci_at91->sfr_regmap, 1);
+		ohci_at91_port_suspend(ohci_at91, 1);
 	}
 
 	return ret;
@@ -645,7 +668,7 @@ ohci_hcd_at91_drv_resume(struct device *dev)
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct ohci_at91_priv *ohci_at91 = hcd_to_ohci_at91_priv(hcd);
 
-	ohci_at91_port_suspend(ohci_at91->sfr_regmap, 0);
+	ohci_at91_port_suspend(ohci_at91, 0);
 
 	if (ohci_at91->wakeup)
 		disable_irq_wake(hcd->irq);
-- 
2.36.1

