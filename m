Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2820522B5AA
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 20:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgGWS2O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 14:28:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46877 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgGWS2O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 14:28:14 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Jul 2020 11:28:13 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jul 2020 11:28:11 -0700
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Jul 2020 23:57:42 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id C21662C81; Thu, 23 Jul 2020 23:57:41 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH v10 1/2] usb: dwc3: qcom: Add interconnect support in dwc3 driver
Date:   Thu, 23 Jul 2020 23:57:36 +0530
Message-Id: <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595528857-25357-1-git-send-email-sanm@codeaurora.org>
References: <1595528857-25357-1-git-send-email-sanm@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add interconnect support in dwc3-qcom driver to vote for bus
bandwidth.

This requires for two different paths - from USB to
DDR. The other is from APPS to USB.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 127 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e1e78e9..712efb7 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/extcon.h>
+#include <linux/interconnect.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -43,6 +44,14 @@
 #define SDM845_QSCRATCH_SIZE			0x400
 #define SDM845_DWC3_CORE_SIZE			0xcd00
 
+/* Interconnect path bandwidths in MBps */
+#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
+#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
+#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
+#define APPS_USB_AVG_BW 0
+#define APPS_USB_PEAK_BW MBps_to_icc(40)
+
 struct dwc3_acpi_pdata {
 	u32			qscratch_base_offset;
 	u32			qscratch_base_size;
@@ -76,6 +85,8 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	struct icc_path		*icc_path_ddr;
+	struct icc_path		*icc_path_apps;
 };
 
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
@@ -190,6 +201,103 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
 	return 0;
 }
 
+static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
+{
+	int ret;
+
+	ret = icc_enable(qcom->icc_path_ddr);
+	if (ret)
+		return ret;
+
+	ret = icc_enable(qcom->icc_path_apps);
+	if (ret)
+		return icc_disable(qcom->icc_path_ddr);
+
+	return ret;
+}
+
+static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
+{
+	int ret;
+
+	ret = icc_disable(qcom->icc_path_ddr);
+	if (ret)
+		return ret;
+
+	ret = icc_disable(qcom->icc_path_apps);
+	if (ret)
+		goto err_reenable_memory_path;
+
+	return 0;
+
+	/* Re-enable things in the event of an error */
+err_reenable_memory_path:
+	dwc3_qcom_interconnect_enable(qcom);
+
+	return ret;
+}
+
+/**
+ * dwc3_qcom_interconnect_init() - Get interconnect path handles
+ * and set bandwidhth.
+ * @qcom:			Pointer to the concerned usb core.
+ *
+ */
+static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
+{
+	struct device *dev = qcom->dev;
+	int ret;
+
+	qcom->icc_path_ddr = of_icc_get(dev, "usb-ddr");
+	if (IS_ERR(qcom->icc_path_ddr)) {
+		dev_err(dev, "failed to get usb-ddr path: %ld\n",
+			PTR_ERR(qcom->icc_path_ddr));
+		return PTR_ERR(qcom->icc_path_ddr);
+	}
+
+	qcom->icc_path_apps = of_icc_get(dev, "apps-usb");
+	if (IS_ERR(qcom->icc_path_apps)) {
+		dev_err(dev, "failed to get apps-usb path: %ld\n",
+				PTR_ERR(qcom->icc_path_apps));
+		return PTR_ERR(qcom->icc_path_apps);
+	}
+
+	if (usb_get_maximum_speed(&qcom->dwc3->dev) >= USB_SPEED_SUPER ||
+			usb_get_maximum_speed(&qcom->dwc3->dev) == USB_SPEED_UNKNOWN)
+		ret = icc_set_bw(qcom->icc_path_ddr,
+			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
+	else
+		ret = icc_set_bw(qcom->icc_path_ddr,
+			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
+
+	if (ret) {
+		dev_err(dev, "failed to set bandwidth for usb-ddr path: %d\n", ret);
+		return ret;
+	}
+
+	ret = icc_set_bw(qcom->icc_path_apps,
+		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
+
+	if (ret) {
+		dev_err(dev, "failed to set bandwidth for apps-usb path: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * dwc3_qcom_interconnect_exit() - Release interconnect path handles
+ * @qcom:			Pointer to the concerned usb core.
+ *
+ * This function is used to release interconnect path handle.
+ */
+static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
+{
+	icc_put(qcom->icc_path_ddr);
+	icc_put(qcom->icc_path_apps);
+}
+
 static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	if (qcom->hs_phy_irq) {
@@ -239,7 +347,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 {
 	u32 val;
-	int i;
+	int i, ret;
 
 	if (qcom->is_suspended)
 		return 0;
@@ -251,6 +359,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 	for (i = qcom->num_clocks - 1; i >= 0; i--)
 		clk_disable_unprepare(qcom->clks[i]);
 
+	ret = dwc3_qcom_interconnect_disable(qcom);
+	if (ret)
+		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
+
 	qcom->is_suspended = true;
 	dwc3_qcom_enable_interrupts(qcom);
 
@@ -276,6 +388,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 		}
 	}
 
+	ret = dwc3_qcom_interconnect_enable(qcom);
+	if (ret)
+		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
+
 	/* Clear existing events from PHY related to L2 in/out */
 	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
 			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
@@ -638,6 +754,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto depopulate;
 	}
 
+	ret = dwc3_qcom_interconnect_init(qcom);
+	if (ret)
+		goto depopulate;
+
 	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
 
 	/* enable vbus override for device mode */
@@ -647,7 +767,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	/* register extcon to override sw_vbus on Vbus change later */
 	ret = dwc3_qcom_register_extcon(qcom);
 	if (ret)
-		goto depopulate;
+		goto interconnect_exit;
 
 	device_init_wakeup(&pdev->dev, 1);
 	qcom->is_suspended = false;
@@ -657,6 +777,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
+interconnect_exit:
+	dwc3_qcom_interconnect_exit(qcom);
 depopulate:
 	if (np)
 		of_platform_depopulate(&pdev->dev);
@@ -687,6 +809,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	}
 	qcom->num_clocks = 0;
 
+	dwc3_qcom_interconnect_exit(qcom);
 	reset_control_assert(qcom->resets);
 
 	pm_runtime_allow(dev);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

