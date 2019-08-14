Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6BA8D25E
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 13:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfHNLj3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 07:39:29 -0400
Received: from inva021.nxp.com ([92.121.34.21]:42674 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727744AbfHNLj3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Aug 2019 07:39:29 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 73B93200365;
        Wed, 14 Aug 2019 13:39:26 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 91152200184;
        Wed, 14 Aug 2019 13:39:23 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E7F19402EC;
        Wed, 14 Aug 2019 19:39:19 +0800 (SGT)
From:   jun.li@nxp.com
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH v3] usb: chipidea: add role switch class support
Date:   Wed, 14 Aug 2019 19:29:42 +0800
Message-Id: <20190814112942.33142-1-jun.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

USB role is fully controlled by usb role switch consumer(e.g. typec),
usb port can be at host mode(USB_ROLE_HOST), device mode connected to
host(USB_ROLE_DEVICE), or not connecting any partner(USB_ROLE_NONE).

Signed-off-by: Li Jun <jun.li@nxp.com>
---

Changes for v3:
- Remove the patch usb: chipidea: replace ci_role with usb_role
  as the existing ci->role usage can't map to usb_role.
- Use the suggested ci_hdrc_cable for reuse current role change
  handling.
- Fix build robot warning by add usb_role head file.

Change for v2:
- Support USB_ROLE_NONE, which for usb port not connecting any
  device or host, and will be in low power mode.

 drivers/usb/chipidea/ci.h   | 12 +++++++
 drivers/usb/chipidea/core.c | 76 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/chipidea/otg.c  |  8 ++---
 3 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 6a2cc5c..6911aef 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -16,6 +16,7 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg-fsm.h>
 #include <linux/usb/otg.h>
+#include <linux/usb/role.h>
 #include <linux/ulpi/interface.h>
 
 /******************************************************************************
@@ -217,6 +218,7 @@ struct ci_hdrc {
 	ktime_t				hr_timeouts[NUM_OTG_FSM_TIMERS];
 	unsigned			enabled_otg_timer_bits;
 	enum otg_fsm_timer		next_otg_timer;
+	struct usb_role_switch		*role_switch;
 	struct work_struct		work;
 	struct workqueue_struct		*wq;
 
@@ -290,6 +292,16 @@ static inline void ci_role_stop(struct ci_hdrc *ci)
 	ci->roles[role]->stop(ci);
 }
 
+static inline enum usb_role ci_role_to_usb_role(struct ci_hdrc *ci)
+{
+	if (ci->role == CI_ROLE_HOST)
+		return USB_ROLE_HOST;
+	else if (ci->role == CI_ROLE_GADGET && ci->vbus_active)
+		return USB_ROLE_DEVICE;
+	else
+		return USB_ROLE_NONE;
+}
+
 /**
  * hw_read_id_reg: reads from a identification register
  * @ci: the controller
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 26062d6..c3300a1 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -600,6 +600,64 @@ static int ci_cable_notifier(struct notifier_block *nb, unsigned long event,
 	return NOTIFY_DONE;
 }
 
+static enum usb_role ci_usb_role_switch_get(struct device *dev)
+{
+	struct ci_hdrc *ci = dev_get_drvdata(dev);
+	enum usb_role role;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ci->lock, flags);
+	role = ci_role_to_usb_role(ci);
+	spin_unlock_irqrestore(&ci->lock, flags);
+
+	return role;
+}
+
+static int ci_usb_role_switch_set(struct device *dev, enum usb_role role)
+{
+	struct ci_hdrc *ci = dev_get_drvdata(dev);
+	struct ci_hdrc_cable *cable = NULL;
+	enum usb_role current_role = ci_role_to_usb_role(ci);
+
+	if (current_role == role)
+		return 0;
+
+	/* Stop current role */
+	if (current_role == USB_ROLE_DEVICE)
+		cable = &ci->platdata->vbus_extcon;
+	else if (current_role == USB_ROLE_HOST)
+		cable = &ci->platdata->id_extcon;
+
+	if (cable) {
+		cable->changed = true;
+		cable->connected = false;
+		ci_irq(ci->irq, ci);
+	}
+
+	cable = NULL;
+
+	/* Start target role */
+	if (role == USB_ROLE_DEVICE)
+		cable = &ci->platdata->vbus_extcon;
+	else if (role == USB_ROLE_HOST)
+		cable = &ci->platdata->id_extcon;
+
+	if (cable) {
+		if (ci->wq)
+			flush_workqueue(ci->wq);
+		cable->changed = true;
+		cable->connected = true;
+		ci_irq(ci->irq, ci);
+	}
+
+	return 0;
+}
+
+static struct usb_role_switch_desc ci_role_switch = {
+	.set = ci_usb_role_switch_set,
+	.get = ci_usb_role_switch_get,
+};
+
 static int ci_get_platdata(struct device *dev,
 		struct ci_hdrc_platform_data *platdata)
 {
@@ -726,6 +784,9 @@ static int ci_get_platdata(struct device *dev,
 			cable->connected = false;
 	}
 
+	if (device_property_read_bool(dev, "usb-role-switch"))
+		ci_role_switch.fwnode = dev->fwnode;
+
 	platdata->pctl = devm_pinctrl_get(dev);
 	if (!IS_ERR(platdata->pctl)) {
 		struct pinctrl_state *p;
@@ -1051,6 +1112,15 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (ci_role_switch.fwnode) {
+		ci->role_switch = usb_role_switch_register(dev,
+					&ci_role_switch);
+		if (IS_ERR(ci->role_switch)) {
+			ret = PTR_ERR(ci->role_switch);
+			goto deinit_otg;
+		}
+	}
+
 	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
 		if (ci->is_otg) {
 			ci->role = ci_otg_role(ci);
@@ -1115,6 +1185,9 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 remove_debug:
 	dbg_remove_files(ci);
 stop:
+	if (ci->role_switch)
+		usb_role_switch_unregister(ci->role_switch);
+deinit_otg:
 	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
 		ci_hdrc_otg_destroy(ci);
 deinit_gadget:
@@ -1133,6 +1206,9 @@ static int ci_hdrc_remove(struct platform_device *pdev)
 {
 	struct ci_hdrc *ci = platform_get_drvdata(pdev);
 
+	if (ci->role_switch)
+		usb_role_switch_unregister(ci->role_switch);
+
 	if (ci->supports_runtime_pm) {
 		pm_runtime_get_sync(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index f25d482..fbfb02e 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -35,7 +35,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
 	 * detection overwrite OTGSC register value
 	 */
 	cable = &ci->platdata->vbus_extcon;
-	if (!IS_ERR(cable->edev)) {
+	if (!IS_ERR(cable->edev) || ci->role_switch) {
 		if (cable->changed)
 			val |= OTGSC_BSVIS;
 		else
@@ -53,7 +53,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
 	}
 
 	cable = &ci->platdata->id_extcon;
-	if (!IS_ERR(cable->edev)) {
+	if (!IS_ERR(cable->edev) || ci->role_switch) {
 		if (cable->changed)
 			val |= OTGSC_IDIS;
 		else
@@ -83,7 +83,7 @@ void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 data)
 	struct ci_hdrc_cable *cable;
 
 	cable = &ci->platdata->vbus_extcon;
-	if (!IS_ERR(cable->edev)) {
+	if (!IS_ERR(cable->edev) || ci->role_switch) {
 		if (data & mask & OTGSC_BSVIS)
 			cable->changed = false;
 
@@ -97,7 +97,7 @@ void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 data)
 	}
 
 	cable = &ci->platdata->id_extcon;
-	if (!IS_ERR(cable->edev)) {
+	if (!IS_ERR(cable->edev) || ci->role_switch) {
 		if (data & mask & OTGSC_IDIS)
 			cable->changed = false;
 
-- 
2.7.4

