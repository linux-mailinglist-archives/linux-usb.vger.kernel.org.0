Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741A82D114C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Dec 2020 14:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgLGNEY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Dec 2020 08:04:24 -0500
Received: from aposti.net ([89.234.176.197]:34776 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgLGNEY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Dec 2020 08:04:24 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     od@zcrc.me, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/4] usb: musb: Add and use inline functions musb_{get,set}_state
Date:   Mon,  7 Dec 2020 13:03:29 +0000
Message-Id: <20201207130332.120681-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Instead of manipulating musb->xceiv->otg->state directly, use the newly
introduced musb_get_state() and musb_set_state() inline functions.

Later, these inline functions will be modified to get rid of the
musb->xceiv dependency, which prevents the musb code from using the
generic PHY subsystem.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/musb_core.c    | 62 ++++++++++++++++-----------------
 drivers/usb/musb/musb_core.h    | 11 ++++++
 drivers/usb/musb/musb_debugfs.c |  6 ++--
 drivers/usb/musb/musb_gadget.c  | 28 +++++++--------
 drivers/usb/musb/musb_host.c    |  6 ++--
 drivers/usb/musb/musb_virthub.c | 18 +++++-----
 6 files changed, 71 insertions(+), 60 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 849e0b770130..c4665d08aa33 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -501,7 +501,7 @@ int musb_set_host(struct musb *musb)
 
 init_data:
 	musb->is_active = 1;
-	musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+	musb_set_state(musb, OTG_STATE_A_IDLE);
 	MUSB_HST_MODE(musb);
 
 	return error;
@@ -548,7 +548,7 @@ int musb_set_peripheral(struct musb *musb)
 
 init_data:
 	musb->is_active = 0;
-	musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+	musb_set_state(musb, OTG_STATE_B_IDLE);
 	MUSB_DEV_MODE(musb);
 
 	return error;
@@ -598,12 +598,12 @@ static void musb_otg_timer_func(struct timer_list *t)
 	unsigned long	flags;
 
 	spin_lock_irqsave(&musb->lock, flags);
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_B_WAIT_ACON:
 		musb_dbg(musb,
 			"HNP: b_wait_acon timeout; back to b_peripheral");
 		musb_g_disconnect(musb);
-		musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+		musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 		musb->is_active = 0;
 		break;
 	case OTG_STATE_A_SUSPEND:
@@ -611,7 +611,7 @@ static void musb_otg_timer_func(struct timer_list *t)
 		musb_dbg(musb, "HNP: %s timeout",
 			usb_otg_state_string(musb->xceiv->otg->state));
 		musb_platform_set_vbus(musb, 0);
-		musb->xceiv->otg->state = OTG_STATE_A_WAIT_VFALL;
+		musb_set_state(musb, OTG_STATE_A_WAIT_VFALL);
 		break;
 	default:
 		musb_dbg(musb, "HNP: Unhandled mode %s",
@@ -632,7 +632,7 @@ void musb_hnp_stop(struct musb *musb)
 	musb_dbg(musb, "HNP: stop from %s",
 			usb_otg_state_string(musb->xceiv->otg->state));
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_PERIPHERAL:
 		musb_g_disconnect(musb);
 		musb_dbg(musb, "HNP: back to %s",
@@ -642,7 +642,7 @@ void musb_hnp_stop(struct musb *musb)
 		musb_dbg(musb, "HNP: Disabling HR");
 		if (hcd)
 			hcd->self.is_b_host = 0;
-		musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+		musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 		MUSB_DEV_MODE(musb);
 		reg = musb_readb(mbase, MUSB_POWER);
 		reg |= MUSB_POWER_SUSPENDM;
@@ -670,7 +670,7 @@ static void musb_handle_intr_resume(struct musb *musb, u8 devctl)
 			usb_otg_state_string(musb->xceiv->otg->state));
 
 	if (devctl & MUSB_DEVCTL_HM) {
-		switch (musb->xceiv->otg->state) {
+		switch (musb_get_state(musb)) {
 		case OTG_STATE_A_SUSPEND:
 			/* remote wakeup? */
 			musb->port1_status |=
@@ -678,14 +678,14 @@ static void musb_handle_intr_resume(struct musb *musb, u8 devctl)
 					| MUSB_PORT_STAT_RESUME;
 			musb->rh_timer = jiffies
 				+ msecs_to_jiffies(USB_RESUME_TIMEOUT);
-			musb->xceiv->otg->state = OTG_STATE_A_HOST;
+			musb_set_state(musb, OTG_STATE_A_HOST);
 			musb->is_active = 1;
 			musb_host_resume_root_hub(musb);
 			schedule_delayed_work(&musb->finish_resume_work,
 				msecs_to_jiffies(USB_RESUME_TIMEOUT));
 			break;
 		case OTG_STATE_B_WAIT_ACON:
-			musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+			musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 			musb->is_active = 1;
 			MUSB_DEV_MODE(musb);
 			break;
@@ -695,10 +695,10 @@ static void musb_handle_intr_resume(struct musb *musb, u8 devctl)
 				usb_otg_state_string(musb->xceiv->otg->state));
 		}
 	} else {
-		switch (musb->xceiv->otg->state) {
+		switch (musb_get_state(musb)) {
 		case OTG_STATE_A_SUSPEND:
 			/* possibly DISCONNECT is upcoming */
-			musb->xceiv->otg->state = OTG_STATE_A_HOST;
+			musb_set_state(musb, OTG_STATE_A_HOST);
 			musb_host_resume_root_hub(musb);
 			break;
 		case OTG_STATE_B_WAIT_ACON:
@@ -749,7 +749,7 @@ static irqreturn_t musb_handle_intr_sessreq(struct musb *musb, u8 devctl)
 	 */
 	musb_writeb(mbase, MUSB_DEVCTL, MUSB_DEVCTL_SESSION);
 	musb->ep0_stage = MUSB_EP0_START;
-	musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+	musb_set_state(musb, OTG_STATE_A_IDLE);
 	MUSB_HST_MODE(musb);
 	musb_platform_set_vbus(musb, 1);
 
@@ -776,7 +776,7 @@ static void musb_handle_intr_vbuserr(struct musb *musb, u8 devctl)
 	 * REVISIT:  do delays from lots of DEBUG_KERNEL checks
 	 * make trouble here, keeping VBUS < 4.4V ?
 	 */
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_HOST:
 		/* recovery is dicey once we've gotten past the
 		 * initial stages of enumeration, but if VBUS
@@ -832,7 +832,7 @@ static void musb_handle_intr_suspend(struct musb *musb, u8 devctl)
 	musb_dbg(musb, "SUSPEND (%s) devctl %02x",
 		usb_otg_state_string(musb->xceiv->otg->state), devctl);
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_PERIPHERAL:
 		/* We also come here if the cable is removed, since
 		 * this silicon doesn't report ID-no-longer-grounded.
@@ -857,7 +857,7 @@ static void musb_handle_intr_suspend(struct musb *musb, u8 devctl)
 		musb_g_suspend(musb);
 		musb->is_active = musb->g.b_hnp_enable;
 		if (musb->is_active) {
-			musb->xceiv->otg->state = OTG_STATE_B_WAIT_ACON;
+			musb_set_state(musb, OTG_STATE_B_WAIT_ACON);
 			musb_dbg(musb, "HNP: Setting timer for b_ase0_brst");
 			mod_timer(&musb->otg_timer, jiffies
 				+ msecs_to_jiffies(
@@ -870,7 +870,7 @@ static void musb_handle_intr_suspend(struct musb *musb, u8 devctl)
 				+ msecs_to_jiffies(musb->a_wait_bcon));
 		break;
 	case OTG_STATE_A_HOST:
-		musb->xceiv->otg->state = OTG_STATE_A_SUSPEND;
+		musb_set_state(musb, OTG_STATE_A_SUSPEND);
 		musb->is_active = musb->hcd->self.b_hnp_enable;
 		break;
 	case OTG_STATE_B_HOST:
@@ -908,7 +908,7 @@ static void musb_handle_intr_connect(struct musb *musb, u8 devctl, u8 int_usb)
 		musb->port1_status |= USB_PORT_STAT_LOW_SPEED;
 
 	/* indicate new connection to OTG machine */
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_B_PERIPHERAL:
 		if (int_usb & MUSB_INTR_SUSPEND) {
 			musb_dbg(musb, "HNP: SUSPEND+CONNECT, now b_host");
@@ -920,7 +920,7 @@ static void musb_handle_intr_connect(struct musb *musb, u8 devctl, u8 int_usb)
 	case OTG_STATE_B_WAIT_ACON:
 		musb_dbg(musb, "HNP: CONNECT, now b_host");
 b_host:
-		musb->xceiv->otg->state = OTG_STATE_B_HOST;
+		musb_set_state(musb, OTG_STATE_B_HOST);
 		if (musb->hcd)
 			musb->hcd->self.is_b_host = 1;
 		del_timer(&musb->otg_timer);
@@ -928,7 +928,7 @@ static void musb_handle_intr_connect(struct musb *musb, u8 devctl, u8 int_usb)
 	default:
 		if ((devctl & MUSB_DEVCTL_VBUS)
 				== (3 << MUSB_DEVCTL_VBUS_SHIFT)) {
-			musb->xceiv->otg->state = OTG_STATE_A_HOST;
+			musb_set_state(musb, OTG_STATE_A_HOST);
 			if (hcd)
 				hcd->self.is_b_host = 0;
 		}
@@ -947,7 +947,7 @@ static void musb_handle_intr_disconnect(struct musb *musb, u8 devctl)
 			usb_otg_state_string(musb->xceiv->otg->state),
 			MUSB_MODE(musb), devctl);
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_HOST:
 	case OTG_STATE_A_SUSPEND:
 		musb_host_resume_root_hub(musb);
@@ -965,7 +965,7 @@ static void musb_handle_intr_disconnect(struct musb *musb, u8 devctl)
 		musb_root_disconnect(musb);
 		if (musb->hcd)
 			musb->hcd->self.is_b_host = 0;
-		musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+		musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 		MUSB_DEV_MODE(musb);
 		musb_g_disconnect(musb);
 		break;
@@ -1005,7 +1005,7 @@ static void musb_handle_intr_reset(struct musb *musb)
 	} else {
 		musb_dbg(musb, "BUS RESET as %s",
 			usb_otg_state_string(musb->xceiv->otg->state));
-		switch (musb->xceiv->otg->state) {
+		switch (musb_get_state(musb)) {
 		case OTG_STATE_A_SUSPEND:
 			musb_g_reset(musb);
 			fallthrough;
@@ -1024,11 +1024,11 @@ static void musb_handle_intr_reset(struct musb *musb)
 		case OTG_STATE_B_WAIT_ACON:
 			musb_dbg(musb, "HNP: RESET (%s), to b_peripheral",
 				usb_otg_state_string(musb->xceiv->otg->state));
-			musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+			musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 			musb_g_reset(musb);
 			break;
 		case OTG_STATE_B_IDLE:
-			musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+			musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 			fallthrough;
 		case OTG_STATE_B_PERIPHERAL:
 			musb_g_reset(musb);
@@ -1215,8 +1215,8 @@ void musb_start(struct musb *musb)
 	 * (c) peripheral initiates, using SRP
 	 */
 	if (musb->port_mode != MUSB_HOST &&
-			musb->xceiv->otg->state != OTG_STATE_A_WAIT_BCON &&
-			(devctl & MUSB_DEVCTL_VBUS) == MUSB_DEVCTL_VBUS) {
+	    musb_get_state(musb) != OTG_STATE_A_WAIT_BCON &&
+	    (devctl & MUSB_DEVCTL_VBUS) == MUSB_DEVCTL_VBUS) {
 		musb->is_active = 1;
 	} else {
 		devctl |= MUSB_DEVCTL_SESSION;
@@ -1907,7 +1907,7 @@ vbus_store(struct device *dev, struct device_attribute *attr,
 	spin_lock_irqsave(&musb->lock, flags);
 	/* force T(a_wait_bcon) to be zero/unlimited *OR* valid */
 	musb->a_wait_bcon = val ? max_t(int, val, OTG_TIME_A_WAIT_BCON) : 0 ;
-	if (musb->xceiv->otg->state == OTG_STATE_A_WAIT_BCON)
+	if (musb_get_state(musb) == OTG_STATE_A_WAIT_BCON)
 		musb->is_active = 0;
 	musb_platform_try_idle(musb, jiffies + msecs_to_jiffies(val));
 	spin_unlock_irqrestore(&musb->lock, flags);
@@ -2075,8 +2075,8 @@ static void musb_irq_work(struct work_struct *data)
 
 	musb_pm_runtime_check_session(musb);
 
-	if (musb->xceiv->otg->state != musb->xceiv_old_state) {
-		musb->xceiv_old_state = musb->xceiv->otg->state;
+	if (musb_get_state(musb) != musb->xceiv_old_state) {
+		musb->xceiv_old_state = musb_get_state(musb);
 		sysfs_notify(&musb->controller->kobj, NULL, "mode");
 	}
 
@@ -2515,7 +2515,7 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 	}
 
 	MUSB_DEV_MODE(musb);
-	musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+	musb_set_state(musb, OTG_STATE_B_IDLE);
 
 	switch (musb->port_mode) {
 	case MUSB_HOST:
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index dbe5623db1e0..8c0fec972b65 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -592,6 +592,17 @@ static inline void musb_platform_clear_ep_rxintr(struct musb *musb, int epnum)
 		musb->ops->clear_ep_rxintr(musb, epnum);
 }
 
+static inline void musb_set_state(struct musb *musb,
+				  enum usb_otg_state otg_state)
+{
+	musb->xceiv->otg->state = otg_state;
+}
+
+static inline enum usb_otg_state musb_get_state(struct musb *musb)
+{
+	return musb->xceiv->otg->state;
+}
+
 /*
  * gets the "dr_mode" property from DT and converts it into musb_mode
  * if the property is not found or not recognized returns MUSB_OTG
diff --git a/drivers/usb/musb/musb_debugfs.c b/drivers/usb/musb/musb_debugfs.c
index 30a89aa8a3e7..78c726a71b17 100644
--- a/drivers/usb/musb/musb_debugfs.c
+++ b/drivers/usb/musb/musb_debugfs.c
@@ -235,7 +235,7 @@ static int musb_softconnect_show(struct seq_file *s, void *unused)
 	u8		reg;
 	int		connect;
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_HOST:
 	case OTG_STATE_A_WAIT_BCON:
 		pm_runtime_get_sync(musb->controller);
@@ -275,7 +275,7 @@ static ssize_t musb_softconnect_write(struct file *file,
 
 	pm_runtime_get_sync(musb->controller);
 	if (!strncmp(buf, "0", 1)) {
-		switch (musb->xceiv->otg->state) {
+		switch (musb_get_state(musb)) {
 		case OTG_STATE_A_HOST:
 			musb_root_disconnect(musb);
 			reg = musb_readb(musb->mregs, MUSB_DEVCTL);
@@ -286,7 +286,7 @@ static ssize_t musb_softconnect_write(struct file *file,
 			break;
 		}
 	} else if (!strncmp(buf, "1", 1)) {
-		switch (musb->xceiv->otg->state) {
+		switch (musb_get_state(musb)) {
 		case OTG_STATE_A_WAIT_BCON:
 			/*
 			 * musb_save_context() called in musb_runtime_suspend()
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index f62ffaede1ab..2be9b084749b 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1518,7 +1518,7 @@ static int musb_gadget_wakeup(struct usb_gadget *gadget)
 
 	spin_lock_irqsave(&musb->lock, flags);
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_B_PERIPHERAL:
 		/* NOTE:  OTG state machine doesn't include B_SUSPENDED;
 		 * that's part of the standard usb 1.1 state machine, and
@@ -1782,7 +1782,7 @@ int musb_gadget_setup(struct musb *musb)
 	musb->g.speed = USB_SPEED_UNKNOWN;
 
 	MUSB_DEV_MODE(musb);
-	musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+	musb_set_state(musb, OTG_STATE_B_IDLE);
 
 	/* this "gadget" abstracts/virtualizes the controller */
 	musb->g.name = musb_driver_name;
@@ -1847,7 +1847,7 @@ static int musb_gadget_start(struct usb_gadget *g,
 	musb->is_active = 1;
 
 	otg_set_peripheral(otg, &musb->g);
-	musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+	musb_set_state(musb, OTG_STATE_B_IDLE);
 	spin_unlock_irqrestore(&musb->lock, flags);
 
 	musb_start(musb);
@@ -1892,7 +1892,7 @@ static int musb_gadget_stop(struct usb_gadget *g)
 
 	(void) musb_gadget_vbus_draw(&musb->g, 0);
 
-	musb->xceiv->otg->state = OTG_STATE_UNDEFINED;
+	musb_set_state(musb, OTG_STATE_UNDEFINED);
 	musb_stop(musb);
 	otg_set_peripheral(musb->xceiv->otg, NULL);
 
@@ -1923,7 +1923,7 @@ static int musb_gadget_stop(struct usb_gadget *g)
 void musb_g_resume(struct musb *musb)
 {
 	musb->is_suspended = 0;
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_B_IDLE:
 		break;
 	case OTG_STATE_B_WAIT_ACON:
@@ -1949,10 +1949,10 @@ void musb_g_suspend(struct musb *musb)
 	devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
 	musb_dbg(musb, "musb_g_suspend: devctl %02x", devctl);
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_B_IDLE:
 		if ((devctl & MUSB_DEVCTL_VBUS) == MUSB_DEVCTL_VBUS)
-			musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+			musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 		break;
 	case OTG_STATE_B_PERIPHERAL:
 		musb->is_suspended = 1;
@@ -1998,22 +1998,22 @@ void musb_g_disconnect(struct musb *musb)
 		spin_lock(&musb->lock);
 	}
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	default:
 		musb_dbg(musb, "Unhandled disconnect %s, setting a_idle",
 			usb_otg_state_string(musb->xceiv->otg->state));
-		musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+		musb_set_state(musb, OTG_STATE_A_IDLE);
 		MUSB_HST_MODE(musb);
 		break;
 	case OTG_STATE_A_PERIPHERAL:
-		musb->xceiv->otg->state = OTG_STATE_A_WAIT_BCON;
+		musb_set_state(musb, OTG_STATE_A_WAIT_BCON);
 		MUSB_HST_MODE(musb);
 		break;
 	case OTG_STATE_B_WAIT_ACON:
 	case OTG_STATE_B_HOST:
 	case OTG_STATE_B_PERIPHERAL:
 	case OTG_STATE_B_IDLE:
-		musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+		musb_set_state(musb, OTG_STATE_B_IDLE);
 		break;
 	case OTG_STATE_B_SRP_INIT:
 		break;
@@ -2077,13 +2077,13 @@ __acquires(musb->lock)
 		 * In that case, do not rely on devctl for setting
 		 * peripheral mode.
 		 */
-		musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+		musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 		musb->g.is_a_peripheral = 0;
 	} else if (devctl & MUSB_DEVCTL_BDEVICE) {
-		musb->xceiv->otg->state = OTG_STATE_B_PERIPHERAL;
+		musb_set_state(musb, OTG_STATE_B_PERIPHERAL);
 		musb->g.is_a_peripheral = 0;
 	} else {
-		musb->xceiv->otg->state = OTG_STATE_A_PERIPHERAL;
+		musb_set_state(musb, OTG_STATE_A_PERIPHERAL);
 		musb->g.is_a_peripheral = 1;
 	}
 
diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 30c5e7de0761..7811a8858c54 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -2507,7 +2507,7 @@ static int musb_bus_suspend(struct usb_hcd *hcd)
 	if (!is_host_active(musb))
 		return 0;
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_SUSPEND:
 		return 0;
 	case OTG_STATE_A_WAIT_VRISE:
@@ -2517,7 +2517,7 @@ static int musb_bus_suspend(struct usb_hcd *hcd)
 		 */
 		devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
 		if ((devctl & MUSB_DEVCTL_VBUS) == MUSB_DEVCTL_VBUS)
-			musb->xceiv->otg->state = OTG_STATE_A_WAIT_BCON;
+			musb_set_state(musb, OTG_STATE_A_WAIT_BCON);
 		break;
 	default:
 		break;
@@ -2726,7 +2726,7 @@ int musb_host_setup(struct musb *musb, int power_budget)
 
 	if (musb->port_mode == MUSB_HOST) {
 		MUSB_HST_MODE(musb);
-		musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+		musb_set_state(musb, OTG_STATE_A_IDLE);
 	}
 	otg_set_host(musb->xceiv->otg, &hcd->self);
 	/* don't support otg protocols */
diff --git a/drivers/usb/musb/musb_virthub.c b/drivers/usb/musb/musb_virthub.c
index cafc69536e1d..d1cfd45d69e3 100644
--- a/drivers/usb/musb/musb_virthub.c
+++ b/drivers/usb/musb/musb_virthub.c
@@ -43,7 +43,7 @@ void musb_host_finish_resume(struct work_struct *work)
 	musb->port1_status |= USB_PORT_STAT_C_SUSPEND << 16;
 	usb_hcd_poll_rh_status(musb->hcd);
 	/* NOTE: it might really be A_WAIT_BCON ... */
-	musb->xceiv->otg->state = OTG_STATE_A_HOST;
+	musb_set_state(musb, OTG_STATE_A_HOST);
 
 	spin_unlock_irqrestore(&musb->lock, flags);
 }
@@ -85,9 +85,9 @@ int musb_port_suspend(struct musb *musb, bool do_suspend)
 		musb_dbg(musb, "Root port suspended, power %02x", power);
 
 		musb->port1_status |= USB_PORT_STAT_SUSPEND;
-		switch (musb->xceiv->otg->state) {
+		switch (musb_get_state(musb)) {
 		case OTG_STATE_A_HOST:
-			musb->xceiv->otg->state = OTG_STATE_A_SUSPEND;
+			musb_set_state(musb, OTG_STATE_A_SUSPEND);
 			musb->is_active = otg->host->b_hnp_enable;
 			if (musb->is_active)
 				mod_timer(&musb->otg_timer, jiffies
@@ -96,7 +96,7 @@ int musb_port_suspend(struct musb *musb, bool do_suspend)
 			musb_platform_try_idle(musb, 0);
 			break;
 		case OTG_STATE_B_HOST:
-			musb->xceiv->otg->state = OTG_STATE_B_WAIT_ACON;
+			musb_set_state(musb, OTG_STATE_B_WAIT_ACON);
 			musb->is_active = otg->host->b_hnp_enable;
 			musb_platform_try_idle(musb, 0);
 			break;
@@ -123,7 +123,7 @@ void musb_port_reset(struct musb *musb, bool do_reset)
 	u8		power;
 	void __iomem	*mbase = musb->mregs;
 
-	if (musb->xceiv->otg->state == OTG_STATE_B_IDLE) {
+	if (musb_get_state(musb) == OTG_STATE_B_IDLE) {
 		musb_dbg(musb, "HNP: Returning from HNP; no hub reset from b_idle");
 		musb->port1_status &= ~USB_PORT_STAT_RESET;
 		return;
@@ -204,20 +204,20 @@ void musb_root_disconnect(struct musb *musb)
 	usb_hcd_poll_rh_status(musb->hcd);
 	musb->is_active = 0;
 
-	switch (musb->xceiv->otg->state) {
+	switch (musb_get_state(musb)) {
 	case OTG_STATE_A_SUSPEND:
 		if (otg->host->b_hnp_enable) {
-			musb->xceiv->otg->state = OTG_STATE_A_PERIPHERAL;
+			musb_set_state(musb, OTG_STATE_A_PERIPHERAL);
 			musb->g.is_a_peripheral = 1;
 			break;
 		}
 		fallthrough;
 	case OTG_STATE_A_HOST:
-		musb->xceiv->otg->state = OTG_STATE_A_WAIT_BCON;
+		musb_set_state(musb, OTG_STATE_A_WAIT_BCON);
 		musb->is_active = 0;
 		break;
 	case OTG_STATE_A_WAIT_VFALL:
-		musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+		musb_set_state(musb, OTG_STATE_B_IDLE);
 		break;
 	default:
 		musb_dbg(musb, "host disconnect (%s)",
-- 
2.29.2

