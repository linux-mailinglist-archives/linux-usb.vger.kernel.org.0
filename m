Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C58B13C2AA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgAONZv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:51 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53860 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728978AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnTv073258;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=+gYMqHQOAcTGTUpRS6YNTVRWPyVX0nxc/pbJR/hobKQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rgNoj8KeMgCT6saXgoSWoHbuS49BgrDst4mzdUhyLUJkpmlMLJKauC+N6lG5gIQdy
         sknhO6DM8VECW6i1bB9RQ136DmaqXZMN4qRWsvgRXTmHOLAqh0jlDkdkkF/Q2Bnq/H
         jI4iH3r71UXE3iTP2oMIpoWq43Dqgeg0qrNzg4e0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPnx6086454
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm36066537;
        Wed, 15 Jan 2020 07:25:48 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 08/25] usb: musb: omap2430: Clean up enable and remove devctl tinkering
Date:   Wed, 15 Jan 2020 07:25:30 -0600
Message-ID: <20200115132547.364-9-b-liu@ti.com>
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

There should be no need to tinker with devctl in enable in the SoC glue
code. We have musb_start() to take care of handling it already.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/omap2430.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index 9c1b72a4b12f..2cc54135bb8b 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -276,33 +276,13 @@ static int omap2430_musb_init(struct musb *musb)
 
 static void omap2430_musb_enable(struct musb *musb)
 {
-	u8		devctl;
-	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
 	struct device *dev = musb->controller;
 	struct omap2430_glue *glue = dev_get_drvdata(dev->parent);
-	struct musb_hdrc_platform_data *pdata = dev_get_platdata(dev);
-	struct omap_musb_board_data *data = pdata->board_data;
-
 
 	switch (glue->status) {
 
 	case MUSB_ID_GROUND:
 		omap_control_usb_set_mode(glue->control_otghs, USB_MODE_HOST);
-		if (data->interface_type != MUSB_INTERFACE_UTMI)
-			break;
-		devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
-		/* start the session */
-		devctl |= MUSB_DEVCTL_SESSION;
-		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
-		while (musb_readb(musb->mregs, MUSB_DEVCTL) &
-				MUSB_DEVCTL_BDEVICE) {
-			cpu_relax();
-
-			if (time_after(jiffies, timeout)) {
-				dev_err(dev, "configured as A device timeout");
-				break;
-			}
-		}
 		break;
 
 	case MUSB_VBUS_VALID:
-- 
2.17.1

