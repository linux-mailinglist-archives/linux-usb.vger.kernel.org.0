Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFC8187485
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732663AbgCPVLk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:11:40 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35910 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732652AbgCPVLj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:11:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBcgA086221;
        Mon, 16 Mar 2020 16:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584393098;
        bh=mAx1m5WW68Xopf7Ts8zVcPLHToq+eHIw4eQjVejPmhA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kQwaf3Joo0Sxtn7j/4Fhju6yf3YDbd2hjmv9MUZUdqcZ5z7I4LRLxKuAoGX8Zr+16
         hVRslaofwlLevR2DfAgSBQip8/j4Db64bZSKrwXofAbEFpu0ujiyf7XyIkGgd445pj
         dLYBhwWhKN1TMJhO/K4h+VxICYi9Ekq8q156P03k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GLBc83024279
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 16:11:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 16:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 16:11:37 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbLi119954;
        Mon, 16 Mar 2020 16:11:37 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 6/8] usb: musb: jz4740: Add support for the JZ4770
Date:   Mon, 16 Mar 2020 16:11:34 -0500
Message-ID: <20200316211136.2274-7-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200316211136.2274-1-b-liu@ti.com>
References: <20200316211136.2274-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

Add support for probing the jz4740-musb driver on the JZ4770 SoC.

The USB IP in the JZ4770 works the same Inventra IP as for the JZ4740,
but it features more endpoints, and officially supports OTG.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 22eebe43ae1e..e64dd30e80e7 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -163,6 +163,33 @@ static const struct musb_hdrc_platform_data jz4740_musb_pdata = {
 	.platform_ops	= &jz4740_musb_ops,
 };
 
+static struct musb_fifo_cfg jz4770_musb_fifo_cfg[] = {
+	{ .hw_ep_num = 1, .style = FIFO_TX, .maxpacket = 512, },
+	{ .hw_ep_num = 1, .style = FIFO_RX, .maxpacket = 512, },
+	{ .hw_ep_num = 2, .style = FIFO_TX, .maxpacket = 512, },
+	{ .hw_ep_num = 2, .style = FIFO_RX, .maxpacket = 512, },
+	{ .hw_ep_num = 3, .style = FIFO_TX, .maxpacket = 512, },
+	{ .hw_ep_num = 3, .style = FIFO_RX, .maxpacket = 512, },
+	{ .hw_ep_num = 4, .style = FIFO_TX, .maxpacket = 512, },
+	{ .hw_ep_num = 4, .style = FIFO_RX, .maxpacket = 512, },
+	{ .hw_ep_num = 5, .style = FIFO_TX, .maxpacket = 512, },
+	{ .hw_ep_num = 5, .style = FIFO_RX, .maxpacket = 512, },
+};
+
+static struct musb_hdrc_config jz4770_musb_config = {
+	.multipoint	= 1,
+	.num_eps	= 11,
+	.ram_bits	= 11,
+	.fifo_cfg	= jz4770_musb_fifo_cfg,
+	.fifo_cfg_size	= ARRAY_SIZE(jz4770_musb_fifo_cfg),
+};
+
+static const struct musb_hdrc_platform_data jz4770_musb_pdata = {
+	.mode		= MUSB_PERIPHERAL, /* TODO: support OTG */
+	.config		= &jz4770_musb_config,
+	.platform_ops	= &jz4740_musb_ops,
+};
+
 static int jz4740_probe(struct platform_device *pdev)
 {
 	struct device			*dev = &pdev->dev;
@@ -250,6 +277,7 @@ static int jz4740_remove(struct platform_device *pdev)
 
 static const struct of_device_id jz4740_musb_of_match[] = {
 	{ .compatible = "ingenic,jz4740-musb", .data = &jz4740_musb_pdata },
+	{ .compatible = "ingenic,jz4770-musb", .data = &jz4770_musb_pdata },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, jz4740_musb_of_match);
-- 
2.17.1

