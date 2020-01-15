Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C39713C2A6
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgAONZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:52 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38444 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnUa118439;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=MUv9jsRq8f0Vv23nvWRnZyvAf4d4TMbe9eV22J9KAJo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Qr/Y2XtuWVbGoI6BizEuG/UZV5qN/aLWldmPmbcDmF15T+x/S08l7i9HEPgPwTmxu
         6S2k8RMUoNtUqOLcddUVc2CdL8Lskhknd/dAJu7p+DfYZMzEzKhuDxHDlHVnfa/m1v
         E+cC+LQBRB3iGk3FKWG0xJdfA6bt5G4GweySHqTo=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPnRV110416
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm35066537;
        Wed, 15 Jan 2020 07:25:48 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 07/25] usb: musb: Add musb_set_host and peripheral and use them for omap2430
Date:   Wed, 15 Jan 2020 07:25:29 -0600
Message-ID: <20200115132547.364-8-b-liu@ti.com>
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

At least some revisions of musb core need to set devctl session bit
in peripheral mode to force musb to host mode. And we have places
clearing the devctl session bit.

Let's add a generic function to do this, and use it for omap2430.
This should get us a bit closer to completely removing devctl register
tinkering in the SoC glue code.

Before making use of this code for the other glue layers, things need
to be tested carefully as there may be a approximately a 200 ms delay
needed between powering up musb and calling musb_set_host() to avoid.
Otherwise the system hangs at least with omap2430 glue layer.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
[b-liu@ti.com: fixed "line over 80 characters" warning]
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 103 +++++++++++++++++++++++++++++++++++
 drivers/usb/musb/musb_core.h |   3 +
 drivers/usb/musb/omap2430.c  |  71 ++++++++----------------
 3 files changed, 128 insertions(+), 49 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 48d95850152d..34090707d122 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -73,6 +73,7 @@
 #include <linux/prefetch.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb.h>
 #include <linux/usb/of.h>
@@ -414,6 +415,108 @@ void musb_write_fifo(struct musb_hw_ep *hw_ep, u16 len, const u8 *src)
 	return hw_ep->musb->io.write_fifo(hw_ep, len, src);
 }
 
+static u8 musb_read_devctl(struct musb *musb)
+{
+	return musb_readb(musb->mregs, MUSB_DEVCTL);
+}
+
+/**
+ * musb_set_host - set and initialize host mode
+ * @musb: musb controller driver data
+ *
+ * At least some musb revisions need to enable devctl session bit in
+ * peripheral mode to switch to host mode. Initializes things to host
+ * mode and sets A_IDLE. SoC glue needs to advance state further
+ * based on phy provided VBUS state.
+ *
+ * Note that the SoC glue code may need to wait for musb to settle
+ * on enable before calling this to avoid babble.
+ */
+int musb_set_host(struct musb *musb)
+{
+	int error = 0;
+	u8 devctl;
+
+	if (!musb)
+		return -EINVAL;
+
+	devctl = musb_read_devctl(musb);
+	if (!(devctl & MUSB_DEVCTL_BDEVICE)) {
+		dev_info(musb->controller,
+			 "%s: already in host mode: %02x\n",
+			 __func__, devctl);
+		goto init_data;
+	}
+
+	devctl |= MUSB_DEVCTL_SESSION;
+	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
+
+	error = readx_poll_timeout(musb_read_devctl, musb, devctl,
+				   !(devctl & MUSB_DEVCTL_BDEVICE), 5000,
+				   1000000);
+	if (error) {
+		dev_err(musb->controller, "%s: could not set host: %02x\n",
+			__func__, devctl);
+
+		return error;
+	}
+
+init_data:
+	musb->is_active = 1;
+	musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+	MUSB_HST_MODE(musb);
+
+	return error;
+}
+EXPORT_SYMBOL_GPL(musb_set_host);
+
+/**
+ * musb_set_peripheral - set and initialize peripheral mode
+ * @musb: musb controller driver data
+ *
+ * Clears devctl session bit and initializes things for peripheral
+ * mode and sets B_IDLE. SoC glue needs to advance state further
+ * based on phy provided VBUS state.
+ */
+int musb_set_peripheral(struct musb *musb)
+{
+	int error = 0;
+	u8 devctl;
+
+	if (!musb)
+		return -EINVAL;
+
+	devctl = musb_read_devctl(musb);
+	if (devctl & MUSB_DEVCTL_BDEVICE) {
+		dev_info(musb->controller,
+			 "%s: already in peripheral mode: %02x\n",
+			 __func__, devctl);
+
+		goto init_data;
+	}
+
+	devctl &= ~MUSB_DEVCTL_SESSION;
+	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
+
+	error = readx_poll_timeout(musb_read_devctl, musb, devctl,
+				   devctl & MUSB_DEVCTL_BDEVICE, 5000,
+				   1000000);
+	if (error) {
+		dev_err(musb->controller, "%s: could not set periperal: %02x\n",
+			__func__, devctl);
+
+		return error;
+	}
+
+init_data:
+	musb->is_active = 0;
+	musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+	MUSB_DEV_MODE(musb);
+
+	return error;
+}
+EXPORT_SYMBOL_GPL(musb_set_peripheral);
+
 /*-------------------------------------------------------------------------*/
 
 /* for high speed test mode; see USB 2.0 spec 7.1.20 */
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index 04203b7126d5..8a13a46cd891 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -487,6 +487,9 @@ extern void musb_start(struct musb *musb);
 extern void musb_write_fifo(struct musb_hw_ep *ep, u16 len, const u8 *src);
 extern void musb_read_fifo(struct musb_hw_ep *ep, u16 len, u8 *dst);
 
+extern int musb_set_host(struct musb *musb);
+extern int musb_set_peripheral(struct musb *musb);
+
 extern void musb_load_testpacket(struct musb *);
 
 extern irqreturn_t musb_interrupt(struct musb *);
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index e572ee624128..9c1b72a4b12f 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -38,65 +38,38 @@ struct omap2430_glue {
 
 static struct omap2430_glue	*_glue;
 
+/*
+ * HDRC controls CPEN, but beware current surges during device connect.
+ * They can trigger transient overcurrent conditions that must be ignored.
+ *
+ * Note that we're skipping A_WAIT_VFALL -> A_IDLE and jumping right to B_IDLE
+ * as set by musb_set_peripheral().
+ */
 static void omap2430_musb_set_vbus(struct musb *musb, int is_on)
 {
-	struct usb_otg	*otg = musb->xceiv->otg;
-	u8		devctl;
-	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
-	/* HDRC controls CPEN, but beware current surges during device
-	 * connect.  They can trigger transient overcurrent conditions
-	 * that must be ignored.
-	 */
-
-	devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
+	struct usb_otg *otg = musb->xceiv->otg;
+	int error;
 
 	if (is_on) {
-		if (musb->xceiv->otg->state == OTG_STATE_A_IDLE) {
-			int loops = 100;
-			/* start the session */
-			devctl |= MUSB_DEVCTL_SESSION;
-			musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
-			/*
-			 * Wait for the musb to set as A device to enable the
-			 * VBUS
-			 */
-			while (musb_readb(musb->mregs, MUSB_DEVCTL) &
-			       MUSB_DEVCTL_BDEVICE) {
-
-				mdelay(5);
-				cpu_relax();
-
-				if (time_after(jiffies, timeout)
-				    || loops-- <= 0) {
-					dev_err(musb->controller,
-					"configured as A device timeout");
-					break;
-				}
+		switch (musb->xceiv->otg->state) {
+		case OTG_STATE_A_IDLE:
+			error = musb_set_host(musb);
+			if (!error) {
+				musb->xceiv->otg->state =
+						OTG_STATE_A_WAIT_VRISE;
+				otg_set_vbus(otg, 1);
 			}
-
+			break;
+		default:
 			otg_set_vbus(otg, 1);
-		} else {
-			musb->is_active = 1;
-			musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
-			devctl |= MUSB_DEVCTL_SESSION;
-			MUSB_HST_MODE(musb);
+			break;
 		}
 	} else {
-		musb->is_active = 0;
-
-		/* NOTE:  we're skipping A_WAIT_VFALL -> A_IDLE and
-		 * jumping right to B_IDLE...
-		 */
-
-		musb->xceiv->otg->state = OTG_STATE_B_IDLE;
-		devctl &= ~MUSB_DEVCTL_SESSION;
-
-		MUSB_DEV_MODE(musb);
+		error = musb_set_peripheral(musb);
+		otg_set_vbus(otg, 0);
 	}
-	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
 
-	dev_dbg(musb->controller, "VBUS %s, devctl %02x "
-		/* otg %3x conf %08x prcm %08x */ "\n",
+	dev_dbg(musb->controller, "VBUS %s, devctl %02x\n",
 		usb_otg_state_string(musb->xceiv->otg->state),
 		musb_readb(musb->mregs, MUSB_DEVCTL));
 }
-- 
2.17.1

