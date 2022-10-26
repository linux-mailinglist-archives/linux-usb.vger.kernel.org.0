Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1C860E72E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 20:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbiJZS13 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 14:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234298AbiJZS10 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 14:27:26 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142C0D8F62;
        Wed, 26 Oct 2022 11:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1666808825; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uBr9f4BEFXltKgJJBj+MHNdTSQATTaFHSGC+OWiEQAE=;
        b=zKaghIJe1c3g7iI413EJVsl7LyvjoJm/SYaJm7YD0vgxQajrkISpuwry4d9bdyNKS9Uw2J
        MX4MNdcb+xLQFpssXvEQlgpWRbdlkcbcZTF+KoJqI55vK9UzvbT3RUhfxOgPqL7JpNiV3N
        wDF6paKrO8PS8L9X9vMd17uEjX6PdBA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, od@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/7] usb: musb: Add and use inline function musb_otg_state_string
Date:   Wed, 26 Oct 2022 19:26:52 +0100
Message-Id: <20221026182657.146630-3-paul@crapouillou.net>
In-Reply-To: <20221026182657.146630-1-paul@crapouillou.net>
References: <20221026182657.146630-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The musb_otg_state_string() simply calls usb_otg_state_string().
This will make it easier to get rid of the musb->xceiv dependency later.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/musb_core.c    | 43 +++++++++++++++------------------
 drivers/usb/musb/musb_core.h    |  5 ++++
 drivers/usb/musb/musb_gadget.c  |  8 +++---
 drivers/usb/musb/musb_host.c    |  2 +-
 drivers/usb/musb/musb_virthub.c |  4 +--
 5 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index a0fe2516870b..9bf0ebaa3b7c 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -610,13 +610,13 @@ static void musb_otg_timer_func(struct timer_list *t)
 	case OTG_STATE_A_SUSPEND:
 	case OTG_STATE_A_WAIT_BCON:
 		musb_dbg(musb, "HNP: %s timeout",
-			usb_otg_state_string(musb->xceiv->otg->state));
+			 musb_otg_state_string(musb));
 		musb_platform_set_vbus(musb, 0);
 		musb_set_state(musb, OTG_STATE_A_WAIT_VFALL);
 		break;
 	default:
 		musb_dbg(musb, "HNP: Unhandled mode %s",
-			usb_otg_state_string(musb->xceiv->otg->state));
+			 musb_otg_state_string(musb));
 	}
 	spin_unlock_irqrestore(&musb->lock, flags);
 }
@@ -630,14 +630,12 @@ void musb_hnp_stop(struct musb *musb)
 	void __iomem	*mbase = musb->mregs;
 	u8	reg;
 
-	musb_dbg(musb, "HNP: stop from %s",
-			usb_otg_state_string(musb->xceiv->otg->state));
+	musb_dbg(musb, "HNP: stop from %s", musb_otg_state_string(musb));
 
 	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_PERIPHERAL:
 		musb_g_disconnect(musb);
-		musb_dbg(musb, "HNP: back to %s",
-			usb_otg_state_string(musb->xceiv->otg->state));
+		musb_dbg(musb, "HNP: back to %s", musb_otg_state_string(musb));
 		break;
 	case OTG_STATE_B_HOST:
 		musb_dbg(musb, "HNP: Disabling HR");
@@ -652,7 +650,7 @@ void musb_hnp_stop(struct musb *musb)
 		break;
 	default:
 		musb_dbg(musb, "HNP: Stopping in unknown state %s",
-			usb_otg_state_string(musb->xceiv->otg->state));
+			 musb_otg_state_string(musb));
 	}
 
 	/*
@@ -667,8 +665,7 @@ static void musb_recover_from_babble(struct musb *musb);
 
 static void musb_handle_intr_resume(struct musb *musb, u8 devctl)
 {
-	musb_dbg(musb, "RESUME (%s)",
-			usb_otg_state_string(musb->xceiv->otg->state));
+	musb_dbg(musb, "RESUME (%s)", musb_otg_state_string(musb));
 
 	if (devctl & MUSB_DEVCTL_HM) {
 		switch (musb_get_state(musb)) {
@@ -693,7 +690,7 @@ static void musb_handle_intr_resume(struct musb *musb, u8 devctl)
 		default:
 			WARNING("bogus %s RESUME (%s)\n",
 				"host",
-				usb_otg_state_string(musb->xceiv->otg->state));
+				musb_otg_state_string(musb));
 		}
 	} else {
 		switch (musb_get_state(musb)) {
@@ -722,7 +719,7 @@ static void musb_handle_intr_resume(struct musb *musb, u8 devctl)
 		default:
 			WARNING("bogus %s RESUME (%s)\n",
 				"peripheral",
-				usb_otg_state_string(musb->xceiv->otg->state));
+				musb_otg_state_string(musb));
 		}
 	}
 }
@@ -738,8 +735,7 @@ static irqreturn_t musb_handle_intr_sessreq(struct musb *musb, u8 devctl)
 		return IRQ_HANDLED;
 	}
 
-	musb_dbg(musb, "SESSION_REQUEST (%s)",
-		usb_otg_state_string(musb->xceiv->otg->state));
+	musb_dbg(musb, "SESSION_REQUEST (%s)", musb_otg_state_string(musb));
 
 	/* IRQ arrives from ID pin sense or (later, if VBUS power
 	 * is removed) SRP.  responses are time critical:
@@ -806,7 +802,7 @@ static void musb_handle_intr_vbuserr(struct musb *musb, u8 devctl)
 
 	dev_printk(ignore ? KERN_DEBUG : KERN_ERR, musb->controller,
 			"VBUS_ERROR in %s (%02x, %s), retry #%d, port1 %08x\n",
-			usb_otg_state_string(musb->xceiv->otg->state),
+			musb_otg_state_string(musb),
 			devctl,
 			({ char *s;
 			switch (devctl & MUSB_DEVCTL_VBUS) {
@@ -831,7 +827,7 @@ static void musb_handle_intr_vbuserr(struct musb *musb, u8 devctl)
 static void musb_handle_intr_suspend(struct musb *musb, u8 devctl)
 {
 	musb_dbg(musb, "SUSPEND (%s) devctl %02x",
-		usb_otg_state_string(musb->xceiv->otg->state), devctl);
+		 musb_otg_state_string(musb), devctl);
 
 	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_PERIPHERAL:
@@ -939,13 +935,13 @@ static void musb_handle_intr_connect(struct musb *musb, u8 devctl, u8 int_usb)
 	musb_host_poke_root_hub(musb);
 
 	musb_dbg(musb, "CONNECT (%s) devctl %02x",
-			usb_otg_state_string(musb->xceiv->otg->state), devctl);
+			musb_otg_state_string(musb), devctl);
 }
 
 static void musb_handle_intr_disconnect(struct musb *musb, u8 devctl)
 {
 	musb_dbg(musb, "DISCONNECT (%s) as %s, devctl %02x",
-			usb_otg_state_string(musb->xceiv->otg->state),
+			musb_otg_state_string(musb),
 			MUSB_MODE(musb), devctl);
 
 	switch (musb_get_state(musb)) {
@@ -981,7 +977,7 @@ static void musb_handle_intr_disconnect(struct musb *musb, u8 devctl)
 		break;
 	default:
 		WARNING("unhandled DISCONNECT transition (%s)\n",
-			usb_otg_state_string(musb->xceiv->otg->state));
+			musb_otg_state_string(musb));
 		break;
 	}
 }
@@ -1004,8 +1000,7 @@ static void musb_handle_intr_reset(struct musb *musb)
 		dev_err(musb->controller, "Babble\n");
 		musb_recover_from_babble(musb);
 	} else {
-		musb_dbg(musb, "BUS RESET as %s",
-			usb_otg_state_string(musb->xceiv->otg->state));
+		musb_dbg(musb, "BUS RESET as %s", musb_otg_state_string(musb));
 		switch (musb_get_state(musb)) {
 		case OTG_STATE_A_SUSPEND:
 			musb_g_reset(musb);
@@ -1013,7 +1008,7 @@ static void musb_handle_intr_reset(struct musb *musb)
 		case OTG_STATE_A_WAIT_BCON:	/* OPT TD.4.7-900ms */
 			/* never use invalid T(a_wait_bcon) */
 			musb_dbg(musb, "HNP: in %s, %d msec timeout",
-				usb_otg_state_string(musb->xceiv->otg->state),
+				 musb_otg_state_string(musb),
 				TA_WAIT_BCON(musb));
 			mod_timer(&musb->otg_timer, jiffies
 				+ msecs_to_jiffies(TA_WAIT_BCON(musb)));
@@ -1024,7 +1019,7 @@ static void musb_handle_intr_reset(struct musb *musb)
 			break;
 		case OTG_STATE_B_WAIT_ACON:
 			musb_dbg(musb, "HNP: RESET (%s), to b_peripheral",
-				usb_otg_state_string(musb->xceiv->otg->state));
+				 musb_otg_state_string(musb));
 			musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 			musb_g_reset(musb);
 			break;
@@ -1036,7 +1031,7 @@ static void musb_handle_intr_reset(struct musb *musb)
 			break;
 		default:
 			musb_dbg(musb, "Unhandled BUS RESET as %s",
-				usb_otg_state_string(musb->xceiv->otg->state));
+				 musb_otg_state_string(musb));
 		}
 	}
 }
@@ -1863,7 +1858,7 @@ mode_show(struct device *dev, struct device_attribute *attr, char *buf)
 	int ret;
 
 	spin_lock_irqsave(&musb->lock, flags);
-	ret = sprintf(buf, "%s\n", usb_otg_state_string(musb->xceiv->otg->state));
+	ret = sprintf(buf, "%s\n", musb_otg_state_string(musb));
 	spin_unlock_irqrestore(&musb->lock, flags);
 
 	return ret;
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index 4a4d485d37bd..a497c44ab0da 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -603,6 +603,11 @@ static inline enum usb_otg_state musb_get_state(struct musb *musb)
 	return musb->xceiv->otg->state;
 }
 
+static inline const char *musb_otg_state_string(struct musb *musb)
+{
+	return usb_otg_state_string(musb_get_state(musb));
+}
+
 /*
  * gets the "dr_mode" property from DT and converts it into musb_mode
  * if the property is not found or not recognized returns MUSB_OTG
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index b5c7deb288d2..9f5c531de387 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1564,7 +1564,7 @@ static int musb_gadget_wakeup(struct usb_gadget *gadget)
 		goto done;
 	default:
 		musb_dbg(musb, "Unhandled wake: %s",
-			usb_otg_state_string(musb->xceiv->otg->state));
+			 musb_otg_state_string(musb));
 		goto done;
 	}
 
@@ -1940,7 +1940,7 @@ void musb_g_resume(struct musb *musb)
 		break;
 	default:
 		WARNING("unhandled RESUME transition (%s)\n",
-				usb_otg_state_string(musb->xceiv->otg->state));
+			musb_otg_state_string(musb));
 	}
 }
 
@@ -1970,7 +1970,7 @@ void musb_g_suspend(struct musb *musb)
 		 * A_PERIPHERAL may need care too
 		 */
 		WARNING("unhandled SUSPEND transition (%s)",
-				usb_otg_state_string(musb->xceiv->otg->state));
+			musb_otg_state_string(musb));
 	}
 }
 
@@ -2004,7 +2004,7 @@ void musb_g_disconnect(struct musb *musb)
 	switch (musb_get_state(musb)) {
 	default:
 		musb_dbg(musb, "Unhandled disconnect %s, setting a_idle",
-			usb_otg_state_string(musb->xceiv->otg->state));
+			 musb_otg_state_string(musb));
 		musb_set_state(musb, OTG_STATE_A_IDLE);
 		MUSB_HST_MODE(musb);
 		break;
diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index ed631447a253..b7553da7f4bc 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -2519,7 +2519,7 @@ static int musb_bus_suspend(struct usb_hcd *hcd)
 
 	if (musb->is_active) {
 		WARNING("trying to suspend as %s while active\n",
-				usb_otg_state_string(musb->xceiv->otg->state));
+			musb_otg_state_string(musb));
 		return -EBUSY;
 	} else
 		return 0;
diff --git a/drivers/usb/musb/musb_virthub.c b/drivers/usb/musb/musb_virthub.c
index d1cfd45d69e3..7eb929d75280 100644
--- a/drivers/usb/musb/musb_virthub.c
+++ b/drivers/usb/musb/musb_virthub.c
@@ -102,7 +102,7 @@ int musb_port_suspend(struct musb *musb, bool do_suspend)
 			break;
 		default:
 			musb_dbg(musb, "bogus rh suspend? %s",
-				usb_otg_state_string(musb->xceiv->otg->state));
+				 musb_otg_state_string(musb));
 		}
 	} else if (power & MUSB_POWER_SUSPENDM) {
 		power &= ~MUSB_POWER_SUSPENDM;
@@ -221,7 +221,7 @@ void musb_root_disconnect(struct musb *musb)
 		break;
 	default:
 		musb_dbg(musb, "host disconnect (%s)",
-			usb_otg_state_string(musb->xceiv->otg->state));
+			 musb_otg_state_string(musb));
 	}
 }
 EXPORT_SYMBOL_GPL(musb_root_disconnect);
-- 
2.35.1

