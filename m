Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1F2FC04
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfD3O7p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:59:45 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36738 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfD3O7o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:59:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UExh7A103366;
        Tue, 30 Apr 2019 09:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556636383;
        bh=W/nM9Sl2KNt5gekBds7/tgviM8tjcvwUIrDJkviBq0Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oBhU+OAuSyl35ULXVJE1mfA4rnqiE4ozAC1Dencd/OgQ2dJ/1tWTwgtMGF/WlyJg7
         EmVJ1I7/y2PGVlz2zrzX7GKZl1HQqBcLjdWPjr3bZhwKwuf2xdMbVJ5rhte8T9K4wG
         51Z+9W388K4hBECSLTvaR0QGPTkjGtPijvBLelCo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UExhKb035165
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 09:59:43 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 09:59:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 09:59:42 -0500
Received: from uda0271908.am.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UExgrC071248;
        Tue, 30 Apr 2019 09:59:42 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 2/7] usb: musb: omap2430: Add support for idling phy when musb is idle
Date:   Tue, 30 Apr 2019 09:59:36 -0500
Message-ID: <20190430145942.1128-3-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430145942.1128-1-b-liu@ti.com>
References: <20190430145942.1128-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

I noticed that musb is blocking core retention for omap4 unlike for
omap3. This is because for omap3 we have phy-twl4030-usb implement
it's own PM runtime to handle errata "VUSB3V1 VBUS overvoltage
debouncer not working when the PHY is powered down". That is done
in order to keep the USB PHY powered when phy-twl4030-usb is loaded.

For the other USB PHYs, we need to enable and disable the PHY based on
musb PM runtime. With the session bit based PM runtime for musb core,
we can now idle the USB PHY always when musb is idle.

Note that adding these calls will not affect the twl4030 driver
as it's phy functions will just query the PHY state without powering
the PHY on or off.

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/omap2430.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index b1dd81fb5f55..a3d2fef67746 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -531,6 +531,9 @@ static int omap2430_runtime_suspend(struct device *dev)
 
 	omap2430_low_level_exit(musb);
 
+	phy_power_off(musb->phy);
+	phy_exit(musb->phy);
+
 	return 0;
 }
 
@@ -542,6 +545,9 @@ static int omap2430_runtime_resume(struct device *dev)
 	if (!musb)
 		return 0;
 
+	phy_init(musb->phy);
+	phy_power_on(musb->phy);
+
 	omap2430_low_level_init(musb);
 	musb_writel(musb->mregs, OTG_INTERFSEL,
 		    musb->context.otg_interfsel);
-- 
2.17.1

