Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E150D13C2A2
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgAONZx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:53 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51350 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728896AbgAONZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:51 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnGu100014;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094750;
        bh=2a8CgKUVakW5jouHuMigNmCw+8KnrwcBVboH4HYueZE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=w7s6NfwD4OBXWrMr4R+6ulc4yjqMC/HkH7YRaIgygW2V1VTQ0gymWzbHjjUIPbQPV
         fmDmJ1lqIPdg13Fs+M3bc/ouLVHkQvO1WwFkKCdQggJyzniw/j1G0HMtYHbkMSxY+L
         vvEQyVSoNXrrO+SV3L5MWMxgtlIpMQXlqNmQqykU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnQW018810;
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3E066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 16/25] usb: musb: jz4740: Whitespace and indentation fixes
Date:   Wed, 15 Jan 2020 07:25:38 -0600
Message-ID: <20200115132547.364-17-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

Fix lines with too much or not enough indentation, and lines which were
indented with spaces instead of tabs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index b4884575e37a..bc0109f4700b 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -23,9 +23,9 @@ struct jz4740_glue {
 
 static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
 {
-	unsigned long   flags;
-	irqreturn_t     retval = IRQ_NONE;
-	struct musb     *musb = __hci;
+	unsigned long	flags;
+	irqreturn_t	retval = IRQ_NONE;
+	struct musb	*musb = __hci;
 
 	spin_lock_irqsave(&musb->lock, flags);
 
@@ -39,7 +39,7 @@ static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
 	 * never see them set
 	 */
 	musb->int_usb &= MUSB_INTR_SUSPEND | MUSB_INTR_RESUME |
-	    MUSB_INTR_RESET | MUSB_INTR_SOF;
+			 MUSB_INTR_RESET | MUSB_INTR_SOF;
 
 	if (musb->int_usb || musb->int_tx || musb->int_rx)
 		retval = musb_interrupt(musb);
@@ -50,20 +50,20 @@ static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
 }
 
 static struct musb_fifo_cfg jz4740_musb_fifo_cfg[] = {
-{ .hw_ep_num = 1, .style = FIFO_TX, .maxpacket = 512, },
-{ .hw_ep_num = 1, .style = FIFO_RX, .maxpacket = 512, },
-{ .hw_ep_num = 2, .style = FIFO_TX, .maxpacket = 64, },
+	{ .hw_ep_num = 1, .style = FIFO_TX, .maxpacket = 512, },
+	{ .hw_ep_num = 1, .style = FIFO_RX, .maxpacket = 512, },
+	{ .hw_ep_num = 2, .style = FIFO_TX, .maxpacket = 64, },
 };
 
 static const struct musb_hdrc_config jz4740_musb_config = {
 	/* Silicon does not implement USB OTG. */
-	.multipoint = 0,
+	.multipoint	= 0,
 	/* Max EPs scanned, driver will decide which EP can be used. */
-	.num_eps    = 4,
+	.num_eps	= 4,
 	/* RAMbits needed to configure EPs from table */
-	.ram_bits   = 9,
-	.fifo_cfg = jz4740_musb_fifo_cfg,
-	.fifo_cfg_size = ARRAY_SIZE(jz4740_musb_fifo_cfg),
+	.ram_bits	= 9,
+	.fifo_cfg	= jz4740_musb_fifo_cfg,
+	.fifo_cfg_size	= ARRAY_SIZE(jz4740_musb_fifo_cfg),
 };
 
 static int jz4740_musb_init(struct musb *musb)
@@ -115,7 +115,7 @@ static int jz4740_probe(struct platform_device *pdev)
 	const struct musb_hdrc_platform_data *pdata = &jz4740_musb_pdata;
 	struct platform_device		*musb;
 	struct jz4740_glue		*glue;
-	struct clk                      *clk;
+	struct clk			*clk;
 	int				ret;
 
 	glue = devm_kzalloc(dev, sizeof(*glue), GFP_KERNEL);
@@ -178,7 +178,7 @@ static int jz4740_probe(struct platform_device *pdev)
 
 static int jz4740_remove(struct platform_device *pdev)
 {
-	struct jz4740_glue	*glue = platform_get_drvdata(pdev);
+	struct jz4740_glue *glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->pdev);
 	clk_disable_unprepare(glue->clk);
-- 
2.17.1

