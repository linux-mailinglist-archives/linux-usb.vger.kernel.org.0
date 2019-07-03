Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD70A5DEE6
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 09:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfGCH2z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 03:28:55 -0400
Received: from inva021.nxp.com ([92.121.34.21]:37180 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726998AbfGCH2z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 03:28:55 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A1B5F201064;
        Wed,  3 Jul 2019 09:28:51 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3029C200FFF;
        Wed,  3 Jul 2019 09:28:48 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 06527402B6;
        Wed,  3 Jul 2019 15:28:43 +0800 (SGT)
From:   jun.li@nxp.com
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/5] usb: chipidea: replace ci_role with usb_role
Date:   Wed,  3 Jul 2019 15:19:52 +0800
Message-Id: <20190703071953.38082-1-jun.li@nxp.com>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Since there is usb_role which has similar definition like ci_role,
switch to use usb_role, then we can directly compare usb role
with a common definition, this can benifit on usb role switch
class support.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/ci.h      | 28 ++++++++++++----------------
 drivers/usb/chipidea/core.c    | 34 +++++++++++++++++-----------------
 drivers/usb/chipidea/debug.c   | 12 ++++++------
 drivers/usb/chipidea/host.c    |  6 +++---
 drivers/usb/chipidea/otg.c     | 14 +++++++-------
 drivers/usb/chipidea/otg.h     |  2 +-
 drivers/usb/chipidea/otg_fsm.c |  4 ++--
 drivers/usb/chipidea/udc.c     |  6 +++---
 8 files changed, 51 insertions(+), 55 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 6a2cc5c..82b86cd 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -16,6 +16,7 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg-fsm.h>
 #include <linux/usb/otg.h>
+#include <linux/usb/role.h>
 #include <linux/ulpi/interface.h>
 
 /******************************************************************************
@@ -102,12 +103,6 @@ struct ci_hw_ep {
 	struct td_node				*pending_td;
 };
 
-enum ci_role {
-	CI_ROLE_HOST = 0,
-	CI_ROLE_GADGET,
-	CI_ROLE_END,
-};
-
 enum ci_revision {
 	CI_REVISION_1X = 10,	/* Revision 1.x */
 	CI_REVISION_20 = 20, /* Revision 2.0 */
@@ -208,8 +203,8 @@ struct ci_hdrc {
 	spinlock_t			lock;
 	struct hw_bank			hw_bank;
 	int				irq;
-	struct ci_role_driver		*roles[CI_ROLE_END];
-	enum ci_role			role;
+	struct ci_role_driver		*roles[USB_ROLE_DEVICE + 1];
+	enum usb_role			role;
 	bool				is_otg;
 	struct usb_otg			otg;
 	struct otg_fsm			fsm;
@@ -258,15 +253,16 @@ struct ci_hdrc {
 
 static inline struct ci_role_driver *ci_role(struct ci_hdrc *ci)
 {
-	BUG_ON(ci->role >= CI_ROLE_END || !ci->roles[ci->role]);
+	WARN_ON((ci->role != USB_ROLE_HOST && ci->role != USB_ROLE_DEVICE) ||
+	       !ci->roles[ci->role]);
 	return ci->roles[ci->role];
 }
 
-static inline int ci_role_start(struct ci_hdrc *ci, enum ci_role role)
+static inline int ci_role_start(struct ci_hdrc *ci, enum usb_role role)
 {
 	int ret;
 
-	if (role >= CI_ROLE_END)
+	if (role != USB_ROLE_HOST && role != USB_ROLE_DEVICE)
 		return -EINVAL;
 
 	if (!ci->roles[role])
@@ -280,12 +276,12 @@ static inline int ci_role_start(struct ci_hdrc *ci, enum ci_role role)
 
 static inline void ci_role_stop(struct ci_hdrc *ci)
 {
-	enum ci_role role = ci->role;
+	enum usb_role role = ci->role;
 
-	if (role == CI_ROLE_END)
+	if (role == USB_ROLE_NONE)
 		return;
 
-	ci->role = CI_ROLE_END;
+	ci->role = USB_ROLE_NONE;
 
 	ci->roles[role]->stop(ci);
 }
@@ -416,8 +412,8 @@ static inline bool ci_otg_is_fsm_mode(struct ci_hdrc *ci)
 #ifdef CONFIG_USB_OTG_FSM
 	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
 
-	return ci->is_otg && ci->roles[CI_ROLE_HOST] &&
-		ci->roles[CI_ROLE_GADGET] && (otg_caps->srp_support ||
+	return ci->is_otg && ci->roles[USB_ROLE_HOST] &&
+		ci->roles[USB_ROLE_DEVICE] && (otg_caps->srp_support ||
 		otg_caps->hnp_support || otg_caps->adp_support);
 #else
 	return false;
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 26062d6..bc24c5b 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -581,7 +581,7 @@ static irqreturn_t ci_irq(int irq, void *data)
 	}
 
 	/* Handle device/host interrupt */
-	if (ci->role != CI_ROLE_END)
+	if (ci->role != USB_ROLE_NONE)
 		ret = ci_role(ci)->irq(ci);
 
 	return ret;
@@ -835,7 +835,7 @@ static inline void ci_role_destroy(struct ci_hdrc *ci)
 {
 	ci_hdrc_gadget_destroy(ci);
 	ci_hdrc_host_destroy(ci);
-	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
+	if (ci->is_otg && ci->roles[USB_ROLE_DEVICE])
 		ci_hdrc_otg_destroy(ci);
 }
 
@@ -860,7 +860,7 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
-	if (ci->role != CI_ROLE_END)
+	if (ci->role != USB_ROLE_NONE)
 		return sprintf(buf, "%s\n", ci_role(ci)->name);
 
 	return 0;
@@ -870,27 +870,27 @@ static ssize_t role_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t n)
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
-	enum ci_role role;
+	enum usb_role role;
 	int ret;
 
-	if (!(ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET])) {
+	if (!(ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE])) {
 		dev_warn(dev, "Current configuration is not dual-role, quit\n");
 		return -EPERM;
 	}
 
-	for (role = CI_ROLE_HOST; role < CI_ROLE_END; role++)
+	for (role = USB_ROLE_DEVICE; role > USB_ROLE_NONE; role--)
 		if (!strncmp(buf, ci->roles[role]->name,
 			     strlen(ci->roles[role]->name)))
 			break;
 
-	if (role == CI_ROLE_END || role == ci->role)
+	if (role == USB_ROLE_NONE || role == ci->role)
 		return -EINVAL;
 
 	pm_runtime_get_sync(dev);
 	disable_irq(ci->irq);
 	ci_role_stop(ci);
 	ret = ci_role_start(ci, role);
-	if (!ret && ci->role == CI_ROLE_GADGET)
+	if (!ret && ci->role == USB_ROLE_DEVICE)
 		ci_handle_vbus_change(ci);
 	enable_irq(ci->irq);
 	pm_runtime_put_sync(dev);
@@ -1037,13 +1037,13 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (!ci->roles[CI_ROLE_HOST] && !ci->roles[CI_ROLE_GADGET]) {
+	if (!ci->roles[USB_ROLE_HOST] && !ci->roles[USB_ROLE_DEVICE]) {
 		dev_err(dev, "no supported roles\n");
 		ret = -ENODEV;
 		goto deinit_gadget;
 	}
 
-	if (ci->is_otg && ci->roles[CI_ROLE_GADGET]) {
+	if (ci->is_otg && ci->roles[USB_ROLE_DEVICE]) {
 		ret = ci_hdrc_otg_init(ci);
 		if (ret) {
 			dev_err(dev, "init otg fails, ret = %d\n", ret);
@@ -1051,7 +1051,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
+	if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
 		if (ci->is_otg) {
 			ci->role = ci_otg_role(ci);
 			/* Enable ID change irq */
@@ -1062,17 +1062,17 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 			 * role switch, the defalt role is gadget, and the
 			 * user can switch it through debugfs.
 			 */
-			ci->role = CI_ROLE_GADGET;
+			ci->role = USB_ROLE_DEVICE;
 		}
 	} else {
-		ci->role = ci->roles[CI_ROLE_HOST]
-			? CI_ROLE_HOST
-			: CI_ROLE_GADGET;
+		ci->role = ci->roles[USB_ROLE_HOST]
+			? USB_ROLE_HOST
+			: USB_ROLE_DEVICE;
 	}
 
 	if (!ci_otg_is_fsm_mode(ci)) {
 		/* only update vbus status for peripheral */
-		if (ci->role == CI_ROLE_GADGET)
+		if (ci->role == USB_ROLE_DEVICE)
 			ci_handle_vbus_change(ci);
 
 		ret = ci_role_start(ci, ci->role);
@@ -1115,7 +1115,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 remove_debug:
 	dbg_remove_files(ci);
 stop:
-	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
+	if (ci->is_otg && ci->roles[USB_ROLE_DEVICE])
 		ci_hdrc_otg_destroy(ci);
 deinit_gadget:
 	ci_hdrc_gadget_destroy(ci);
diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
index fcc91a3..a3c022e 100644
--- a/drivers/usb/chipidea/debug.c
+++ b/drivers/usb/chipidea/debug.c
@@ -124,7 +124,7 @@ static int ci_qheads_show(struct seq_file *s, void *data)
 	unsigned long flags;
 	unsigned i, j;
 
-	if (ci->role != CI_ROLE_GADGET) {
+	if (ci->role != USB_ROLE_DEVICE) {
 		seq_printf(s, "not in gadget mode\n");
 		return 0;
 	}
@@ -158,7 +158,7 @@ static int ci_requests_show(struct seq_file *s, void *data)
 	struct td_node *node, *tmpnode;
 	unsigned i, j, qsize = sizeof(struct ci_hw_td)/sizeof(u32);
 
-	if (ci->role != CI_ROLE_GADGET) {
+	if (ci->role != USB_ROLE_DEVICE) {
 		seq_printf(s, "not in gadget mode\n");
 		return 0;
 	}
@@ -251,7 +251,7 @@ static int ci_role_show(struct seq_file *s, void *data)
 {
 	struct ci_hdrc *ci = s->private;
 
-	if (ci->role != CI_ROLE_END)
+	if (ci->role != USB_ROLE_NONE)
 		seq_printf(s, "%s\n", ci_role(ci)->name);
 
 	return 0;
@@ -262,20 +262,20 @@ static ssize_t ci_role_write(struct file *file, const char __user *ubuf,
 {
 	struct seq_file *s = file->private_data;
 	struct ci_hdrc *ci = s->private;
-	enum ci_role role;
+	enum usb_role role;
 	char buf[8];
 	int ret;
 
 	if (copy_from_user(buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
 
-	for (role = CI_ROLE_HOST; role < CI_ROLE_END; role++)
+	for (role = USB_ROLE_DEVICE; role > USB_ROLE_NONE; role--)
 		if (ci->roles[role] &&
 		    !strncmp(buf, ci->roles[role]->name,
 			     strlen(ci->roles[role]->name)))
 			break;
 
-	if (role == CI_ROLE_END || role == ci->role)
+	if (role == USB_ROLE_NONE || role == ci->role)
 		return -EINVAL;
 
 	pm_runtime_get_sync(ci->dev);
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index b45ceb9..dcce43d 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -198,7 +198,7 @@ static void host_stop(struct ci_hdrc *ci)
 			ci->platdata->notify_event(ci,
 				CI_HDRC_CONTROLLER_STOPPED_EVENT);
 		usb_remove_hcd(hcd);
-		ci->role = CI_ROLE_END;
+		ci->role = USB_ROLE_NONE;
 		synchronize_irq(ci->irq);
 		usb_put_hcd(hcd);
 		if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci) &&
@@ -216,7 +216,7 @@ static void host_stop(struct ci_hdrc *ci)
 
 void ci_hdrc_host_destroy(struct ci_hdrc *ci)
 {
-	if (ci->role == CI_ROLE_HOST && ci->hcd)
+	if (ci->role == USB_ROLE_HOST && ci->hcd)
 		host_stop(ci);
 }
 
@@ -362,7 +362,7 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
 	rdrv->stop	= host_stop;
 	rdrv->irq	= host_irq;
 	rdrv->name	= "host";
-	ci->roles[CI_ROLE_HOST] = rdrv;
+	ci->roles[USB_ROLE_HOST] = rdrv;
 
 	return 0;
 }
diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index f25d482..5bde0b5 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -117,11 +117,11 @@ void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 data)
  * ci_otg_role - pick role based on ID pin state
  * @ci: the controller
  */
-enum ci_role ci_otg_role(struct ci_hdrc *ci)
+enum usb_role ci_otg_role(struct ci_hdrc *ci)
 {
-	enum ci_role role = hw_read_otgsc(ci, OTGSC_ID)
-		? CI_ROLE_GADGET
-		: CI_ROLE_HOST;
+	enum usb_role role = hw_read_otgsc(ci, OTGSC_ID)
+		? USB_ROLE_DEVICE
+		: USB_ROLE_HOST;
 
 	return role;
 }
@@ -164,7 +164,7 @@ static int hw_wait_vbus_lower_bsv(struct ci_hdrc *ci)
 
 static void ci_handle_id_switch(struct ci_hdrc *ci)
 {
-	enum ci_role role = ci_otg_role(ci);
+	enum usb_role role = ci_otg_role(ci);
 
 	if (role != ci->role) {
 		dev_dbg(ci->dev, "switching from %s to %s\n",
@@ -172,7 +172,7 @@ static void ci_handle_id_switch(struct ci_hdrc *ci)
 
 		ci_role_stop(ci);
 
-		if (role == CI_ROLE_GADGET &&
+		if (role == USB_ROLE_DEVICE &&
 				IS_ERR(ci->platdata->vbus_extcon.edev))
 			/*
 			 * Wait vbus lower than OTGSC_BSV before connecting
@@ -185,7 +185,7 @@ static void ci_handle_id_switch(struct ci_hdrc *ci)
 
 		ci_role_start(ci, role);
 		/* vbus change may have already occurred */
-		if (role == CI_ROLE_GADGET)
+		if (role == USB_ROLE_DEVICE)
 			ci_handle_vbus_change(ci);
 	}
 }
diff --git a/drivers/usb/chipidea/otg.h b/drivers/usb/chipidea/otg.h
index 4f8b817..f64bfc6 100644
--- a/drivers/usb/chipidea/otg.h
+++ b/drivers/usb/chipidea/otg.h
@@ -12,7 +12,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask);
 void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 data);
 int ci_hdrc_otg_init(struct ci_hdrc *ci);
 void ci_hdrc_otg_destroy(struct ci_hdrc *ci);
-enum ci_role ci_otg_role(struct ci_hdrc *ci);
+enum usb_role ci_otg_role(struct ci_hdrc *ci);
 void ci_handle_vbus_change(struct ci_hdrc *ci);
 static inline void ci_otg_queue_work(struct ci_hdrc *ci)
 {
diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
index 6ed4b00..78c96a1 100644
--- a/drivers/usb/chipidea/otg_fsm.c
+++ b/drivers/usb/chipidea/otg_fsm.c
@@ -547,10 +547,10 @@ static int ci_otg_start_host(struct otg_fsm *fsm, int on)
 
 	if (on) {
 		ci_role_stop(ci);
-		ci_role_start(ci, CI_ROLE_HOST);
+		ci_role_start(ci, USB_ROLE_HOST);
 	} else {
 		ci_role_stop(ci);
-		ci_role_start(ci, CI_ROLE_GADGET);
+		ci_role_start(ci, USB_ROLE_DEVICE);
 	}
 	return 0;
 }
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 6a5ee8e..e1d745f7 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1606,7 +1606,7 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
 	 * Data+ pullup controlled by OTG state machine in OTG fsm mode;
 	 * and don't touch Data+ in host mode for dual role config.
 	 */
-	if (ci_otg_is_fsm_mode(ci) || ci->role == CI_ROLE_HOST)
+	if (ci_otg_is_fsm_mode(ci) || ci->role == USB_ROLE_DEVICE)
 		return 0;
 
 	pm_runtime_get_sync(&ci->gadget.dev);
@@ -1973,7 +1973,7 @@ static int udc_start(struct ci_hdrc *ci)
  */
 void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
 {
-	if (!ci->roles[CI_ROLE_GADGET])
+	if (!ci->roles[USB_ROLE_DEVICE])
 		return;
 
 	usb_del_gadget_udc(&ci->gadget);
@@ -2039,7 +2039,7 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 
 	ret = udc_start(ci);
 	if (!ret)
-		ci->roles[CI_ROLE_GADGET] = rdrv;
+		ci->roles[USB_ROLE_DEVICE] = rdrv;
 
 	return ret;
 }
-- 
2.7.4

