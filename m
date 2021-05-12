Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E8E37B8D1
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 11:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhELJGw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 05:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhELJGv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 05:06:51 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAC9C061760
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 02:05:42 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so2638523wmb.3
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aqalGEh1WebDsoxoEGXQaw9Zdn2svZEtilVDb1za8Kg=;
        b=y/xisGOaP8TnYOec32lXo6fLcm4TaaHuRSJna5EBSIKSGYtJYQQ+d5B5QUnkVrozp5
         Bs15X7oxXgcZwJutgERFUSC8rZ+V7i9EO6OYC4EQBPVUNa4u+SrCy743oy75d2L9XnTG
         RdZnEaQbxiMJFbw04wW2KKqD4JpVdrrTWN7Du4ThI0tmT9Wll+omYoTfyYgaxUWXxBsl
         FnSXjPXXX+yp7u1RHjRg1SlIXWg8rGFyk/Fo/9DBOYBDr7WYUdZzXNFFv6HzFVJR5dQP
         itts/VPEL6EJ/gouGTD8qtbHCvIA2TbprsOy3LllHtKQr+SQmRX5DlK42H6eT0A2GrW6
         PtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aqalGEh1WebDsoxoEGXQaw9Zdn2svZEtilVDb1za8Kg=;
        b=Xg1YB6LqT7VNaOd2mztRfyLIprHajtNJmEN8Gx9GSI/RQXikBAGWEXB1n8tJnkIvx5
         vqGuc9J8vblzw4Stx+00qAluQaWCpMfPPTwrgrIFE5Y6Wxjy18r2WN6s8e+3ERwddtfJ
         bqkZMGXZYmKkpS3CO7qVlut0NSLj6TimT8l1GE/gXt91yYpcilakhEDR4Tbm4SxMpUPh
         F4lbCTW8/wXj8mcjv8UpSkFmjlWwxkmO+ilk0k6Go1CiFZ1SseTjFCG0bQPfeA8T6AHU
         2XH50VI2wo27dp1/9or2fixs7QiXeDss4K2kfe0W9ESdW56T/UiYqQzmLamrQSoxO8UK
         Pc0Q==
X-Gm-Message-State: AOAM533P8JgbXdOMZcqyaal4UywgYUxgwNp/bgnHNevLq5NZN1UE9FdE
        GGo9ML6+JvzphgjVV6CNtxqixw==
X-Google-Smtp-Source: ABdhPJyWksnPGXP3x0NzINpCPK/p88rddC7KSNxwVnpmUPjHnjskYA2I20Auo/+yEouuJFfgMgIoNQ==
X-Received: by 2002:a05:600c:28d0:: with SMTP id h16mr14824665wmd.52.1620810340396;
        Wed, 12 May 2021 02:05:40 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v20sm26679451wmj.15.2021.05.12.02.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 02:05:39 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 2/9] usb: isp1760: move to regmap for register access
Date:   Wed, 12 May 2021 10:05:22 +0100
Message-Id: <20210512090529.2283637-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512090529.2283637-1-rui.silva@linaro.org>
References: <20210512090529.2283637-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rework access to registers and memory to use regmap framework.
No change in current feature or way of work is intended with this
change.

This will allow to reuse this driver with other IP of this family,
for example isp1763, with little changes and effort.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/Kconfig        |   1 +
 drivers/usb/isp1760/isp1760-core.c | 239 +++++++++++++---
 drivers/usb/isp1760/isp1760-core.h |  38 ++-
 drivers/usb/isp1760/isp1760-hcd.c  | 445 +++++++++++++++--------------
 drivers/usb/isp1760/isp1760-hcd.h  |  18 +-
 drivers/usb/isp1760/isp1760-if.c   |   4 +-
 drivers/usb/isp1760/isp1760-regs.h | 338 ++++++++++------------
 drivers/usb/isp1760/isp1760-udc.c  | 227 ++++++++++-----
 drivers/usb/isp1760/isp1760-udc.h  |  10 +-
 9 files changed, 789 insertions(+), 531 deletions(-)

diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
index b1022cc490a2..d23853f601b1 100644
--- a/drivers/usb/isp1760/Kconfig
+++ b/drivers/usb/isp1760/Kconfig
@@ -3,6 +3,7 @@
 config USB_ISP1760
 	tristate "NXP ISP 1760/1761 support"
 	depends on USB || USB_GADGET
+	select REGMAP_MMIO
 	help
 	  Say Y or M here if your system as an ISP1760 USB host controller
 	  or an ISP1761 USB dual-role controller.
diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index fdeb4cf97cc5..c79ba98df9f9 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
 
@@ -25,8 +26,8 @@
 
 static void isp1760_init_core(struct isp1760_device *isp)
 {
-	u32 otgctrl;
-	u32 hwmode;
+	struct isp1760_hcd *hcd = &isp->hcd;
+	struct isp1760_udc *udc = &isp->udc;
 
 	/* Low-level chip reset */
 	if (isp->rst_gpio) {
@@ -39,24 +40,22 @@ static void isp1760_init_core(struct isp1760_device *isp)
 	 * Reset the host controller, including the CPU interface
 	 * configuration.
 	 */
-	isp1760_write32(isp->regs, HC_RESET_REG, SW_RESET_RESET_ALL);
+	isp1760_field_set(hcd->fields, SW_RESET_RESET_ALL);
 	msleep(100);
 
 	/* Setup HW Mode Control: This assumes a level active-low interrupt */
-	hwmode = HW_DATA_BUS_32BIT;
-
 	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
-		hwmode &= ~HW_DATA_BUS_32BIT;
+		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
 	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
-		hwmode |= HW_ANA_DIGI_OC;
+		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
 	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
-		hwmode |= HW_DACK_POL_HIGH;
+		isp1760_field_set(hcd->fields, HW_DACK_POL_HIGH);
 	if (isp->devflags & ISP1760_FLAG_DREQ_POL_HIGH)
-		hwmode |= HW_DREQ_POL_HIGH;
+		isp1760_field_set(hcd->fields, HW_DREQ_POL_HIGH);
 	if (isp->devflags & ISP1760_FLAG_INTR_POL_HIGH)
-		hwmode |= HW_INTR_HIGH_ACT;
+		isp1760_field_set(hcd->fields, HW_INTR_HIGH_ACT);
 	if (isp->devflags & ISP1760_FLAG_INTR_EDGE_TRIG)
-		hwmode |= HW_INTR_EDGE_TRIG;
+		isp1760_field_set(hcd->fields, HW_INTR_EDGE_TRIG);
 
 	/*
 	 * The ISP1761 has a dedicated DC IRQ line but supports sharing the HC
@@ -65,18 +64,10 @@ static void isp1760_init_core(struct isp1760_device *isp)
 	 * spurious interrupts during HCD registration.
 	 */
 	if (isp->devflags & ISP1760_FLAG_ISP1761) {
-		isp1760_write32(isp->regs, DC_MODE, 0);
-		hwmode |= HW_COMN_IRQ;
+		isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
+		isp1760_field_set(hcd->fields, HW_COMN_IRQ);
 	}
 
-	/*
-	 * We have to set this first in case we're in 16-bit mode.
-	 * Write it twice to ensure correct upper bits if switching
-	 * to 16-bit mode.
-	 */
-	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
-	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
-
 	/*
 	 * PORT 1 Control register of the ISP1760 is the OTG control register
 	 * on ISP1761.
@@ -85,14 +76,15 @@ static void isp1760_init_core(struct isp1760_device *isp)
 	 * when OTG is requested.
 	 */
 	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
-	    (isp->devflags & ISP1760_FLAG_OTG_EN))
-		otgctrl = ((HW_DM_PULLDOWN | HW_DP_PULLDOWN) << 16)
-			| HW_OTG_DISABLE;
-	else
-		otgctrl = (HW_SW_SEL_HC_DC << 16)
-			| (HW_VBUS_DRV | HW_SEL_CP_EXT);
-
-	isp1760_write32(isp->regs, HC_PORT1_CTRL, otgctrl);
+	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
+		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
+		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
+		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
+	} else {
+		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
+		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
+		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
+	}
 
 	dev_info(isp->dev, "bus width: %u, oc: %s\n",
 		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
@@ -101,16 +93,158 @@ static void isp1760_init_core(struct isp1760_device *isp)
 
 void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
 {
-	isp1760_write32(isp->regs, HW_OTG_CTRL_SET,
-			enable ? HW_DP_PULLUP : HW_DP_PULLUP << 16);
+	struct isp1760_udc *udc = &isp->udc;
+
+	if (enable)
+		isp1760_field_set(udc->fields, HW_DP_PULLUP);
+	else
+		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
 }
 
+static const struct regmap_range isp176x_hc_volatile_ranges[] = {
+	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
+	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
+	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AND),
+};
+
+static const struct regmap_access_table isp176x_hc_volatile_table = {
+	.yes_ranges	= isp176x_hc_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(isp176x_hc_volatile_ranges),
+};
+
+static struct regmap_config isp1760_hc_regmap_conf = {
+	.name = "isp1760-hc",
+	.reg_bits = 16,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = ISP176x_HC_MEMORY,
+	.volatile_table = &isp176x_hc_volatile_table,
+};
+
+static const struct reg_field isp1760_hc_reg_fields[] = {
+	[HCS_PPC]		= REG_FIELD(ISP176x_HC_HCSPARAMS, 4, 4),
+	[HCS_N_PORTS]		= REG_FIELD(ISP176x_HC_HCSPARAMS, 0, 3),
+	[HCC_ISOC_CACHE]	= REG_FIELD(ISP176x_HC_HCCPARAMS, 7, 7),
+	[HCC_ISOC_THRES]	= REG_FIELD(ISP176x_HC_HCCPARAMS, 4, 6),
+	[CMD_LRESET]		= REG_FIELD(ISP176x_HC_USBCMD, 7, 7),
+	[CMD_RESET]		= REG_FIELD(ISP176x_HC_USBCMD, 1, 1),
+	[CMD_RUN]		= REG_FIELD(ISP176x_HC_USBCMD, 0, 0),
+	[STS_PCD]		= REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
+	[HC_FRINDEX]		= REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
+	[FLAG_CF]		= REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
+	[PORT_OWNER]		= REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
+	[PORT_POWER]		= REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
+	[PORT_LSTATUS]		= REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
+	[PORT_RESET]		= REG_FIELD(ISP176x_HC_PORTSC1, 8, 8),
+	[PORT_SUSPEND]		= REG_FIELD(ISP176x_HC_PORTSC1, 7, 7),
+	[PORT_RESUME]		= REG_FIELD(ISP176x_HC_PORTSC1, 6, 6),
+	[PORT_PE]		= REG_FIELD(ISP176x_HC_PORTSC1, 2, 2),
+	[PORT_CSC]		= REG_FIELD(ISP176x_HC_PORTSC1, 1, 1),
+	[PORT_CONNECT]		= REG_FIELD(ISP176x_HC_PORTSC1, 0, 0),
+	[ALL_ATX_RESET]		= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 31, 31),
+	[HW_ANA_DIGI_OC]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 15, 15),
+	[HW_COMN_IRQ]		= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 10, 10),
+	[HW_DATA_BUS_WIDTH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 8, 8),
+	[HW_DACK_POL_HIGH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 6, 6),
+	[HW_DREQ_POL_HIGH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 5, 5),
+	[HW_INTR_HIGH_ACT]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
+	[HW_INTR_EDGE_TRIG]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
+	[HW_GLOBAL_INTR_EN]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
+	[SW_RESET_RESET_ALL]	= REG_FIELD(ISP176x_HC_RESET, 0, 0),
+	[INT_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
+	[ATL_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
+	[MEM_BANK_SEL]		= REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
+	[MEM_START_ADDR]	= REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
+	[HC_INT_ENABLE]		= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8),
+};
+
+static const struct regmap_range isp176x_dc_volatile_ranges[] = {
+	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
+	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
+	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLEAR),
+};
+
+static const struct regmap_access_table isp176x_dc_volatile_table = {
+	.yes_ranges	= isp176x_dc_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(isp176x_dc_volatile_ranges),
+};
+
+static struct regmap_config isp1761_dc_regmap_conf = {
+	.name = "isp1761-dc",
+	.reg_bits = 16,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = ISP1761_DC_OTG_CTRL_CLEAR,
+	.volatile_table = &isp176x_dc_volatile_table,
+};
+
+static const struct reg_field isp1761_dc_reg_fields[] = {
+	[DC_DEVEN]		= REG_FIELD(ISP176x_DC_ADDRESS, 7, 7),
+	[DC_DEVADDR]		= REG_FIELD(ISP176x_DC_ADDRESS, 0, 6),
+	[DC_VBUSSTAT]		= REG_FIELD(ISP176x_DC_MODE, 8, 8),
+	[DC_SFRESET]		= REG_FIELD(ISP176x_DC_MODE, 4, 4),
+	[DC_GLINTENA]		= REG_FIELD(ISP176x_DC_MODE, 3, 3),
+	[DC_CDBGMOD_ACK]	= REG_FIELD(ISP176x_DC_INTCONF, 6, 6),
+	[DC_DDBGMODIN_ACK]	= REG_FIELD(ISP176x_DC_INTCONF, 4, 4),
+	[DC_DDBGMODOUT_ACK]	= REG_FIELD(ISP176x_DC_INTCONF, 2, 2),
+	[DC_INTPOL]		= REG_FIELD(ISP176x_DC_INTCONF, 0, 0),
+	[DC_IEPRXTX_7]		= REG_FIELD(ISP176x_DC_INTENABLE, 25, 25),
+	[DC_IEPRXTX_6]		= REG_FIELD(ISP176x_DC_INTENABLE, 23, 23),
+	[DC_IEPRXTX_5]		= REG_FIELD(ISP176x_DC_INTENABLE, 21, 21),
+	[DC_IEPRXTX_4]		= REG_FIELD(ISP176x_DC_INTENABLE, 19, 19),
+	[DC_IEPRXTX_3]		= REG_FIELD(ISP176x_DC_INTENABLE, 17, 17),
+	[DC_IEPRXTX_2]		= REG_FIELD(ISP176x_DC_INTENABLE, 15, 15),
+	[DC_IEPRXTX_1]		= REG_FIELD(ISP176x_DC_INTENABLE, 13, 13),
+	[DC_IEPRXTX_0]		= REG_FIELD(ISP176x_DC_INTENABLE, 11, 11),
+	[DC_IEP0SETUP]		= REG_FIELD(ISP176x_DC_INTENABLE, 8, 8),
+	[DC_IEVBUS]		= REG_FIELD(ISP176x_DC_INTENABLE, 7, 7),
+	[DC_IEHS_STA]		= REG_FIELD(ISP176x_DC_INTENABLE, 5, 5),
+	[DC_IERESM]		= REG_FIELD(ISP176x_DC_INTENABLE, 4, 4),
+	[DC_IESUSP]		= REG_FIELD(ISP176x_DC_INTENABLE, 3, 3),
+	[DC_IEBRST]		= REG_FIELD(ISP176x_DC_INTENABLE, 0, 0),
+	[DC_EP0SETUP]		= REG_FIELD(ISP176x_DC_EPINDEX, 5, 5),
+	[DC_ENDPIDX]		= REG_FIELD(ISP176x_DC_EPINDEX, 1, 4),
+	[DC_EPDIR]		= REG_FIELD(ISP176x_DC_EPINDEX, 0, 0),
+	[DC_CLBUF]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 4, 4),
+	[DC_VENDP]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 3, 3),
+	[DC_DSEN]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 2, 2),
+	[DC_STATUS]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 1, 1),
+	[DC_STALL]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 0, 0),
+	[DC_BUFLEN]		= REG_FIELD(ISP176x_DC_BUFLEN, 0, 15),
+	[DC_FFOSZ]		= REG_FIELD(ISP176x_DC_EPMAXPKTSZ, 0, 10),
+	[DC_EPENABLE]		= REG_FIELD(ISP176x_DC_EPTYPE, 3, 3),
+	[DC_ENDPTYP]		= REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
+	[DC_UFRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
+	[DC_FRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
+	[HW_OTG_DISABLE]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
+	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
+	[HW_VBUS_DRV]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
+	[HW_SEL_CP_EXT]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
+	[HW_DM_PULLDOWN]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
+	[HW_DP_PULLDOWN]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
+	[HW_DP_PULLUP]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
+	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
+	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
+	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
+	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
+	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
+	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
+	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
+};
+
 int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 		     struct device *dev, unsigned int devflags)
 {
 	struct isp1760_device *isp;
+	struct isp1760_hcd *hcd;
+	struct isp1760_udc *udc;
 	bool udc_disabled = !(devflags & ISP1760_FLAG_ISP1761);
+	struct regmap_field *f;
+	void __iomem *base;
 	int ret;
+	int i;
 
 	/*
 	 * If neither the HCD not the UDC is enabled return an error, as no
@@ -126,19 +260,52 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 
 	isp->dev = dev;
 	isp->devflags = devflags;
+	hcd = &isp->hcd;
+	udc = &isp->udc;
+
+	if (devflags & ISP1760_FLAG_BUS_WIDTH_16) {
+		isp1760_hc_regmap_conf.val_bits = 16;
+		isp1761_dc_regmap_conf.val_bits = 16;
+	}
 
 	isp->rst_gpio = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
 	if (IS_ERR(isp->rst_gpio))
 		return PTR_ERR(isp->rst_gpio);
 
-	isp->regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(isp->regs))
-		return PTR_ERR(isp->regs);
+	hcd->base = devm_ioremap_resource(dev, mem);
+	if (IS_ERR(hcd->base))
+		return PTR_ERR(hcd->base);
+
+	hcd->regs = devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap_conf);
+	if (IS_ERR(hcd->regs))
+		return PTR_ERR(hcd->regs);
+
+	for (i = 0; i < HC_FIELD_MAX; i++) {
+		f = devm_regmap_field_alloc(dev, hcd->regs,
+					    isp1760_hc_reg_fields[i]);
+		if (IS_ERR(f))
+			return PTR_ERR(f);
+
+		hcd->fields[i] = f;
+	}
+
+	udc->regs = devm_regmap_init_mmio(dev, base, &isp1761_dc_regmap_conf);
+	if (IS_ERR(udc->regs))
+		return PTR_ERR(udc->regs);
+
+	for (i = 0; i < DC_FIELD_MAX; i++) {
+		f = devm_regmap_field_alloc(dev, udc->regs,
+					    isp1761_dc_reg_fields[i]);
+		if (IS_ERR(f))
+			return PTR_ERR(f);
+
+		udc->fields[i] = f;
+	}
 
 	isp1760_init_core(isp);
 
 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
-		ret = isp1760_hcd_register(&isp->hcd, isp->regs, mem, irq,
+		ret = isp1760_hcd_register(hcd, mem, irq,
 					   irqflags | IRQF_SHARED, dev);
 		if (ret < 0)
 			return ret;
@@ -147,7 +314,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
 		ret = isp1760_udc_register(isp, irq, irqflags);
 		if (ret < 0) {
-			isp1760_hcd_unregister(&isp->hcd);
+			isp1760_hcd_unregister(hcd);
 			return ret;
 		}
 	}
diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
index d9a0a4cc467c..8fec6395f19f 100644
--- a/drivers/usb/isp1760/isp1760-core.h
+++ b/drivers/usb/isp1760/isp1760-core.h
@@ -14,6 +14,7 @@
 #define _ISP1760_CORE_H_
 
 #include <linux/ioport.h>
+#include <linux/regmap.h>
 
 #include "isp1760-hcd.h"
 #include "isp1760-udc.h"
@@ -38,7 +39,6 @@ struct gpio_desc;
 struct isp1760_device {
 	struct device *dev;
 
-	void __iomem *regs;
 	unsigned int devflags;
 	struct gpio_desc *rst_gpio;
 
@@ -52,14 +52,42 @@ void isp1760_unregister(struct device *dev);
 
 void isp1760_set_pullup(struct isp1760_device *isp, bool enable);
 
-static inline u32 isp1760_read32(void __iomem *base, u32 reg)
+static inline u32 isp1760_field_read(struct regmap_field **fields, u32 field)
 {
-	return readl(base + reg);
+	unsigned int val;
+
+	regmap_field_read(fields[field], &val);
+
+	return val;
+}
+
+static inline void isp1760_field_write(struct regmap_field **fields, u32 field,
+				       u32 val)
+{
+	regmap_field_write(fields[field], val);
+}
+
+static inline void isp1760_field_set(struct regmap_field **fields, u32 field)
+{
+	isp1760_field_write(fields, field, 0xFFFFFFFF);
 }
 
-static inline void isp1760_write32(void __iomem *base, u32 reg, u32 val)
+static inline void isp1760_field_clear(struct regmap_field **fields, u32 field)
 {
-	writel(val, base + reg);
+	isp1760_field_write(fields, field, 0);
 }
 
+static inline u32 isp1760_reg_read(struct regmap *regs, u32 reg)
+{
+	unsigned int val;
+
+	regmap_read(regs, reg, &val);
+
+	return val;
+}
+
+static inline void isp1760_reg_write(struct regmap *regs, u32 reg, u32 val)
+{
+	regmap_write(regs, reg, val);
+}
 #endif
diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 0e0a4b01c710..20d142140574 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -66,6 +66,11 @@ struct ptd {
 #define ATL_PTD_OFFSET		0x0c00
 #define PAYLOAD_OFFSET		0x1000
 
+#define ISP_BANK_0		0x00
+#define ISP_BANK_1		0x01
+#define ISP_BANK_2		0x02
+#define ISP_BANK_3		0x03
+
 #define TO_DW(x)	((__force __dw)x)
 #define TO_U32(x)	((__force u32)x)
 
@@ -161,16 +166,59 @@ struct urb_listitem {
 };
 
 /*
- * Access functions for isp176x registers (addresses 0..0x03FF).
+ * Access functions for isp176x registers regmap fields
  */
-static u32 reg_read32(void __iomem *base, u32 reg)
+static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	return isp1760_field_read(priv->fields, field);
+}
+
+static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	isp1760_field_write(priv->fields, field, val);
+}
+
+static void isp1760_hcd_set(struct usb_hcd *hcd, u32 field)
+{
+	isp1760_hcd_write(hcd, field, 0xFFFFFFFF);
+}
+
+static void isp1760_hcd_clear(struct usb_hcd *hcd, u32 field)
+{
+	isp1760_hcd_write(hcd, field, 0);
+}
+
+static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 field,
+					u32 timeout_us)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	unsigned int val;
+
+	isp1760_hcd_set(hcd, field);
+
+	return regmap_field_read_poll_timeout(priv->fields[field], val, 1, 1,
+					      timeout_us);
+}
+
+static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32 field,
+					  u32 timeout_us)
 {
-	return isp1760_read32(base, reg);
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	unsigned int val;
+
+	isp1760_hcd_clear(hcd, field);
+
+	return regmap_field_read_poll_timeout(priv->fields[field], val, 0, 1,
+					      timeout_us);
 }
 
-static void reg_write32(void __iomem *base, u32 reg, u32 val)
+static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
 {
-	isp1760_write32(base, reg, val);
+	return !!isp1760_hcd_read(hcd, field);
 }
 
 /*
@@ -233,12 +281,15 @@ static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
 	}
 }
 
-static void mem_reads8(void __iomem *src_base, u32 src_offset, void *dst,
-								u32 bytes)
+static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base,
+		       u32 src_offset, void *dst, u32 bytes)
 {
-	reg_write32(src_base, HC_MEMORY_REG, src_offset + ISP_BANK(0));
+	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
+	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
+
 	ndelay(90);
-	bank_reads8(src_base, src_offset, ISP_BANK(0), dst, bytes);
+
+	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
 }
 
 static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
@@ -280,14 +331,15 @@ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
  * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
  * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
  */
-static void ptd_read(void __iomem *base, u32 ptd_offset, u32 slot,
-								struct ptd *ptd)
+static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
+		     u32 ptd_offset, u32 slot, struct ptd *ptd)
 {
-	reg_write32(base, HC_MEMORY_REG,
-				ISP_BANK(0) + ptd_offset + slot*sizeof(*ptd));
+	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
+	isp1760_hcd_write(hcd, MEM_START_ADDR,
+			  ptd_offset + slot * sizeof(*ptd));
 	ndelay(90);
-	bank_reads8(base, ptd_offset + slot*sizeof(*ptd), ISP_BANK(0),
-						(void *) ptd, sizeof(*ptd));
+	bank_reads8(base, ptd_offset + slot * sizeof(*ptd), ISP_BANK_0,
+		    (void *)ptd, sizeof(*ptd));
 }
 
 static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
@@ -379,34 +431,15 @@ static void free_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
 	qtd->payload_addr = 0;
 }
 
-static int handshake(struct usb_hcd *hcd, u32 reg,
-		      u32 mask, u32 done, int usec)
-{
-	u32 result;
-	int ret;
-
-	ret = readl_poll_timeout_atomic(hcd->regs + reg, result,
-					((result & mask) == done ||
-					 result == U32_MAX), 1, usec);
-	if (result == U32_MAX)
-		return -ENODEV;
-
-	return ret;
-}
-
 /* reset a non-running (STS_HALT == 1) controller */
 static int ehci_reset(struct usb_hcd *hcd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 
-	u32 command = reg_read32(hcd->regs, HC_USBCMD);
-
-	command |= CMD_RESET;
-	reg_write32(hcd->regs, HC_USBCMD, command);
 	hcd->state = HC_STATE_HALT;
 	priv->next_statechange = jiffies;
 
-	return handshake(hcd, HC_USBCMD, CMD_RESET, 0, 250 * 1000);
+	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
 }
 
 static struct isp1760_qh *qh_alloc(gfp_t flags)
@@ -434,8 +467,10 @@ static void qh_free(struct isp1760_qh *qh)
 /* one-time init, only for memory state */
 static int priv_init(struct usb_hcd *hcd)
 {
-	struct isp1760_hcd		*priv = hcd_to_priv(hcd);
-	u32			hcc_params;
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	u32 isoc_cache;
+	u32 isoc_thres;
+
 	int i;
 
 	spin_lock_init(&priv->lock);
@@ -450,12 +485,14 @@ static int priv_init(struct usb_hcd *hcd)
 	priv->periodic_size = DEFAULT_I_TDPS;
 
 	/* controllers may cache some of the periodic schedule ... */
-	hcc_params = reg_read32(hcd->regs, HC_HCCPARAMS);
+	isoc_cache = isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
+	isoc_thres = isp1760_hcd_read(hcd, HCC_ISOC_THRES);
+
 	/* full frame cache */
-	if (HCC_ISOC_CACHE(hcc_params))
+	if (isoc_cache)
 		priv->i_thresh = 8;
 	else /* N microframes cached */
-		priv->i_thresh = 2 + HCC_ISOC_THRES(hcc_params);
+		priv->i_thresh = 2 + isoc_thres;
 
 	return 0;
 }
@@ -464,12 +501,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 	int result;
-	u32 scratch, hwmode;
+	u32 scratch;
+
+	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
 
-	reg_write32(hcd->regs, HC_SCRATCH_REG, 0xdeadbabe);
 	/* Change bus pattern */
-	scratch = reg_read32(hcd->regs, HC_CHIP_ID_REG);
-	scratch = reg_read32(hcd->regs, HC_SCRATCH_REG);
+	scratch = isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
+	scratch = isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
 	if (scratch != 0xdeadbabe) {
 		dev_err(hcd->self.controller, "Scratch test failed.\n");
 		return -ENODEV;
@@ -483,10 +521,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
 	 * the host controller through the EHCI USB Command register. The device
 	 * has been reset in core code anyway, so this shouldn't matter.
 	 */
-	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG, 0);
-	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
-	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
-	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
+	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
+			  NO_TRANSFER_ACTIVE);
+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
+			  NO_TRANSFER_ACTIVE);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
+			  NO_TRANSFER_ACTIVE);
 
 	result = ehci_reset(hcd);
 	if (result)
@@ -495,14 +536,11 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
 	/* Step 11 passed */
 
 	/* ATL reset */
-	hwmode = reg_read32(hcd->regs, HC_HW_MODE_CTRL) & ~ALL_ATX_RESET;
-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode | ALL_ATX_RESET);
+	isp1760_hcd_set(hcd, ALL_ATX_RESET);
 	mdelay(10);
-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode);
+	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
 
-	reg_write32(hcd->regs, HC_INTERRUPT_ENABLE, INTERRUPT_ENABLE_MASK);
-
-	priv->hcs_params = reg_read32(hcd->regs, HC_HCSPARAMS);
+	isp1760_hcd_set(hcd, HC_INT_ENABLE);
 
 	return priv_init(hcd);
 }
@@ -732,12 +770,12 @@ static void start_bus_transfer(struct usb_hcd *hcd, u32 ptd_offset, int slot,
 
 	/* Make sure done map has not triggered from some unlinked transfer */
 	if (ptd_offset == ATL_PTD_OFFSET) {
-		priv->atl_done_map |= reg_read32(hcd->regs,
-						HC_ATL_PTD_DONEMAP_REG);
+		priv->atl_done_map |= isp1760_reg_read(priv->regs,
+						ISP176x_HC_ATL_PTD_DONEMAP);
 		priv->atl_done_map &= ~(1 << slot);
 	} else {
-		priv->int_done_map |= reg_read32(hcd->regs,
-						HC_INT_PTD_DONEMAP_REG);
+		priv->int_done_map |= isp1760_reg_read(priv->regs,
+					       ISP176x_HC_INT_PTD_DONEMAP);
 		priv->int_done_map &= ~(1 << slot);
 	}
 
@@ -746,16 +784,20 @@ static void start_bus_transfer(struct usb_hcd *hcd, u32 ptd_offset, int slot,
 	slots[slot].timestamp = jiffies;
 	slots[slot].qtd = qtd;
 	slots[slot].qh = qh;
-	ptd_write(hcd->regs, ptd_offset, slot, ptd);
+	ptd_write(priv->base, ptd_offset, slot, ptd);
 
 	if (ptd_offset == ATL_PTD_OFFSET) {
-		skip_map = reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
+		skip_map = isp1760_reg_read(priv->regs,
+					    ISP176x_HC_ATL_PTD_SKIPMAP);
 		skip_map &= ~(1 << qh->slot);
-		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
+		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
+				  skip_map);
 	} else {
-		skip_map = reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
+		skip_map = isp1760_reg_read(priv->regs,
+					    ISP176x_HC_INT_PTD_SKIPMAP);
 		skip_map &= ~(1 << qh->slot);
-		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
+		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
+				  skip_map);
 	}
 }
 
@@ -768,9 +810,10 @@ static int is_short_bulk(struct isp1760_qtd *qtd)
 static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
 						struct list_head *urb_list)
 {
-	int last_qtd;
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 	struct isp1760_qtd *qtd, *qtd_next;
 	struct urb_listitem *urb_listitem;
+	int last_qtd;
 
 	list_for_each_entry_safe(qtd, qtd_next, &qh->qtd_list, qtd_list) {
 		if (qtd->status < QTD_XFER_COMPLETE)
@@ -785,9 +828,10 @@ static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
 			if (qtd->actual_length) {
 				switch (qtd->packet_type) {
 				case IN_PID:
-					mem_reads8(hcd->regs, qtd->payload_addr,
-							qtd->data_buffer,
-							qtd->actual_length);
+					mem_reads8(hcd, priv->base,
+						   qtd->payload_addr,
+						   qtd->data_buffer,
+						   qtd->actual_length);
 					fallthrough;
 				case OUT_PID:
 					qtd->urb->actual_length +=
@@ -875,8 +919,8 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
 			if ((qtd->length) &&
 			    ((qtd->packet_type == SETUP_PID) ||
 			     (qtd->packet_type == OUT_PID))) {
-				mem_writes8(hcd->regs, qtd->payload_addr,
-						qtd->data_buffer, qtd->length);
+				mem_writes8(priv->base, qtd->payload_addr,
+					    qtd->data_buffer, qtd->length);
 			}
 
 			qtd->status = QTD_PAYLOAD_ALLOC;
@@ -1076,9 +1120,9 @@ static void handle_done_ptds(struct usb_hcd *hcd)
 	int modified;
 	int skip_map;
 
-	skip_map = reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
+	skip_map = isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP);
 	priv->int_done_map &= ~skip_map;
-	skip_map = reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
+	skip_map = isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP);
 	priv->atl_done_map &= ~skip_map;
 
 	modified = priv->int_done_map || priv->atl_done_map;
@@ -1096,7 +1140,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
 				continue;
 			}
 			ptd_offset = INT_PTD_OFFSET;
-			ptd_read(hcd->regs, INT_PTD_OFFSET, slot, &ptd);
+			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
 			state = check_int_transfer(hcd, &ptd,
 							slots[slot].qtd->urb);
 		} else {
@@ -1111,7 +1155,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
 				continue;
 			}
 			ptd_offset = ATL_PTD_OFFSET;
-			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
+			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
 			state = check_atl_transfer(hcd, &ptd,
 							slots[slot].qtd->urb);
 		}
@@ -1136,7 +1180,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
 
 			qtd->status = QTD_XFER_COMPLETE;
 			if (list_is_last(&qtd->qtd_list, &qh->qtd_list) ||
-							is_short_bulk(qtd))
+			    is_short_bulk(qtd))
 				qtd = NULL;
 			else
 				qtd = list_entry(qtd->qtd_list.next,
@@ -1212,13 +1256,15 @@ static irqreturn_t isp1760_irq(struct usb_hcd *hcd)
 	if (!(hcd->state & HC_STATE_RUNNING))
 		goto leave;
 
-	imask = reg_read32(hcd->regs, HC_INTERRUPT_REG);
+	imask = isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
 	if (unlikely(!imask))
 		goto leave;
-	reg_write32(hcd->regs, HC_INTERRUPT_REG, imask); /* Clear */
+	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Clear */
 
-	priv->int_done_map |= reg_read32(hcd->regs, HC_INT_PTD_DONEMAP_REG);
-	priv->atl_done_map |= reg_read32(hcd->regs, HC_ATL_PTD_DONEMAP_REG);
+	priv->int_done_map |= isp1760_reg_read(priv->regs,
+					       ISP176x_HC_INT_PTD_DONEMAP);
+	priv->atl_done_map |= isp1760_reg_read(priv->regs,
+					       ISP176x_HC_ATL_PTD_DONEMAP);
 
 	handle_done_ptds(hcd);
 
@@ -1273,7 +1319,7 @@ static void errata2_function(struct timer_list *unused)
 		if (priv->atl_slots[slot].qh && time_after(jiffies,
 					priv->atl_slots[slot].timestamp +
 					msecs_to_jiffies(SLOT_TIMEOUT))) {
-			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
+			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
 			if (!FROM_DW0_VALID(ptd.dw0) &&
 					!FROM_DW3_ACTIVE(ptd.dw3))
 				priv->atl_done_map |= 1 << slot;
@@ -1290,9 +1336,8 @@ static void errata2_function(struct timer_list *unused)
 
 static int isp1760_run(struct usb_hcd *hcd)
 {
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 	int retval;
-	u32 temp;
-	u32 command;
 	u32 chipid;
 
 	hcd->uses_new_polling = 1;
@@ -1300,23 +1345,20 @@ static int isp1760_run(struct usb_hcd *hcd)
 	hcd->state = HC_STATE_RUNNING;
 
 	/* Set PTD interrupt AND & OR maps */
-	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_AND_REG, 0);
-	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_OR_REG, 0xffffffff);
-	reg_write32(hcd->regs, HC_INT_IRQ_MASK_AND_REG, 0);
-	reg_write32(hcd->regs, HC_INT_IRQ_MASK_OR_REG, 0xffffffff);
-	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_AND_REG, 0);
-	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_OR_REG, 0xffffffff);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xffffffff);
+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xffffffff);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xffffffff);
 	/* step 23 passed */
 
-	temp = reg_read32(hcd->regs, HC_HW_MODE_CTRL);
-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp | HW_GLOBAL_INTR_EN);
+	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
 
-	command = reg_read32(hcd->regs, HC_USBCMD);
-	command &= ~(CMD_LRESET|CMD_RESET);
-	command |= CMD_RUN;
-	reg_write32(hcd->regs, HC_USBCMD, command);
+	isp1760_hcd_clear(hcd, CMD_LRESET);
+	isp1760_hcd_clear(hcd, CMD_RESET);
 
-	retval = handshake(hcd, HC_USBCMD, CMD_RUN, CMD_RUN, 250 * 1000);
+	retval = isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000);
 	if (retval)
 		return retval;
 
@@ -1326,9 +1368,8 @@ static int isp1760_run(struct usb_hcd *hcd)
 	 * the semaphore while doing so.
 	 */
 	down_write(&ehci_cf_port_reset_rwsem);
-	reg_write32(hcd->regs, HC_CONFIGFLAG, FLAG_CF);
 
-	retval = handshake(hcd, HC_CONFIGFLAG, FLAG_CF, FLAG_CF, 250 * 1000);
+	retval = isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000);
 	up_write(&ehci_cf_port_reset_rwsem);
 	if (retval)
 		return retval;
@@ -1338,21 +1379,22 @@ static int isp1760_run(struct usb_hcd *hcd)
 	errata2_timer.expires = jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD);
 	add_timer(&errata2_timer);
 
-	chipid = reg_read32(hcd->regs, HC_CHIP_ID_REG);
+	chipid = isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
 	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n",
 					chipid & 0xffff, chipid >> 16);
 
 	/* PTD Register Init Part 2, Step 28 */
 
 	/* Setup registers controlling PTD checking */
-	reg_write32(hcd->regs, HC_ATL_PTD_LASTPTD_REG, 0x80000000);
-	reg_write32(hcd->regs, HC_INT_PTD_LASTPTD_REG, 0x80000000);
-	reg_write32(hcd->regs, HC_ISO_PTD_LASTPTD_REG, 0x00000001);
-	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, 0xffffffff);
-	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, 0xffffffff);
-	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, 0xffffffff);
-	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG,
-						ATL_BUF_FILL | INT_BUF_FILL);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000000);
+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000000);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000001);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xffffffff);
+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xffffffff);
+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xffffffff);
+
+	isp1760_hcd_set(hcd, ATL_BUF_FILL);
+	isp1760_hcd_set(hcd, INT_BUF_FILL);
 
 	/* GRR this is run-once init(), being done every time the HC starts.
 	 * So long as they're part of class devices, we can't do it init()
@@ -1586,15 +1628,19 @@ static void kill_transfer(struct usb_hcd *hcd, struct urb *urb,
 	/* We need to forcefully reclaim the slot since some transfers never
 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
-		skip_map = reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
+		skip_map = isp1760_reg_read(priv->regs,
+					    ISP176x_HC_ATL_PTD_SKIPMAP);
 		skip_map |= (1 << qh->slot);
-		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
+		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
+				  skip_map);
 		priv->atl_slots[qh->slot].qh = NULL;
 		priv->atl_slots[qh->slot].qtd = NULL;
 	} else {
-		skip_map = reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
+		skip_map = isp1760_reg_read(priv->regs,
+					    ISP176x_HC_INT_PTD_SKIPMAP);
 		skip_map |= (1 << qh->slot);
-		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
+		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
+				  skip_map);
 		priv->int_slots[qh->slot].qh = NULL;
 		priv->int_slots[qh->slot].qtd = NULL;
 	}
@@ -1707,8 +1753,7 @@ static void isp1760_endpoint_disable(struct usb_hcd *hcd,
 static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
-	u32 temp, status = 0;
-	u32 mask;
+	u32 status = 0;
 	int retval = 1;
 	unsigned long flags;
 
@@ -1718,17 +1763,13 @@ static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
 
 	/* init status to no-changes */
 	buf[0] = 0;
-	mask = PORT_CSC;
 
 	spin_lock_irqsave(&priv->lock, flags);
-	temp = reg_read32(hcd->regs, HC_PORTSC1);
 
-	if (temp & PORT_OWNER) {
-		if (temp & PORT_CSC) {
-			temp &= ~PORT_CSC;
-			reg_write32(hcd->regs, HC_PORTSC1, temp);
-			goto done;
-		}
+	if (isp1760_hcd_is_set(hcd, PORT_OWNER) &&
+	    isp1760_hcd_is_set(hcd, PORT_CSC)) {
+		isp1760_hcd_clear(hcd, PORT_CSC);
+		goto done;
 	}
 
 	/*
@@ -1737,11 +1778,9 @@ static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
 	 * high-speed device is switched over to the companion
 	 * controller by the user.
 	 */
-
-	if ((temp & mask) != 0
-			|| ((temp & PORT_RESUME) != 0
-				&& time_after_eq(jiffies,
-					priv->reset_done))) {
+	if (isp1760_hcd_is_set(hcd, PORT_CSC) ||
+	    (isp1760_hcd_is_set(hcd, PORT_RESUME) &&
+	     time_after_eq(jiffies, priv->reset_done))) {
 		buf [0] |= 1 << (0 + 1);
 		status = STS_PCD;
 	}
@@ -1754,9 +1793,11 @@ static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
 static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
 		struct usb_hub_descriptor *desc)
 {
-	int ports = HCS_N_PORTS(priv->hcs_params);
+	int ports;
 	u16 temp;
 
+	ports = isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
+
 	desc->bDescriptorType = USB_DT_HUB;
 	/* priv 1.0, 2.3.9 says 20ms max */
 	desc->bPwrOn2PwrGood = 10;
@@ -1772,7 +1813,7 @@ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
 
 	/* per-port overcurrent reporting */
 	temp = HUB_CHAR_INDV_PORT_OCPM;
-	if (HCS_PPC(priv->hcs_params))
+	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
 		/* per-port power control */
 		temp |= HUB_CHAR_INDV_PORT_LPSM;
 	else
@@ -1783,38 +1824,37 @@ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
 
 #define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
 
-static int check_reset_complete(struct usb_hcd *hcd, int index,
-		int port_status)
+static void check_reset_complete(struct usb_hcd *hcd, int index)
 {
-	if (!(port_status & PORT_CONNECT))
-		return port_status;
+	if (!(isp1760_hcd_is_set(hcd, PORT_CONNECT)))
+		return;
 
 	/* if reset finished and it's still not enabled -- handoff */
-	if (!(port_status & PORT_PE)) {
-
+	if (!isp1760_hcd_is_set(hcd, PORT_PE)) {
 		dev_info(hcd->self.controller,
-					"port %d full speed --> companion\n",
-					index + 1);
+			 "port %d full speed --> companion\n", index + 1);
 
-		port_status |= PORT_OWNER;
-		port_status &= ~PORT_RWC_BITS;
-		reg_write32(hcd->regs, HC_PORTSC1, port_status);
+		isp1760_hcd_set(hcd, PORT_OWNER);
 
-	} else
+		isp1760_hcd_clear(hcd, PORT_CSC);
+	} else {
 		dev_info(hcd->self.controller, "port %d high speed\n",
-								index + 1);
+			 index + 1);
+	}
 
-	return port_status;
+	return;
 }
 
 static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		u16 wValue, u16 wIndex, char *buf, u16 wLength)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
-	int ports = HCS_N_PORTS(priv->hcs_params);
-	u32 temp, status;
+	u32 status;
 	unsigned long flags;
 	int retval = 0;
+	int ports;
+
+	ports = isp1760_hcd_read(hcd, HCS_N_PORTS);
 
 	/*
 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
@@ -1839,7 +1879,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		if (!wIndex || wIndex > ports)
 			goto error;
 		wIndex--;
-		temp = reg_read32(hcd->regs, HC_PORTSC1);
 
 		/*
 		 * Even if OWNER is set, so the port is owned by the
@@ -1850,22 +1889,22 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 
 		switch (wValue) {
 		case USB_PORT_FEAT_ENABLE:
-			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_PE);
+			isp1760_hcd_clear(hcd, PORT_PE);
 			break;
 		case USB_PORT_FEAT_C_ENABLE:
 			/* XXX error? */
 			break;
 		case USB_PORT_FEAT_SUSPEND:
-			if (temp & PORT_RESET)
+			if (isp1760_hcd_is_set(hcd, PORT_RESET))
 				goto error;
 
-			if (temp & PORT_SUSPEND) {
-				if ((temp & PORT_PE) == 0)
+			if (isp1760_hcd_is_set(hcd, PORT_SUSPEND)) {
+				if (!isp1760_hcd_is_set(hcd, PORT_PE))
 					goto error;
 				/* resume signaling for 20 msec */
-				temp &= ~(PORT_RWC_BITS);
-				reg_write32(hcd->regs, HC_PORTSC1,
-							temp | PORT_RESUME);
+				isp1760_hcd_clear(hcd, PORT_CSC);
+				isp1760_hcd_set(hcd, PORT_RESUME);
+
 				priv->reset_done = jiffies +
 					msecs_to_jiffies(USB_RESUME_TIMEOUT);
 			}
@@ -1874,12 +1913,11 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 			/* we auto-clear this feature */
 			break;
 		case USB_PORT_FEAT_POWER:
-			if (HCS_PPC(priv->hcs_params))
-				reg_write32(hcd->regs, HC_PORTSC1,
-							temp & ~PORT_POWER);
+			if (isp1760_hcd_is_set(hcd, HCS_PPC))
+				isp1760_hcd_clear(hcd, PORT_POWER);
 			break;
 		case USB_PORT_FEAT_C_CONNECTION:
-			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_CSC);
+			isp1760_hcd_set(hcd, PORT_CSC);
 			break;
 		case USB_PORT_FEAT_C_OVER_CURRENT:
 			/* XXX error ?*/
@@ -1890,7 +1928,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		default:
 			goto error;
 		}
-		reg_read32(hcd->regs, HC_USBCMD);
+		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
 		break;
 	case GetHubDescriptor:
 		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
@@ -1905,15 +1943,14 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 			goto error;
 		wIndex--;
 		status = 0;
-		temp = reg_read32(hcd->regs, HC_PORTSC1);
 
 		/* wPortChange bits */
-		if (temp & PORT_CSC)
+		if (isp1760_hcd_is_set(hcd, PORT_CSC))
 			status |= USB_PORT_STAT_C_CONNECTION << 16;
 
 
 		/* whoever resumes must GetPortStatus to complete it!! */
-		if (temp & PORT_RESUME) {
+		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
 			dev_err(hcd->self.controller, "Port resume should be skipped.\n");
 
 			/* Remote Wakeup received? */
@@ -1932,35 +1969,31 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 				priv->reset_done = 0;
 
 				/* stop resume signaling */
-				temp = reg_read32(hcd->regs, HC_PORTSC1);
-				reg_write32(hcd->regs, HC_PORTSC1,
-					temp & ~(PORT_RWC_BITS | PORT_RESUME));
-				retval = handshake(hcd, HC_PORTSC1,
-					   PORT_RESUME, 0, 2000 /* 2msec */);
+				isp1760_hcd_clear(hcd, PORT_CSC);
+
+				retval = isp1760_hcd_clear_poll_timeout(hcd,
+							  PORT_RESUME, 2000);
 				if (retval != 0) {
 					dev_err(hcd->self.controller,
 						"port %d resume error %d\n",
 						wIndex + 1, retval);
 					goto error;
 				}
-				temp &= ~(PORT_SUSPEND|PORT_RESUME|(3<<10));
 			}
 		}
 
 		/* whoever resets must GetPortStatus to complete it!! */
-		if ((temp & PORT_RESET)
-				&& time_after_eq(jiffies,
-					priv->reset_done)) {
+		if (isp1760_hcd_is_set(hcd, PORT_RESET) &&
+		    time_after_eq(jiffies, priv->reset_done)) {
 			status |= USB_PORT_STAT_C_RESET << 16;
 			priv->reset_done = 0;
 
 			/* force reset to complete */
-			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_RESET);
 			/* REVISIT:  some hardware needs 550+ usec to clear
 			 * this bit; seems too long to spin routinely...
 			 */
-			retval = handshake(hcd, HC_PORTSC1,
-					PORT_RESET, 0, 750);
+			retval = isp1760_hcd_clear_poll_timeout(hcd, PORT_RESET,
+								750);
 			if (retval != 0) {
 				dev_err(hcd->self.controller, "port %d reset error %d\n",
 						wIndex + 1, retval);
@@ -1968,8 +2001,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 			}
 
 			/* see what we found out */
-			temp = check_reset_complete(hcd, wIndex,
-					reg_read32(hcd->regs, HC_PORTSC1));
+			check_reset_complete(hcd, wIndex);
 		}
 		/*
 		 * Even if OWNER is set, there's no harm letting hub_wq
@@ -1977,21 +2009,22 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		 * for PORT_POWER anyway).
 		 */
 
-		if (temp & PORT_OWNER)
+		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
 			dev_err(hcd->self.controller, "PORT_OWNER is set\n");
 
-		if (temp & PORT_CONNECT) {
+		if (isp1760_hcd_is_set(hcd, PORT_CONNECT)) {
 			status |= USB_PORT_STAT_CONNECTION;
 			/* status may be from integrated TT */
 			status |= USB_PORT_STAT_HIGH_SPEED;
 		}
-		if (temp & PORT_PE)
+		if (isp1760_hcd_is_set(hcd, PORT_PE))
 			status |= USB_PORT_STAT_ENABLE;
-		if (temp & (PORT_SUSPEND|PORT_RESUME))
+		if (isp1760_hcd_is_set(hcd, PORT_SUSPEND) &&
+		    isp1760_hcd_is_set(hcd, PORT_RESUME))
 			status |= USB_PORT_STAT_SUSPEND;
-		if (temp & PORT_RESET)
+		if (isp1760_hcd_is_set(hcd, PORT_RESET))
 			status |= USB_PORT_STAT_RESET;
-		if (temp & PORT_POWER)
+		if (isp1760_hcd_is_set(hcd, PORT_POWER))
 			status |= USB_PORT_STAT_POWER;
 
 		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
@@ -2011,41 +2044,39 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		if (!wIndex || wIndex > ports)
 			goto error;
 		wIndex--;
-		temp = reg_read32(hcd->regs, HC_PORTSC1);
-		if (temp & PORT_OWNER)
+		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
 			break;
 
-/*		temp &= ~PORT_RWC_BITS; */
 		switch (wValue) {
 		case USB_PORT_FEAT_ENABLE:
-			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_PE);
+			isp1760_hcd_set(hcd, PORT_PE);
 			break;
 
 		case USB_PORT_FEAT_SUSPEND:
-			if ((temp & PORT_PE) == 0
-					|| (temp & PORT_RESET) != 0)
+			if (!isp1760_hcd_is_set(hcd, PORT_PE) ||
+			    isp1760_hcd_is_set(hcd, PORT_RESET))
 				goto error;
 
-			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_SUSPEND);
+			isp1760_hcd_set(hcd, PORT_SUSPEND);
 			break;
 		case USB_PORT_FEAT_POWER:
-			if (HCS_PPC(priv->hcs_params))
-				reg_write32(hcd->regs, HC_PORTSC1,
-							temp | PORT_POWER);
+			if (isp1760_hcd_is_set(hcd, HCS_PPC))
+				isp1760_hcd_set(hcd, PORT_POWER);
 			break;
 		case USB_PORT_FEAT_RESET:
-			if (temp & PORT_RESUME)
+			if (isp1760_hcd_is_set(hcd, PORT_RESUME))
 				goto error;
 			/* line status bits may report this as low speed,
 			 * which can be fine if this root hub has a
 			 * transaction translator built in.
 			 */
-			if ((temp & (PORT_PE|PORT_CONNECT)) == PORT_CONNECT
-					&& PORT_USB11(temp)) {
-				temp |= PORT_OWNER;
+			if ((isp1760_hcd_is_set(hcd, PORT_CONNECT) &&
+			     !isp1760_hcd_is_set(hcd, PORT_PE)) &&
+			    (isp1760_hcd_read(hcd, PORT_LSTATUS) == 1)) {
+				isp1760_hcd_set(hcd, PORT_OWNER);
 			} else {
-				temp |= PORT_RESET;
-				temp &= ~PORT_PE;
+				isp1760_hcd_set(hcd, PORT_RESET);
+				isp1760_hcd_clear(hcd, PORT_PE);
 
 				/*
 				 * caller must wait, then call GetPortStatus
@@ -2054,12 +2085,11 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 				priv->reset_done = jiffies +
 					msecs_to_jiffies(50);
 			}
-			reg_write32(hcd->regs, HC_PORTSC1, temp);
 			break;
 		default:
 			goto error;
 		}
-		reg_read32(hcd->regs, HC_USBCMD);
+		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
 		break;
 
 	default:
@@ -2076,14 +2106,13 @@ static int isp1760_get_frame(struct usb_hcd *hcd)
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 	u32 fr;
 
-	fr = reg_read32(hcd->regs, HC_FRINDEX);
+	fr = isp1760_hcd_read(hcd, HC_FRINDEX);
 	return (fr >> 3) % priv->periodic_size;
 }
 
 static void isp1760_stop(struct usb_hcd *hcd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
-	u32 temp;
 
 	del_timer(&errata2_timer);
 
@@ -2094,24 +2123,19 @@ static void isp1760_stop(struct usb_hcd *hcd)
 	spin_lock_irq(&priv->lock);
 	ehci_reset(hcd);
 	/* Disable IRQ */
-	temp = reg_read32(hcd->regs, HC_HW_MODE_CTRL);
-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &= ~HW_GLOBAL_INTR_EN);
+	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
 	spin_unlock_irq(&priv->lock);
 
-	reg_write32(hcd->regs, HC_CONFIGFLAG, 0);
+	isp1760_hcd_clear(hcd, FLAG_CF);
 }
 
 static void isp1760_shutdown(struct usb_hcd *hcd)
 {
-	u32 command, temp;
-
 	isp1760_stop(hcd);
-	temp = reg_read32(hcd->regs, HC_HW_MODE_CTRL);
-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &= ~HW_GLOBAL_INTR_EN);
 
-	command = reg_read32(hcd->regs, HC_USBCMD);
-	command &= ~CMD_RUN;
-	reg_write32(hcd->regs, HC_USBCMD, command);
+	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
+
+	isp1760_hcd_clear(hcd, CMD_RUN);
 }
 
 static void isp1760_clear_tt_buffer_complete(struct usb_hcd *hcd,
@@ -2184,8 +2208,8 @@ void isp1760_deinit_kmem_cache(void)
 	kmem_cache_destroy(urb_listitem_cachep);
 }
 
-int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
-			 struct resource *mem, int irq, unsigned long irqflags,
+int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
+			 int irq, unsigned long irqflags,
 			 struct device *dev)
 {
 	struct usb_hcd *hcd;
@@ -2202,7 +2226,6 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
 	init_memory(priv);
 
 	hcd->irq = irq;
-	hcd->regs = regs;
 	hcd->rsrc_start = mem->start;
 	hcd->rsrc_len = resource_size(mem);
 
diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
index f1bb2deb1ccf..34e1899e52c4 100644
--- a/drivers/usb/isp1760/isp1760-hcd.h
+++ b/drivers/usb/isp1760/isp1760-hcd.h
@@ -3,6 +3,9 @@
 #define _ISP1760_HCD_H_
 
 #include <linux/spinlock.h>
+#include <linux/regmap.h>
+
+#include "isp1760-regs.h"
 
 struct isp1760_qh;
 struct isp1760_qtd;
@@ -48,10 +51,13 @@ enum isp1760_queue_head_types {
 };
 
 struct isp1760_hcd {
-#ifdef CONFIG_USB_ISP1760_HCD
 	struct usb_hcd		*hcd;
 
-	u32 hcs_params;
+	void __iomem		*base;
+
+	struct regmap		*regs;
+	struct regmap_field	*fields[HC_FIELD_MAX];
+
 	spinlock_t		lock;
 	struct isp1760_slotinfo	atl_slots[32];
 	int			atl_done_map;
@@ -66,20 +72,18 @@ struct isp1760_hcd {
 	unsigned		i_thresh;
 	unsigned long		reset_done;
 	unsigned long		next_statechange;
-#endif
 };
 
 #ifdef CONFIG_USB_ISP1760_HCD
-int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
-			 struct resource *mem, int irq, unsigned long irqflags,
-			 struct device *dev);
+int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
+			 int irq, unsigned long irqflags, struct device *dev);
 void isp1760_hcd_unregister(struct isp1760_hcd *priv);
 
 int isp1760_init_kmem_once(void);
 void isp1760_deinit_kmem_cache(void);
 #else
 static inline int isp1760_hcd_register(struct isp1760_hcd *priv,
-				       void __iomem *regs, struct resource *mem,
+				       struct resource *mem,
 				       int irq, unsigned long irqflags,
 				       struct device *dev)
 {
diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index ccd30f835888..abfba9f5ec23 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -75,9 +75,9 @@ static int isp1761_pci_init(struct pci_dev *dev)
 		/*by default host is in 16bit mode, so
 		 * io operations at this stage must be 16 bit
 		 * */
-		writel(0xface, iobase + HC_SCRATCH_REG);
+		writel(0xface, iobase + ISP176x_HC_SCRATCH);
 		udelay(100);
-		reg_data = readl(iobase + HC_SCRATCH_REG) & 0x0000ffff;
+		reg_data = readl(iobase + ISP176x_HC_SCRATCH) & 0x0000ffff;
 		retry_count--;
 	}
 
diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
index fedc4f5cded0..0d5262c37c5b 100644
--- a/drivers/usb/isp1760/isp1760-regs.h
+++ b/drivers/usb/isp1760/isp1760-regs.h
@@ -10,218 +10,182 @@
  *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
-#ifndef _ISP1760_REGS_H_
-#define _ISP1760_REGS_H_
+#ifndef _ISP176x_REGS_H_
+#define _ISP176x_REGS_H_
 
 /* -----------------------------------------------------------------------------
  * Host Controller
  */
 
 /* EHCI capability registers */
-#define HC_CAPLENGTH		0x000
-#define HC_LENGTH(p)		(((p) >> 00) & 0x00ff)	/* bits 7:0 */
-#define HC_VERSION(p)		(((p) >> 16) & 0xffff)	/* bits 31:16 */
-
-#define HC_HCSPARAMS		0x004
-#define HCS_INDICATOR(p)	((p) & (1 << 16))	/* true: has port indicators */
-#define HCS_PPC(p)		((p) & (1 << 4))	/* true: port power control */
-#define HCS_N_PORTS(p)		(((p) >> 0) & 0xf)	/* bits 3:0, ports on HC */
-
-#define HC_HCCPARAMS		0x008
-#define HCC_ISOC_CACHE(p)       ((p) & (1 << 7))	/* true: can cache isoc frame */
-#define HCC_ISOC_THRES(p)       (((p) >> 4) & 0x7)	/* bits 6:4, uframes cached */
+#define ISP176x_HC_CAPLENGTH		0x000
+#define ISP176x_HC_VERSION		0x002
+#define ISP176x_HC_HCSPARAMS		0x004
+#define ISP176x_HC_HCCPARAMS		0x008
 
 /* EHCI operational registers */
-#define HC_USBCMD		0x020
-#define CMD_LRESET		(1 << 7)		/* partial reset (no ports, etc) */
-#define CMD_RESET		(1 << 1)		/* reset HC not bus */
-#define CMD_RUN			(1 << 0)		/* start/stop HC */
-
-#define HC_USBSTS		0x024
-#define STS_PCD			(1 << 2)		/* port change detect */
-
-#define HC_FRINDEX		0x02c
-
-#define HC_CONFIGFLAG		0x060
-#define FLAG_CF			(1 << 0)		/* true: we'll support "high speed" */
-
-#define HC_PORTSC1		0x064
-#define PORT_OWNER		(1 << 13)		/* true: companion hc owns this port */
-#define PORT_POWER		(1 << 12)		/* true: has power (see PPC) */
-#define PORT_USB11(x)		(((x) & (3 << 10)) == (1 << 10))	/* USB 1.1 device */
-#define PORT_RESET		(1 << 8)		/* reset port */
-#define PORT_SUSPEND		(1 << 7)		/* suspend port */
-#define PORT_RESUME		(1 << 6)		/* resume it */
-#define PORT_PE			(1 << 2)		/* port enable */
-#define PORT_CSC		(1 << 1)		/* connect status change */
-#define PORT_CONNECT		(1 << 0)		/* device connected */
-#define PORT_RWC_BITS		(PORT_CSC)
-
-#define HC_ISO_PTD_DONEMAP_REG	0x130
-#define HC_ISO_PTD_SKIPMAP_REG	0x134
-#define HC_ISO_PTD_LASTPTD_REG	0x138
-#define HC_INT_PTD_DONEMAP_REG	0x140
-#define HC_INT_PTD_SKIPMAP_REG	0x144
-#define HC_INT_PTD_LASTPTD_REG	0x148
-#define HC_ATL_PTD_DONEMAP_REG	0x150
-#define HC_ATL_PTD_SKIPMAP_REG	0x154
-#define HC_ATL_PTD_LASTPTD_REG	0x158
+#define ISP176x_HC_USBCMD		0x020
+#define ISP176x_HC_USBSTS		0x024
+#define ISP176x_HC_FRINDEX		0x02c
+
+#define ISP176x_HC_CONFIGFLAG		0x060
+#define ISP176x_HC_PORTSC1		0x064
+
+#define ISP176x_HC_ISO_PTD_DONEMAP	0x130
+#define ISP176x_HC_ISO_PTD_SKIPMAP	0x134
+#define ISP176x_HC_ISO_PTD_LASTPTD	0x138
+#define ISP176x_HC_INT_PTD_DONEMAP	0x140
+#define ISP176x_HC_INT_PTD_SKIPMAP	0x144
+#define ISP176x_HC_INT_PTD_LASTPTD	0x148
+#define ISP176x_HC_ATL_PTD_DONEMAP	0x150
+#define ISP176x_HC_ATL_PTD_SKIPMAP	0x154
+#define ISP176x_HC_ATL_PTD_LASTPTD	0x158
 
 /* Configuration Register */
-#define HC_HW_MODE_CTRL		0x300
-#define ALL_ATX_RESET		(1 << 31)
-#define HW_ANA_DIGI_OC		(1 << 15)
-#define HW_DEV_DMA		(1 << 11)
-#define HW_COMN_IRQ		(1 << 10)
-#define HW_COMN_DMA		(1 << 9)
-#define HW_DATA_BUS_32BIT	(1 << 8)
-#define HW_DACK_POL_HIGH	(1 << 6)
-#define HW_DREQ_POL_HIGH	(1 << 5)
-#define HW_INTR_HIGH_ACT	(1 << 2)
-#define HW_INTR_EDGE_TRIG	(1 << 1)
-#define HW_GLOBAL_INTR_EN	(1 << 0)
-
-#define HC_CHIP_ID_REG		0x304
-#define HC_SCRATCH_REG		0x308
-
-#define HC_RESET_REG		0x30c
-#define SW_RESET_RESET_HC	(1 << 1)
-#define SW_RESET_RESET_ALL	(1 << 0)
-
-#define HC_BUFFER_STATUS_REG	0x334
-#define ISO_BUF_FILL		(1 << 2)
-#define INT_BUF_FILL		(1 << 1)
-#define ATL_BUF_FILL		(1 << 0)
-
-#define HC_MEMORY_REG		0x33c
-#define ISP_BANK(x)		((x) << 16)
-
-#define HC_PORT1_CTRL		0x374
-#define PORT1_POWER		(3 << 3)
-#define PORT1_INIT1		(1 << 7)
-#define PORT1_INIT2		(1 << 23)
-#define HW_OTG_CTRL_SET		0x374
-#define HW_OTG_CTRL_CLR		0x376
-#define HW_OTG_DISABLE		(1 << 10)
-#define HW_OTG_SE0_EN		(1 << 9)
-#define HW_BDIS_ACON_EN		(1 << 8)
-#define HW_SW_SEL_HC_DC		(1 << 7)
-#define HW_VBUS_CHRG		(1 << 6)
-#define HW_VBUS_DISCHRG		(1 << 5)
-#define HW_VBUS_DRV		(1 << 4)
-#define HW_SEL_CP_EXT		(1 << 3)
-#define HW_DM_PULLDOWN		(1 << 2)
-#define HW_DP_PULLDOWN		(1 << 1)
-#define HW_DP_PULLUP		(1 << 0)
+#define ISP176x_HC_HW_MODE_CTRL		0x300
+#define ISP176x_HC_CHIP_ID		0x304
+#define ISP176x_HC_SCRATCH		0x308
+#define ISP176x_HC_RESET		0x30c
+#define ISP176x_HC_BUFFER_STATUS	0x334
+#define ISP176x_HC_MEMORY		0x33c
 
 /* Interrupt Register */
-#define HC_INTERRUPT_REG	0x310
-
-#define HC_INTERRUPT_ENABLE	0x314
-#define HC_ISO_INT		(1 << 9)
-#define HC_ATL_INT		(1 << 8)
-#define HC_INTL_INT		(1 << 7)
-#define HC_EOT_INT		(1 << 3)
-#define HC_SOT_INT		(1 << 1)
-#define INTERRUPT_ENABLE_MASK	(HC_INTL_INT | HC_ATL_INT)
-
-#define HC_ISO_IRQ_MASK_OR_REG	0x318
-#define HC_INT_IRQ_MASK_OR_REG	0x31c
-#define HC_ATL_IRQ_MASK_OR_REG	0x320
-#define HC_ISO_IRQ_MASK_AND_REG	0x324
-#define HC_INT_IRQ_MASK_AND_REG	0x328
-#define HC_ATL_IRQ_MASK_AND_REG	0x32c
+#define ISP176x_HC_INTERRUPT		0x310
+#define ISP176x_HC_INTERRUPT_ENABLE	0x314
+#define ISP176x_HC_ISO_IRQ_MASK_OR	0x318
+#define ISP176x_HC_INT_IRQ_MASK_OR	0x31c
+#define ISP176x_HC_ATL_IRQ_MASK_OR	0x320
+#define ISP176x_HC_ISO_IRQ_MASK_AND	0x324
+#define ISP176x_HC_INT_IRQ_MASK_AND	0x328
+#define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
+
+enum isp176x_host_controller_fields {
+	/* HC_HCSPARAMS */
+	HCS_PPC, HCS_N_PORTS,
+	/* HC_HCCPARAMS */
+	HCC_ISOC_CACHE, HCC_ISOC_THRES,
+	/* HC_USBCMD */
+	CMD_LRESET, CMD_RESET, CMD_RUN,
+	/* HC_USBSTS */
+	STS_PCD,
+	/* HC_FRINDEX */
+	HC_FRINDEX,
+	/* HC_CONFIGFLAG */
+	FLAG_CF,
+	/* HC_PORTSC1 */
+	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
+	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
+	/* HC_HW_MODE_CTRL */
+	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
+	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_ACT,
+	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
+	/* HC_RESET */
+	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
+	/* HC_BUFFER_STATUS */
+	INT_BUF_FILL, ATL_BUF_FILL,
+	/* HC_MEMORY */
+	MEM_BANK_SEL, MEM_START_ADDR,
+	/* HC_INTERRUPT_ENABLE */
+	HC_INT_ENABLE,
+	/* Last element */
+	HC_FIELD_MAX,
+};
 
 /* -----------------------------------------------------------------------------
  * Peripheral Controller
  */
 
-/* Initialization Registers */
-#define DC_ADDRESS			0x0200
-#define DC_DEVEN			(1 << 7)
-
-#define DC_MODE				0x020c
-#define DC_DMACLKON			(1 << 9)
-#define DC_VBUSSTAT			(1 << 8)
-#define DC_CLKAON			(1 << 7)
-#define DC_SNDRSU			(1 << 6)
-#define DC_GOSUSP			(1 << 5)
-#define DC_SFRESET			(1 << 4)
-#define DC_GLINTENA			(1 << 3)
-#define DC_WKUPCS			(1 << 2)
-
-#define DC_INTCONF			0x0210
-#define DC_CDBGMOD_ACK_NAK		(0 << 6)
-#define DC_CDBGMOD_ACK			(1 << 6)
-#define DC_CDBGMOD_ACK_1NAK		(2 << 6)
-#define DC_DDBGMODIN_ACK_NAK		(0 << 4)
-#define DC_DDBGMODIN_ACK		(1 << 4)
-#define DC_DDBGMODIN_ACK_1NAK		(2 << 4)
-#define DC_DDBGMODOUT_ACK_NYET_NAK	(0 << 2)
-#define DC_DDBGMODOUT_ACK_NYET		(1 << 2)
-#define DC_DDBGMODOUT_ACK_NYET_1NAK	(2 << 2)
-#define DC_INTLVL			(1 << 1)
-#define DC_INTPOL			(1 << 0)
-
-#define DC_DEBUG			0x0212
-#define DC_INTENABLE			0x0214
 #define DC_IEPTX(n)			(1 << (11 + 2 * (n)))
 #define DC_IEPRX(n)			(1 << (10 + 2 * (n)))
 #define DC_IEPRXTX(n)			(3 << (10 + 2 * (n)))
-#define DC_IEP0SETUP			(1 << 8)
-#define DC_IEVBUS			(1 << 7)
-#define DC_IEDMA			(1 << 6)
-#define DC_IEHS_STA			(1 << 5)
-#define DC_IERESM			(1 << 4)
-#define DC_IESUSP			(1 << 3)
-#define DC_IEPSOF			(1 << 2)
-#define DC_IESOF			(1 << 1)
-#define DC_IEBRST			(1 << 0)
+
+#define ISP176x_DC_CDBGMOD_ACK		BIT(6)
+#define ISP176x_DC_DDBGMODIN_ACK	BIT(4)
+#define ISP176x_DC_DDBGMODOUT_ACK	BIT(2)
+
+#define ISP176x_DC_IEP0SETUP		BIT(8)
+#define ISP176x_DC_IEVBUS		BIT(7)
+#define ISP176x_DC_IEHS_STA		BIT(5)
+#define ISP176x_DC_IERESM		BIT(4)
+#define ISP176x_DC_IESUSP		BIT(3)
+#define ISP176x_DC_IEBRST		BIT(0)
+
+#define ISP176x_DC_ENDPTYP_ISOC		0x01
+#define ISP176x_DC_ENDPTYP_BULK		0x02
+#define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
+
+/* Initialization Registers */
+#define ISP176x_DC_ADDRESS		0x0200
+#define ISP176x_DC_MODE			0x020c
+#define ISP176x_DC_INTCONF		0x0210
+#define ISP176x_DC_DEBUG		0x0212
+#define ISP176x_DC_INTENABLE		0x0214
 
 /* Data Flow Registers */
-#define DC_EPINDEX			0x022c
-#define DC_EP0SETUP			(1 << 5)
-#define DC_ENDPIDX(n)			((n) << 1)
-#define DC_EPDIR			(1 << 0)
-
-#define DC_CTRLFUNC			0x0228
-#define DC_CLBUF			(1 << 4)
-#define DC_VENDP			(1 << 3)
-#define DC_DSEN				(1 << 2)
-#define DC_STATUS			(1 << 1)
-#define DC_STALL			(1 << 0)
-
-#define DC_DATAPORT			0x0220
-#define DC_BUFLEN			0x021c
-#define DC_DATACOUNT_MASK		0xffff
-#define DC_BUFSTAT			0x021e
-#define DC_EPMAXPKTSZ			0x0204
-
-#define DC_EPTYPE			0x0208
-#define DC_NOEMPKT			(1 << 4)
-#define DC_EPENABLE			(1 << 3)
-#define DC_DBLBUF			(1 << 2)
-#define DC_ENDPTYP_ISOC			(1 << 0)
-#define DC_ENDPTYP_BULK			(2 << 0)
-#define DC_ENDPTYP_INTERRUPT		(3 << 0)
+#define ISP176x_DC_EPMAXPKTSZ		0x0204
+#define ISP176x_DC_EPTYPE		0x0208
+
+#define ISP176x_DC_BUFLEN		0x021c
+#define ISP176x_DC_BUFSTAT		0x021e
+#define ISP176x_DC_DATAPORT		0x0220
+
+#define ISP176x_DC_CTRLFUNC		0x0228
+#define ISP176x_DC_EPINDEX		0x022c
+
+#define ISP1761_DC_OTG_CTRL_SET		0x374
+#define ISP1761_DC_OTG_CTRL_CLEAR	0x376
 
 /* DMA Registers */
-#define DC_DMACMD			0x0230
-#define DC_DMATXCOUNT			0x0234
-#define DC_DMACONF			0x0238
-#define DC_DMAHW			0x023c
-#define DC_DMAINTREASON			0x0250
-#define DC_DMAINTEN			0x0254
-#define DC_DMAEP			0x0258
-#define DC_DMABURSTCOUNT		0x0264
+#define ISP176x_DC_DMACMD		0x0230
+#define ISP176x_DC_DMATXCOUNT		0x0234
+#define ISP176x_DC_DMACONF		0x0238
+#define ISP176x_DC_DMAHW		0x023c
+#define ISP176x_DC_DMAINTREASON		0x0250
+#define ISP176x_DC_DMAINTEN		0x0254
+#define ISP176x_DC_DMAEP		0x0258
+#define ISP176x_DC_DMABURSTCOUNT	0x0264
 
 /* General Registers */
-#define DC_INTERRUPT			0x0218
-#define DC_CHIPID			0x0270
-#define DC_FRAMENUM			0x0274
-#define DC_SCRATCH			0x0278
-#define DC_UNLOCKDEV			0x027c
-#define DC_INTPULSEWIDTH		0x0280
-#define DC_TESTMODE			0x0284
+#define ISP176x_DC_INTERRUPT		0x0218
+#define ISP176x_DC_CHIPID		0x0270
+#define ISP176x_DC_FRAMENUM		0x0274
+#define ISP176x_DC_SCRATCH		0x0278
+#define ISP176x_DC_UNLOCKDEV		0x027c
+#define ISP176x_DC_INTPULSEWIDTH	0x0280
+#define ISP176x_DC_TESTMODE		0x0284
+
+enum isp176x_device_controller_fields {
+	/* DC_ADDRESS */
+	DC_DEVEN, DC_DEVADDR,
+	/* DC_MODE */
+	DC_VBUSSTAT, DC_SFRESET, DC_GLINTENA,
+	/* DC_INTCONF */
+	DC_CDBGMOD_ACK, DC_DDBGMODIN_ACK, DC_DDBGMODOUT_ACK, DC_INTPOL,
+	/* DC_INTENABLE */
+	DC_IEPRXTX_7, DC_IEPRXTX_6, DC_IEPRXTX_5, DC_IEPRXTX_4, DC_IEPRXTX_3,
+	DC_IEPRXTX_2, DC_IEPRXTX_1, DC_IEPRXTX_0,
+	DC_IEP0SETUP, DC_IEVBUS, DC_IEHS_STA, DC_IERESM, DC_IESUSP, DC_IEBRST,
+	/* DC_EPINDEX */
+	DC_EP0SETUP, DC_ENDPIDX, DC_EPDIR,
+	/* DC_CTRLFUNC */
+	DC_CLBUF, DC_VENDP, DC_DSEN, DC_STATUS, DC_STALL,
+	/* DC_BUFLEN */
+	DC_BUFLEN,
+	/* DC_EPMAXPKTSZ */
+	DC_FFOSZ,
+	/* DC_EPTYPE */
+	DC_EPENABLE, DC_ENDPTYP,
+	/* DC_FRAMENUM */
+	DC_FRAMENUM, DC_UFRAMENUM,
+	/* HW_OTG_CTRL_SET */
+	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
+	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
+	/* HW_OTG_CTRL_CLR */
+	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
+	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
+	HW_DP_PULLUP_CLEAR,
+	/* Last element */
+	DC_FIELD_MAX,
+};
 
 #endif
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 1714b2258b54..1e2ca43fb152 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -45,16 +45,62 @@ static inline struct isp1760_request *req_to_udc_req(struct usb_request *req)
 	return container_of(req, struct isp1760_request, req);
 }
 
-static inline u32 isp1760_udc_read(struct isp1760_udc *udc, u16 reg)
+static u32 isp1760_udc_read(struct isp1760_udc *udc, u16 field)
 {
-	return isp1760_read32(udc->regs, reg);
+	return isp1760_field_read(udc->fields, field);
 }
 
-static inline void isp1760_udc_write(struct isp1760_udc *udc, u16 reg, u32 val)
+static void isp1760_udc_write(struct isp1760_udc *udc, u16 field, u32 val)
 {
-	isp1760_write32(udc->regs, reg, val);
+	isp1760_field_write(udc->fields, field, val);
 }
 
+static u32 isp1760_udc_read_raw(struct isp1760_udc *udc, u16 reg)
+{
+	__le32 val;
+
+	regmap_raw_read(udc->regs, reg, &val, 4);
+
+	return le32_to_cpu(val);
+}
+
+static u16 isp1760_udc_read_raw16(struct isp1760_udc *udc, u16 reg)
+{
+	__le16 val;
+
+	regmap_raw_read(udc->regs, reg, &val, 2);
+
+	return le16_to_cpu(val);
+}
+
+static void isp1760_udc_write_raw(struct isp1760_udc *udc, u16 reg, u32 val)
+{
+	__le32 val_le = cpu_to_le32(val);
+
+	regmap_raw_write(udc->regs, reg, &val_le, 4);
+}
+
+static void isp1760_udc_write_raw16(struct isp1760_udc *udc, u16 reg, u16 val)
+{
+	__le16 val_le = cpu_to_le16(val);
+
+	regmap_raw_write(udc->regs, reg, &val_le, 2);
+}
+
+static void isp1760_udc_set(struct isp1760_udc *udc, u32 field)
+{
+	isp1760_udc_write(udc, field, 0xFFFFFFFF);
+}
+
+static void isp1760_udc_clear(struct isp1760_udc *udc, u32 field)
+{
+	isp1760_udc_write(udc, field, 0);
+}
+
+static bool isp1760_udc_is_set(struct isp1760_udc *udc, u32 field)
+{
+	return !!isp1760_udc_read(udc, field);
+}
 /* -----------------------------------------------------------------------------
  * Endpoint Management
  */
@@ -75,11 +121,15 @@ static struct isp1760_ep *isp1760_udc_find_ep(struct isp1760_udc *udc,
 	return NULL;
 }
 
-static void __isp1760_udc_select_ep(struct isp1760_ep *ep, int dir)
+static void __isp1760_udc_select_ep(struct isp1760_udc *udc,
+				    struct isp1760_ep *ep, int dir)
 {
-	isp1760_udc_write(ep->udc, DC_EPINDEX,
-			  DC_ENDPIDX(ep->addr & USB_ENDPOINT_NUMBER_MASK) |
-			  (dir == USB_DIR_IN ? DC_EPDIR : 0));
+	isp1760_udc_write(udc, DC_ENDPIDX, ep->addr & USB_ENDPOINT_NUMBER_MASK);
+
+	if (dir == USB_DIR_IN)
+		isp1760_udc_set(udc, DC_EPDIR);
+	else
+		isp1760_udc_clear(udc, DC_EPDIR);
 }
 
 /**
@@ -93,9 +143,10 @@ static void __isp1760_udc_select_ep(struct isp1760_ep *ep, int dir)
  *
  * Called with the UDC spinlock held.
  */
-static void isp1760_udc_select_ep(struct isp1760_ep *ep)
+static void isp1760_udc_select_ep(struct isp1760_udc *udc,
+				  struct isp1760_ep *ep)
 {
-	__isp1760_udc_select_ep(ep, ep->addr & USB_ENDPOINT_DIR_MASK);
+	__isp1760_udc_select_ep(udc, ep, ep->addr & USB_ENDPOINT_DIR_MASK);
 }
 
 /* Called with the UDC spinlock held. */
@@ -108,9 +159,13 @@ static void isp1760_udc_ctrl_send_status(struct isp1760_ep *ep, int dir)
 	 * the direction opposite to the data stage data packets, we thus need
 	 * to select the OUT/IN endpoint for IN/OUT transfers.
 	 */
-	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) |
-			  (dir == USB_DIR_IN ? 0 : DC_EPDIR));
-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STATUS);
+	if (dir == USB_DIR_IN)
+		isp1760_udc_clear(udc, DC_EPDIR);
+	else
+		isp1760_udc_set(udc, DC_EPDIR);
+
+	isp1760_udc_write(udc, DC_ENDPIDX, 1);
+	isp1760_udc_set(udc, DC_STATUS);
 
 	/*
 	 * The hardware will terminate the request automatically and go back to
@@ -157,10 +212,10 @@ static void isp1760_udc_ctrl_send_stall(struct isp1760_ep *ep)
 	spin_lock_irqsave(&udc->lock, flags);
 
 	/* Stall both the IN and OUT endpoints. */
-	__isp1760_udc_select_ep(ep, USB_DIR_OUT);
-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
-	__isp1760_udc_select_ep(ep, USB_DIR_IN);
-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
+	__isp1760_udc_select_ep(udc, ep, USB_DIR_OUT);
+	isp1760_udc_set(udc, DC_STALL);
+	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
+	isp1760_udc_set(udc, DC_STALL);
 
 	/* A protocol stall completes the control transaction. */
 	udc->ep0_state = ISP1760_CTRL_SETUP;
@@ -181,8 +236,8 @@ static bool isp1760_udc_receive(struct isp1760_ep *ep,
 	u32 *buf;
 	int i;
 
-	isp1760_udc_select_ep(ep);
-	len = isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
+	isp1760_udc_select_ep(udc, ep);
+	len = isp1760_udc_read(udc, DC_BUFLEN);
 
 	dev_dbg(udc->isp->dev, "%s: received %u bytes (%u/%u done)\n",
 		__func__, len, req->req.actual, req->req.length);
@@ -198,7 +253,7 @@ static bool isp1760_udc_receive(struct isp1760_ep *ep,
 		 * datasheet doesn't clearly document how this should be
 		 * handled.
 		 */
-		isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
+		isp1760_udc_set(udc, DC_CLBUF);
 		return false;
 	}
 
@@ -209,9 +264,9 @@ static bool isp1760_udc_receive(struct isp1760_ep *ep,
 	 * the next packet might be removed from the FIFO.
 	 */
 	for (i = len; i > 2; i -= 4, ++buf)
-		*buf = le32_to_cpu(isp1760_udc_read(udc, DC_DATAPORT));
+		*buf = isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
 	if (i > 0)
-		*(u16 *)buf = le16_to_cpu(readw(udc->regs + DC_DATAPORT));
+		*(u16 *)buf = isp1760_udc_read_raw16(udc, ISP176x_DC_DATAPORT);
 
 	req->req.actual += len;
 
@@ -253,7 +308,7 @@ static void isp1760_udc_transmit(struct isp1760_ep *ep,
 		__func__, req->packet_size, req->req.actual,
 		req->req.length);
 
-	__isp1760_udc_select_ep(ep, USB_DIR_IN);
+	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
 
 	if (req->packet_size)
 		isp1760_udc_write(udc, DC_BUFLEN, req->packet_size);
@@ -265,14 +320,14 @@ static void isp1760_udc_transmit(struct isp1760_ep *ep,
 	 * the FIFO for this kind of conditions, but doesn't seem to work.
 	 */
 	for (i = req->packet_size; i > 2; i -= 4, ++buf)
-		isp1760_udc_write(udc, DC_DATAPORT, cpu_to_le32(*buf));
+		isp1760_udc_write_raw(udc, ISP176x_DC_DATAPORT, *buf);
 	if (i > 0)
-		writew(cpu_to_le16(*(u16 *)buf), udc->regs + DC_DATAPORT);
+		isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, *(u16 *)buf);
 
 	if (ep->addr == 0)
-		isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
+		isp1760_udc_set(udc, DC_DSEN);
 	if (!req->packet_size)
-		isp1760_udc_write(udc, DC_CTRLFUNC, DC_VENDP);
+		isp1760_udc_set(udc, DC_VENDP);
 }
 
 static void isp1760_ep_rx_ready(struct isp1760_ep *ep)
@@ -408,19 +463,24 @@ static int __isp1760_udc_set_halt(struct isp1760_ep *ep, bool halt)
 		return -EINVAL;
 	}
 
-	isp1760_udc_select_ep(ep);
-	isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
+	isp1760_udc_select_ep(udc, ep);
+
+	if (halt)
+		isp1760_udc_set(udc, DC_STALL);
+	else
+		isp1760_udc_clear(udc, DC_STALL);
 
 	if (ep->addr == 0) {
 		/* When halting the control endpoint, stall both IN and OUT. */
-		__isp1760_udc_select_ep(ep, USB_DIR_IN);
-		isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
+		__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
+		if (halt)
+			isp1760_udc_set(udc, DC_STALL);
+		else
+			isp1760_udc_clear(udc, DC_STALL);
 	} else if (!halt) {
 		/* Reset the data PID by cycling the endpoint enable bit. */
-		u16 eptype = isp1760_udc_read(udc, DC_EPTYPE);
-
-		isp1760_udc_write(udc, DC_EPTYPE, eptype & ~DC_EPENABLE);
-		isp1760_udc_write(udc, DC_EPTYPE, eptype);
+		isp1760_udc_clear(udc, DC_EPENABLE);
+		isp1760_udc_set(udc, DC_EPENABLE);
 
 		/*
 		 * Disabling the endpoint emptied the transmit FIFO, fill it
@@ -479,12 +539,14 @@ static int isp1760_udc_get_status(struct isp1760_udc *udc,
 		return -EINVAL;
 	}
 
-	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) | DC_EPDIR);
+	isp1760_udc_set(udc, DC_EPDIR);
+	isp1760_udc_write(udc, DC_ENDPIDX, 1);
+
 	isp1760_udc_write(udc, DC_BUFLEN, 2);
 
-	writew(cpu_to_le16(status), udc->regs + DC_DATAPORT);
+	isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, status);
 
-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
+	isp1760_udc_set(udc, DC_DSEN);
 
 	dev_dbg(udc->isp->dev, "%s: status 0x%04x\n", __func__, status);
 
@@ -508,7 +570,8 @@ static int isp1760_udc_set_address(struct isp1760_udc *udc, u16 addr)
 	usb_gadget_set_state(&udc->gadget, addr ? USB_STATE_ADDRESS :
 			     USB_STATE_DEFAULT);
 
-	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN | addr);
+	isp1760_udc_write(udc, DC_DEVADDR, addr);
+	isp1760_udc_set(udc, DC_DEVEN);
 
 	spin_lock(&udc->lock);
 	isp1760_udc_ctrl_send_status(&udc->ep[0], USB_DIR_OUT);
@@ -650,9 +713,9 @@ static void isp1760_ep0_setup(struct isp1760_udc *udc)
 
 	spin_lock(&udc->lock);
 
-	isp1760_udc_write(udc, DC_EPINDEX, DC_EP0SETUP);
+	isp1760_udc_set(udc, DC_EP0SETUP);
 
-	count = isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
+	count = isp1760_udc_read(udc, DC_BUFLEN);
 	if (count != sizeof(req)) {
 		spin_unlock(&udc->lock);
 
@@ -663,8 +726,8 @@ static void isp1760_ep0_setup(struct isp1760_udc *udc)
 		return;
 	}
 
-	req.data[0] = isp1760_udc_read(udc, DC_DATAPORT);
-	req.data[1] = isp1760_udc_read(udc, DC_DATAPORT);
+	req.data[0] = isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
+	req.data[1] = isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
 
 	if (udc->ep0_state != ISP1760_CTRL_SETUP) {
 		spin_unlock(&udc->lock);
@@ -732,13 +795,13 @@ static int isp1760_ep_enable(struct usb_ep *ep,
 
 	switch (usb_endpoint_type(desc)) {
 	case USB_ENDPOINT_XFER_ISOC:
-		type = DC_ENDPTYP_ISOC;
+		type = ISP176x_DC_ENDPTYP_ISOC;
 		break;
 	case USB_ENDPOINT_XFER_BULK:
-		type = DC_ENDPTYP_BULK;
+		type = ISP176x_DC_ENDPTYP_BULK;
 		break;
 	case USB_ENDPOINT_XFER_INT:
-		type = DC_ENDPTYP_INTERRUPT;
+		type = ISP176x_DC_ENDPTYP_INTERRUPT;
 		break;
 	case USB_ENDPOINT_XFER_CONTROL:
 	default:
@@ -755,10 +818,13 @@ static int isp1760_ep_enable(struct usb_ep *ep,
 	uep->halted = false;
 	uep->wedged = false;
 
-	isp1760_udc_select_ep(uep);
-	isp1760_udc_write(udc, DC_EPMAXPKTSZ, uep->maxpacket);
+	isp1760_udc_select_ep(udc, uep);
+
+	isp1760_udc_write(udc, DC_FFOSZ, uep->maxpacket);
 	isp1760_udc_write(udc, DC_BUFLEN, uep->maxpacket);
-	isp1760_udc_write(udc, DC_EPTYPE, DC_EPENABLE | type);
+
+	isp1760_udc_write(udc, DC_ENDPTYP, type);
+	isp1760_udc_set(udc, DC_EPENABLE);
 
 	spin_unlock_irqrestore(&udc->lock, flags);
 
@@ -786,8 +852,9 @@ static int isp1760_ep_disable(struct usb_ep *ep)
 	uep->desc = NULL;
 	uep->maxpacket = 0;
 
-	isp1760_udc_select_ep(uep);
-	isp1760_udc_write(udc, DC_EPTYPE, 0);
+	isp1760_udc_select_ep(udc, uep);
+	isp1760_udc_clear(udc, DC_EPENABLE);
+	isp1760_udc_clear(udc, DC_ENDPTYP);
 
 	/* TODO Synchronize with the IRQ handler */
 
@@ -864,8 +931,8 @@ static int isp1760_ep_queue(struct usb_ep *ep, struct usb_request *_req,
 
 		case ISP1760_CTRL_DATA_OUT:
 			list_add_tail(&req->queue, &uep->queue);
-			__isp1760_udc_select_ep(uep, USB_DIR_OUT);
-			isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
+			__isp1760_udc_select_ep(udc, uep, USB_DIR_OUT);
+			isp1760_udc_set(udc, DC_DSEN);
 			break;
 
 		case ISP1760_CTRL_STATUS:
@@ -1025,14 +1092,14 @@ static void isp1760_ep_fifo_flush(struct usb_ep *ep)
 
 	spin_lock_irqsave(&udc->lock, flags);
 
-	isp1760_udc_select_ep(uep);
+	isp1760_udc_select_ep(udc, uep);
 
 	/*
 	 * Set the CLBUF bit twice to flush both buffers in case double
 	 * buffering is enabled.
 	 */
-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
+	isp1760_udc_set(udc, DC_CLBUF);
+	isp1760_udc_set(udc, DC_CLBUF);
 
 	spin_unlock_irqrestore(&udc->lock, flags);
 }
@@ -1091,19 +1158,22 @@ static void isp1760_udc_init_hw(struct isp1760_udc *udc)
 	 * ACK tokens only (and NYET for the out pipe). The default
 	 * configuration also generates an interrupt on the first NACK token.
 	 */
-	isp1760_udc_write(udc, DC_INTCONF, DC_CDBGMOD_ACK | DC_DDBGMODIN_ACK |
-			  DC_DDBGMODOUT_ACK_NYET);
-
-	isp1760_udc_write(udc, DC_INTENABLE, DC_IEPRXTX(7) | DC_IEPRXTX(6) |
-			  DC_IEPRXTX(5) | DC_IEPRXTX(4) | DC_IEPRXTX(3) |
-			  DC_IEPRXTX(2) | DC_IEPRXTX(1) | DC_IEPRXTX(0) |
-			  DC_IEP0SETUP | DC_IEVBUS | DC_IERESM | DC_IESUSP |
-			  DC_IEHS_STA | DC_IEBRST);
+	isp1760_reg_write(udc->regs, ISP176x_DC_INTCONF,
+			  ISP176x_DC_CDBGMOD_ACK | ISP176x_DC_DDBGMODIN_ACK |
+			  ISP176x_DC_DDBGMODOUT_ACK);
+
+	isp1760_reg_write(udc->regs, ISP176x_DC_INTENABLE, DC_IEPRXTX(7) |
+			  DC_IEPRXTX(6) | DC_IEPRXTX(5) | DC_IEPRXTX(4) |
+			  DC_IEPRXTX(3) | DC_IEPRXTX(2) | DC_IEPRXTX(1) |
+			  DC_IEPRXTX(0) | ISP176x_DC_IEP0SETUP |
+			  ISP176x_DC_IEVBUS | ISP176x_DC_IERESM |
+			  ISP176x_DC_IESUSP | ISP176x_DC_IEHS_STA |
+			  ISP176x_DC_IEBRST);
 
 	if (udc->connected)
 		isp1760_set_pullup(udc->isp, true);
 
-	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN);
+	isp1760_udc_set(udc, DC_DEVEN);
 }
 
 static void isp1760_udc_reset(struct isp1760_udc *udc)
@@ -1152,7 +1222,7 @@ static int isp1760_udc_get_frame(struct usb_gadget *gadget)
 {
 	struct isp1760_udc *udc = gadget_to_udc(gadget);
 
-	return isp1760_udc_read(udc, DC_FRAMENUM) & ((1 << 11) - 1);
+	return isp1760_udc_read(udc, DC_FRAMENUM);
 }
 
 static int isp1760_udc_wakeup(struct usb_gadget *gadget)
@@ -1219,7 +1289,7 @@ static int isp1760_udc_start(struct usb_gadget *gadget,
 	usb_gadget_set_state(&udc->gadget, USB_STATE_ATTACHED);
 
 	/* DMA isn't supported yet, don't enable the DMA clock. */
-	isp1760_udc_write(udc, DC_MODE, DC_GLINTENA);
+	isp1760_udc_set(udc, DC_GLINTENA);
 
 	isp1760_udc_init_hw(udc);
 
@@ -1238,7 +1308,7 @@ static int isp1760_udc_stop(struct usb_gadget *gadget)
 
 	del_timer_sync(&udc->vbus_timer);
 
-	isp1760_udc_write(udc, DC_MODE, 0);
+	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
 
 	spin_lock_irqsave(&udc->lock, flags);
 	udc->driver = NULL;
@@ -1266,9 +1336,9 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
 	unsigned int i;
 	u32 status;
 
-	status = isp1760_udc_read(udc, DC_INTERRUPT)
-	       & isp1760_udc_read(udc, DC_INTENABLE);
-	isp1760_udc_write(udc, DC_INTERRUPT, status);
+	status = isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
+	       & isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
+	isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
 
 	if (status & DC_IEVBUS) {
 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
@@ -1313,7 +1383,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
 		dev_dbg(udc->isp->dev, "%s(SUSP)\n", __func__);
 
 		spin_lock(&udc->lock);
-		if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
+		if (!isp1760_udc_is_set(udc, DC_VBUSSTAT))
 			isp1760_udc_disconnect(udc);
 		else
 			isp1760_udc_suspend(udc);
@@ -1335,7 +1405,7 @@ static void isp1760_udc_vbus_poll(struct timer_list *t)
 
 	spin_lock_irqsave(&udc->lock, flags);
 
-	if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
+	if (!(isp1760_udc_is_set(udc, DC_VBUSSTAT)))
 		isp1760_udc_disconnect(udc);
 	else if (udc->gadget.state >= USB_STATE_POWERED)
 		mod_timer(&udc->vbus_timer,
@@ -1412,9 +1482,9 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
 	 * register, and reading the scratch register value back. The chip ID
 	 * and scratch register contents must match the expected values.
 	 */
-	isp1760_udc_write(udc, DC_SCRATCH, 0xbabe);
-	chipid = isp1760_udc_read(udc, DC_CHIPID);
-	scratch = isp1760_udc_read(udc, DC_SCRATCH);
+	isp1760_reg_write(udc->regs, ISP176x_DC_SCRATCH, 0xbabe);
+	chipid = isp1760_reg_read(udc->regs, ISP176x_DC_CHIPID);
+	scratch = isp1760_reg_read(udc->regs, ISP176x_DC_SCRATCH);
 
 	if (scratch != 0xbabe) {
 		dev_err(udc->isp->dev,
@@ -1429,9 +1499,9 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
 	}
 
 	/* Reset the device controller. */
-	isp1760_udc_write(udc, DC_MODE, DC_SFRESET);
+	isp1760_udc_set(udc, DC_SFRESET);
 	usleep_range(10000, 11000);
-	isp1760_udc_write(udc, DC_MODE, 0);
+	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
 	usleep_range(10000, 11000);
 
 	return 0;
@@ -1445,7 +1515,6 @@ int isp1760_udc_register(struct isp1760_device *isp, int irq,
 
 	udc->irq = -1;
 	udc->isp = isp;
-	udc->regs = isp->regs;
 
 	spin_lock_init(&udc->lock);
 	timer_setup(&udc->vbus_timer, isp1760_udc_vbus_poll, 0);
diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1760-udc.h
index d2df650d54e9..a49096c0ac8e 100644
--- a/drivers/usb/isp1760/isp1760-udc.h
+++ b/drivers/usb/isp1760/isp1760-udc.h
@@ -17,6 +17,8 @@
 #include <linux/timer.h>
 #include <linux/usb/gadget.h>
 
+#include "isp1760-regs.h"
+
 struct isp1760_device;
 struct isp1760_udc;
 
@@ -48,7 +50,7 @@ struct isp1760_ep {
  * struct isp1760_udc - UDC state information
  * irq: IRQ number
  * irqname: IRQ name (as passed to request_irq)
- * regs: Base address of the UDC registers
+ * regs: regmap for UDC registers
  * driver: Gadget driver
  * gadget: Gadget device
  * lock: Protects driver, vbus_timer, ep, ep0_*, DC_EPINDEX register
@@ -59,12 +61,13 @@ struct isp1760_ep {
  * connected: Tracks gadget driver bus connection state
  */
 struct isp1760_udc {
-#ifdef CONFIG_USB_ISP1761_UDC
 	struct isp1760_device *isp;
 
 	int irq;
 	char *irqname;
-	void __iomem *regs;
+
+	struct regmap *regs;
+	struct regmap_field *fields[DC_FIELD_MAX];
 
 	struct usb_gadget_driver *driver;
 	struct usb_gadget gadget;
@@ -81,7 +84,6 @@ struct isp1760_udc {
 	bool connected;
 
 	unsigned int devstatus;
-#endif
 };
 
 #ifdef CONFIG_USB_ISP1761_UDC
-- 
2.31.1

