Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D4413C2B5
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgAON0F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:05 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38442 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnwY118435;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=tQbM8HxtnzRSAfowCdsavAsrra+kOaTH46D2a9w0DNY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Sq37ARvIX7a+sdBjinmclPuFRCwGctIy6tBsPQMmgzd+XHCly/SXiQdO9DgH6H9Md
         WngfTyiFYYD746yFQrn4DRmPmBxk3Vg7FO0m8RuzRZLVxgKsN38f0km9tTqj1j1bkr
         Vjjvm+hD0ntsFp9Wx7wlEEaTycKBJKqf7Gd5aTnY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnkG018801;
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:48 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm34066537;
        Wed, 15 Jan 2020 07:25:48 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 06/25] usb: musb: omap2430: Handle multiple ID ground interrupts
Date:   Wed, 15 Jan 2020 07:25:28 -0600
Message-ID: <20200115132547.364-7-b-liu@ti.com>
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

We currently get "unhandled DISCONNECT transition" warnings from musb core
on device disconnect as things are wrongly set to OTG_STATE_A_IDLE in
host mode when enumerating devices. We can also get "Failed to write reg
index" errors after enumerating.

This is happening at least with cpcap phy where we get multiple ID ground
interrupts. Looks like it's VBUS keeps timing out and needs to be kicked
when the phy sends multiple ID ground interrupts during host mode.

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
 drivers/usb/musb/omap2430.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index 920862c3fc64..e572ee624128 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -151,13 +151,26 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 	switch (glue->status) {
 	case MUSB_ID_GROUND:
 		dev_dbg(musb->controller, "ID GND\n");
-
-		musb->xceiv->otg->state = OTG_STATE_A_IDLE;
-		musb->xceiv->last_event = USB_EVENT_ID;
-		if (musb->gadget_driver) {
-			omap_control_usb_set_mode(glue->control_otghs,
-				USB_MODE_HOST);
+		switch (musb->xceiv->otg->state) {
+		case OTG_STATE_A_WAIT_VRISE:
+		case OTG_STATE_A_WAIT_BCON:
+		case OTG_STATE_A_HOST:
+		case OTG_STATE_A_IDLE:
+			/*
+			 * On multiple ID ground interrupts just keep enabling
+			 * VBUS. At least cpcap VBUS shuts down otherwise.
+			 */
 			omap2430_musb_set_vbus(musb, 1);
+			break;
+		default:
+			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+			musb->xceiv->last_event = USB_EVENT_ID;
+			if (musb->gadget_driver) {
+				omap_control_usb_set_mode(glue->control_otghs,
+							  USB_MODE_HOST);
+				omap2430_musb_set_vbus(musb, 1);
+			}
+			break;
 		}
 		break;
 
-- 
2.17.1

