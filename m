Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39C97B399C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 13:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732311AbfIPLl7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 07:41:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48758 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfIPLl7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 07:41:59 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 58D3B6133A; Mon, 16 Sep 2019 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634118;
        bh=i3TvR9VBOENHp0uYAk8SA6fq9iHDYlbwKazrvJk3C/o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KccLNkMdQzNGocQDSlvqkbCJeSDY5HecGEbY1OhV6Dw1I2lRgaCgfx88BH//QpSc2
         kLrxDwOBQyG89rT72zrDQjWXjE1lphhpASdLd1JgfKDjJiRkoKIhVtUx/iaR72xZBN
         RKf93WN5kO8nUcLSGVKllJaF3OGh6ONmMxQfluDM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 583AF611BE;
        Mon, 16 Sep 2019 11:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634117;
        bh=i3TvR9VBOENHp0uYAk8SA6fq9iHDYlbwKazrvJk3C/o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bls6HF9PTpsL2mYyHucA7HbDxjuvoDGAstKyULbnrr8Wl9+dKwRQxoWexEobFtqrD
         6nhLSG6H4HLNrdPcWy0FgakIEW13LBzHKQ7wBgdwCfngOTGjr4Ap4La15ChLH02yQk
         y73efkdWHl4ksYvnHmjTTVf4fa9VqddKG8QMqmAI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 583AF611BE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH V2 2/3] usb: dwc3: qcom: Add interconnect support in dwc3 driver
Date:   Mon, 16 Sep 2019 17:11:00 +0530
Message-Id: <1568634061-14455-3-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
References: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add interconnect support in dwc3-qcom driver to vote for bus
bandwidth.

This requires for two different paths - from USB master to
DDR slave. The other is from APPS master to USB slave.

Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 145 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 184df4d..4f6c9736 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -14,6 +14,7 @@
 #include <linux/extcon.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/interconnect.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
@@ -59,8 +60,13 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	struct icc_path		*usb_ddr_icc_path;
+	struct icc_path		*apps_usb_icc_path;
 };
 
+static int usb_interconnect_enable(struct dwc3_qcom *qcom);
+static int usb_interconnect_disable(struct dwc3_qcom *qcom);
+
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -222,7 +228,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 {
 	u32 val;
-	int i;
+	int i, ret;
 
 	if (qcom->is_suspended)
 		return 0;
@@ -234,6 +240,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 	for (i = qcom->num_clocks - 1; i >= 0; i--)
 		clk_disable_unprepare(qcom->clks[i]);
 
+	/* Remove bus voting */
+	ret = usb_interconnect_disable(qcom);
+	if (ret)
+		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
+
 	qcom->is_suspended = true;
 	dwc3_qcom_enable_interrupts(qcom);
 
@@ -259,6 +270,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 		}
 	}
 
+	/* Add bus voting */
+	ret = usb_interconnect_enable(qcom);
+	if (ret)
+		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
+
 	/* Clear existing events from PHY related to L2 in/out */
 	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
 			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
@@ -268,6 +284,117 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 	return 0;
 }
 
+/* Interconnect path bandwidths in MBps */
+#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
+#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
+#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
+#define APPS_USB_AVG_BW 0
+#define APPS_USB_PEAK_BW MBps_to_icc(40)
+
+/**
+ * usb_interconnect_init() - Request to get interconnect path handle
+ * @qcom:			Pointer to the concerned usb core.
+ *
+ */
+static int usb_interconnect_init(struct dwc3_qcom *qcom)
+{
+	struct device *dev = qcom->dev;
+
+	qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
+	if (IS_ERR(qcom->usb_ddr_icc_path)) {
+		dev_err(dev, "Error: (%ld) failed getting %s path\n",
+			PTR_ERR(qcom->usb_ddr_icc_path), "usb-ddr");
+		return PTR_ERR(qcom->usb_ddr_icc_path);
+	}
+
+	qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
+	if (IS_ERR(qcom->apps_usb_icc_path)) {
+		dev_err(dev, "Error: (%ld) failed getting %s path\n",
+				PTR_ERR(qcom->apps_usb_icc_path), "apps-usb");
+		return PTR_ERR(qcom->usb_ddr_icc_path);
+	}
+
+	return 0;
+}
+
+/**
+ * geni_interconnect_exit() - Request to release interconnect path handle
+ * @qcom:			Pointer to the concerned usb core.
+ *
+ * This function is used to release interconnect path handle.
+ */
+static void usb_interconnect_exit(struct dwc3_qcom *qcom)
+{
+	icc_put(qcom->usb_ddr_icc_path);
+	icc_put(qcom->apps_usb_icc_path);
+}
+
+/* Currently we only use bandwidth level, so just "enable" interconnects */
+static int usb_interconnect_enable(struct dwc3_qcom *qcom)
+{
+	struct dwc3 *dwc;
+	int ret;
+
+	dwc = platform_get_drvdata(qcom->dwc3);
+	if (!dwc) {
+		dev_err(qcom->dev, "Failed to get dwc3 device\n");
+		return -EPROBE_DEFER;
+	}
+
+	if (dwc->maximum_speed == USB_SPEED_SUPER) {
+		ret = icc_set_bw(qcom->usb_ddr_icc_path,
+			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
+		if (ret)
+			return ret;
+	} else {
+		ret = icc_set_bw(qcom->usb_ddr_icc_path,
+			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
+		if (ret)
+			return ret;
+	}
+
+	ret = icc_set_bw(qcom->apps_usb_icc_path,
+		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
+	if (ret)
+		goto err_disable_mem_path;
+
+	return 0;
+
+err_disable_mem_path:
+	icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
+
+	return ret;
+}
+
+/* To disable an interconnect, we just set its bandwidth to 0 */
+static int usb_interconnect_disable(struct dwc3_qcom *qcom)
+{
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	int ret;
+
+	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
+	if (ret)
+		return ret;
+
+	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
+	if (ret)
+		goto err_reenable_memory_path;
+
+	return 0;
+
+	/* Re-enable things in the event of an error */
+err_reenable_memory_path:
+	if (dwc->maximum_speed == USB_SPEED_SUPER)
+		icc_set_bw(qcom->usb_ddr_icc_path,
+			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
+	else
+		icc_set_bw(qcom->usb_ddr_icc_path,
+			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
+
+	return ret;
+}
+
 static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 {
 	struct dwc3_qcom *qcom = data;
@@ -494,6 +621,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto depopulate;
 	}
 
+	ret = usb_interconnect_init(qcom);
+	if (ret) {
+		dev_err(dev, "failed to get interconnect handle ret:%d\n", ret);
+		goto depopulate;
+	}
+	ret = usb_interconnect_enable(qcom);
+	if (ret) {
+		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
+		goto interconnect_exit;
+	}
+
 	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
 
 	/* enable vbus override for device mode */
@@ -503,7 +641,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	/* register extcon to override sw_vbus on Vbus change later */
 	ret = dwc3_qcom_register_extcon(qcom);
 	if (ret)
-		goto depopulate;
+		goto interconnect_exit;
 
 	device_init_wakeup(&pdev->dev, 1);
 	qcom->is_suspended = false;
@@ -513,6 +651,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
+interconnect_exit:
+	usb_interconnect_exit(qcom);
 depopulate:
 	of_platform_depopulate(&pdev->dev);
 clk_disable:
@@ -540,6 +680,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	}
 	qcom->num_clocks = 0;
 
+	usb_interconnect_exit(qcom);
 	reset_control_assert(qcom->resets);
 
 	pm_runtime_allow(dev);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

