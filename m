Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC1813C2B1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgAON0C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:02 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38448 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnsb118445;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=nDdJ6wIFtcrIYVyCbrqei7p+G65U8LcuhhXl1liGkdc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VKQzYxPoAs9Ejd2V9K7m2WMkMSVLWZM2djs6ECovl+vJFbeVKt/Pa7+z1/PGeLxzh
         Ht0DnxvjOEy+five/F3jMVtrr7wtvd3eeVEC+9SGSEHzv6e+rVgseHh96pd/Ug/IIA
         RHle+WKNQayhqwbHbQwTElfuaYFeFXQpxI9c8Hfc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPnX5019842
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm37066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 09/25] usb: musb: omap2430: Idle musb on init
Date:   Wed, 15 Jan 2020 07:25:31 -0600
Message-ID: <20200115132547.364-10-b-liu@ti.com>
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

From: Tony Lindgren <tony@atomide.com>

We want to configure musb state in omap2430_musb_enable() instead of
omap2430_musb_init(). Otherwise musb may not idle properly until
USB cable has been connected at least once.

And we already have omap_musb_set_mailbox() configure mode with
omap_control_usb_set_mode() so we can remove those calls from
omap2430_musb_enable().

Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/omap2430.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index 2cc54135bb8b..bc5810e14ebb 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -212,7 +212,6 @@ static int omap2430_musb_init(struct musb *musb)
 	u32 l;
 	int status = 0;
 	struct device *dev = musb->controller;
-	struct omap2430_glue *glue = dev_get_drvdata(dev->parent);
 	struct musb_hdrc_platform_data *plat = dev_get_platdata(dev);
 	struct omap_musb_board_data *data = plat->board_data;
 
@@ -268,9 +267,6 @@ static int omap2430_musb_init(struct musb *musb)
 			musb_readl(musb->mregs, OTG_INTERFSEL),
 			musb_readl(musb->mregs, OTG_SIMENABLE));
 
-	if (glue->status != MUSB_UNKNOWN)
-		omap_musb_set_mailbox(glue);
-
 	return 0;
 }
 
@@ -279,19 +275,9 @@ static void omap2430_musb_enable(struct musb *musb)
 	struct device *dev = musb->controller;
 	struct omap2430_glue *glue = dev_get_drvdata(dev->parent);
 
-	switch (glue->status) {
-
-	case MUSB_ID_GROUND:
-		omap_control_usb_set_mode(glue->control_otghs, USB_MODE_HOST);
-		break;
-
-	case MUSB_VBUS_VALID:
-		omap_control_usb_set_mode(glue->control_otghs, USB_MODE_DEVICE);
-		break;
-
-	default:
-		break;
-	}
+	if (glue->status == MUSB_UNKNOWN)
+		glue->status = MUSB_VBUS_OFF;
+	omap_musb_set_mailbox(glue);
 }
 
 static void omap2430_musb_disable(struct musb *musb)
-- 
2.17.1

