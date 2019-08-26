Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3134F9CD5B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 12:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfHZKfN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 06:35:13 -0400
Received: from inva020.nxp.com ([92.121.34.13]:41248 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726916AbfHZKfN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 06:35:13 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 225C71A008F;
        Mon, 26 Aug 2019 12:35:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 08D561A01C6;
        Mon, 26 Aug 2019 12:35:07 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1F35A402EB;
        Mon, 26 Aug 2019 18:35:03 +0800 (SGT)
From:   jun.li@nxp.com
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH v4] usb: chipidea: add role switch class support
Date:   Mon, 26 Aug 2019 18:25:12 +0800
Message-Id: <20190826102512.14829-1-jun.li@nxp.com>
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
changes for v4:
- Add spinlock for role set().
- Select USB_ROLE_SWITCH to fix build break.
- Add runtime PM for role set. 
- Do flash_workqueue only in case both stop and start required
  for role set, means role change directly from device to host
  or vice versa.

Changes for v3:
- Remove the patch usb: chipidea: replace ci_role with usb_role
  as the existing ci->role usage can't map to usb_role.
- Use the suggested ci_hdrc_cable for reuse current role change
  handling.
- Fix build robot warning by add usb_role head file.

Change for v2:
- Support USB_ROLE_NONE, which for usb port not connecting any
  device or host, and will be in low power mode.

 drivers/usb/chipidea/Kconfig |  1 +
 drivers/usb/chipidea/ci.h    | 12 +++++++
 drivers/usb/chipidea/core.c  | 83 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/chipidea/otg.c   |  8 ++---
 4 files changed, 100 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index eb37ebf..ae850b3 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -6,6 +6,7 @@ config USB_CHIPIDEA
 	select EXTCON
 	select RESET_CONTROLLER
 	select USB_ULPI_BUS
+	select USB_ROLE_SWITCH
 	help
 	  Say Y here if your system has a dual role high speed USB
 	  controller based on ChipIdea silicon IP. It supports:
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
index 26062d6..bfc6a18 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -600,6 +600,71 @@ static int ci_cable_notifier(struct notifier_block *nb, unsigned long event,
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
+	unsigned long flags;
+
+	if (current_role == role)
+		return 0;
+
+	pm_runtime_get_sync(ci->dev);
+	/* Stop current role */
+	spin_lock_irqsave(&ci->lock, flags);
+	if (current_role == USB_ROLE_DEVICE)
+		cable = &ci->platdata->vbus_extcon;
+	else if (current_role == USB_ROLE_HOST)
+		cable = &ci->platdata->id_extcon;
+
+	if (cable) {
+		cable->changed = true;
+		cable->connected = false;
+		ci_irq(ci->irq, ci);
+		spin_unlock_irqrestore(&ci->lock, flags);
+		if (ci->wq && role != USB_ROLE_NONE)
+			flush_workqueue(ci->wq);
+		spin_lock_irqsave(&ci->lock, flags);
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
+		cable->changed = true;
+		cable->connected = true;
+		ci_irq(ci->irq, ci);
+	}
+	spin_unlock_irqrestore(&ci->lock, flags);
+	pm_runtime_put_sync(ci->dev);
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
@@ -726,6 +791,9 @@ static int ci_get_platdata(struct device *dev,
 			cable->connected = false;
 	}
 
+	if (device_property_read_bool(dev, "usb-role-switch"))
+		ci_role_switch.fwnode = dev->fwnode;
+
 	platdata->pctl = devm_pinctrl_get(dev);
 	if (!IS_ERR(platdata->pctl)) {
 		struct pinctrl_state *p;
@@ -1051,6 +1119,15 @@ static int ci_hdrc_probe(struct platform_device *pdev)
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
@@ -1115,6 +1192,9 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 remove_debug:
 	dbg_remove_files(ci);
 stop:
+	if (ci->role_switch)
+		usb_role_switch_unregister(ci->role_switch);
+deinit_otg:
 	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
 		ci_hdrc_otg_destroy(ci);
 deinit_gadget:
@@ -1133,6 +1213,9 @@ static int ci_hdrc_remove(struct platform_device *pdev)
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

