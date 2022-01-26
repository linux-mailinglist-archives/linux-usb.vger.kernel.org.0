Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594DA49CBFA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242000AbiAZONz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:13:55 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:61266 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241979AbiAZONy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206434; x=1674742434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6DdLsqqroNMKr6Xyes2xsy1sE+X7bKTqbAbUFZzzPF8=;
  b=TnU33xOP1qx+6ukl4I8Azuzdo0t40esMVBhmPPAZQdHoxoqJ05k49fF+
   3oqP9uRIsrkPnXyyiAhO67Y8S4aneEAUk0TrGoNLXHqqjSG6Ff/hAUE0i
   JZuBGosvWr1lNPiIV/Evtod7V3TOCte+sw8M5z5+ofX9tyBKqyoMheMgm
   IXgjAh4dExmjfYw9HSZqa4RmEARRJMSlAUBPGoNjMfiMtTubYdsyT9lnH
   Xk8Yt4ar2QTOb3hLjju9KU0PT/jU7ivU8RluVpQrXITDMvqK7KxOlr4+u
   qi/mTLe+2r8GvhjeTxSyWHkngGzMms6JqRVYVlLqbMRhFZMxAM5vbOBJ5
   A==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725568"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 26 Jan 2022 15:13:51 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 26 Jan 2022 15:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206431; x=1674742431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6DdLsqqroNMKr6Xyes2xsy1sE+X7bKTqbAbUFZzzPF8=;
  b=iXRd2SPNodDerQ0RSu+4O2IrceJFqtcoaj5XIJHMzq45Uo3GYpCOe4gi
   Q5ijvJadMXuRa2PTpZDWsajnJzVzQRMxUNMeSjRq32IJ+H4JpBJTFYlo1
   L+lrELoXO1J/OEj+FHlSwJFozUQnUR1uEOsUE7odxpxOY1IeZosu0xvEt
   8vHOD/wJmcQoRsmjUarwZS8UUdLIy16xi+avlL30qvsyn+49wlEfveViw
   YyFYnYoW4AZZSVcyLK4d+DNiQr1/9wtNR8sIzicW+gE644QaDQYl3g788
   CdBetaXzwI0py65zX/6vj6XfaEc/Vb8I4I2NxzE9F4CoXnQ0RHGqrq5Y1
   w==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725564"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 00C4A280065;
        Wed, 26 Jan 2022 15:13:50 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 1/4] usb: dwc3: imx8mp: rename iomem base pointer
Date:   Wed, 26 Jan 2022 15:13:37 +0100
Message-Id: <20220126141340.234125-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Until now the iomem used is not USB glue as the name suggests, but
HSIO BLK_CTL. Rename the struct member accordingly. This is a preparing
patch for when USB glue is actually used.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index d328d20abfbc..1c8fe657b3a9 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -39,7 +39,7 @@
 struct dwc3_imx8mp {
 	struct device			*dev;
 	struct platform_device		*dwc3;
-	void __iomem			*glue_base;
+	void __iomem			*hsio_blk_base;
 	struct clk			*hsio_clk;
 	struct clk			*suspend_clk;
 	int				irq;
@@ -55,7 +55,7 @@ static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
 	if (!dwc3)
 		return;
 
-	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	val = readl(dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 
 	if ((dwc3->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
 		val |= USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
@@ -64,16 +64,16 @@ static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
 		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
 
-	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 }
 
 static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
 {
 	u32 val;
 
-	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	val = readl(dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
-	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 }
 
 static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
@@ -115,9 +115,9 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 
 	dwc3_imx->dev = dev;
 
-	dwc3_imx->glue_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(dwc3_imx->glue_base))
-		return PTR_ERR(dwc3_imx->glue_base);
+	dwc3_imx->hsio_blk_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dwc3_imx->hsio_blk_base))
+		return PTR_ERR(dwc3_imx->hsio_blk_base);
 
 	dwc3_imx->hsio_clk = devm_clk_get(dev, "hsio");
 	if (IS_ERR(dwc3_imx->hsio_clk)) {
-- 
2.25.1

