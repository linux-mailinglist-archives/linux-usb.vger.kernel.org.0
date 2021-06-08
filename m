Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762C139F03B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 09:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhFHIAT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 04:00:19 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53643 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231277AbhFHIAN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 04:00:13 -0400
X-UUID: 9fecf6fb0c9044bc9bcd4f6e07960963-20210608
X-UUID: 9fecf6fb0c9044bc9bcd4f6e07960963-20210608
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1972132383; Tue, 08 Jun 2021 15:58:17 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:14 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 21/23] usb: mtu3: support suspend/resume for device mode
Date:   Tue, 8 Jun 2021 15:57:47 +0800
Message-ID: <1623139069-8173-22-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support suspend/resume for device mode if the device is not
connected with a host, otherwise reject to suspend.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h        |  1 +
 drivers/usb/mtu3/mtu3_core.c   | 68 +++++++++++++++++++++++++++++++++-
 drivers/usb/mtu3/mtu3_dr.h     | 14 +++++++
 drivers/usb/mtu3/mtu3_gadget.c |  5 +++
 drivers/usb/mtu3/mtu3_plat.c   | 47 +++++++++++++++++------
 5 files changed, 121 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 1f479a867ed1..ad063fec7f17 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -360,6 +360,7 @@ struct mtu3 {
 	unsigned is_u3_ip:1;
 	unsigned delayed_status:1;
 	unsigned gen2cp:1;
+	unsigned connected:1;
 
 	u8 address;
 	u8 test_mode_nr;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 648e970d77ba..a800920d38b9 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -380,6 +381,24 @@ void mtu3_stop(struct mtu3 *mtu)
 	mtu3_dev_power_down(mtu);
 }
 
+static void mtu3_dev_suspend(struct mtu3 *mtu)
+{
+	if (!mtu->is_active)
+		return;
+
+	mtu3_intr_disable(mtu);
+	mtu3_dev_power_down(mtu);
+}
+
+static void mtu3_dev_resume(struct mtu3 *mtu)
+{
+	if (!mtu->is_active)
+		return;
+
+	mtu3_dev_power_on(mtu);
+	mtu3_intr_enable(mtu);
+}
+
 /* for non-ep0 */
 int mtu3_config_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
 			int interval, int burst, int mult)
@@ -700,11 +719,15 @@ static irqreturn_t mtu3_link_isr(struct mtu3 *mtu)
 	mtu->g.speed = udev_speed;
 	mtu->g.ep0->maxpacket = maxpkt;
 	mtu->ep0_state = MU3D_EP0_STATE_SETUP;
+	mtu->connected = !!(udev_speed != USB_SPEED_UNKNOWN);
 
-	if (udev_speed == USB_SPEED_UNKNOWN)
+	if (udev_speed == USB_SPEED_UNKNOWN) {
 		mtu3_gadget_disconnect(mtu);
-	else
+		pm_runtime_put(mtu->dev);
+	} else {
+		pm_runtime_get(mtu->dev);
 		mtu3_ep0_setup(mtu);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -984,3 +1007,44 @@ void ssusb_gadget_exit(struct ssusb_mtk *ssusb)
 	device_init_wakeup(ssusb->dev, false);
 	mtu3_hw_exit(mtu);
 }
+
+int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	struct mtu3 *mtu = ssusb->u3d;
+	void __iomem *ibase = mtu->ippc_base;
+	u32 value;
+	int ret = 0;
+
+	if (!mtu->gadget_driver)
+		return 0;
+
+	if (mtu->connected)
+		return -EBUSY;
+
+	mtu3_dev_suspend(mtu);
+	synchronize_irq(mtu->irq);
+
+	/* wait for ip to sleep */
+	if (mtu->is_active && mtu->softconnect) {
+		ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1,
+				value, (value & SSUSB_IP_SLEEP_STS), 100, 100000);
+		if (ret) {
+			dev_err(mtu->dev, "ip sleep failed!!!\n");
+			ret = -EBUSY;
+		}
+	}
+
+	return ret;
+}
+
+int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	struct mtu3 *mtu = ssusb->u3d;
+
+	if (!mtu->gadget_driver)
+		return 0;
+
+	mtu3_dev_resume(mtu);
+
+	return 0;
+}
diff --git a/drivers/usb/mtu3/mtu3_dr.h b/drivers/usb/mtu3/mtu3_dr.h
index 70dbf4706138..5286f9f5ee18 100644
--- a/drivers/usb/mtu3/mtu3_dr.h
+++ b/drivers/usb/mtu3/mtu3_dr.h
@@ -57,6 +57,8 @@ static inline void ssusb_wakeup_set(struct ssusb_mtk *ssusb, bool enable)
 #if IS_ENABLED(CONFIG_USB_MTU3_GADGET) || IS_ENABLED(CONFIG_USB_MTU3_DUAL_ROLE)
 int ssusb_gadget_init(struct ssusb_mtk *ssusb);
 void ssusb_gadget_exit(struct ssusb_mtk *ssusb);
+int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg);
+int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg);
 #else
 static inline int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 {
@@ -65,6 +67,18 @@ static inline int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 
 static inline void ssusb_gadget_exit(struct ssusb_mtk *ssusb)
 {}
+
+static inline int
+ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	return 0;
+}
+
+static inline int
+ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	return 0;
+}
 #endif
 
 
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 5e21ba05ebf0..7b54631ca335 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -469,6 +469,8 @@ static int mtu3_gadget_pullup(struct usb_gadget *gadget, int is_on)
 	dev_dbg(mtu->dev, "%s (%s) for %sactive device\n", __func__,
 		is_on ? "on" : "off", mtu->is_active ? "" : "in");
 
+	pm_runtime_get_sync(mtu->dev);
+
 	/* we'd rather not pullup unless the device is active. */
 	spin_lock_irqsave(&mtu->lock, flags);
 
@@ -482,6 +484,7 @@ static int mtu3_gadget_pullup(struct usb_gadget *gadget, int is_on)
 	}
 
 	spin_unlock_irqrestore(&mtu->lock, flags);
+	pm_runtime_put(mtu->dev);
 
 	return 0;
 }
@@ -499,6 +502,7 @@ static int mtu3_gadget_start(struct usb_gadget *gadget,
 	}
 
 	dev_dbg(mtu->dev, "bind driver %s\n", driver->function);
+	pm_runtime_get_sync(mtu->dev);
 
 	spin_lock_irqsave(&mtu->lock, flags);
 
@@ -509,6 +513,7 @@ static int mtu3_gadget_start(struct usb_gadget *gadget,
 		mtu3_start(mtu);
 
 	spin_unlock_irqrestore(&mtu->lock, flags);
+	pm_runtime_put(mtu->dev);
 
 	return 0;
 }
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 9f8f2759b08e..4c50b3663b66 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -479,21 +479,32 @@ static int mtu3_remove(struct platform_device *pdev)
 	return 0;
 }
 
-/*
- * when support dual-role mode, we reject suspend when
- * it works as device mode;
- */
 static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 {
 	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
+	int ret = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	/* REVISIT: disconnect it for only device mode? */
-	if (!ssusb->is_host)
-		return 0;
+	switch (ssusb->dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ret = ssusb_gadget_suspend(ssusb, msg);
+		if (ret)
+			return ret;
 
-	ssusb_host_suspend(ssusb);
+		break;
+	case USB_DR_MODE_HOST:
+		ssusb_host_suspend(ssusb);
+		break;
+	case USB_DR_MODE_OTG:
+		if (!ssusb->is_host)
+			return 0;
+
+		ssusb_host_suspend(ssusb);
+		break;
+	default:
+		return -EINVAL;
+	}
 	ssusb_phy_power_off(ssusb);
 	ssusb_clks_disable(ssusb);
 	ssusb_wakeup_set(ssusb, true);
@@ -508,9 +519,6 @@ static int mtu3_resume_common(struct device *dev, pm_message_t msg)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	if (!ssusb->is_host)
-		return 0;
-
 	ssusb_wakeup_set(ssusb, false);
 	ret = ssusb_clks_enable(ssusb);
 	if (ret)
@@ -520,7 +528,22 @@ static int mtu3_resume_common(struct device *dev, pm_message_t msg)
 	if (ret)
 		goto phy_err;
 
-	ssusb_host_resume(ssusb, false);
+	switch (ssusb->dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ssusb_gadget_resume(ssusb, msg);
+		break;
+	case USB_DR_MODE_HOST:
+		ssusb_host_resume(ssusb, false);
+		break;
+	case USB_DR_MODE_OTG:
+		if (!ssusb->is_host)
+			return 0;
+
+		ssusb_host_resume(ssusb, true);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 
-- 
2.18.0

