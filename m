Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE2037A29A
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhEKIwd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbhEKIwa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 04:52:30 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED106C06175F
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so783555wmb.3
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mp/bUigjVbfMmi8wG0+AFcSWGNsQEJUSB5Gx3oWvc34=;
        b=BrPbFm56MZbl/yG9vPu2oEiIKbV/gMtauuPv1ZDxE30kfdGg+h/1gn2VSm8Q6N2Geb
         iRpl4vdyRcXGzbFOH3Zj0mVHdRFD+3Nhvowcuncz8CYosPGNqW5svBH4i+Xn3iKh2uHn
         BNOmUX1c6q5RTQ/tFTwTSfFbxSuI3UJq2Jyz+GsosHcvpDWS6zhk8JuvrbJ7WbfYX1vc
         uepMwj6uOTFmRbzHmVbvNUCWXeBRbh70eQ9GYgEeyV+JHf2cqZ29d2pFttC7uu6m2YNJ
         o+Z6AXkwHa9naMwOaG+Y7H9cLoUbVFGzzp9H2spxQ/Lz7V/BkHUi1BVmrIKAbkqGnAq2
         ODVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mp/bUigjVbfMmi8wG0+AFcSWGNsQEJUSB5Gx3oWvc34=;
        b=LupKUbKmeJ1ubOODYpuaYxUrjBbkrZYWnLZktRwvAtPrTQh5OYsUa/OCgv6+txtDjs
         7BoYR/c1aXGLu51IbRtRUvp4KeHB2yxYna8sNiBxAyb0BkjmJFIn4hO9xtgPGdahChBh
         8FUB7fZWTRJMHdvFZchPz7iwLH+NvJpgXzUT3DuOrPiU7eqvw+tWLhBnhGK22SU0HjlC
         sAL9MrwjYg4jSOAv2JID4k1PCf+8ka2njeywgnORsuqGgBOsdolXMXr0hz7EdjUaT03P
         k1AYrR81Pnd4nhbGapmS9fNeDbxyPXTnRRlYaRrKP7tX8fyDXhU5KEaDCaJcKictLe2y
         wwwg==
X-Gm-Message-State: AOAM530dNHTcedDwZ9bj4W0gcl+txTHL9DatbfGXvmkN+8GikasXG4U6
        pXZltkC3+z91oWiCm/S52Cg5jNXWEickOg==
X-Google-Smtp-Source: ABdhPJzpRCFZxzQLq6nns+Wv6BuvIfh1/uexAtRl+97UI8bMl/sC1E5Pn6Z40hEPDdHF43yxIMH6eA==
X-Received: by 2002:a7b:c7c5:: with SMTP id z5mr4099226wmk.184.1620723081343;
        Tue, 11 May 2021 01:51:21 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j7sm23042980wmi.21.2021.05.11.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 01:51:20 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 7/9] usb: isp1760: add support for isp1763
Date:   Tue, 11 May 2021 09:50:59 +0100
Message-Id: <20210511085101.2081399-8-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511085101.2081399-1-rui.silva@linaro.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

isp1763 have some differences from the isp1760, 8 bit address for
registers and 16 bit for values, no bulk access to memory addresses,
16 PTD's instead of 32.

Following the regmap work done before add the registers, memory access
and add the functions to support differences in setup sequences.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/Kconfig        |   4 +-
 drivers/usb/isp1760/isp1760-core.c | 301 ++++++++++++--
 drivers/usb/isp1760/isp1760-core.h |   4 +
 drivers/usb/isp1760/isp1760-hcd.c  | 627 ++++++++++++++++++++++-------
 drivers/usb/isp1760/isp1760-hcd.h  |   6 +-
 drivers/usb/isp1760/isp1760-if.c   |  12 +-
 drivers/usb/isp1760/isp1760-regs.h |  95 ++++-
 drivers/usb/isp1760/isp1760-udc.c  |   2 +
 drivers/usb/isp1760/isp1760-udc.h  |   2 +
 9 files changed, 849 insertions(+), 204 deletions(-)

diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
index b1022cc490a2..d3384cbe1ffb 100644
--- a/drivers/usb/isp1760/Kconfig
+++ b/drivers/usb/isp1760/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config USB_ISP1760
-	tristate "NXP ISP 1760/1761 support"
+	tristate "NXP ISP 1760/1761/1763 support"
 	depends on USB || USB_GADGET
 	help
-	  Say Y or M here if your system as an ISP1760 USB host controller
+	  Say Y or M here if your system as an ISP1760/1763 USB host controller
 	  or an ISP1761 USB dual-role controller.
 
 	  This driver does not support isochronous transfers or OTG.
diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index 0aeeb12d3bfe..1d847f13abab 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -2,12 +2,14 @@
 /*
  * Driver for the NXP ISP1760 chip
  *
+ * Copyright 2021 Linaro, Rui Miguel Silva
  * Copyright 2014 Laurent Pinchart
  * Copyright 2007 Sebastian Siewior
  *
  * Contacts:
  *	Sebastian Siewior <bigeasy@linutronix.de>
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *	Rui Miguel Silva <rui.silva@linaro.org>
  */
 
 #include <linux/delay.h>
@@ -24,7 +26,7 @@
 #include "isp1760-regs.h"
 #include "isp1760-udc.h"
 
-static void isp1760_init_core(struct isp1760_device *isp)
+static int isp1760_init_core(struct isp1760_device *isp)
 {
 	struct isp1760_hcd *hcd = &isp->hcd;
 	struct isp1760_udc *udc = &isp->udc;
@@ -44,8 +46,15 @@ static void isp1760_init_core(struct isp1760_device *isp)
 	msleep(100);
 
 	/* Setup HW Mode Control: This assumes a level active-low interrupt */
+	if ((isp->devflags & ISP1760_FLAG_ANALOG_OC) && hcd->is_isp1763) {
+		dev_err(isp->dev, "isp1763 analog overcurrent not available\n");
+		return -EINVAL;
+	}
+
 	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
 		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
+	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_8)
+		isp1760_field_set(hcd->fields, HW_DATA_BUS_WIDTH);
 	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
 		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
 	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
@@ -85,9 +94,14 @@ static void isp1760_init_core(struct isp1760_device *isp)
 		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
 	}
 
-	dev_info(isp->dev, "bus width: %u, oc: %s\n",
+	dev_info(isp->dev, "%s bus width: %u, oc: %s\n",
+		 hcd->is_isp1763 ? "isp1763" : "isp1760",
+		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_8 ? 8 :
 		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
+		 hcd->is_isp1763 ? "not available" :
 		 isp->devflags & ISP1760_FLAG_ANALOG_OC ? "analog" : "digital");
+
+	return 0;
 }
 
 void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
@@ -101,6 +115,8 @@ void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
 }
 
 /*
+ * ISP1760/61:
+ *
  * 60kb divided in:
  * - 32 blocks @ 256  bytes
  * - 20 blocks @ 1024 bytes
@@ -114,15 +130,36 @@ static const struct isp1760_memory_layout isp176x_memory_conf = {
 	.blocks[2]		= 4,
 	.blocks_size[2]		= 8192,
 
-	.ptd_num		= 32,
+	.slot_num		= 32,
 	.payload_blocks		= 32 + 20 + 4,
 	.payload_area_size	= 0xf000,
 };
 
+/*
+ * ISP1763:
+ *
+ * 20kb divided in:
+ * - 8 blocks @ 256  bytes
+ * - 2 blocks @ 1024 bytes
+ * - 4 blocks @ 4096 bytes
+ */
+static const struct isp1760_memory_layout isp1763_memory_conf = {
+	.blocks[0]		= 8,
+	.blocks_size[0]		= 256,
+	.blocks[1]		= 2,
+	.blocks_size[1]		= 1024,
+	.blocks[2]		= 4,
+	.blocks_size[2]		= 4096,
+
+	.slot_num		= 16,
+	.payload_blocks		= 8 + 2 + 4,
+	.payload_area_size	= 0x5000,
+};
+
 static const struct regmap_range isp176x_hc_volatile_ranges[] = {
 	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
 	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
-	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AND),
+	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_OTG_CTRL_CLEAR),
 };
 
 static const struct regmap_access_table isp176x_hc_volatile_table = {
@@ -130,13 +167,13 @@ static const struct regmap_access_table isp176x_hc_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(isp176x_hc_volatile_ranges),
 };
 
-static struct regmap_config isp1760_hc_regmap_conf = {
+static const struct regmap_config isp1760_hc_regmap_conf = {
 	.name = "isp1760-hc",
 	.reg_bits = 16,
 	.reg_stride = 4,
 	.val_bits = 32,
 	.fast_io = true,
-	.max_register = ISP176x_HC_MEMORY,
+	.max_register = ISP176x_HC_OTG_CTRL_CLEAR,
 	.volatile_table = &isp176x_hc_volatile_table,
 };
 
@@ -151,6 +188,15 @@ static const struct reg_field isp1760_hc_reg_fields[] = {
 	[STS_PCD]		= REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
 	[HC_FRINDEX]		= REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
 	[FLAG_CF]		= REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
+	[HC_ISO_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_ISO_PTD_DONEMAP, 0, 31),
+	[HC_ISO_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_ISO_PTD_SKIPMAP, 0, 31),
+	[HC_ISO_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_ISO_PTD_LASTPTD, 0, 31),
+	[HC_INT_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_INT_PTD_DONEMAP, 0, 31),
+	[HC_INT_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_INT_PTD_SKIPMAP, 0, 31),
+	[HC_INT_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_INT_PTD_LASTPTD, 0, 31),
+	[HC_ATL_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_ATL_PTD_DONEMAP, 0, 31),
+	[HC_ATL_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_ATL_PTD_SKIPMAP, 0, 31),
+	[HC_ATL_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_ATL_PTD_LASTPTD, 0, 31),
 	[PORT_OWNER]		= REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
 	[PORT_POWER]		= REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
 	[PORT_LSTATUS]		= REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
@@ -169,18 +215,135 @@ static const struct reg_field isp1760_hc_reg_fields[] = {
 	[HW_INTR_HIGH_ACT]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
 	[HW_INTR_EDGE_TRIG]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
 	[HW_GLOBAL_INTR_EN]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
+	[HC_CHIP_REV]		= REG_FIELD(ISP176x_HC_CHIP_ID, 16, 31),
+	[HC_CHIP_ID_HIGH]	= REG_FIELD(ISP176x_HC_CHIP_ID, 8, 15),
+	[HC_CHIP_ID_LOW]	= REG_FIELD(ISP176x_HC_CHIP_ID, 0, 7),
+	[HC_SCRATCH]		= REG_FIELD(ISP176x_HC_SCRATCH, 0, 31),
 	[SW_RESET_RESET_ALL]	= REG_FIELD(ISP176x_HC_RESET, 0, 0),
+	[ISO_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 2, 2),
 	[INT_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
 	[ATL_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
 	[MEM_BANK_SEL]		= REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
 	[MEM_START_ADDR]	= REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
-	[HC_INT_ENABLE]		= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8),
+	[HC_INTERRUPT]		= REG_FIELD(ISP176x_HC_INTERRUPT, 0, 9),
+	[HC_ATL_IRQ_ENABLE]	= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 8, 8),
+	[HC_INT_IRQ_ENABLE]	= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 7),
+	[HC_ISO_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_OR, 0, 31),
+	[HC_INT_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_INT_IRQ_MASK_OR, 0, 31),
+	[HC_ATL_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_OR, 0, 31),
+	[HC_ISO_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_AND, 0, 31),
+	[HC_INT_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_INT_IRQ_MASK_AND, 0, 31),
+	[HC_ATL_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_AND, 0, 31),
+	[HW_OTG_DISABLE]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 10, 10),
+	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 7, 7),
+	[HW_VBUS_DRV]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 4, 4),
+	[HW_SEL_CP_EXT]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 3, 3),
+	[HW_DM_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 2, 2),
+	[HW_DP_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 1, 1),
+	[HW_DP_PULLUP]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 0, 0),
+	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 10, 10),
+	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 7, 7),
+	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 4, 4),
+	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 3, 3),
+	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 2, 2),
+	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 1, 1),
+	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 0, 0),
+};
+
+static const struct reg_field isp1763_hc_reg_fields[] = {
+	[CMD_LRESET]		= REG_FIELD(ISP1763_HC_USBCMD, 7, 7),
+	[CMD_RESET]		= REG_FIELD(ISP1763_HC_USBCMD, 1, 1),
+	[CMD_RUN]		= REG_FIELD(ISP1763_HC_USBCMD, 0, 0),
+	[STS_PCD]		= REG_FIELD(ISP1763_HC_USBSTS, 2, 2),
+	[HC_FRINDEX]		= REG_FIELD(ISP1763_HC_FRINDEX, 0, 13),
+	[FLAG_CF]		= REG_FIELD(ISP1763_HC_CONFIGFLAG, 0, 0),
+	[HC_ISO_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_ISO_PTD_DONEMAP, 0, 15),
+	[HC_ISO_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_ISO_PTD_SKIPMAP, 0, 15),
+	[HC_ISO_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_ISO_PTD_LASTPTD, 0, 15),
+	[HC_INT_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_INT_PTD_DONEMAP, 0, 15),
+	[HC_INT_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_INT_PTD_SKIPMAP, 0, 15),
+	[HC_INT_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_INT_PTD_LASTPTD, 0, 15),
+	[HC_ATL_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_ATL_PTD_DONEMAP, 0, 15),
+	[HC_ATL_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_ATL_PTD_SKIPMAP, 0, 15),
+	[HC_ATL_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_ATL_PTD_LASTPTD, 0, 15),
+	[PORT_OWNER]		= REG_FIELD(ISP1763_HC_PORTSC1, 13, 13),
+	[PORT_POWER]		= REG_FIELD(ISP1763_HC_PORTSC1, 12, 12),
+	[PORT_LSTATUS]		= REG_FIELD(ISP1763_HC_PORTSC1, 10, 11),
+	[PORT_RESET]		= REG_FIELD(ISP1763_HC_PORTSC1, 8, 8),
+	[PORT_SUSPEND]		= REG_FIELD(ISP1763_HC_PORTSC1, 7, 7),
+	[PORT_RESUME]		= REG_FIELD(ISP1763_HC_PORTSC1, 6, 6),
+	[PORT_PE]		= REG_FIELD(ISP1763_HC_PORTSC1, 2, 2),
+	[PORT_CSC]		= REG_FIELD(ISP1763_HC_PORTSC1, 1, 1),
+	[PORT_CONNECT]		= REG_FIELD(ISP1763_HC_PORTSC1, 0, 0),
+	[HW_DATA_BUS_WIDTH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 4, 4),
+	[HW_DACK_POL_HIGH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 6, 6),
+	[HW_DREQ_POL_HIGH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 5, 5),
+	[HW_INTF_LOCK]		= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 3, 3),
+	[HW_INTR_HIGH_ACT]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 2, 2),
+	[HW_INTR_EDGE_TRIG]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 1, 1),
+	[HW_GLOBAL_INTR_EN]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 0, 0),
+	[SW_RESET_RESET_ATX]	= REG_FIELD(ISP1763_HC_RESET, 3, 3),
+	[SW_RESET_RESET_ALL]	= REG_FIELD(ISP1763_HC_RESET, 0, 0),
+	[HC_CHIP_ID_HIGH]	= REG_FIELD(ISP1763_HC_CHIP_ID, 0, 15),
+	[HC_CHIP_ID_LOW]	= REG_FIELD(ISP1763_HC_CHIP_REV, 8, 15),
+	[HC_CHIP_REV]		= REG_FIELD(ISP1763_HC_CHIP_REV, 0, 7),
+	[HC_SCRATCH]		= REG_FIELD(ISP1763_HC_SCRATCH, 0, 15),
+	[ISO_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 2, 2),
+	[INT_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 1, 1),
+	[ATL_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 0, 0),
+	[MEM_START_ADDR]	= REG_FIELD(ISP1763_HC_MEMORY, 0, 15),
+	[HC_DATA]		= REG_FIELD(ISP1763_HC_DATA, 0, 15),
+	[HC_INTERRUPT]		= REG_FIELD(ISP1763_HC_INTERRUPT, 0, 10),
+	[HC_ATL_IRQ_ENABLE]	= REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 8, 8),
+	[HC_INT_IRQ_ENABLE]	= REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 7, 7),
+	[HC_ISO_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_OR, 0, 15),
+	[HC_INT_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_INT_IRQ_MASK_OR, 0, 15),
+	[HC_ATL_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_OR, 0, 15),
+	[HC_ISO_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_AND, 0, 15),
+	[HC_INT_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_INT_IRQ_MASK_AND, 0, 15),
+	[HC_ATL_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_AND, 0, 15),
+	[HW_HC_2_DIS]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 15, 15),
+	[HW_OTG_DISABLE]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 10, 10),
+	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 7, 7),
+	[HW_VBUS_DRV]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 4, 4),
+	[HW_SEL_CP_EXT]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 3, 3),
+	[HW_DM_PULLDOWN]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 2, 2),
+	[HW_DP_PULLDOWN]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 1, 1),
+	[HW_DP_PULLUP]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 0, 0),
+	[HW_HC_2_DIS_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 15, 15),
+	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 10, 10),
+	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 7, 7),
+	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 4, 4),
+	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 3, 3),
+	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 2, 2),
+	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 1, 1),
+	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 0, 0),
+};
+
+static const struct regmap_range isp1763_hc_volatile_ranges[] = {
+	regmap_reg_range(ISP1763_HC_USBCMD, ISP1763_HC_ATL_PTD_LASTPTD),
+	regmap_reg_range(ISP1763_HC_BUFFER_STATUS, ISP1763_HC_DATA),
+	regmap_reg_range(ISP1763_HC_INTERRUPT, ISP1763_HC_OTG_CTRL_CLEAR),
+};
+
+static const struct regmap_access_table isp1763_hc_volatile_table = {
+	.yes_ranges	= isp1763_hc_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(isp1763_hc_volatile_ranges),
+};
+
+static const struct regmap_config isp1763_hc_regmap_conf = {
+	.name = "isp1763-hc",
+	.reg_bits = 8,
+	.reg_stride = 2,
+	.val_bits = 16,
+	.fast_io = true,
+	.max_register = ISP1763_HC_OTG_CTRL_CLEAR,
+	.volatile_table = &isp1763_hc_volatile_table,
 };
 
 static const struct regmap_range isp176x_dc_volatile_ranges[] = {
 	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
 	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
-	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLEAR),
 };
 
 static const struct regmap_access_table isp176x_dc_volatile_table = {
@@ -188,13 +351,13 @@ static const struct regmap_access_table isp176x_dc_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(isp176x_dc_volatile_ranges),
 };
 
-static struct regmap_config isp1761_dc_regmap_conf = {
+static const struct regmap_config isp1761_dc_regmap_conf = {
 	.name = "isp1761-dc",
 	.reg_bits = 16,
 	.reg_stride = 4,
 	.val_bits = 32,
 	.fast_io = true,
-	.max_register = ISP1761_DC_OTG_CTRL_CLEAR,
+	.max_register = ISP176x_DC_TESTMODE,
 	.volatile_table = &isp176x_dc_volatile_table,
 };
 
@@ -236,31 +399,84 @@ static const struct reg_field isp1761_dc_reg_fields[] = {
 	[DC_ENDPTYP]		= REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
 	[DC_UFRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
 	[DC_FRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
-	[HW_OTG_DISABLE]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
-	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
-	[HW_VBUS_DRV]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
-	[HW_SEL_CP_EXT]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
-	[HW_DM_PULLDOWN]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
-	[HW_DP_PULLDOWN]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
-	[HW_DP_PULLUP]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
-	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
-	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
-	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
-	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
-	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
-	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
-	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
+	[DC_CHIP_ID_HIGH]	= REG_FIELD(ISP176x_DC_CHIPID, 16, 31),
+	[DC_CHIP_ID_LOW]	= REG_FIELD(ISP176x_DC_CHIPID, 0, 15),
+	[DC_SCRATCH]		= REG_FIELD(ISP176x_DC_SCRATCH, 0, 15),
+};
+
+static const struct regmap_range isp1763_dc_volatile_ranges[] = {
+	regmap_reg_range(ISP1763_DC_EPMAXPKTSZ, ISP1763_DC_EPTYPE),
+	regmap_reg_range(ISP1763_DC_BUFLEN, ISP1763_DC_EPINDEX),
+};
+
+static const struct regmap_access_table isp1763_dc_volatile_table = {
+	.yes_ranges	= isp1763_dc_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(isp1763_dc_volatile_ranges),
+};
+
+static const struct reg_field isp1763_dc_reg_fields[] = {
+	[DC_DEVEN]		= REG_FIELD(ISP1763_DC_ADDRESS, 7, 7),
+	[DC_DEVADDR]		= REG_FIELD(ISP1763_DC_ADDRESS, 0, 6),
+	[DC_VBUSSTAT]		= REG_FIELD(ISP1763_DC_MODE, 8, 8),
+	[DC_SFRESET]		= REG_FIELD(ISP1763_DC_MODE, 4, 4),
+	[DC_GLINTENA]		= REG_FIELD(ISP1763_DC_MODE, 3, 3),
+	[DC_CDBGMOD_ACK]	= REG_FIELD(ISP1763_DC_INTCONF, 6, 6),
+	[DC_DDBGMODIN_ACK]	= REG_FIELD(ISP1763_DC_INTCONF, 4, 4),
+	[DC_DDBGMODOUT_ACK]	= REG_FIELD(ISP1763_DC_INTCONF, 2, 2),
+	[DC_INTPOL]		= REG_FIELD(ISP1763_DC_INTCONF, 0, 0),
+	[DC_IEPRXTX_7]		= REG_FIELD(ISP1763_DC_INTENABLE, 25, 25),
+	[DC_IEPRXTX_6]		= REG_FIELD(ISP1763_DC_INTENABLE, 23, 23),
+	[DC_IEPRXTX_5]		= REG_FIELD(ISP1763_DC_INTENABLE, 21, 21),
+	[DC_IEPRXTX_4]		= REG_FIELD(ISP1763_DC_INTENABLE, 19, 19),
+	[DC_IEPRXTX_3]		= REG_FIELD(ISP1763_DC_INTENABLE, 17, 17),
+	[DC_IEPRXTX_2]		= REG_FIELD(ISP1763_DC_INTENABLE, 15, 15),
+	[DC_IEPRXTX_1]		= REG_FIELD(ISP1763_DC_INTENABLE, 13, 13),
+	[DC_IEPRXTX_0]		= REG_FIELD(ISP1763_DC_INTENABLE, 11, 11),
+	[DC_IEP0SETUP]		= REG_FIELD(ISP1763_DC_INTENABLE, 8, 8),
+	[DC_IEVBUS]		= REG_FIELD(ISP1763_DC_INTENABLE, 7, 7),
+	[DC_IEHS_STA]		= REG_FIELD(ISP1763_DC_INTENABLE, 5, 5),
+	[DC_IERESM]		= REG_FIELD(ISP1763_DC_INTENABLE, 4, 4),
+	[DC_IESUSP]		= REG_FIELD(ISP1763_DC_INTENABLE, 3, 3),
+	[DC_IEBRST]		= REG_FIELD(ISP1763_DC_INTENABLE, 0, 0),
+	[DC_EP0SETUP]		= REG_FIELD(ISP1763_DC_EPINDEX, 5, 5),
+	[DC_ENDPIDX]		= REG_FIELD(ISP1763_DC_EPINDEX, 1, 4),
+	[DC_EPDIR]		= REG_FIELD(ISP1763_DC_EPINDEX, 0, 0),
+	[DC_CLBUF]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 4, 4),
+	[DC_VENDP]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 3, 3),
+	[DC_DSEN]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 2, 2),
+	[DC_STATUS]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 1, 1),
+	[DC_STALL]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 0, 0),
+	[DC_BUFLEN]		= REG_FIELD(ISP1763_DC_BUFLEN, 0, 15),
+	[DC_FFOSZ]		= REG_FIELD(ISP1763_DC_EPMAXPKTSZ, 0, 10),
+	[DC_EPENABLE]		= REG_FIELD(ISP1763_DC_EPTYPE, 3, 3),
+	[DC_ENDPTYP]		= REG_FIELD(ISP1763_DC_EPTYPE, 0, 1),
+	[DC_UFRAMENUM]		= REG_FIELD(ISP1763_DC_FRAMENUM, 11, 13),
+	[DC_FRAMENUM]		= REG_FIELD(ISP1763_DC_FRAMENUM, 0, 10),
+	[DC_CHIP_ID_HIGH]	= REG_FIELD(ISP1763_DC_CHIPID_HIGH, 0, 15),
+	[DC_CHIP_ID_LOW]	= REG_FIELD(ISP1763_DC_CHIPID_LOW, 0, 15),
+	[DC_SCRATCH]		= REG_FIELD(ISP1763_DC_SCRATCH, 0, 15),
+};
+
+static const struct regmap_config isp1763_dc_regmap_conf = {
+	.name = "isp1763-dc",
+	.reg_bits = 8,
+	.reg_stride = 2,
+	.val_bits = 16,
+	.fast_io = true,
+	.max_register = ISP1763_DC_TESTMODE,
+	.volatile_table = &isp1763_dc_volatile_table,
 };
 
 int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 		     struct device *dev, unsigned int devflags)
 {
+	bool udc_disabled = !(devflags & ISP1760_FLAG_ISP1761);
+	const struct regmap_config *hc_regmap;
+	const struct reg_field *hc_reg_fields;
 	struct isp1760_device *isp;
 	struct isp1760_hcd *hcd;
 	struct isp1760_udc *udc;
-	bool udc_disabled = !(devflags & ISP1760_FLAG_ISP1761);
 	struct regmap_field *f;
-	void __iomem *base;
 	int ret;
 	int i;
 
@@ -281,9 +497,19 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 	hcd = &isp->hcd;
 	udc = &isp->udc;
 
-	if (devflags & ISP1760_FLAG_BUS_WIDTH_16) {
-		isp1760_hc_regmap_conf.val_bits = 16;
-		isp1761_dc_regmap_conf.val_bits = 16;
+	hcd->is_isp1763 = !!(devflags & ISP1760_FLAG_ISP1763);
+
+	if (!hcd->is_isp1763 && (devflags & ISP1760_FLAG_BUS_WIDTH_8)) {
+		dev_err(dev, "isp1760/61 do not support data width 8\n");
+		return -EINVAL;
+	}
+
+	if (hcd->is_isp1763) {
+		hc_regmap = &isp1763_hc_regmap_conf;
+		hc_reg_fields = &isp1763_hc_reg_fields[0];
+	} else {
+		hc_regmap = &isp1760_hc_regmap_conf;
+		hc_reg_fields = &isp1760_hc_reg_fields[0];
 	}
 
 	isp->rst_gpio = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
@@ -294,20 +520,20 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 	if (IS_ERR(hcd->base))
 		return PTR_ERR(hcd->base);
 
-	hcd->regs = devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap_conf);
+	hcd->regs = devm_regmap_init_mmio(dev, hcd->base, hc_regmap);
 	if (IS_ERR(hcd->regs))
 		return PTR_ERR(hcd->regs);
 
 	for (i = 0; i < HC_FIELD_MAX; i++) {
-		f = devm_regmap_field_alloc(dev, hcd->regs,
-					    isp1760_hc_reg_fields[i]);
+		f = devm_regmap_field_alloc(dev, hcd->regs, hc_reg_fields[i]);
 		if (IS_ERR(f))
 			return PTR_ERR(f);
 
 		hcd->fields[i] = f;
 	}
 
-	udc->regs = devm_regmap_init_mmio(dev, base, &isp1761_dc_regmap_conf);
+	udc->regs = devm_regmap_init_mmio(dev, hcd->base,
+					  &isp1761_dc_regmap_conf);
 	if (IS_ERR(udc->regs))
 		return PTR_ERR(udc->regs);
 
@@ -320,9 +546,14 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 		udc->fields[i] = f;
 	}
 
-	hcd->memory_layout = &isp176x_memory_conf;
+	if (hcd->is_isp1763)
+		hcd->memory_layout = &isp1763_memory_conf;
+	else
+		hcd->memory_layout = &isp176x_memory_conf;
 
-	isp1760_init_core(isp);
+	ret = isp1760_init_core(isp);
+	if (ret < 0)
+		return ret;
 
 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
 		ret = isp1760_hcd_register(hcd, mem, irq,
diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
index 7a6755d68d41..91e0ee3992a7 100644
--- a/drivers/usb/isp1760/isp1760-core.h
+++ b/drivers/usb/isp1760/isp1760-core.h
@@ -2,12 +2,14 @@
 /*
  * Driver for the NXP ISP1760 chip
  *
+ * Copyright 2021 Linaro, Rui Miguel Silva
  * Copyright 2014 Laurent Pinchart
  * Copyright 2007 Sebastian Siewior
  *
  * Contacts:
  *	Sebastian Siewior <bigeasy@linutronix.de>
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *	Rui Miguel Silva <rui.silva@linaro.org>
  */
 
 #ifndef _ISP1760_CORE_H_
@@ -35,6 +37,8 @@ struct gpio_desc;
 #define ISP1760_FLAG_ISP1761		0x00000040 /* Chip is ISP1761 */
 #define ISP1760_FLAG_INTR_POL_HIGH	0x00000080 /* Interrupt polarity active high */
 #define ISP1760_FLAG_INTR_EDGE_TRIG	0x00000100 /* Interrupt edge triggered */
+#define ISP1760_FLAG_ISP1763		0x00000200 /* Chip is ISP1763 */
+#define ISP1760_FLAG_BUS_WIDTH_8	0x00000400 /* 8-bit data bus width */
 
 struct isp1760_device {
 	struct device *dev;
diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index a65f5f917ebe..016a54ea76f4 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -11,6 +11,8 @@
  *
  * (c) 2011 Arvid Brodin <arvid.brodin@enea.com>
  *
+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
+ *
  */
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -44,6 +46,9 @@ static inline struct isp1760_hcd *hcd_to_priv(struct usb_hcd *hcd)
 	return *(struct isp1760_hcd **)hcd->hcd_priv;
 }
 
+#define dw_to_le32(x)	(cpu_to_le32((__force u32)x))
+#define le32_to_dw(x)	((__force __dw)(le32_to_cpu(x)))
+
 /* urb state*/
 #define DELETE_URB		(0x0008)
 #define NO_TRANSFER_ACTIVE	(0xffffffff)
@@ -60,6 +65,18 @@ struct ptd {
 	__dw dw6;
 	__dw dw7;
 };
+
+struct ptd_le32 {
+	__le32 dw0;
+	__le32 dw1;
+	__le32 dw2;
+	__le32 dw3;
+	__le32 dw4;
+	__le32 dw5;
+	__le32 dw6;
+	__le32 dw7;
+};
+
 #define PTD_OFFSET		0x0400
 #define ISO_PTD_OFFSET		0x0400
 #define INT_PTD_OFFSET		0x0800
@@ -96,7 +113,7 @@ struct ptd {
 #define TO_DW2_RL(x)			TO_DW(((x) << 25))
 #define FROM_DW2_RL(x)			((TO_U32(x) >> 25) & 0xf)
 /* DW3 */
-#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x7fff)
+#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x3fff)
 #define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	TO_U32((x) & 0x07ff)
 #define TO_DW3_NAKCOUNT(x)		TO_DW(((x) << 19))
 #define FROM_DW3_NAKCOUNT(x)		((TO_U32(x) >> 19) & 0xf)
@@ -123,7 +140,7 @@ struct ptd {
 /* Errata 1 */
 #define RL_COUNTER	(0)
 #define NAK_COUNTER	(0)
-#define ERR_COUNTER	(2)
+#define ERR_COUNTER	(3)
 
 struct isp1760_qtd {
 	u8 packet_type;
@@ -165,6 +182,18 @@ struct urb_listitem {
 	struct urb *urb;
 };
 
+static const u32 isp1763_hc_portsc1_fields[] = {
+	[PORT_OWNER]		= BIT(13),
+	[PORT_POWER]		= BIT(12),
+	[PORT_LSTATUS]		= BIT(10),
+	[PORT_RESET]		= BIT(8),
+	[PORT_SUSPEND]		= BIT(7),
+	[PORT_RESUME]		= BIT(6),
+	[PORT_PE]		= BIT(2),
+	[PORT_CSC]		= BIT(1),
+	[PORT_CONNECT]		= BIT(0),
+};
+
 /*
  * Access functions for isp176x registers regmap fields
  */
@@ -175,10 +204,30 @@ static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
 	return isp1760_field_read(priv->fields, field);
 }
 
+/*
+ * We need, in isp1763, to write directly the values to the portsc1
+ * register so it will make the other values to trigger.
+ */
+static void isp1760_hcd_portsc1_set_clear(struct isp1760_hcd *priv, u32 field,
+					  u32 val)
+{
+	u32 bit = isp1763_hc_portsc1_fields[field];
+	u32 port_status = readl(priv->base + ISP1763_HC_PORTSC1);
+
+	if (val)
+		writel(port_status | bit, priv->base + ISP1763_HC_PORTSC1);
+	else
+		writel(port_status & ~bit, priv->base + ISP1763_HC_PORTSC1);
+}
+
 static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 
+	if (unlikely(priv->is_isp1763 &&
+		     (field >= PORT_OWNER && field <= PORT_CONNECT)))
+		return isp1760_hcd_portsc1_set_clear(priv, field, val);
+
 	isp1760_field_write(priv->fields, field, val);
 }
 
@@ -192,28 +241,40 @@ static void isp1760_hcd_clear(struct usb_hcd *hcd, u32 field)
 	isp1760_hcd_write(hcd, field, 0);
 }
 
-static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 field,
-					u32 timeout_us)
+static int isp1760_hcd_set_and_wait(struct usb_hcd *hcd, u32 field,
+				    u32 timeout_us)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	u32 val;
+
+	isp1760_hcd_set(hcd, field);
+
+	return regmap_field_read_poll_timeout(priv->fields[field], val,
+					      val, 10, timeout_us);
+}
+
+static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field,
+					 u32 timeout_us)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
-	unsigned int val;
+	u32 val;
 
 	isp1760_hcd_set(hcd, field);
 
-	return regmap_field_read_poll_timeout(priv->fields[field], val, 1, 1,
-					      timeout_us);
+	return regmap_field_read_poll_timeout(priv->fields[field], val,
+					      !val, 10, timeout_us);
 }
 
-static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32 field,
-					  u32 timeout_us)
+static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
+				      u32 timeout_us)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
-	unsigned int val;
+	u32 val;
 
 	isp1760_hcd_clear(hcd, field);
 
-	return regmap_field_read_poll_timeout(priv->fields[field], val, 0, 1,
-					      timeout_us);
+	return regmap_field_read_poll_timeout(priv->fields[field], val,
+					      !val, 10, timeout_us);
 }
 
 static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
@@ -221,12 +282,32 @@ static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
 	return !!isp1760_hcd_read(hcd, field);
 }
 
+static bool isp1760_hcd_ppc_is_set(struct usb_hcd *hcd)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	if (priv->is_isp1763)
+		return true;
+
+	return isp1760_hcd_is_set(hcd, HCS_PPC);
+}
+
+static u32 isp1760_hcd_n_ports(struct usb_hcd *hcd)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	if (priv->is_isp1763)
+		return 1;
+
+	return isp1760_hcd_read(hcd, HCS_N_PORTS);
+}
+
 /*
  * Access functions for isp176x memory (offset >= 0x0400).
  *
  * bank_reads8() reads memory locations prefetched by an earlier write to
  * HC_MEMORY_REG (see isp176x datasheet). Unless you want to do fancy multi-
- * bank optimizations, you should use the more generic mem_reads8() below.
+ * bank optimizations, you should use the more generic mem_read() below.
  *
  * For access to ptd memory, use the specialized ptd_read() and ptd_write()
  * below.
@@ -281,19 +362,59 @@ static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
 	}
 }
 
-static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base,
-		       u32 src_offset, void *dst, u32 bytes)
+static void isp1760_mem_read(struct usb_hcd *hcd, u32 src_offset, void *dst,
+			     u32 bytes)
 {
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
 	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
 	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
+	ndelay(100);
 
-	ndelay(90);
+	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
+}
 
-	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
+/*
+ * ISP1763 does not have the banks direct host controller memory access,
+ * needs to use the HC_DATA register. Add data read/write according to this,
+ * and also adjust 16bit access.
+ */
+static void isp1763_mem_read(struct usb_hcd *hcd, u16 srcaddr,
+			     u16 *dstptr, u32 bytes)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	/* Write the starting device address to the hcd memory register */
+	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, srcaddr);
+	ndelay(100); /* Delay between consecutive access */
+
+	/* As long there are at least 16-bit to read ... */
+	while (bytes >= 2) {
+		*dstptr = __raw_readw(priv->base + ISP1763_HC_DATA);
+		bytes -= 2;
+		dstptr++;
+	}
+
+	/* If there are no more bytes to read, return */
+	if (bytes <= 0)
+		return;
+
+	*((u8 *)dstptr) = (u8)(readw(priv->base + ISP1763_HC_DATA) & 0xFF);
+}
+
+static void mem_read(struct usb_hcd *hcd, u32 src_offset, __u32 *dst,
+		     u32 bytes)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	if (!priv->is_isp1763)
+		return isp1760_mem_read(hcd, src_offset, (u16 *)dst, bytes);
+
+	isp1763_mem_read(hcd, (u16)src_offset, (u16 *)dst, bytes);
 }
 
-static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
-						__u32 const *src, u32 bytes)
+static void isp1760_mem_write(void __iomem *dst_base, u32 dst_offset,
+			      __u32 const *src, u32 bytes)
 {
 	__u32 __iomem *dst;
 
@@ -327,33 +448,136 @@ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
 		__raw_writel(*src, dst);
 }
 
+static void isp1763_mem_write(struct usb_hcd *hcd, u16 dstaddr, u16 *src,
+			      u32 bytes)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	/* Write the starting device address to the hcd memory register */
+	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, dstaddr);
+	ndelay(100); /* Delay between consecutive access */
+
+	while (bytes >= 2) {
+		/* Get and write the data; then adjust the data ptr and len */
+		__raw_writew(*src, priv->base + ISP1763_HC_DATA);
+		bytes -= 2;
+		src++;
+	}
+
+	/* If there are no more bytes to process, return */
+	if (bytes <= 0)
+		return;
+
+	/*
+	 * The only way to get here is if there is a single byte left,
+	 * get it and write it to the data reg;
+	 */
+	writew(*((u8 *)src), priv->base + ISP1763_HC_DATA);
+}
+
+static void mem_write(struct usb_hcd *hcd, u32 dst_offset, __u32 *src,
+		      u32 bytes)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	if (!priv->is_isp1763)
+		return isp1760_mem_write(priv->base, dst_offset, src, bytes);
+
+	isp1763_mem_write(hcd, dst_offset, (u16 *)src, bytes);
+}
+
 /*
  * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
  * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
  */
-static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
-		     u32 ptd_offset, u32 slot, struct ptd *ptd)
+static void isp1760_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
+			     struct ptd *ptd)
 {
+	u16 src_offset = ptd_offset + slot * sizeof(*ptd);
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
 	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-	isp1760_hcd_write(hcd, MEM_START_ADDR,
-			  ptd_offset + slot * sizeof(*ptd));
+	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
 	ndelay(90);
-	bank_reads8(base, ptd_offset + slot * sizeof(*ptd), ISP_BANK_0,
-		    (void *)ptd, sizeof(*ptd));
+
+	bank_reads8(priv->base, src_offset, ISP_BANK_0, (void *)ptd,
+		    sizeof(*ptd));
+}
+
+static void isp1763_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
+			     struct ptd *ptd)
+{
+	u16 src_offset = ptd_offset + slot * sizeof(*ptd);
+	struct ptd_le32 le32_ptd;
+
+	isp1763_mem_read(hcd, src_offset, (u16 *)&le32_ptd, sizeof(le32_ptd));
+	/* Normalize the data obtained */
+	ptd->dw0 = le32_to_dw(le32_ptd.dw0);
+	ptd->dw1 = le32_to_dw(le32_ptd.dw1);
+	ptd->dw2 = le32_to_dw(le32_ptd.dw2);
+	ptd->dw3 = le32_to_dw(le32_ptd.dw3);
+	ptd->dw4 = le32_to_dw(le32_ptd.dw4);
+	ptd->dw5 = le32_to_dw(le32_ptd.dw5);
+	ptd->dw6 = le32_to_dw(le32_ptd.dw6);
+	ptd->dw7 = le32_to_dw(le32_ptd.dw7);
+}
+
+static void ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
+		     struct ptd *ptd)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	if (!priv->is_isp1763)
+		return isp1760_ptd_read(hcd, ptd_offset, slot, ptd);
+
+	isp1763_ptd_read(hcd, ptd_offset, slot, ptd);
+}
+
+static void isp1763_ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
+			      struct ptd *cpu_ptd)
+{
+	u16 dst_offset = ptd_offset + slot * sizeof(*cpu_ptd);
+	struct ptd_le32 ptd;
+
+	ptd.dw0 = dw_to_le32(cpu_ptd->dw0);
+	ptd.dw1 = dw_to_le32(cpu_ptd->dw1);
+	ptd.dw2 = dw_to_le32(cpu_ptd->dw2);
+	ptd.dw3 = dw_to_le32(cpu_ptd->dw3);
+	ptd.dw4 = dw_to_le32(cpu_ptd->dw4);
+	ptd.dw5 = dw_to_le32(cpu_ptd->dw5);
+	ptd.dw6 = dw_to_le32(cpu_ptd->dw6);
+	ptd.dw7 = dw_to_le32(cpu_ptd->dw7);
+
+	isp1763_mem_write(hcd, dst_offset,  (u16 *)&ptd.dw0,
+			  8 * sizeof(ptd.dw0));
 }
 
-static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
-								struct ptd *ptd)
+static void isp1760_ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
+			      struct ptd *ptd)
 {
-	mem_writes8(base, ptd_offset + slot*sizeof(*ptd) + sizeof(ptd->dw0),
-		    (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
-	/* Make sure dw0 gets written last (after other dw's and after payload)
-	   since it contains the enable bit */
+	u32 dst_offset = ptd_offset + slot * sizeof(*ptd);
+
+	/*
+	 * Make sure dw0 gets written last (after other dw's and after payload)
+	 *  since it contains the enable bit
+	 */
+	isp1760_mem_write(base, dst_offset + sizeof(ptd->dw0),
+			  (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
 	wmb();
-	mem_writes8(base, ptd_offset + slot * sizeof(*ptd),
-		    (__force u32 *)&ptd->dw0, sizeof(ptd->dw0));
+	isp1760_mem_write(base, dst_offset, (__force u32 *)&ptd->dw0,
+			  sizeof(ptd->dw0));
 }
 
+static void ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
+		      struct ptd *ptd)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+
+	if (!priv->is_isp1763)
+		return isp1760_ptd_write(priv->base, ptd_offset, slot, ptd);
+
+	isp1763_ptd_write(hcd, ptd_offset, slot, ptd);
+}
 
 /* memory management of the 60kb on the chip from 0x1000 to 0xffff */
 static void init_memory(struct isp1760_hcd *priv)
@@ -430,7 +654,7 @@ static int ehci_reset(struct usb_hcd *hcd)
 	hcd->state = HC_STATE_HALT;
 	priv->next_statechange = jiffies;
 
-	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
+	return isp1760_hcd_set_and_wait_swap(hcd, CMD_RESET, 250 * 1000);
 }
 
 static struct isp1760_qh *qh_alloc(gfp_t flags)
@@ -461,7 +685,6 @@ static int priv_init(struct usb_hcd *hcd)
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 	u32 isoc_cache;
 	u32 isoc_thres;
-
 	int i;
 
 	spin_lock_init(&priv->lock);
@@ -475,6 +698,11 @@ static int priv_init(struct usb_hcd *hcd)
 	 */
 	priv->periodic_size = DEFAULT_I_TDPS;
 
+	if (priv->is_isp1763) {
+		priv->i_thresh = 2;
+		return 0;
+	}
+
 	/* controllers may cache some of the periodic schedule ... */
 	isoc_cache = isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
 	isoc_thres = isp1760_hcd_read(hcd, HCC_ISOC_THRES);
@@ -491,16 +719,24 @@ static int priv_init(struct usb_hcd *hcd)
 static int isp1760_hc_setup(struct usb_hcd *hcd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	u32 atx_reset;
 	int result;
 	u32 scratch;
+	u32 pattern;
 
-	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
+	if (priv->is_isp1763)
+		pattern = 0xcafe;
+	else
+		pattern = 0xdeadcafe;
+
+	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
 
 	/* Change bus pattern */
-	scratch = isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
-	scratch = isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
-	if (scratch != 0xdeadbabe) {
-		dev_err(hcd->self.controller, "Scratch test failed.\n");
+	scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
+	dev_err(hcd->self.controller, "Scratch test 0x%08x\n", scratch);
+	scratch = isp1760_hcd_read(hcd, HC_SCRATCH);
+	if (scratch != pattern) {
+		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratch);
 		return -ENODEV;
 	}
 
@@ -512,13 +748,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
 	 * the host controller through the EHCI USB Command register. The device
 	 * has been reset in core code anyway, so this shouldn't matter.
 	 */
-	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-			  NO_TRANSFER_ACTIVE);
-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-			  NO_TRANSFER_ACTIVE);
-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
-			  NO_TRANSFER_ACTIVE);
+	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
+	isp1760_hcd_clear(hcd, INT_BUF_FILL);
+	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
+
+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
 
 	result = ehci_reset(hcd);
 	if (result)
@@ -527,11 +763,26 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
 	/* Step 11 passed */
 
 	/* ATL reset */
-	isp1760_hcd_set(hcd, ALL_ATX_RESET);
+	if (priv->is_isp1763)
+		atx_reset = SW_RESET_RESET_ATX;
+	else
+		atx_reset = ALL_ATX_RESET;
+
+	isp1760_hcd_set(hcd, atx_reset);
 	mdelay(10);
-	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
+	isp1760_hcd_clear(hcd, atx_reset);
 
-	isp1760_hcd_set(hcd, HC_INT_ENABLE);
+	if (priv->is_isp1763) {
+		isp1760_hcd_set(hcd, HW_OTG_DISABLE);
+		isp1760_hcd_set(hcd, HW_SW_SEL_HC_DC_CLEAR);
+		isp1760_hcd_set(hcd, HW_HC_2_DIS_CLEAR);
+		mdelay(10);
+
+		isp1760_hcd_set(hcd, HW_INTF_LOCK);
+	}
+
+	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
+	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
 
 	return priv_init(hcd);
 }
@@ -751,45 +1002,45 @@ static void start_bus_transfer(struct usb_hcd *hcd, u32 ptd_offset, int slot,
 				struct ptd *ptd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	const struct isp1760_memory_layout *mem = priv->memory_layout;
 	int skip_map;
 
-	WARN_ON((slot < 0) || (slot > 31));
+	WARN_ON((slot < 0) || (slot > mem->slot_num - 1));
 	WARN_ON(qtd->length && !qtd->payload_addr);
 	WARN_ON(slots[slot].qtd);
 	WARN_ON(slots[slot].qh);
 	WARN_ON(qtd->status != QTD_PAYLOAD_ALLOC);
 
+	if (priv->is_isp1763)
+		ndelay(100);
+
 	/* Make sure done map has not triggered from some unlinked transfer */
 	if (ptd_offset == ATL_PTD_OFFSET) {
-		priv->atl_done_map |= isp1760_reg_read(priv->regs,
-						ISP176x_HC_ATL_PTD_DONEMAP);
+		skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP,
+				  skip_map | (1 << slot));
+		priv->atl_done_map |= isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
 		priv->atl_done_map &= ~(1 << slot);
 	} else {
-		priv->int_done_map |= isp1760_reg_read(priv->regs,
-					       ISP176x_HC_INT_PTD_DONEMAP);
+		skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP,
+				  skip_map | (1 << slot));
+		priv->int_done_map |= isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
 		priv->int_done_map &= ~(1 << slot);
 	}
 
+	skip_map &= ~(1 << slot);
 	qh->slot = slot;
 	qtd->status = QTD_XFER_STARTED;
 	slots[slot].timestamp = jiffies;
 	slots[slot].qtd = qtd;
 	slots[slot].qh = qh;
-	ptd_write(priv->base, ptd_offset, slot, ptd);
+	ptd_write(hcd, ptd_offset, slot, ptd);
 
-	if (ptd_offset == ATL_PTD_OFFSET) {
-		skip_map = isp1760_reg_read(priv->regs,
-					    ISP176x_HC_ATL_PTD_SKIPMAP);
-		skip_map &= ~(1 << qh->slot);
-		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-				  skip_map);
-	} else {
-		skip_map = isp1760_reg_read(priv->regs,
-					    ISP176x_HC_INT_PTD_SKIPMAP);
-		skip_map &= ~(1 << qh->slot);
-		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-				  skip_map);
-	}
+	if (ptd_offset == ATL_PTD_OFFSET)
+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
+	else
+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
 }
 
 static int is_short_bulk(struct isp1760_qtd *qtd)
@@ -801,7 +1052,6 @@ static int is_short_bulk(struct isp1760_qtd *qtd)
 static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
 						struct list_head *urb_list)
 {
-	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 	struct isp1760_qtd *qtd, *qtd_next;
 	struct urb_listitem *urb_listitem;
 	int last_qtd;
@@ -819,10 +1069,9 @@ static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
 			if (qtd->actual_length) {
 				switch (qtd->packet_type) {
 				case IN_PID:
-					mem_reads8(hcd, priv->base,
-						   qtd->payload_addr,
-						   qtd->data_buffer,
-						   qtd->actual_length);
+					mem_read(hcd, qtd->payload_addr,
+						 qtd->data_buffer,
+						 qtd->actual_length);
 					fallthrough;
 				case OUT_PID:
 					qtd->urb->actual_length +=
@@ -866,6 +1115,8 @@ static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
 static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	const struct isp1760_memory_layout *mem = priv->memory_layout;
+	int slot_num = mem->slot_num;
 	int ptd_offset;
 	struct isp1760_slotinfo *slots;
 	int curr_slot, free_slot;
@@ -892,7 +1143,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
 	}
 
 	free_slot = -1;
-	for (curr_slot = 0; curr_slot < 32; curr_slot++) {
+	for (curr_slot = 0; curr_slot < slot_num; curr_slot++) {
 		if ((free_slot == -1) && (slots[curr_slot].qtd == NULL))
 			free_slot = curr_slot;
 		if (slots[curr_slot].qh == qh)
@@ -907,11 +1158,10 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
 			if ((qtd->length) && (!qtd->payload_addr))
 				break;
 
-			if ((qtd->length) &&
-			    ((qtd->packet_type == SETUP_PID) ||
-			     (qtd->packet_type == OUT_PID))) {
-				mem_writes8(priv->base, qtd->payload_addr,
-					    qtd->data_buffer, qtd->length);
+			if (qtd->length && (qtd->packet_type == SETUP_PID ||
+					    qtd->packet_type == OUT_PID)) {
+				mem_write(hcd, qtd->payload_addr,
+					  qtd->data_buffer, qtd->length);
 			}
 
 			qtd->status = QTD_PAYLOAD_ALLOC;
@@ -924,7 +1174,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
 					"available for transfer\n", __func__);
 */
 			/* Start xfer for this endpoint if not already done */
-			if ((curr_slot > 31) && (free_slot > -1)) {
+			if ((curr_slot > slot_num - 1) && (free_slot > -1)) {
 				if (usb_pipeint(qtd->urb->pipe))
 					create_ptd_int(qh, qtd, &ptd);
 				else
@@ -1111,9 +1361,9 @@ static void handle_done_ptds(struct usb_hcd *hcd)
 	int modified;
 	int skip_map;
 
-	skip_map = isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP);
+	skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
 	priv->int_done_map &= ~skip_map;
-	skip_map = isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP);
+	skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
 	priv->atl_done_map &= ~skip_map;
 
 	modified = priv->int_done_map || priv->atl_done_map;
@@ -1131,7 +1381,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
 				continue;
 			}
 			ptd_offset = INT_PTD_OFFSET;
-			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
+			ptd_read(hcd, INT_PTD_OFFSET, slot, &ptd);
 			state = check_int_transfer(hcd, &ptd,
 							slots[slot].qtd->urb);
 		} else {
@@ -1146,7 +1396,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
 				continue;
 			}
 			ptd_offset = ATL_PTD_OFFSET;
-			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
+			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
 			state = check_atl_transfer(hcd, &ptd,
 							slots[slot].qtd->urb);
 		}
@@ -1239,27 +1489,30 @@ static void handle_done_ptds(struct usb_hcd *hcd)
 static irqreturn_t isp1760_irq(struct usb_hcd *hcd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
-	u32 imask;
 	irqreturn_t irqret = IRQ_NONE;
+	u32 int_reg;
+	u32 imask;
 
 	spin_lock(&priv->lock);
 
 	if (!(hcd->state & HC_STATE_RUNNING))
 		goto leave;
 
-	imask = isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
+	imask = isp1760_hcd_read(hcd, HC_INTERRUPT);
 	if (unlikely(!imask))
 		goto leave;
-	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Clear */
 
-	priv->int_done_map |= isp1760_reg_read(priv->regs,
-					       ISP176x_HC_INT_PTD_DONEMAP);
-	priv->atl_done_map |= isp1760_reg_read(priv->regs,
-					       ISP176x_HC_ATL_PTD_DONEMAP);
+	int_reg = priv->is_isp1763 ? ISP1763_HC_INTERRUPT :
+		ISP176x_HC_INTERRUPT;
+	isp1760_reg_write(priv->regs, int_reg, imask);
+
+	priv->int_done_map |= isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
+	priv->atl_done_map |= isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
 
 	handle_done_ptds(hcd);
 
 	irqret = IRQ_HANDLED;
+
 leave:
 	spin_unlock(&priv->lock);
 
@@ -1300,17 +1553,18 @@ static void errata2_function(struct timer_list *unused)
 {
 	struct usb_hcd *hcd = errata2_timer_hcd;
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	const struct isp1760_memory_layout *mem = priv->memory_layout;
 	int slot;
 	struct ptd ptd;
 	unsigned long spinflags;
 
 	spin_lock_irqsave(&priv->lock, spinflags);
 
-	for (slot = 0; slot < 32; slot++)
+	for (slot = 0; slot < mem->slot_num; slot++)
 		if (priv->atl_slots[slot].qh && time_after(jiffies,
 					priv->atl_slots[slot].timestamp +
 					msecs_to_jiffies(SLOT_TIMEOUT))) {
-			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
+			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
 			if (!FROM_DW0_VALID(ptd.dw0) &&
 					!FROM_DW3_ACTIVE(ptd.dw3))
 				priv->atl_done_map |= 1 << slot;
@@ -1325,23 +1579,113 @@ static void errata2_function(struct timer_list *unused)
 	add_timer(&errata2_timer);
 }
 
+static int isp1763_run(struct usb_hcd *hcd)
+{
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	int retval;
+	u32 chipid_h;
+	u32 chipid_l;
+	u32 chip_rev;
+	u32 ptd_atl_int;
+	u32 ptd_iso;
+
+	hcd->uses_new_polling = 1;
+	hcd->state = HC_STATE_RUNNING;
+
+	chipid_h = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
+	chipid_l = isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
+	chip_rev = isp1760_hcd_read(hcd, HC_CHIP_REV);
+	dev_info(hcd->self.controller, "USB ISP %02x%02x HW rev. %d started\n",
+		 chipid_h, chipid_l, chip_rev);
+
+	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
+	isp1760_hcd_clear(hcd, INT_BUF_FILL);
+	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
+
+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
+	ndelay(100);
+	isp1760_hcd_clear(hcd, HC_ATL_PTD_DONEMAP);
+	isp1760_hcd_clear(hcd, HC_INT_PTD_DONEMAP);
+	isp1760_hcd_clear(hcd, HC_ISO_PTD_DONEMAP);
+
+	isp1760_hcd_set(hcd, HW_OTG_DISABLE);
+	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, BIT(7));
+	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, BIT(15));
+	mdelay(10);
+
+	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
+	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
+
+	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
+
+	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
+	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
+	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
+
+	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
+	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
+	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
+
+	ptd_atl_int = 0x8000;
+	ptd_iso = 0x0001;
+
+	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
+	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
+	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
+
+	isp1760_hcd_set(hcd, ATL_BUF_FILL);
+	isp1760_hcd_set(hcd, INT_BUF_FILL);
+
+	isp1760_hcd_clear(hcd, CMD_LRESET);
+	isp1760_hcd_clear(hcd, CMD_RESET);
+
+	retval = isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
+	if (retval)
+		return retval;
+
+	down_write(&ehci_cf_port_reset_rwsem);
+	retval = isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
+	up_write(&ehci_cf_port_reset_rwsem);
+	retval = 0;
+	if (retval)
+		return retval;
+
+	return 0;
+}
+
 static int isp1760_run(struct usb_hcd *hcd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
 	int retval;
-	u32 chipid;
+	u32 chipid_h;
+	u32 chipid_l;
+	u32 chip_rev;
+	u32 ptd_atl_int;
+	u32 ptd_iso;
+
+	/*
+	 * ISP1763 have some differences in the setup and order to enable
+	 * the ports, disable otg, setup buffers, and ATL, INT, ISO status.
+	 * So, just handle it a separate sequence.
+	 */
+	if (priv->is_isp1763)
+		return isp1763_run(hcd);
 
 	hcd->uses_new_polling = 1;
 
 	hcd->state = HC_STATE_RUNNING;
 
 	/* Set PTD interrupt AND & OR maps */
-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xffffffff);
-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xffffffff);
-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xffffffff);
+	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
+	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
+	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
+
+	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
+	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
+	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
+
 	/* step 23 passed */
 
 	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
@@ -1349,7 +1693,7 @@ static int isp1760_run(struct usb_hcd *hcd)
 	isp1760_hcd_clear(hcd, CMD_LRESET);
 	isp1760_hcd_clear(hcd, CMD_RESET);
 
-	retval = isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000);
+	retval = isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
 	if (retval)
 		return retval;
 
@@ -1360,7 +1704,7 @@ static int isp1760_run(struct usb_hcd *hcd)
 	 */
 	down_write(&ehci_cf_port_reset_rwsem);
 
-	retval = isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000);
+	retval = isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
 	up_write(&ehci_cf_port_reset_rwsem);
 	if (retval)
 		return retval;
@@ -1370,19 +1714,25 @@ static int isp1760_run(struct usb_hcd *hcd)
 	errata2_timer.expires = jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD);
 	add_timer(&errata2_timer);
 
-	chipid = isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
-	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n",
-					chipid & 0xffff, chipid >> 16);
+	chipid_h = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
+	chipid_l = isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
+	chip_rev = isp1760_hcd_read(hcd, HC_CHIP_REV);
+	dev_info(hcd->self.controller, "USB ISP %02x%02x HW rev. %d started\n",
+		 chipid_h, chipid_l, chip_rev);
 
 	/* PTD Register Init Part 2, Step 28 */
 
 	/* Setup registers controlling PTD checking */
-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000000);
-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000000);
-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000001);
-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xffffffff);
-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xffffffff);
-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xffffffff);
+	ptd_atl_int = 0x80000000;
+	ptd_iso = 0x00000001;
+
+	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
+	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
+	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
+
+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
 
 	isp1760_hcd_set(hcd, ATL_BUF_FILL);
 	isp1760_hcd_set(hcd, INT_BUF_FILL);
@@ -1623,19 +1973,16 @@ static void kill_transfer(struct usb_hcd *hcd, struct urb *urb,
 	/* We need to forcefully reclaim the slot since some transfers never
 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
-		skip_map = isp1760_reg_read(priv->regs,
-					    ISP176x_HC_ATL_PTD_SKIPMAP);
+		skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
 		skip_map |= (1 << qh->slot);
-		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-				  skip_map);
+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
+		ndelay(100);
 		priv->atl_slots[qh->slot].qh = NULL;
 		priv->atl_slots[qh->slot].qtd = NULL;
 	} else {
-		skip_map = isp1760_reg_read(priv->regs,
-					    ISP176x_HC_INT_PTD_SKIPMAP);
+		skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
 		skip_map |= (1 << qh->slot);
-		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-				  skip_map);
+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
 		priv->int_slots[qh->slot].qh = NULL;
 		priv->int_slots[qh->slot].qtd = NULL;
 	}
@@ -1791,7 +2138,7 @@ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
 	int ports;
 	u16 temp;
 
-	ports = isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
+	ports = isp1760_hcd_n_ports(priv->hcd);
 
 	desc->bDescriptorType = USB_DT_HUB;
 	/* priv 1.0, 2.3.9 says 20ms max */
@@ -1808,7 +2155,7 @@ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
 
 	/* per-port overcurrent reporting */
 	temp = HUB_CHAR_INDV_PORT_OCPM;
-	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
+	if (isp1760_hcd_ppc_is_set(priv->hcd))
 		/* per-port power control */
 		temp |= HUB_CHAR_INDV_PORT_LPSM;
 	else
@@ -1849,7 +2196,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 	int retval = 0;
 	int ports;
 
-	ports = isp1760_hcd_read(hcd, HCS_N_PORTS);
+	ports = isp1760_hcd_n_ports(hcd);
 
 	/*
 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
@@ -1908,7 +2255,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 			/* we auto-clear this feature */
 			break;
 		case USB_PORT_FEAT_POWER:
-			if (isp1760_hcd_is_set(hcd, HCS_PPC))
+			if (isp1760_hcd_ppc_is_set(hcd))
 				isp1760_hcd_clear(hcd, PORT_POWER);
 			break;
 		case USB_PORT_FEAT_C_CONNECTION:
@@ -1923,7 +2270,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		default:
 			goto error;
 		}
-		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
+		isp1760_hcd_read(hcd, CMD_RUN);
 		break;
 	case GetHubDescriptor:
 		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
@@ -1943,7 +2290,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		if (isp1760_hcd_is_set(hcd, PORT_CSC))
 			status |= USB_PORT_STAT_C_CONNECTION << 16;
 
-
 		/* whoever resumes must GetPortStatus to complete it!! */
 		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
 			dev_err(hcd->self.controller, "Port resume should be skipped.\n");
@@ -1966,7 +2312,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 				/* stop resume signaling */
 				isp1760_hcd_clear(hcd, PORT_CSC);
 
-				retval = isp1760_hcd_clear_poll_timeout(hcd,
+				retval = isp1760_hcd_clear_and_wait(hcd,
 							  PORT_RESUME, 2000);
 				if (retval != 0) {
 					dev_err(hcd->self.controller,
@@ -1987,11 +2333,11 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 			/* REVISIT:  some hardware needs 550+ usec to clear
 			 * this bit; seems too long to spin routinely...
 			 */
-			retval = isp1760_hcd_clear_poll_timeout(hcd, PORT_RESET,
-								750);
+			retval = isp1760_hcd_clear_and_wait(hcd, PORT_RESET,
+							    750);
 			if (retval != 0) {
 				dev_err(hcd->self.controller, "port %d reset error %d\n",
-						wIndex + 1, retval);
+					wIndex + 1, retval);
 				goto error;
 			}
 
@@ -2039,6 +2385,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		if (!wIndex || wIndex > ports)
 			goto error;
 		wIndex--;
+
 		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
 			break;
 
@@ -2055,7 +2402,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 			isp1760_hcd_set(hcd, PORT_SUSPEND);
 			break;
 		case USB_PORT_FEAT_POWER:
-			if (isp1760_hcd_is_set(hcd, HCS_PPC))
+			if (isp1760_hcd_ppc_is_set(hcd))
 				isp1760_hcd_set(hcd, PORT_POWER);
 			break;
 		case USB_PORT_FEAT_RESET:
@@ -2084,7 +2431,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		default:
 			goto error;
 		}
-		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
 		break;
 
 	default:
@@ -2219,22 +2565,14 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
 
 	priv->hcd = hcd;
 
-	priv->memory_pool = kcalloc(mem_layout->payload_blocks,
-				    sizeof(struct isp1760_memory_chunk),
-				    GFP_KERNEL);
-	if (!priv->memory_pool) {
-		ret = -ENOMEM;
-		goto put_hcd;
-	}
-
-	priv->atl_slots = kcalloc(mem_layout->ptd_num,
+	priv->atl_slots = kcalloc(mem_layout->slot_num,
 				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
 	if (!priv->atl_slots) {
 		ret = -ENOMEM;
-		goto free_mem_pool;
+		goto put_hcd;
 	}
 
-	priv->int_slots = kcalloc(mem_layout->ptd_num,
+	priv->int_slots = kcalloc(mem_layout->slot_num,
 				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
 	if (!priv->int_slots) {
 		ret = -ENOMEM;
@@ -2262,8 +2600,6 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
 	kfree(priv->int_slots);
 free_atl_slots:
 	kfree(priv->atl_slots);
-free_mem_pool:
-	kfree(priv->memory_pool);
 put_hcd:
 	usb_put_hcd(hcd);
 	return ret;
@@ -2278,5 +2614,4 @@ void isp1760_hcd_unregister(struct isp1760_hcd *priv)
 	usb_put_hcd(priv->hcd);
 	kfree(priv->atl_slots);
 	kfree(priv->int_slots);
-	kfree(priv->memory_pool);
 }
diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
index 9d2427ce3f1a..ee3063a34de3 100644
--- a/drivers/usb/isp1760/isp1760-hcd.h
+++ b/drivers/usb/isp1760/isp1760-hcd.h
@@ -19,13 +19,14 @@ struct isp1760_slotinfo {
 };
 
 /* chip memory management */
+#define ISP176x_BLOCK_MAX (32 + 20 + 4)
 #define ISP176x_BLOCK_NUM 3
 
 struct isp1760_memory_layout {
 	unsigned int blocks[ISP176x_BLOCK_NUM];
 	unsigned int blocks_size[ISP176x_BLOCK_NUM];
 
-	unsigned int ptd_num;
+	unsigned int slot_num;
 	unsigned int payload_blocks;
 	unsigned int payload_area_size;
 };
@@ -51,6 +52,7 @@ struct isp1760_hcd {
 	struct regmap		*regs;
 	struct regmap_field	*fields[HC_FIELD_MAX];
 
+	bool			is_isp1763;
 	const struct isp1760_memory_layout	*memory_layout;
 
 	spinlock_t		lock;
@@ -58,7 +60,7 @@ struct isp1760_hcd {
 	int			atl_done_map;
 	struct isp1760_slotinfo	*int_slots;
 	int			int_done_map;
-	struct isp1760_memory_chunk *memory_pool;
+	struct isp1760_memory_chunk memory_pool[ISP176x_BLOCK_MAX];
 	struct list_head	qh_list[QH_END];
 
 	/* periodic schedule support */
diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index cb3e4d782315..7cc349c0b2ad 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -7,6 +7,7 @@
  * - PDEV (generic platform device centralized driver model)
  *
  * (c) 2007 Sebastian Siewior <bigeasy@linutronix.de>
+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
  *
  */
 
@@ -209,10 +210,18 @@ static int isp1760_plat_probe(struct platform_device *pdev)
 		if (of_device_is_compatible(dp, "nxp,usb-isp1761"))
 			devflags |= ISP1760_FLAG_ISP1761;
 
-		/* Some systems wire up only 16 of the 32 data lines */
+		if (of_device_is_compatible(dp, "nxp,usb-isp1763"))
+			devflags |= ISP1760_FLAG_ISP1763;
+
+		/*
+		 * Some systems wire up only 8 of 16 data lines or
+		 * 16 of the 32 data lines
+		 */
 		of_property_read_u32(dp, "bus-width", &bus_width);
 		if (bus_width == 16)
 			devflags |= ISP1760_FLAG_BUS_WIDTH_16;
+		else if (bus_width == 8)
+			devflags |= ISP1760_FLAG_BUS_WIDTH_8;
 
 		if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_PERIPHERAL)
 			devflags |= ISP1760_FLAG_PERIPHERAL_EN;
@@ -250,6 +259,7 @@ static int isp1760_plat_remove(struct platform_device *pdev)
 static const struct of_device_id isp1760_of_match[] = {
 	{ .compatible = "nxp,usb-isp1760", },
 	{ .compatible = "nxp,usb-isp1761", },
+	{ .compatible = "nxp,usb-isp1763", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, isp1760_of_match);
diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
index 0d5262c37c5b..4f632cbbbd1f 100644
--- a/drivers/usb/isp1760/isp1760-regs.h
+++ b/drivers/usb/isp1760/isp1760-regs.h
@@ -2,12 +2,14 @@
 /*
  * Driver for the NXP ISP1760 chip
  *
+ * Copyright 2021 Linaro, Rui Miguel Silva
  * Copyright 2014 Laurent Pinchart
  * Copyright 2007 Sebastian Siewior
  *
  * Contacts:
  *     Sebastian Siewior <bigeasy@linutronix.de>
  *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *     Rui Miguel Silva <rui.silva@linaro.org>
  */
 
 #ifndef _ISP176x_REGS_H_
@@ -17,8 +19,8 @@
  * Host Controller
  */
 
+/* ISP1760/31 */
 /* EHCI capability registers */
-#define ISP176x_HC_CAPLENGTH		0x000
 #define ISP176x_HC_VERSION		0x002
 #define ISP176x_HC_HCSPARAMS		0x004
 #define ISP176x_HC_HCCPARAMS		0x008
@@ -59,7 +61,13 @@
 #define ISP176x_HC_INT_IRQ_MASK_AND	0x328
 #define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
 
+#define ISP176x_HC_OTG_CTRL_SET		0x374
+#define ISP176x_HC_OTG_CTRL_CLEAR	0x376
+
 enum isp176x_host_controller_fields {
+	/* HC_PORTSC1 */
+	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
+	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
 	/* HC_HCSPARAMS */
 	HCS_PPC, HCS_N_PORTS,
 	/* HC_HCCPARAMS */
@@ -72,25 +80,86 @@ enum isp176x_host_controller_fields {
 	HC_FRINDEX,
 	/* HC_CONFIGFLAG */
 	FLAG_CF,
-	/* HC_PORTSC1 */
-	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
-	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
+	/* ISO/INT/ATL PTD */
+	HC_ISO_PTD_DONEMAP, HC_ISO_PTD_SKIPMAP, HC_ISO_PTD_LASTPTD,
+	HC_INT_PTD_DONEMAP, HC_INT_PTD_SKIPMAP, HC_INT_PTD_LASTPTD,
+	HC_ATL_PTD_DONEMAP, HC_ATL_PTD_SKIPMAP, HC_ATL_PTD_LASTPTD,
 	/* HC_HW_MODE_CTRL */
 	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
 	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_ACT,
-	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
+	HW_INTF_LOCK, HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
+	/* HC_CHIP_ID */
+	HC_CHIP_ID_HIGH, HC_CHIP_ID_LOW, HC_CHIP_REV,
+	/* HC_SCRATCH */
+	HC_SCRATCH,
 	/* HC_RESET */
-	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
+	SW_RESET_RESET_ATX, SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
 	/* HC_BUFFER_STATUS */
-	INT_BUF_FILL, ATL_BUF_FILL,
+	ISO_BUF_FILL, INT_BUF_FILL, ATL_BUF_FILL,
 	/* HC_MEMORY */
 	MEM_BANK_SEL, MEM_START_ADDR,
+	/* HC_DATA */
+	HC_DATA,
+	/* HC_INTERRUPT */
+	HC_INTERRUPT,
 	/* HC_INTERRUPT_ENABLE */
-	HC_INT_ENABLE,
+	HC_INT_IRQ_ENABLE, HC_ATL_IRQ_ENABLE,
+	/* INTERRUPT MASKS */
+	HC_ISO_IRQ_MASK_OR, HC_INT_IRQ_MASK_OR, HC_ATL_IRQ_MASK_OR,
+	HC_ISO_IRQ_MASK_AND, HC_INT_IRQ_MASK_AND, HC_ATL_IRQ_MASK_AND,
+	/* HW_OTG_CTRL_SET */
+	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
+	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP, HW_HC_2_DIS,
+	/* HW_OTG_CTRL_CLR */
+	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
+	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
+	HW_DP_PULLUP_CLEAR, HW_HC_2_DIS_CLEAR,
 	/* Last element */
 	HC_FIELD_MAX,
 };
 
+/* ISP1763 */
+/* EHCI operational registers */
+#define ISP1763_HC_USBCMD		0x8c
+#define ISP1763_HC_USBSTS		0x90
+#define ISP1763_HC_FRINDEX		0x98
+
+#define ISP1763_HC_CONFIGFLAG		0x9c
+#define ISP1763_HC_PORTSC1		0xa0
+
+#define ISP1763_HC_ISO_PTD_DONEMAP	0xa4
+#define ISP1763_HC_ISO_PTD_SKIPMAP	0xa6
+#define ISP1763_HC_ISO_PTD_LASTPTD	0xa8
+#define ISP1763_HC_INT_PTD_DONEMAP	0xaa
+#define ISP1763_HC_INT_PTD_SKIPMAP	0xac
+#define ISP1763_HC_INT_PTD_LASTPTD	0xae
+#define ISP1763_HC_ATL_PTD_DONEMAP	0xb0
+#define ISP1763_HC_ATL_PTD_SKIPMAP	0xb2
+#define ISP1763_HC_ATL_PTD_LASTPTD	0xb4
+
+/* Configuration Register */
+#define ISP1763_HC_HW_MODE_CTRL		0xb6
+#define ISP1763_HC_CHIP_REV		0x70
+#define ISP1763_HC_CHIP_ID		0x72
+#define ISP1763_HC_SCRATCH		0x78
+#define ISP1763_HC_RESET		0xb8
+#define ISP1763_HC_BUFFER_STATUS	0xba
+#define ISP1763_HC_MEMORY		0xc4
+#define ISP1763_HC_DATA			0xc6
+
+/* Interrupt Register */
+#define ISP1763_HC_INTERRUPT		0xd4
+#define ISP1763_HC_INTERRUPT_ENABLE	0xd6
+#define ISP1763_HC_ISO_IRQ_MASK_OR	0xd8
+#define ISP1763_HC_INT_IRQ_MASK_OR	0xda
+#define ISP1763_HC_ATL_IRQ_MASK_OR	0xdc
+#define ISP1763_HC_ISO_IRQ_MASK_AND	0xde
+#define ISP1763_HC_INT_IRQ_MASK_AND	0xe0
+#define ISP1763_HC_ATL_IRQ_MASK_AND	0xe2
+
+#define ISP1763_HC_OTG_CTRL_SET		0xe4
+#define ISP1763_HC_OTG_CTRL_CLEAR	0xe6
+
 /* -----------------------------------------------------------------------------
  * Peripheral Controller
  */
@@ -132,9 +201,6 @@ enum isp176x_host_controller_fields {
 #define ISP176x_DC_CTRLFUNC		0x0228
 #define ISP176x_DC_EPINDEX		0x022c
 
-#define ISP1761_DC_OTG_CTRL_SET		0x374
-#define ISP1761_DC_OTG_CTRL_CLEAR	0x376
-
 /* DMA Registers */
 #define ISP176x_DC_DMACMD		0x0230
 #define ISP176x_DC_DMATXCOUNT		0x0234
@@ -177,13 +243,6 @@ enum isp176x_device_controller_fields {
 	DC_EPENABLE, DC_ENDPTYP,
 	/* DC_FRAMENUM */
 	DC_FRAMENUM, DC_UFRAMENUM,
-	/* HW_OTG_CTRL_SET */
-	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
-	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
-	/* HW_OTG_CTRL_CLR */
-	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
-	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
-	HW_DP_PULLUP_CLEAR,
 	/* Last element */
 	DC_FIELD_MAX,
 };
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 1e2ca43fb152..30efc9d32506 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -2,10 +2,12 @@
 /*
  * Driver for the NXP ISP1761 device controller
  *
+ * Copyright 2021 Linaro, Rui Miguel Silva
  * Copyright 2014 Ideas on Board Oy
  *
  * Contacts:
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *	Rui Miguel Silva <rui.silva@linaro.org>
  */
 
 #include <linux/interrupt.h>
diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1760-udc.h
index a49096c0ac8e..f2ab5929cc9f 100644
--- a/drivers/usb/isp1760/isp1760-udc.h
+++ b/drivers/usb/isp1760/isp1760-udc.h
@@ -2,10 +2,12 @@
 /*
  * Driver for the NXP ISP1761 device controller
  *
+ * Copyright 2021 Linaro, Rui Miguel Silva
  * Copyright 2014 Ideas on Board Oy
  *
  * Contacts:
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *	Rui Miguel Silva <rui.silva@linaro.org>
  */
 
 #ifndef _ISP1760_UDC_H_
-- 
2.31.1

