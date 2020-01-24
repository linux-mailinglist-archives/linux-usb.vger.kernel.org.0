Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 031BF147988
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2020 09:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729946AbgAXIlw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 03:41:52 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:60475 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725843AbgAXIlw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jan 2020 03:41:52 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00O8caBU008756;
        Fri, 24 Jan 2020 09:41:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6S6OisoqqGbJJ/BF/+rC6Q6a3UxFXhzvkchLfbaM/sc=;
 b=ItGpb2UXB+USuMXfRitCdNjCUlXr1AcRnPMECAi6nluqabyHit4Tm22nVm7f56i9DVUA
 tjHdoRKFYF45pEtzdPUgNCWT/Xw0fiIEZ4xhBJZ5onv5QAuEIfa5WYNY/QLhXfwCAhzl
 Gd+aVqWQJ4sPcY6Y78128T4yCsba+iy1z8YiBhzT1nA6Rhk7ZRh5QgtYu0VeRUFx0iDg
 8BLLnQPsZ8gLXWIrLv0IUANb1EMgew9Z59zP56ATz3HDr6iHK32USg8LA6zqLh1tss2k
 IBt+osl1emkJ8zTEUpXw/O7siNQ6ul1y60HWkSJVPicW1BLjdVjxWoMQEFJ7cftreOh9 gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkrp2ps44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Jan 2020 09:41:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 171E110003A;
        Fri, 24 Jan 2020 09:41:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07A9B20EDC8;
        Fri, 24 Jan 2020 09:41:41 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jan 2020 09:41:40
 +0100
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v3 2/2] usb: dwc2: add support for STM32MP15 SoCs USB OTG HS and FS
Date:   Fri, 24 Jan 2020 09:41:31 +0100
Message-ID: <20200124084131.23749-3-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124084131.23749-1-amelie.delaunay@st.com>
References: <20200124084131.23749-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-24_02:2020-01-24,2020-01-24 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch introduces a new parameter to activate external ID pin and valid
vbus level detection, required on STM32MP15 SoC to support dual role,
either in HS or FS.
The STM32MP15 SoC uses the GGPIO register to enable the level detection.
The level detector requires to be powered.
Also adds the params structures for STM32MP15 OTG HS and STM32MP1 OTG FS.

Acked-by: Minas Harutyunyan <hminas@synopsys.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/dwc2/core.h     |  8 ++++
 drivers/usb/dwc2/hw.h       |  8 ++++
 drivers/usb/dwc2/params.c   | 33 +++++++++++++
 drivers/usb/dwc2/platform.c | 94 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 968e03b89d04..99b0bdfe0012 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -411,6 +411,10 @@ enum dwc2_ep0_state {
  *			register.
  *			0 - Deactivate the transceiver (default)
  *			1 - Activate the transceiver
+ * @activate_stm_id_vb_detection: Activate external ID pin and Vbus level
+ *			detection using GGPIO register.
+ *			0 - Deactivate the external level detection (default)
+ *			1 - Activate the external level detection
  * @g_dma:              Enables gadget dma usage (default: autodetect).
  * @g_dma_desc:         Enables gadget descriptor DMA (default: autodetect).
  * @g_rx_fifo_size:	The periodic rx fifo size for the device, in
@@ -481,6 +485,7 @@ struct dwc2_core_params {
 	bool service_interval;
 	u8 hird_threshold;
 	bool activate_stm_fs_transceiver;
+	bool activate_stm_id_vb_detection;
 	bool ipg_isoc_en;
 	u16 max_packet_count;
 	u32 max_transfer_size;
@@ -874,6 +879,8 @@ struct dwc2_hregs_backup {
  *                      removed once all SoCs support usb transceiver.
  * @supplies:           Definition of USB power supplies
  * @vbus_supply:        Regulator supplying vbus.
+ * @usb33d:		Optional 3.3v regulator used on some stm32 devices to
+ *			supply ID and VBUS detection hardware.
  * @lock:		Spinlock that protects all the driver data structures
  * @priv:		Stores a pointer to the struct usb_hcd
  * @queuing_high_bandwidth: True if multiple packets of a high-bandwidth
@@ -1061,6 +1068,7 @@ struct dwc2_hsotg {
 	struct dwc2_hsotg_plat *plat;
 	struct regulator_bulk_data supplies[DWC2_NUM_SUPPLIES];
 	struct regulator *vbus_supply;
+	struct regulator *usb33d;
 
 	spinlock_t lock;
 	void *priv;
diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 510e87ec0be8..c4027bbcedec 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -54,6 +54,12 @@
 #define GOTGCTL_HSTSETHNPEN		BIT(10)
 #define GOTGCTL_HNPREQ			BIT(9)
 #define GOTGCTL_HSTNEGSCS		BIT(8)
+#define GOTGCTL_BVALOVAL		BIT(7)
+#define GOTGCTL_BVALOEN			BIT(6)
+#define GOTGCTL_AVALOVAL		BIT(5)
+#define GOTGCTL_AVALOEN			BIT(4)
+#define GOTGCTL_VBVALOVAL		BIT(3)
+#define GOTGCTL_VBVALOEN		BIT(2)
 #define GOTGCTL_SESREQ			BIT(1)
 #define GOTGCTL_SESREQSCS		BIT(0)
 
@@ -227,6 +233,8 @@
 #define GPVNDCTL			HSOTG_REG(0x0034)
 #define GGPIO				HSOTG_REG(0x0038)
 #define GGPIO_STM32_OTG_GCCFG_PWRDWN	BIT(16)
+#define GGPIO_STM32_OTG_GCCFG_VBDEN	BIT(21)
+#define GGPIO_STM32_OTG_GCCFG_IDEN	BIT(22)
 
 #define GUID				HSOTG_REG(0x003c)
 #define GSNPSID				HSOTG_REG(0x0040)
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 31e090ac9f1e..8ccc83f7eb3f 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -163,6 +163,35 @@ static void dwc2_set_stm32f7_hsotg_params(struct dwc2_hsotg *hsotg)
 	p->host_perio_tx_fifo_size = 256;
 }
 
+static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
+	p->speed = DWC2_SPEED_PARAM_FULL;
+	p->host_rx_fifo_size = 128;
+	p->host_nperio_tx_fifo_size = 96;
+	p->host_perio_tx_fifo_size = 96;
+	p->max_packet_count = 256;
+	p->phy_type = DWC2_PHY_TYPE_PARAM_FS;
+	p->i2c_enable = false;
+	p->activate_stm_fs_transceiver = true;
+	p->activate_stm_id_vb_detection = true;
+	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+}
+
+static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
+	p->activate_stm_id_vb_detection = true;
+	p->host_rx_fifo_size = 440;
+	p->host_nperio_tx_fifo_size = 256;
+	p->host_perio_tx_fifo_size = 256;
+	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+}
+
 const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "brcm,bcm2835-usb", .data = dwc2_set_bcm_params },
 	{ .compatible = "hisilicon,hi6220-usb", .data = dwc2_set_his_params  },
@@ -186,6 +215,10 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "st,stm32f4x9-hsotg" },
 	{ .compatible = "st,stm32f7-hsotg",
 	  .data = dwc2_set_stm32f7_hsotg_params },
+	{ .compatible = "st,stm32mp15-fsotg",
+	  .data = dwc2_set_stm32mp15_fsotg_params },
+	{ .compatible = "st,stm32mp15-hsotg",
+	  .data = dwc2_set_stm32mp15_hsotg_params },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 3c6ce09a6db5..8368d6d66d64 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -312,6 +312,9 @@ static int dwc2_driver_remove(struct platform_device *dev)
 	if (hsotg->gadget_enabled)
 		dwc2_hsotg_remove(hsotg);
 
+	if (hsotg->params.activate_stm_id_vb_detection)
+		regulator_disable(hsotg->usb33d);
+
 	if (hsotg->ll_hw_enabled)
 		dwc2_lowlevel_hw_disable(hsotg);
 
@@ -464,10 +467,35 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	if (retval)
 		goto error;
 
+	if (hsotg->params.activate_stm_id_vb_detection) {
+		u32 ggpio;
+
+		hsotg->usb33d = devm_regulator_get(hsotg->dev, "usb33d");
+		if (IS_ERR(hsotg->usb33d)) {
+			retval = PTR_ERR(hsotg->usb33d);
+			if (retval != -EPROBE_DEFER)
+				dev_err(hsotg->dev,
+					"failed to request usb33d supply: %d\n",
+					retval);
+			goto error;
+		}
+		retval = regulator_enable(hsotg->usb33d);
+		if (retval) {
+			dev_err(hsotg->dev,
+				"failed to enable usb33d supply: %d\n", retval);
+			goto error;
+		}
+
+		ggpio = dwc2_readl(hsotg, GGPIO);
+		ggpio |= GGPIO_STM32_OTG_GCCFG_IDEN;
+		ggpio |= GGPIO_STM32_OTG_GCCFG_VBDEN;
+		dwc2_writel(hsotg, ggpio, GGPIO);
+	}
+
 	if (hsotg->dr_mode != USB_DR_MODE_HOST) {
 		retval = dwc2_gadget_init(hsotg);
 		if (retval)
-			goto error;
+			goto error_init;
 		hsotg->gadget_enabled = 1;
 	}
 
@@ -493,7 +521,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		if (retval) {
 			if (hsotg->gadget_enabled)
 				dwc2_hsotg_remove(hsotg);
-			goto error;
+			goto error_init;
 		}
 		hsotg->hcd_enabled = 1;
 	}
@@ -509,6 +537,9 @@ static int dwc2_driver_probe(struct platform_device *dev)
 
 	return 0;
 
+error_init:
+	if (hsotg->params.activate_stm_id_vb_detection)
+		regulator_disable(hsotg->usb33d);
 error:
 	dwc2_lowlevel_hw_disable(hsotg);
 	return retval;
@@ -523,6 +554,37 @@ static int __maybe_unused dwc2_suspend(struct device *dev)
 	if (is_device_mode)
 		dwc2_hsotg_suspend(dwc2);
 
+	if (dwc2->params.activate_stm_id_vb_detection) {
+		unsigned long flags;
+		u32 ggpio, gotgctl;
+
+		/*
+		 * Need to force the mode to the current mode to avoid Mode
+		 * Mismatch Interrupt when ID detection will be disabled.
+		 */
+		dwc2_force_mode(dwc2, !is_device_mode);
+
+		spin_lock_irqsave(&dwc2->lock, flags);
+		gotgctl = dwc2_readl(dwc2, GOTGCTL);
+		/* bypass debounce filter, enable overrides */
+		gotgctl |= GOTGCTL_DBNCE_FLTR_BYPASS;
+		gotgctl |= GOTGCTL_BVALOEN | GOTGCTL_AVALOEN;
+		/* Force A / B session if needed */
+		if (gotgctl & GOTGCTL_ASESVLD)
+			gotgctl |= GOTGCTL_AVALOVAL;
+		if (gotgctl & GOTGCTL_BSESVLD)
+			gotgctl |= GOTGCTL_BVALOVAL;
+		dwc2_writel(dwc2, gotgctl, GOTGCTL);
+		spin_unlock_irqrestore(&dwc2->lock, flags);
+
+		ggpio = dwc2_readl(dwc2, GGPIO);
+		ggpio &= ~GGPIO_STM32_OTG_GCCFG_IDEN;
+		ggpio &= ~GGPIO_STM32_OTG_GCCFG_VBDEN;
+		dwc2_writel(dwc2, ggpio, GGPIO);
+
+		regulator_disable(dwc2->usb33d);
+	}
+
 	if (dwc2->ll_hw_enabled &&
 	    (is_device_mode || dwc2_host_can_poweroff_phy(dwc2))) {
 		ret = __dwc2_lowlevel_hw_disable(dwc2);
@@ -544,6 +606,34 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 	}
 	dwc2->phy_off_for_suspend = false;
 
+	if (dwc2->params.activate_stm_id_vb_detection) {
+		unsigned long flags;
+		u32 ggpio, gotgctl;
+
+		ret = regulator_enable(dwc2->usb33d);
+		if (ret)
+			return ret;
+
+		ggpio = dwc2_readl(dwc2, GGPIO);
+		ggpio |= GGPIO_STM32_OTG_GCCFG_IDEN;
+		ggpio |= GGPIO_STM32_OTG_GCCFG_VBDEN;
+		dwc2_writel(dwc2, ggpio, GGPIO);
+
+		/* ID/VBUS detection startup time */
+		usleep_range(5000, 7000);
+
+		spin_lock_irqsave(&dwc2->lock, flags);
+		gotgctl = dwc2_readl(dwc2, GOTGCTL);
+		gotgctl &= ~GOTGCTL_DBNCE_FLTR_BYPASS;
+		gotgctl &= ~(GOTGCTL_BVALOEN | GOTGCTL_AVALOEN |
+			     GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL);
+		dwc2_writel(dwc2, gotgctl, GOTGCTL);
+		spin_unlock_irqrestore(&dwc2->lock, flags);
+	}
+
+	/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
+	dwc2_force_dr_mode(dwc2);
+
 	if (dwc2_is_device_mode(dwc2))
 		ret = dwc2_hsotg_resume(dwc2);
 
-- 
2.17.1

