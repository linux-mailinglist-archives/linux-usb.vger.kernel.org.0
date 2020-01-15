Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637A113C29F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgAONZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:52 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49148 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729035AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnR1069006;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=EQk0oY2EeUu1aZvoNyl5B3RdSWWNfMGImiEnshIE10A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kP3D69evagM/DekL8KsFfWvT9KuzCHXjyp6XI0hp/AvL0BW/RFKPPFdPO/IjP0dXw
         lWYWW5HYZLzZwQfrG9r9FicdvHjmi4+iLbzyB0r2LvTC/u1brHvnQjubqz6gTwT5IM
         qxzIHgrO21WopV+Z7ntaR8cJg6W0yW+RY0fi9kDA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPnKm019845
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3D066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 15/25] usb: musb: jz4740: Comments fix
Date:   Wed, 15 Jan 2020 07:25:37 -0600
Message-ID: <20200115132547.364-16-b-liu@ti.com>
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

Add a /* sentinel */ comment to the sentinel entry of the devicetree ID
table, and fix a multi-line comment not having its opening token on a
separate line.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 64e0b0f8c45b..b4884575e37a 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -82,7 +82,8 @@ static int jz4740_musb_init(struct musb *musb)
 		return err;
 	}
 
-	/* Silicon does not implement ConfigData register.
+	/*
+	 * Silicon does not implement ConfigData register.
 	 * Set dyn_fifo to avoid reading EP config from hardware.
 	 */
 	musb->dyn_fifo = true;
@@ -188,7 +189,7 @@ static int jz4740_remove(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id jz4740_musb_of_match[] = {
 	{ .compatible = "ingenic,jz4740-musb" },
-	{},
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, jz4740_musb_of_match);
 #endif
-- 
2.17.1

