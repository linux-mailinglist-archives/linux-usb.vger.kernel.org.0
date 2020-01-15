Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 297ED13C2AD
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgAON0A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:00 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51340 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbgAONZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:51 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnoG099998;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=RG4D0u3+rd6vPqdm0FNjPuhtK0VSaCET0q+Gce1m3tc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lbbudpD2LG8DRXhuh9MgvUZNRJXK1C1ru7J0GbkcU7zFCRPP5TlCetB8YE/mzWw9V
         32NFitpLevl1XPRYirSPBnYShgno/JaiyNFzrEFUDwgqTycDBWRdenp5nHU9CrmAHJ
         jkg6y1ElLQ1bK+YtnrYhufBRVAlmDUPBLLxSU9lI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPnG3086455
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm38066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 10/25] usb: musb: Get rid of omap2430_musb_set_vbus()
Date:   Wed, 15 Jan 2020 07:25:32 -0600
Message-ID: <20200115132547.364-11-b-liu@ti.com>
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

Now that we've removed direct calls from interrupt handler to
omap2430_musb_set_vbus(), let's make things less confusing and
configure VBUS directly in omap_musb_set_mailbox().

We have omap_musb_set_mailbox() called from the PHYs, and that's
all we need.

Note that we can now also drop the check for MUSB_INTERFACE_UTMI,
we've been already calling otg_set_vbus(musb->xceiv->otg, 0)
unconditionally via omap2430_musb_set_vbus() and we should only
need to call it once.

And we want to disable VBUS unconditionally on disconnect even
without musb->gadget_driver, so let's drop that check too.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/omap2430.c | 71 ++++++++++++-------------------------
 1 file changed, 23 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index bc5810e14ebb..d62c78b97cad 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -38,42 +38,6 @@ struct omap2430_glue {
 
 static struct omap2430_glue	*_glue;
 
-/*
- * HDRC controls CPEN, but beware current surges during device connect.
- * They can trigger transient overcurrent conditions that must be ignored.
- *
- * Note that we're skipping A_WAIT_VFALL -> A_IDLE and jumping right to B_IDLE
- * as set by musb_set_peripheral().
- */
-static void omap2430_musb_set_vbus(struct musb *musb, int is_on)
-{
-	struct usb_otg *otg = musb->xceiv->otg;
-	int error;
-
-	if (is_on) {
-		switch (musb->xceiv->otg->state) {
-		case OTG_STATE_A_IDLE:
-			error = musb_set_host(musb);
-			if (!error) {
-				musb->xceiv->otg->state =
-						OTG_STATE_A_WAIT_VRISE;
-				otg_set_vbus(otg, 1);
-			}
-			break;
-		default:
-			otg_set_vbus(otg, 1);
-			break;
-		}
-	} else {
-		error = musb_set_peripheral(musb);
-		otg_set_vbus(otg, 0);
-	}
-
-	dev_dbg(musb->controller, "VBUS %s, devctl %02x\n",
-		usb_otg_state_string(musb->xceiv->otg->state),
-		musb_readb(musb->mregs, MUSB_DEVCTL));
-}
-
 static inline void omap2430_low_level_exit(struct musb *musb)
 {
 	u32 l;
@@ -113,27 +77,42 @@ static int omap2430_musb_mailbox(enum musb_vbus_id_status status)
 	return 0;
 }
 
+/*
+ * HDRC controls CPEN, but beware current surges during device connect.
+ * They can trigger transient overcurrent conditions that must be ignored.
+ *
+ * Note that we're skipping A_WAIT_VFALL -> A_IDLE and jumping right to B_IDLE
+ * as set by musb_set_peripheral().
+ */
 static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 {
 	struct musb *musb = glue_to_musb(glue);
-	struct musb_hdrc_platform_data *pdata =
-		dev_get_platdata(musb->controller);
-	struct omap_musb_board_data *data = pdata->board_data;
+	int error;
 
 	pm_runtime_get_sync(musb->controller);
+
+	dev_dbg(musb->controller, "VBUS %s, devctl %02x\n",
+		usb_otg_state_string(musb->xceiv->otg->state),
+		musb_readb(musb->mregs, MUSB_DEVCTL));
+
 	switch (glue->status) {
 	case MUSB_ID_GROUND:
 		dev_dbg(musb->controller, "ID GND\n");
 		switch (musb->xceiv->otg->state) {
+		case OTG_STATE_A_IDLE:
+			error = musb_set_host(musb);
+			if (error)
+				break;
+			musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
+			/* Fall through */
 		case OTG_STATE_A_WAIT_VRISE:
 		case OTG_STATE_A_WAIT_BCON:
 		case OTG_STATE_A_HOST:
-		case OTG_STATE_A_IDLE:
 			/*
 			 * On multiple ID ground interrupts just keep enabling
 			 * VBUS. At least cpcap VBUS shuts down otherwise.
 			 */
-			omap2430_musb_set_vbus(musb, 1);
+			otg_set_vbus(musb->xceiv->otg, 1);
 			break;
 		default:
 			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
@@ -141,7 +120,7 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 			if (musb->gadget_driver) {
 				omap_control_usb_set_mode(glue->control_otghs,
 							  USB_MODE_HOST);
-				omap2430_musb_set_vbus(musb, 1);
+				otg_set_vbus(musb->xceiv->otg, 1);
 			}
 			break;
 		}
@@ -160,12 +139,8 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 		dev_dbg(musb->controller, "VBUS Disconnect\n");
 
 		musb->xceiv->last_event = USB_EVENT_NONE;
-		if (musb->gadget_driver)
-			omap2430_musb_set_vbus(musb, 0);
-
-		if (data->interface_type == MUSB_INTERFACE_UTMI)
-			otg_set_vbus(musb->xceiv->otg, 0);
-
+		musb_set_peripheral(musb);
+		otg_set_vbus(musb->xceiv->otg, 0);
 		omap_control_usb_set_mode(glue->control_otghs,
 			USB_MODE_DISCONNECT);
 		break;
-- 
2.17.1

