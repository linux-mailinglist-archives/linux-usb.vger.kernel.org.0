Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24491BA06B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 11:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgD0Ju6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 05:50:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbgD0Ju6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 05:50:58 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2F8220663;
        Mon, 27 Apr 2020 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587981057;
        bh=cbonv1gsYD8NJAIAIYbRXL+tSke9pTH0C+CVM5DdVdk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EYf3ZGsWCz5YBGgysmNKdhrji7zEkZO+kBGKtD2kE9JoGkniU44UBIgcVXZqDKwgO
         sKb8Qc4KF5RkSR111eseWgmfJBisIwPJSis1biOre1FHFSWGHu2qBUEGLVXililXUI
         z6P50viTniUXgfs8TXLd0C/UtUBuFnmQERZ0cSio=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/4] usb: chipidea: usbmisc_imx: using different ops for imx7d and imx7ulp
Date:   Mon, 27 Apr 2020 17:50:39 +0800
Message-Id: <20200427095039.3833-4-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427095039.3833-1-peter.chen@kernel.org>
References: <20200427095039.3833-1-peter.chen@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

imx7ulp uses different USB PHY with imx7d (MXS PHY vs PICO PHY), so the
features are supported by non-core register are a little different.
For example, autoresume feature is supported by all controllers for
imx7ulp, but for imx7d, it is only supported by non-HSIC controller.

Besides, these two platforms use different HSIC controller, imx7ulp
needs software operation, but imx7d doesn't.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 89 ++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 8d7e78657e3d..f136876cb4a3 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -100,6 +100,7 @@
 #define MX7D_USB_VBUS_WAKEUP_SOURCE_AVALID	MX7D_USB_VBUS_WAKEUP_SOURCE(1)
 #define MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID	MX7D_USB_VBUS_WAKEUP_SOURCE(2)
 #define MX7D_USB_VBUS_WAKEUP_SOURCE_SESS_END	MX7D_USB_VBUS_WAKEUP_SOURCE(3)
+#define MX7D_USBNC_AUTO_RESUME				BIT(2)
 /* The default DM/DP value is pull-down */
 #define MX7D_USBNC_USB_CTRL2_OPMODE(v)			(v << 6)
 #define MX7D_USBNC_USB_CTRL2_OPMODE_NON_DRIVING	MX7D_USBNC_USB_CTRL2_OPMODE(1)
@@ -638,10 +639,17 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 		reg |= MX6_BM_PWR_POLARITY;
 	writel(reg, usbmisc->base);
 
-	reg = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
-	reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE_MASK;
-	writel(reg | MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID,
-		 usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	/* SoC non-burst setting */
+	reg = readl(usbmisc->base);
+	writel(reg | MX6_BM_NON_BURST_SETTING, usbmisc->base);
+
+	if (!data->hsic) {
+		reg = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+		reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE_MASK;
+		writel(reg | MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID
+			| MX7D_USBNC_AUTO_RESUME,
+			usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	}
 
 	spin_unlock_irqrestore(&usbmisc->lock, flags);
 
@@ -832,6 +840,70 @@ static int imx7d_charger_detection(struct imx_usbmisc_data *data)
 	return ret;
 }
 
+static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	if (data->index >= 1)
+		return -EINVAL;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	reg = readl(usbmisc->base);
+	if (data->disable_oc) {
+		reg |= MX6_BM_OVER_CUR_DIS;
+	} else {
+		reg &= ~MX6_BM_OVER_CUR_DIS;
+
+		/*
+		 * If the polarity is not configured keep it as setup by the
+		 * bootloader.
+		 */
+		if (data->oc_pol_configured && data->oc_pol_active_low)
+			reg |= MX6_BM_OVER_CUR_POLARITY;
+		else if (data->oc_pol_configured)
+			reg &= ~MX6_BM_OVER_CUR_POLARITY;
+	}
+	/* If the polarity is not set keep it as setup by the bootlader */
+	if (data->pwr_pol == 1)
+		reg |= MX6_BM_PWR_POLARITY;
+
+	writel(reg, usbmisc->base);
+
+	/* SoC non-burst setting */
+	reg = readl(usbmisc->base);
+	writel(reg | MX6_BM_NON_BURST_SETTING, usbmisc->base);
+
+	if (data->hsic) {
+		reg = readl(usbmisc->base);
+		writel(reg | MX6_BM_UTMI_ON_CLOCK, usbmisc->base);
+
+		reg = readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET);
+		reg |= MX6_BM_HSIC_EN | MX6_BM_HSIC_CLK_ON;
+		writel(reg, usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET);
+
+		/*
+		 * For non-HSIC controller, the autoresume is enabled
+		 * at MXS PHY driver (usbphy_ctrl bit18).
+		 */
+		reg = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+		writel(reg | MX7D_USBNC_AUTO_RESUME,
+			usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	} else {
+		reg = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+		reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE_MASK;
+		writel(reg | MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID,
+			 usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	}
+
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	usbmisc_imx7d_set_wakeup(data, false);
+
+	return 0;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -873,6 +945,13 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
 	.charger_detection = imx7d_charger_detection,
 };
 
+static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
+	.init = usbmisc_imx7ulp_init,
+	.set_wakeup = usbmisc_imx7d_set_wakeup,
+	.hsic_set_connect = usbmisc_imx6_hsic_set_connect,
+	.hsic_set_clk = usbmisc_imx6_hsic_set_clk,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1025,7 +1104,7 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 	},
 	{
 		.compatible = "fsl,imx7ulp-usbmisc",
-		.data = &imx7d_usbmisc_ops,
+		.data = &imx7ulp_usbmisc_ops,
 	},
 	{ /* sentinel */ }
 };
-- 
2.17.1

