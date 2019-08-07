Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE6C18460A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 09:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387396AbfHGHdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 03:33:21 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55570 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727372AbfHGHdV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 03:33:21 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C8A9D1A0711;
        Wed,  7 Aug 2019 09:33:19 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 89B7C1A0228;
        Wed,  7 Aug 2019 09:33:16 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 77B0640310;
        Wed,  7 Aug 2019 15:33:12 +0800 (SGT)
From:   jun.li@nxp.com
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 2/2] usb: chipidea: add role switch class support
Date:   Wed,  7 Aug 2019 15:23:42 +0800
Message-Id: <20190807072342.9700-2-jun.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190807072342.9700-1-jun.li@nxp.com>
References: <20190807072342.9700-1-jun.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

USB role is fully controlled by usb role switch consumer(e.g. typec),
usb port can be at host mode(USB_ROLE_HOST), device mode connected to
host(USB_ROLE_DEVICE), or not connecting any parter(USB_ROLE_NONE).

Signed-off-by: Li Jun <jun.li@nxp.com>
---

Change for v2:
- Support USB_ROLE_NONE, which for usb port not connecting any
  device or host, and will be in low power mode.

 drivers/usb/chipidea/ci.h   |   3 ++
 drivers/usb/chipidea/core.c | 120 +++++++++++++++++++++++++++++++++-----------
 drivers/usb/chipidea/otg.c  |  20 ++++++++
 3 files changed, 114 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 82b86cd..f0aec1d 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -205,6 +205,7 @@ struct ci_hdrc {
 	int				irq;
 	struct ci_role_driver		*roles[USB_ROLE_DEVICE + 1];
 	enum usb_role			role;
+	enum usb_role			target_role;
 	bool				is_otg;
 	struct usb_otg			otg;
 	struct otg_fsm			fsm;
@@ -212,6 +213,7 @@ struct ci_hdrc {
 	ktime_t				hr_timeouts[NUM_OTG_FSM_TIMERS];
 	unsigned			enabled_otg_timer_bits;
 	enum otg_fsm_timer		next_otg_timer;
+	struct usb_role_switch		*role_switch;
 	struct work_struct		work;
 	struct workqueue_struct		*wq;
 
@@ -244,6 +246,7 @@ struct ci_hdrc {
 	struct dentry			*debugfs;
 	bool				id_event;
 	bool				b_sess_valid_event;
+	bool				role_switch_event;
 	bool				imx28_write_fix;
 	bool				supports_runtime_pm;
 	bool				in_lpm;
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index bc24c5b..965ce17 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -587,6 +587,42 @@ static irqreturn_t ci_irq(int irq, void *data)
 	return ret;
 }
 
+static int ci_usb_role_switch_set(struct device *dev, enum usb_role role)
+{
+	struct ci_hdrc *ci = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	if (ci->role == role)
+		return 0;
+
+	spin_lock_irqsave(&ci->lock, flags);
+	ci->role_switch_event = true;
+	ci->target_role = role;
+	spin_unlock_irqrestore(&ci->lock, flags);
+
+	ci_otg_queue_work(ci);
+
+	return 0;
+}
+
+static enum usb_role ci_usb_role_switch_get(struct device *dev)
+{
+	struct ci_hdrc *ci = dev_get_drvdata(dev);
+	unsigned long flags;
+	enum usb_role role;
+
+	spin_lock_irqsave(&ci->lock, flags);
+	role = ci->role;
+	spin_unlock_irqrestore(&ci->lock, flags);
+
+	return role;
+}
+
+static struct usb_role_switch_desc ci_role_switch = {
+	.set = ci_usb_role_switch_set,
+	.get = ci_usb_role_switch_get,
+};
+
 static int ci_cable_notifier(struct notifier_block *nb, unsigned long event,
 			     void *ptr)
 {
@@ -689,6 +725,9 @@ static int ci_get_platdata(struct device *dev,
 	if (of_find_property(dev->of_node, "non-zero-ttctrl-ttha", NULL))
 		platdata->flags |= CI_HDRC_SET_NON_ZERO_TTHA;
 
+	if (device_property_read_bool(dev, "usb-role-switch"))
+		ci_role_switch.fwnode = dev->fwnode;
+
 	ext_id = ERR_PTR(-ENODEV);
 	ext_vbus = ERR_PTR(-ENODEV);
 	if (of_property_read_bool(dev->of_node, "extcon")) {
@@ -908,6 +947,43 @@ static const struct attribute_group ci_attr_group = {
 	.attrs = ci_attrs,
 };
 
+static int ci_start_initial_role(struct ci_hdrc *ci)
+{
+	int ret = 0;
+
+	if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
+		if (ci->is_otg) {
+			ci->role = ci_otg_role(ci);
+			/* Enable ID change irq */
+			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
+		} else {
+			/*
+			 * If the controller is not OTG capable, but support
+			 * role switch, the defalt role is gadget, and the
+			 * user can switch it through debugfs.
+			 */
+			ci->role = USB_ROLE_DEVICE;
+		}
+	} else {
+		ci->role = ci->roles[USB_ROLE_HOST]
+			? USB_ROLE_HOST
+			: USB_ROLE_DEVICE;
+	}
+
+	if (!ci_otg_is_fsm_mode(ci)) {
+		/* only update vbus status for peripheral */
+		if (ci->role == USB_ROLE_DEVICE)
+			ci_handle_vbus_change(ci);
+
+		ret = ci_role_start(ci, ci->role);
+		if (ret)
+			dev_err(ci->dev, "can't start %s role\n",
+						ci_role(ci)->name);
+	}
+
+	return ret;
+}
+
 static int ci_hdrc_probe(struct platform_device *pdev)
 {
 	struct device	*dev = &pdev->dev;
@@ -1051,36 +1127,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
-		if (ci->is_otg) {
-			ci->role = ci_otg_role(ci);
-			/* Enable ID change irq */
-			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
-		} else {
-			/*
-			 * If the controller is not OTG capable, but support
-			 * role switch, the defalt role is gadget, and the
-			 * user can switch it through debugfs.
-			 */
-			ci->role = USB_ROLE_DEVICE;
-		}
-	} else {
-		ci->role = ci->roles[USB_ROLE_HOST]
-			? USB_ROLE_HOST
-			: USB_ROLE_DEVICE;
-	}
-
-	if (!ci_otg_is_fsm_mode(ci)) {
-		/* only update vbus status for peripheral */
-		if (ci->role == USB_ROLE_DEVICE)
-			ci_handle_vbus_change(ci);
-
-		ret = ci_role_start(ci, ci->role);
-		if (ret) {
-			dev_err(dev, "can't start %s role\n",
-						ci_role(ci)->name);
+	if (!ci_role_switch.fwnode) {
+		ret = ci_start_initial_role(ci);
+		if (ret)
 			goto stop;
-		}
 	}
 
 	ret = devm_request_irq(dev, ci->irq, ci_irq, IRQF_SHARED,
@@ -1092,6 +1142,15 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 	if (ret)
 		goto stop;
 
+	if (ci_role_switch.fwnode) {
+		ci->role_switch = usb_role_switch_register(dev,
+					&ci_role_switch);
+		if (IS_ERR(ci->role_switch)) {
+			ret = PTR_ERR(ci->role_switch);
+			goto stop;
+		}
+	}
+
 	if (ci->supports_runtime_pm) {
 		pm_runtime_set_active(&pdev->dev);
 		pm_runtime_enable(&pdev->dev);
@@ -1133,6 +1192,9 @@ static int ci_hdrc_remove(struct platform_device *pdev)
 {
 	struct ci_hdrc *ci = platform_get_drvdata(pdev);
 
+	if (ci->role_switch)
+		usb_role_switch_unregister(ci->role_switch);
+
 	if (ci->supports_runtime_pm) {
 		pm_runtime_get_sync(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 5bde0b5..03675b6 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -214,6 +214,26 @@ static void ci_otg_work(struct work_struct *work)
 		ci_handle_vbus_change(ci);
 	}
 
+	if (ci->role_switch_event) {
+		ci->role_switch_event = false;
+
+		/* Stop current role */
+		if (ci->role == USB_ROLE_DEVICE) {
+			usb_gadget_vbus_disconnect(&ci->gadget);
+			ci->role = USB_ROLE_NONE;
+		} else if (ci->role == USB_ROLE_HOST) {
+			ci_role_stop(ci);
+		}
+
+		/* Start target role */
+		if (ci->target_role == USB_ROLE_DEVICE) {
+			usb_gadget_vbus_connect(&ci->gadget);
+			ci->role = USB_ROLE_DEVICE;
+		} else if (ci->target_role == USB_ROLE_HOST) {
+			ci_role_start(ci, USB_ROLE_HOST);
+		}
+	}
+
 	pm_runtime_put_sync(ci->dev);
 
 	enable_irq(ci->irq);
-- 
2.7.4

