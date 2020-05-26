Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6181BA06A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 11:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgD0Ju5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 05:50:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbgD0Ju4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 05:50:56 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D350F206B8;
        Mon, 27 Apr 2020 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587981054;
        bh=7jMbIp6ldAcq2LwtGoY9LN591hek4ERPbJ0D9H3xuc8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RikueDAiyvGIPXZH45p5AnNlyQkmkB3x2ZqazjhhIzXgniT7zB+4+mU1+z+SVXRpr
         wTfjvqUPkR7zGC9OaEHqjXms3UVe2eVUXOwtc8cxFw3+VXZ+L52LFYslzd/LaH4S7Y
         4RwsidhQOhFOo9yXMtJVOsCZfO5ggrN2G5LaPgFk=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, Jun Li <jun.li@nxp.com>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/4] usb: chipidea: introduce imx7d USB charger detection
Date:   Mon, 27 Apr 2020 17:50:37 +0800
Message-Id: <20200427095039.3833-2-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427095039.3833-1-peter.chen@kernel.org>
References: <20200427095039.3833-1-peter.chen@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jun Li <jun.li@nxp.com>

imx7d (and imx8mm, imx8mn) uses Samsung PHY and USB generic PHY driver.
The USB generic PHY driver is impossible to have a charger detection
for every user, so we implement USB charger detection routine at glue
layer. After the detection has finished, it will notify USB PHY
charger framework, and the uevents will be triggered.

Signed-off-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  13 +-
 drivers/usb/chipidea/ci_hdrc_imx.h |   2 +
 drivers/usb/chipidea/usbmisc_imx.c | 245 +++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index d8e7eb2f97b9..fb4097f02391 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -271,6 +271,7 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 	struct device *dev = ci->dev->parent;
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret = 0;
+	struct imx_usbmisc_data *mdata = data->usbmisc_data;
 
 	switch (event) {
 	case CI_HDRC_IMX_HSIC_ACTIVE_EVENT:
@@ -284,11 +285,19 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 		}
 		break;
 	case CI_HDRC_IMX_HSIC_SUSPEND_EVENT:
-		ret = imx_usbmisc_hsic_set_connect(data->usbmisc_data);
+		ret = imx_usbmisc_hsic_set_connect(mdata);
 		if (ret)
 			dev_err(dev,
 				"hsic_set_connect failed, err=%d\n", ret);
 		break;
+	case CI_HDRC_CONTROLLER_VBUS_EVENT:
+		if (ci->vbus_active)
+			ret = imx_usbmisc_charger_detection(mdata, true);
+		else
+			ret = imx_usbmisc_charger_detection(mdata, false);
+		if (ci->usb_phy)
+			schedule_work(&ci->usb_phy->chg_work);
+		break;
 	default:
 		break;
 	}
@@ -415,6 +424,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	}
 
 	pdata.usb_phy = data->phy;
+	if (data->usbmisc_data)
+		data->usbmisc_data->usb_phy = data->phy;
 
 	if ((of_device_is_compatible(np, "fsl,imx53-usb") ||
 	     of_device_is_compatible(np, "fsl,imx51-usb")) && pdata.usb_phy &&
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index c2051aeba13f..727d02b6dbd3 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -24,6 +24,7 @@ struct imx_usbmisc_data {
 	unsigned int hsic:1; /* HSIC controlller */
 	unsigned int ext_id:1; /* ID from exteranl event */
 	unsigned int ext_vbus:1; /* Vbus from exteranl event */
+	struct usb_phy *usb_phy;
 };
 
 int imx_usbmisc_init(struct imx_usbmisc_data *data);
@@ -31,5 +32,6 @@ int imx_usbmisc_init_post(struct imx_usbmisc_data *data);
 int imx_usbmisc_set_wakeup(struct imx_usbmisc_data *data, bool enabled);
 int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data);
 int imx_usbmisc_hsic_set_clk(struct imx_usbmisc_data *data, bool on);
+int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect);
 
 #endif /* __DRIVER_USB_CHIPIDEA_CI_HDRC_IMX_H */
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index e81e33c26e6c..8d7e78657e3d 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/usb/otg.h>
 
 #include "ci_hdrc_imx.h"
 
@@ -99,6 +100,32 @@
 #define MX7D_USB_VBUS_WAKEUP_SOURCE_AVALID	MX7D_USB_VBUS_WAKEUP_SOURCE(1)
 #define MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID	MX7D_USB_VBUS_WAKEUP_SOURCE(2)
 #define MX7D_USB_VBUS_WAKEUP_SOURCE_SESS_END	MX7D_USB_VBUS_WAKEUP_SOURCE(3)
+/* The default DM/DP value is pull-down */
+#define MX7D_USBNC_USB_CTRL2_OPMODE(v)			(v << 6)
+#define MX7D_USBNC_USB_CTRL2_OPMODE_NON_DRIVING	MX7D_USBNC_USB_CTRL2_OPMODE(1)
+#define MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK	(BIT(7) | BIT(6))
+#define MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN		BIT(8)
+#define MX7D_USBNC_USB_CTRL2_DP_OVERRIDE_VAL		BIT(12)
+#define MX7D_USBNC_USB_CTRL2_DP_OVERRIDE_EN		BIT(13)
+#define MX7D_USBNC_USB_CTRL2_DM_OVERRIDE_VAL		BIT(14)
+#define MX7D_USBNC_USB_CTRL2_DM_OVERRIDE_EN		BIT(15)
+#define MX7D_USBNC_USB_CTRL2_DP_DM_MASK			(BIT(12) | BIT(13) | \
+							BIT(14) | BIT(15))
+
+#define MX7D_USB_OTG_PHY_CFG1		0x30
+#define MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL	BIT(0)
+#define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0	BIT(1)
+#define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0	BIT(2)
+#define MX7D_USB_OTG_PHY_CFG2_CHRG_DCDENB	BIT(3)
+#define MX7D_USB_OTG_PHY_CFG2_DRVVBUS0		BIT(16)
+
+#define MX7D_USB_OTG_PHY_CFG2		0x34
+
+#define MX7D_USB_OTG_PHY_STATUS		0x3c
+#define MX7D_USB_OTG_PHY_STATUS_LINE_STATE0	BIT(0)
+#define MX7D_USB_OTG_PHY_STATUS_LINE_STATE1	BIT(1)
+#define MX7D_USB_OTG_PHY_STATUS_VBUS_VLD	BIT(3)
+#define MX7D_USB_OTG_PHY_STATUS_CHRGDET		BIT(29)
 
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP)
@@ -114,6 +141,8 @@ struct usbmisc_ops {
 	int (*hsic_set_connect)(struct imx_usbmisc_data *data);
 	/* It's called during suspend/resume */
 	int (*hsic_set_clk)(struct imx_usbmisc_data *data, bool enabled);
+	/* usb charger detection */
+	int (*charger_detection)(struct imx_usbmisc_data *data);
 };
 
 struct imx_usbmisc {
@@ -621,6 +650,188 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static int imx7d_charger_secondary_detection(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	struct usb_phy *usb_phy = data->usb_phy;
+	int val;
+	unsigned long flags;
+
+	/* VDM_SRC is connected to D- and IDP_SINK is connected to D+ */
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	writel(val | MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0 |
+			MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0 |
+			MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL,
+				usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	usleep_range(1000, 2000);
+
+	/*
+	 * Per BC 1.2, check voltage of D+:
+	 * DCP: if greater than VDAT_REF;
+	 * CDP: if less than VDAT_REF.
+	 */
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_STATUS);
+	if (val & MX7D_USB_OTG_PHY_STATUS_CHRGDET) {
+		dev_dbg(data->dev, "It is a dedicate charging port\n");
+		usb_phy->chg_type = DCP_TYPE;
+	} else {
+		dev_dbg(data->dev, "It is a charging downstream port\n");
+		usb_phy->chg_type = CDP_TYPE;
+	}
+
+	return 0;
+}
+
+static void imx7_disable_charger_detector(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	val &= ~(MX7D_USB_OTG_PHY_CFG2_CHRG_DCDENB |
+			MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0 |
+			MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0 |
+			MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL);
+	writel(val, usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+
+	/* Set OPMODE to be 2'b00 and disable its override */
+	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
+	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
+
+	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	writel(val & ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN,
+			usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+}
+
+static int imx7d_charger_data_contact_detect(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+	int i, data_pin_contact_count = 0;
+
+	/* Enable Data Contact Detect (DCD) per the USB BC 1.2 */
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	writel(val | MX7D_USB_OTG_PHY_CFG2_CHRG_DCDENB,
+			usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	for (i = 0; i < 100; i = i + 1) {
+		val = readl(usbmisc->base + MX7D_USB_OTG_PHY_STATUS);
+		if (!(val & MX7D_USB_OTG_PHY_STATUS_LINE_STATE0)) {
+			if (data_pin_contact_count++ > 5)
+				/* Data pin makes contact */
+				break;
+			usleep_range(5000, 10000);
+		} else {
+			data_pin_contact_count = 0;
+			usleep_range(5000, 6000);
+		}
+	}
+
+	/* Disable DCD after finished data contact check */
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	writel(val & ~MX7D_USB_OTG_PHY_CFG2_CHRG_DCDENB,
+			usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	if (i == 100) {
+		dev_err(data->dev,
+			"VBUS is coming from a dedicated power supply.\n");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static int imx7d_charger_primary_detection(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	struct usb_phy *usb_phy = data->usb_phy;
+	unsigned long flags;
+	u32 val;
+
+	/* VDP_SRC is connected to D+ and IDM_SINK is connected to D- */
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	val &= ~MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL;
+	writel(val | MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0 |
+			MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0,
+				usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	usleep_range(1000, 2000);
+
+	/* Check if D- is less than VDAT_REF to determine an SDP per BC 1.2 */
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_STATUS);
+	if (!(val & MX7D_USB_OTG_PHY_STATUS_CHRGDET)) {
+		dev_dbg(data->dev, "It is a standard downstream port\n");
+		usb_phy->chg_type = SDP_TYPE;
+	}
+
+	return 0;
+}
+
+/**
+ * Whole charger detection process:
+ * 1. OPMODE override to be non-driving
+ * 2. Data contact check
+ * 3. Primary detection
+ * 4. Secondary detection
+ * 5. Disable charger detection
+ */
+static int imx7d_charger_detection(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	struct usb_phy *usb_phy = data->usb_phy;
+	unsigned long flags;
+	u32 val;
+	int ret;
+
+	/* Check if vbus is valid */
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_STATUS);
+	if (!(val & MX7D_USB_OTG_PHY_STATUS_VBUS_VLD)) {
+		dev_err(data->dev, "vbus is error\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Keep OPMODE to be non-driving mode during the whole
+	 * charger detection process.
+	 */
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
+	val |= MX7D_USBNC_USB_CTRL2_OPMODE_NON_DRIVING;
+	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
+
+	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	writel(val | MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN,
+			usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	ret = imx7d_charger_data_contact_detect(data);
+	if (ret)
+		return ret;
+
+	ret = imx7d_charger_primary_detection(data);
+	if (!ret && usb_phy->chg_type != SDP_TYPE)
+		ret = imx7d_charger_secondary_detection(data);
+
+	imx7_disable_charger_detector(data);
+
+	return ret;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -659,6 +870,7 @@ static const struct usbmisc_ops imx6sx_usbmisc_ops = {
 static const struct usbmisc_ops imx7d_usbmisc_ops = {
 	.init = usbmisc_imx7d_init,
 	.set_wakeup = usbmisc_imx7d_set_wakeup,
+	.charger_detection = imx7d_charger_detection,
 };
 
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
@@ -737,6 +949,39 @@ int imx_usbmisc_hsic_set_clk(struct imx_usbmisc_data *data, bool on)
 	return usbmisc->ops->hsic_set_clk(data, on);
 }
 EXPORT_SYMBOL_GPL(imx_usbmisc_hsic_set_clk);
+
+int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect)
+{
+	struct imx_usbmisc *usbmisc;
+	struct usb_phy *usb_phy;
+	int ret = 0;
+
+	if (!data)
+		return -EINVAL;
+
+	usbmisc = dev_get_drvdata(data->dev);
+	usb_phy = data->usb_phy;
+	if (!usbmisc->ops->charger_detection)
+		return -ENOTSUPP;
+
+	if (connect) {
+		ret = usbmisc->ops->charger_detection(data);
+		if (ret) {
+			dev_err(data->dev,
+					"Error occurs during detection: %d\n",
+					ret);
+			usb_phy->chg_state = USB_CHARGER_ABSENT;
+		} else {
+			usb_phy->chg_state = USB_CHARGER_PRESENT;
+		}
+	} else {
+		usb_phy->chg_state = USB_CHARGER_ABSENT;
+		usb_phy->chg_type = UNKNOWN_TYPE;
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(imx_usbmisc_charger_detection);
+
 static const struct of_device_id usbmisc_imx_dt_ids[] = {
 	{
 		.compatible = "fsl,imx25-usbmisc",
-- 
2.17.1

