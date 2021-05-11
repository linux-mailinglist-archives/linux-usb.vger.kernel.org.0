Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FF637A29E
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhEKIwg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbhEKIwe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 04:52:34 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B70C061763
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:26 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id l2so19270975wrm.9
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uVIcInm117yUPNbjXSfDZDRHOhoiBshLNSOpLU18Vts=;
        b=Z967oXGL1qkVVnHAlRk0FLK4X6scRI4fqhafdGa1R6ntnzt4zV03e5lI4NJJuFeKxw
         I+ht0XsKOE/npa0aKkzJYQb3i1JQ6WaFyilu+K9KQddaJm2rOoM9M26bfFCkL4rQsVpS
         uHKV5IS8kppNU4VDXaaa+Vse3pEDZNjMTfcSO/4IGtIoJ/YaK7B5zFNTxFhf9MAQyS17
         TWLUTVszXjSvhOGhYeV4OyHBKjIir1JsMuder/0owPDg3QUIdlDxr4vOwDoUxbC3+9DU
         liDBOoA3kGPXFFMUOboZL0+CO4GAzAvNmA43Nf98h7Wr76ZIeBtxOIob7AETlxZJ8Eut
         73mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uVIcInm117yUPNbjXSfDZDRHOhoiBshLNSOpLU18Vts=;
        b=JLDyZX0AKJbkO6sxYgtj/UI6plQDDKorIRe3PbxaFm3ez+gcrm4d3koXuqwmPXuuOt
         LM+oY/HXtJpa0Cj8ST09aG1qkt/B2fYFxf900RewHI2+K0qSH8QI8dl3kmjxxOFayNFM
         Ui+Tw4s8IbJWQsmIy//EKY+TrP/JgXMriu2YIrWB9SbfPrbSZ8XB6vKRYoWhOVGtVPA7
         tIp3i+Y5fHu79HMJ2kPLlCGVr7E3WMx9ERLPt2uFv/APiG7D5DWUqJ4lQhMeV5cGaCL5
         yutphQt+hT9z9Yx2Na7dUBTu+AamL4o6HDoiiZy90Sukz2sgS5QbqCeBRQe9ep0nxd3K
         1auw==
X-Gm-Message-State: AOAM5310+ytczG8UiPuoe2R9/ZbiXCjSom5dUxJKJjpcUa+U2nT3FxOZ
        NYQNH1OkDdnWoAp3IxxOIyH03w==
X-Google-Smtp-Source: ABdhPJxqvZIj7p2XqWXBCZ+Qw+CEghNirHllm7Q0QuMteaa7OCs1bCx6sOdkKaT4iew23+M+0lJExA==
X-Received: by 2002:a05:6000:4d:: with SMTP id k13mr36792079wrx.98.1620723085189;
        Tue, 11 May 2021 01:51:25 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j7sm23042980wmi.21.2021.05.11.01.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 01:51:24 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 9/9] usb: isp1763: add peripheral mode
Date:   Tue, 11 May 2021 09:51:01 +0100
Message-Id: <20210511085101.2081399-10-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511085101.2081399-1-rui.silva@linaro.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Besides the already host mode support add peripheral mode support for
the isp1763 IP from the isp1760 family.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-core.c | 25 +++++++++++------
 drivers/usb/isp1760/isp1760-regs.h | 42 ++++++++++++++++++++++++++++
 drivers/usb/isp1760/isp1760-udc.c  | 45 ++++++++++++++++++++++--------
 drivers/usb/isp1760/isp1760-udc.h  |  1 +
 4 files changed, 94 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index 1d847f13abab..ff07e2890692 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -83,7 +83,8 @@ static int isp1760_init_core(struct isp1760_device *isp)
 	 *
 	 * TODO: Really support OTG. For now we configure port 1 in device mode
 	 */
-	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
+	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
+	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
 	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
 		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
 		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
@@ -470,13 +471,15 @@ static const struct regmap_config isp1763_dc_regmap_conf = {
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
 
@@ -484,8 +487,11 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
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
@@ -498,6 +504,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 	udc = &isp->udc;
 
 	hcd->is_isp1763 = !!(devflags & ISP1760_FLAG_ISP1763);
+	udc->is_isp1763 = !!(devflags & ISP1760_FLAG_ISP1763);
 
 	if (!hcd->is_isp1763 && (devflags & ISP1760_FLAG_BUS_WIDTH_8)) {
 		dev_err(dev, "isp1760/61 do not support data width 8\n");
@@ -507,9 +514,13 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
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
@@ -532,14 +543,12 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
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
 
@@ -562,7 +571,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 			return ret;
 	}
 
-	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
+	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && udc_enabled) {
 		ret = isp1760_udc_register(isp, irq, irqflags);
 		if (ret < 0) {
 			isp1760_hcd_unregister(hcd);
diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
index 4f632cbbbd1f..94ea60c20b2a 100644
--- a/drivers/usb/isp1760/isp1760-regs.h
+++ b/drivers/usb/isp1760/isp1760-regs.h
@@ -243,8 +243,50 @@ enum isp176x_device_controller_fields {
 	DC_EPENABLE, DC_ENDPTYP,
 	/* DC_FRAMENUM */
 	DC_FRAMENUM, DC_UFRAMENUM,
+	/* DC_CHIP_ID */
+	DC_CHIP_ID_HIGH, DC_CHIP_ID_LOW,
+	/* DC_SCRATCH */
+	DC_SCRATCH,
 	/* Last element */
 	DC_FIELD_MAX,
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
+#define ISP1763_DC_CHIPID_LOW		0x70
+#define ISP1763_DC_CHIPID_HIGH		0x72
+#define ISP1763_DC_FRAMENUM		0x74
+#define ISP1763_DC_SCRATCH		0x78
+#define ISP1763_DC_UNLOCKDEV		0x7c
+#define ISP1763_DC_INTPULSEWIDTH	0x80
+#define ISP1763_DC_TESTMODE		0x84
+
 #endif
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 30efc9d32506..3e05e3605435 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1151,6 +1151,10 @@ static void isp1760_udc_disconnect(struct isp1760_udc *udc)
 
 static void isp1760_udc_init_hw(struct isp1760_udc *udc)
 {
+	u32 intconf = udc->is_isp1763 ? ISP1763_DC_INTCONF : ISP176x_DC_INTCONF;
+	u32 intena = udc->is_isp1763 ? ISP1763_DC_INTENABLE :
+						ISP176x_DC_INTENABLE;
+
 	/*
 	 * The device controller currently shares its interrupt with the host
 	 * controller, the DC_IRQ polarity and signaling mode are ignored. Set
@@ -1160,11 +1164,11 @@ static void isp1760_udc_init_hw(struct isp1760_udc *udc)
 	 * ACK tokens only (and NYET for the out pipe). The default
 	 * configuration also generates an interrupt on the first NACK token.
 	 */
-	isp1760_reg_write(udc->regs, ISP176x_DC_INTCONF,
+	isp1760_reg_write(udc->regs, intconf,
 			  ISP176x_DC_CDBGMOD_ACK | ISP176x_DC_DDBGMODIN_ACK |
 			  ISP176x_DC_DDBGMODOUT_ACK);
 
-	isp1760_reg_write(udc->regs, ISP176x_DC_INTENABLE, DC_IEPRXTX(7) |
+	isp1760_reg_write(udc->regs, intena, DC_IEPRXTX(7) |
 			  DC_IEPRXTX(6) | DC_IEPRXTX(5) | DC_IEPRXTX(4) |
 			  DC_IEPRXTX(3) | DC_IEPRXTX(2) | DC_IEPRXTX(1) |
 			  DC_IEPRXTX(0) | ISP176x_DC_IEP0SETUP |
@@ -1304,13 +1308,14 @@ static int isp1760_udc_start(struct usb_gadget *gadget,
 static int isp1760_udc_stop(struct usb_gadget *gadget)
 {
 	struct isp1760_udc *udc = gadget_to_udc(gadget);
+	u32 mode_reg = udc->is_isp1763 ? ISP1763_DC_MODE : ISP176x_DC_MODE;
 	unsigned long flags;
 
 	dev_dbg(udc->isp->dev, "%s\n", __func__);
 
 	del_timer_sync(&udc->vbus_timer);
 
-	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
+	isp1760_reg_write(udc->regs, mode_reg, 0);
 
 	spin_lock_irqsave(&udc->lock, flags);
 	udc->driver = NULL;
@@ -1332,15 +1337,30 @@ static const struct usb_gadget_ops isp1760_udc_ops = {
  * Interrupt Handling
  */
 
+static u32 isp1760_udc_irq_get_status(struct isp1760_udc *udc)
+{
+	u32 status;
+
+	if (udc->is_isp1763) {
+		status = isp1760_reg_read(udc->regs, ISP1763_DC_INTERRUPT)
+			& isp1760_reg_read(udc->regs, ISP1763_DC_INTENABLE);
+		isp1760_reg_write(udc->regs, ISP1763_DC_INTERRUPT, status);
+	} else {
+		status = isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
+			& isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
+		isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
+	}
+
+	return status;
+}
+
 static irqreturn_t isp1760_udc_irq(int irq, void *dev)
 {
 	struct isp1760_udc *udc = dev;
 	unsigned int i;
 	u32 status;
 
-	status = isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
-	       & isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
-	isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
+	status = isp1760_udc_irq_get_status(udc);
 
 	if (status & DC_IEVBUS) {
 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
@@ -1475,6 +1495,7 @@ static void isp1760_udc_init_eps(struct isp1760_udc *udc)
 
 static int isp1760_udc_init(struct isp1760_udc *udc)
 {
+	u32 mode_reg = udc->is_isp1763 ? ISP1763_DC_MODE : ISP176x_DC_MODE;
 	u16 scratch;
 	u32 chipid;
 
@@ -1484,9 +1505,10 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
 	 * register, and reading the scratch register value back. The chip ID
 	 * and scratch register contents must match the expected values.
 	 */
-	isp1760_reg_write(udc->regs, ISP176x_DC_SCRATCH, 0xbabe);
-	chipid = isp1760_reg_read(udc->regs, ISP176x_DC_CHIPID);
-	scratch = isp1760_reg_read(udc->regs, ISP176x_DC_SCRATCH);
+	isp1760_udc_write(udc, DC_SCRATCH, 0xbabe);
+	chipid = isp1760_udc_read(udc, DC_CHIP_ID_HIGH) << 16;
+	chipid |= isp1760_udc_read(udc, DC_CHIP_ID_LOW);
+	scratch = isp1760_udc_read(udc, DC_SCRATCH);
 
 	if (scratch != 0xbabe) {
 		dev_err(udc->isp->dev,
@@ -1495,7 +1517,8 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
 		return -ENODEV;
 	}
 
-	if (chipid != 0x00011582 && chipid != 0x00158210) {
+	if (chipid != 0x00011582 && chipid != 0x00158210 &&
+	    chipid != 0x00176320) {
 		dev_err(udc->isp->dev, "udc: invalid chip ID 0x%08x\n", chipid);
 		return -ENODEV;
 	}
@@ -1503,7 +1526,7 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
 	/* Reset the device controller. */
 	isp1760_udc_set(udc, DC_SFRESET);
 	usleep_range(10000, 11000);
-	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
+	isp1760_reg_write(udc->regs, mode_reg, 0);
 	usleep_range(10000, 11000);
 
 	return 0;
diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1760-udc.h
index f2ab5929cc9f..22044e86bc0e 100644
--- a/drivers/usb/isp1760/isp1760-udc.h
+++ b/drivers/usb/isp1760/isp1760-udc.h
@@ -84,6 +84,7 @@ struct isp1760_udc {
 	u16 ep0_length;
 
 	bool connected;
+	bool is_isp1763;
 
 	unsigned int devstatus;
 };
-- 
2.31.1

