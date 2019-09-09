Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB2C1AD33F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2019 08:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730929AbfIIGvz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 02:51:55 -0400
Received: from inva020.nxp.com ([92.121.34.13]:50964 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727342AbfIIGvz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Sep 2019 02:51:55 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B1F641A0266;
        Mon,  9 Sep 2019 08:51:52 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DECF81A01E1;
        Mon,  9 Sep 2019 08:51:49 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4F711402BF;
        Mon,  9 Sep 2019 14:51:46 +0800 (SGT)
From:   jun.li@nxp.com
To:     peter.chen@nxp.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: chipidea: imx: enable vbus and id wakeup only for OTG events
Date:   Mon,  9 Sep 2019 14:41:41 +0800
Message-Id: <20190909064141.15643-1-jun.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

If ID or VBUS is from external block, don't enable its wakeup
because it isn't used at all.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  8 ++++++++
 drivers/usb/chipidea/ci_hdrc_imx.h |  2 ++
 drivers/usb/chipidea/usbmisc_imx.c | 31 +++++++++++++++++++++++--------
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index e783604..b11d70f 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -433,6 +433,14 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	if (!IS_ERR(pdata.id_extcon.edev) ||
+	    of_property_read_bool(np, "usb-role-switch"))
+		data->usbmisc_data->ext_id = 1;
+
+	if (!IS_ERR(pdata.vbus_extcon.edev) ||
+	    of_property_read_bool(np, "usb-role-switch"))
+		data->usbmisc_data->ext_vbus = 1;
+
 	ret = imx_usbmisc_init_post(data->usbmisc_data);
 	if (ret) {
 		dev_err(dev, "usbmisc post failed, ret=%d\n", ret);
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index c842e03..de2aac9 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -22,6 +22,8 @@ struct imx_usbmisc_data {
 	unsigned int evdo:1; /* set external vbus divider option */
 	unsigned int ulpi:1; /* connected to an ULPI phy */
 	unsigned int hsic:1; /* HSIC controlller */
+	unsigned int ext_id:1; /* ID from exteranl event */
+	unsigned int ext_vbus:1; /* Vbus from exteranl event */
 };
 
 int imx_usbmisc_init(struct imx_usbmisc_data *data);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 078c1fd..e81e33c 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -100,6 +100,9 @@
 #define MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID	MX7D_USB_VBUS_WAKEUP_SOURCE(2)
 #define MX7D_USB_VBUS_WAKEUP_SOURCE_SESS_END	MX7D_USB_VBUS_WAKEUP_SOURCE(3)
 
+#define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
+				 MX6_BM_ID_WAKEUP)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -330,14 +333,25 @@ static int usbmisc_imx53_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static u32 usbmisc_wakeup_setting(struct imx_usbmisc_data *data)
+{
+	u32 wakeup_setting = MX6_USB_OTG_WAKEUP_BITS;
+
+	if (data->ext_id)
+		wakeup_setting &= ~MX6_BM_ID_WAKEUP;
+
+	if (data->ext_vbus)
+		wakeup_setting &= ~MX6_BM_VBUS_WAKEUP;
+
+	return wakeup_setting;
+}
+
 static int usbmisc_imx6q_set_wakeup
 	(struct imx_usbmisc_data *data, bool enabled)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
 	unsigned long flags;
 	u32 val;
-	u32 wakeup_setting = (MX6_BM_WAKEUP_ENABLE |
-		MX6_BM_VBUS_WAKEUP | MX6_BM_ID_WAKEUP);
 	int ret = 0;
 
 	if (data->index > 3)
@@ -346,11 +360,12 @@ static int usbmisc_imx6q_set_wakeup
 	spin_lock_irqsave(&usbmisc->lock, flags);
 	val = readl(usbmisc->base + data->index * 4);
 	if (enabled) {
-		val |= wakeup_setting;
+		val &= ~MX6_USB_OTG_WAKEUP_BITS;
+		val |= usbmisc_wakeup_setting(data);
 	} else {
 		if (val & MX6_BM_WAKEUP_INTR)
 			pr_debug("wakeup int at ci_hdrc.%d\n", data->index);
-		val &= ~wakeup_setting;
+		val &= ~MX6_USB_OTG_WAKEUP_BITS;
 	}
 	writel(val, usbmisc->base + data->index * 4);
 	spin_unlock_irqrestore(&usbmisc->lock, flags);
@@ -547,17 +562,17 @@ static int usbmisc_imx7d_set_wakeup
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
 	unsigned long flags;
 	u32 val;
-	u32 wakeup_setting = (MX6_BM_WAKEUP_ENABLE |
-		MX6_BM_VBUS_WAKEUP | MX6_BM_ID_WAKEUP);
 
 	spin_lock_irqsave(&usbmisc->lock, flags);
 	val = readl(usbmisc->base);
 	if (enabled) {
-		writel(val | wakeup_setting, usbmisc->base);
+		val &= ~MX6_USB_OTG_WAKEUP_BITS;
+		val |= usbmisc_wakeup_setting(data);
+		writel(val, usbmisc->base);
 	} else {
 		if (val & MX6_BM_WAKEUP_INTR)
 			dev_dbg(data->dev, "wakeup int\n");
-		writel(val & ~wakeup_setting, usbmisc->base);
+		writel(val & ~MX6_USB_OTG_WAKEUP_BITS, usbmisc->base);
 	}
 	spin_unlock_irqrestore(&usbmisc->lock, flags);
 
-- 
2.7.4

