Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0580B3728B3
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 12:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhEDKU4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 May 2021 06:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhEDKUy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 May 2021 06:20:54 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7F3C061574
        for <linux-usb@vger.kernel.org>; Tue,  4 May 2021 03:20:00 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d11so8765778wrw.8
        for <linux-usb@vger.kernel.org>; Tue, 04 May 2021 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CCzoY1ZXOUmx6n7n3wk/SPRI356JRF97/LdAV2fm9lE=;
        b=SGtOHSJX2vOepxhUR4Ad8B6bwpO0g9aIAH5vmzVlDUaeevIzJmwBs2rvSA0RtclLT6
         QB+1nUQvyQZ9OxnWwDtm+BS1GOdk9ogUcX4obTCjD+BE7pZLh2M/prrzG6OA2G5WY5QE
         RHBrUGAXVGVVkf4CnpGLsp106DnY+VCmDtDnF9yzgRKOyQEEVzjB7+iuxg/4oNlJHqOR
         YTrz02YmwbLBnxsl8lAmObmdVARn7Ct3eE+eBmrQgcDTSX8lmRW9o53syLk7A90vfsBt
         aRM44V0O1XDQZ7b9P0Ytcsl0Fd3A4tLD+4qtzxvTy3qj9PtkNUcOMdXk1sJqkETDM6ie
         KRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CCzoY1ZXOUmx6n7n3wk/SPRI356JRF97/LdAV2fm9lE=;
        b=ehVy+vEcd2+3roohIh/jiyWOayvHNz1vMLXrnFpB8cNJMXkPwFwtnQVotz7KyQONkS
         uQvP8Dn5Mtpo1MX5amuCPTeh10mS+6P3x3HgQ2brLYsb32x0dYF4RujSV4OFRv0WRPMO
         eGIVHHtQkbK35Gzyj8WHX2OktANePf7b/m7VBLBHuvF6dKNAijyqs2hvKetrJaz7KsCD
         qfitXtf9IsZPJv0uJH15HC3hC+inhp87L2uVPlmTuoWqv3xGazctG5QJrgFbGCWxgvu8
         fg2eqVEMFSuzNLOb5YUAmMOENCXrdSJbyMxGaHRlyiCIuwJv+SWWg3L3bO1lj4CPS29s
         ntWA==
X-Gm-Message-State: AOAM532enmPv/J7mN9UjqviIV6sZJN9VcHMjDtLAKfHgIXRvxq6Ooy7q
        uC1I4bj6eYv2uxYwg005dTLsKA==
X-Google-Smtp-Source: ABdhPJyHFx/oI8gug2CQr+9dINXbbG3Tmk9YXx/SFkK4eSHETEE5BT5R1jD3DGZLq5xcM+wPMWPx2A==
X-Received: by 2002:adf:f28c:: with SMTP id k12mr30140824wro.272.1620123598707;
        Tue, 04 May 2021 03:19:58 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id d5sm16293789wrv.43.2021.05.04.03.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 03:19:58 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 7/7] usb: isp1763: add peripheral mode
Date:   Tue,  4 May 2021 11:19:10 +0100
Message-Id: <20210504101910.18619-8-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504101910.18619-1-rui.silva@linaro.org>
References: <20210504101910.18619-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Besides the already host mode support add peripheral mode support for
the isp1763 IP from the isp1760 family.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-core.c | 34 +++++++++---
 drivers/usb/isp1760/isp1760-regs.h | 87 ++++++++++++++++++++++++++++++
 drivers/usb/isp1760/isp1760-udc.c  |  3 +-
 3 files changed, 115 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index 31de1064aa23..f9f77099b8ae 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -82,7 +82,8 @@ static int isp1760_init_core(struct isp1760_device *isp)
 	 *
 	 * TODO: Really support OTG. For now we configure port 1 in device mode
 	 */
-	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
+	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
+	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
 	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
 		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
 		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
@@ -185,16 +186,28 @@ static struct regmap_config isp1761_dc_regmap_conf = {
 	.volatile_table = &isp176x_dc_volatile_table,
 };
 
+static struct regmap_config isp1763_dc_regmap_conf = {
+	.name = "isp1763-dc",
+	.reg_bits = 8,
+	.reg_stride = 4,
+	.val_bits = 16,
+	.fast_io = true,
+	.max_register = ISP176x_DC_TESTMODE,
+	.volatile_table = &isp176x_dc_volatile_table,
+};
+
 int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 		     struct device *dev, unsigned int devflags)
 {
-	bool udc_disabled = !(devflags & ISP1760_FLAG_ISP1761);
 	const struct regmap_config *hc_regmap;
 	const struct reg_field *hc_reg_fields;
+	const struct regmap_config *dc_regmap;
+	const struct reg_field *dc_reg_fields;
 	struct isp1760_device *isp;
 	struct isp1760_hcd *hcd;
 	struct isp1760_udc *udc;
 	struct regmap_field *f;
+	bool udc_enabled;
 	int ret;
 	int i;
 
@@ -202,8 +215,11 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 	 * If neither the HCD not the UDC is enabled return an error, as no
 	 * device would be registered.
 	 */
+	udc_enabled = ((devflags & ISP1760_FLAG_ISP1763) ||
+		       (devflags & ISP1760_FLAG_ISP1761));
+
 	if ((!IS_ENABLED(CONFIG_USB_ISP1760_HCD) || usb_disabled()) &&
-	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || udc_disabled))
+	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || !udc_enabled))
 		return -ENODEV;
 
 	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
@@ -233,9 +249,13 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 	if (hcd->is_isp1763) {
 		hc_regmap = &isp1763_hc_regmap_conf;
 		hc_reg_fields = &isp1763_hc_reg_fields[0];
+		dc_regmap = &isp1763_dc_regmap_conf;
+		dc_reg_fields = &isp1763_dc_reg_fields[0];
 	} else {
 		hc_regmap = &isp1760_hc_regmap_conf;
 		hc_reg_fields = &isp1760_hc_reg_fields[0];
+		dc_regmap = &isp1761_dc_regmap_conf;
+		dc_reg_fields = &isp1761_dc_reg_fields[0];
 	}
 
 	isp->rst_gpio = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
@@ -258,14 +278,12 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 		hcd->fields[i] = f;
 	}
 
-	udc->regs = devm_regmap_init_mmio(dev, hcd->base,
-					  &isp1761_dc_regmap_conf);
+	udc->regs = devm_regmap_init_mmio(dev, hcd->base, dc_regmap);
 	if (IS_ERR(udc->regs))
 		return PTR_ERR(udc->regs);
 
 	for (i = 0; i < DC_FIELD_MAX; i++) {
-		f = devm_regmap_field_alloc(dev, udc->regs,
-					    isp1761_dc_reg_fields[i]);
+		f = devm_regmap_field_alloc(dev, udc->regs, dc_reg_fields[i]);
 		if (IS_ERR(f))
 			return PTR_ERR(f);
 
@@ -288,7 +306,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 			return ret;
 	}
 
-	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
+	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && udc_enabled) {
 		ret = isp1760_udc_register(isp, irq, irqflags);
 		if (ret < 0) {
 			isp1760_hcd_unregister(hcd);
diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
index c98466f66cb6..a66f77edb814 100644
--- a/drivers/usb/isp1760/isp1760-regs.h
+++ b/drivers/usb/isp1760/isp1760-regs.h
@@ -465,4 +465,91 @@ static const struct reg_field isp1761_dc_reg_fields[] = {
 	[DC_FRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
 };
 
+/* ISP1763 */
+/* Initialization Registers */
+#define ISP1763_DC_ADDRESS		0x00
+#define ISP1763_DC_MODE			0x0c
+#define ISP1763_DC_INTCONF		0x10
+#define ISP1763_DC_INTENABLE		0x14
+
+/* Data Flow Registers */
+#define ISP1763_DC_EPMAXPKTSZ		0x04
+#define ISP1763_DC_EPTYPE		0x08
+
+#define ISP1763_DC_BUFLEN		0x1c
+#define ISP1763_DC_BUFSTAT		0x1e
+#define ISP1763_DC_DATAPORT		0x20
+
+#define ISP1763_DC_CTRLFUNC		0x28
+#define ISP1763_DC_EPINDEX		0x2c
+
+/* DMA Registers */
+#define ISP1763_DC_DMACMD		0x30
+#define ISP1763_DC_DMATXCOUNT		0x34
+#define ISP1763_DC_DMACONF		0x38
+#define ISP1763_DC_DMAHW		0x3c
+#define ISP1763_DC_DMAINTREASON		0x50
+#define ISP1763_DC_DMAINTEN		0x54
+#define ISP1763_DC_DMAEP		0x58
+#define ISP1763_DC_DMABURSTCOUNT	0x64
+
+/* General Registers */
+#define ISP1763_DC_INTERRUPT		0x18
+#define ISP1763_DC_CHIPID		0x70
+#define ISP1763_DC_FRAMENUM		0x74
+#define ISP1763_DC_SCRATCH		0x78
+#define ISP1763_DC_UNLOCKDEV		0x7c
+#define ISP1763_DC_INTPULSEWIDTH	0x80
+#define ISP1763_DC_TESTMODE		0x84
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
+};
+
 #endif
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 980d51bff65e..1eff029c4158 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1503,7 +1503,8 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
 		return -ENODEV;
 	}
 
-	if (chipid != 0x00011582 && chipid != 0x00158210) {
+	if (chipid != 0x00011582 && chipid != 0x00158210 &&
+	    chipid != 0x00006320) {
 		dev_err(udc->isp->dev, "udc: invalid chip ID 0x%08x\n", chipid);
 		return -ENODEV;
 	}
-- 
2.31.1

