Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CE437F465
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 10:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhEMIsy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbhEMIst (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 04:48:49 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6933C061760
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:47:38 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id o26-20020a1c4d1a0000b0290146e1feccdaso594717wmh.0
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B0EKwpT/Juku6OOFlNyblK5SG01UBE1YBGTNS7Jt+sQ=;
        b=X9lwLFA+S2t3XcV4JP7IDdXh9j4FnnQumywXsKstN4wO0qOFotAf8zMUiAhcZW16U1
         jtSDNkj3PUlbhFd5l0S50UEeNwM83gYpDD0aUi/EzP8gOEJp/kpPRnz3vZ/ltWkVmqlg
         swmFu1Eag1PrYFDFJggzXWSK4w+j2eCn/XsVe5oIZ2lBDV/V+GKfDDoO0m6h+gmJqWs7
         51qtbPHEvR/udvWmWNLDPArVo9ndrKcRTzEnnMtZ6+kb5rpHegfzXpZo2q8RFxdk4+7R
         s7/9q59dmYDyIGwAvbETcQsoNEMUxATYG8s16FEDBGeeP0CQLTy+0HDxyj3uZbjYnONP
         4UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B0EKwpT/Juku6OOFlNyblK5SG01UBE1YBGTNS7Jt+sQ=;
        b=V+3LyF6pMwLZ7+zPWrrStBS4tqXm7kxMFCgSsmYFcljHDBfn4rm/4/0UZTO2N6jjiL
         PxFsNtqTcZlNBR0VpRa6EUKno4hyE68oK58E1j4ZuFJKsJAYtGf5FeyezAPxgbja9txo
         y1wYJ3oK+7qS+YW7rtMbDjqcZHPqXy/2PVMivDbjHkCbHJWfftk2aqcifOGleHYu8OS8
         pE8e5foT2rC8Vy+G0Cofxo5OBauo+ZQXZFxiYoMZIN3XNBw5yldIZaGCm7N47/MudmKx
         qak/5I4XBr/gx3aL/l2gON9sUIRbsWvvyT7rZaB0Tdb5+M34brEsGqH9bG3all8ZGkFm
         mzPg==
X-Gm-Message-State: AOAM531glC4cL3HRIdzqkr7neBJ8PpKX1jtY0DTA71R5UeLzcBz+bivN
        mJuMOTZQSggzmh+25pUjwxIhZQ==
X-Google-Smtp-Source: ABdhPJxjgxAbMbUxll6VymXpFkcLJX+TASPRdz+kMPxP65palI9Fp/lJdAoENPHz52VLBmf9u1ucug==
X-Received: by 2002:a1c:cc0b:: with SMTP id h11mr2661491wmb.87.1620895657631;
        Thu, 13 May 2021 01:47:37 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h15sm1730282wmq.4.2021.05.13.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 01:47:37 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v4 6/9] usb: isp1760: use dr_mode binding
Date:   Thu, 13 May 2021 09:47:14 +0100
Message-Id: <20210513084717.2487366-7-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513084717.2487366-1-rui.silva@linaro.org>
References: <20210513084717.2487366-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is already a binding to describe the dual role mode (dr_mode),
use that instead of defining a new one (port1-otg).

Update driver code and devicetree files that use that port1-otg
binding.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/arm-realview-eb.dtsi    | 2 +-
 arch/arm/boot/dts/arm-realview-pb1176.dts | 2 +-
 arch/arm/boot/dts/arm-realview-pb11mp.dts | 2 +-
 arch/arm/boot/dts/arm-realview-pbx.dtsi   | 2 +-
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi   | 2 +-
 arch/arm/boot/dts/vexpress-v2m.dtsi       | 2 +-
 drivers/usb/isp1760/isp1760-core.c        | 3 +--
 drivers/usb/isp1760/isp1760-core.h        | 2 +-
 drivers/usb/isp1760/isp1760-if.c          | 5 +++--
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index a534a8e444d9..04e8a27ba1eb 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -148,7 +148,7 @@ ethernet: ethernet@4e000000 {
 	usb: usb@4f000000 {
 		compatible = "nxp,usb-isp1761";
 		reg = <0x4f000000 0x20000>;
-		port1-otg;
+		dr_mode = "peripheral";
 	};
 
 	bridge {
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index f925782f8560..366687fb1ee3 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -166,7 +166,7 @@ usb@3b000000 {
 		reg = <0x3b000000 0x20000>;
 		interrupt-parent = <&intc_fpga1176>;
 		interrupts = <0 11 IRQ_TYPE_LEVEL_HIGH>;
-		port1-otg;
+		dr_mode = "peripheral";
 	};
 
 	bridge {
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 0c7dabef4a5f..228a51a38f95 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -712,7 +712,7 @@ usb@4f000000 {
 			reg = <0x4f000000 0x20000>;
 			interrupt-parent = <&intc_tc11mp>;
 			interrupts = <0 3 IRQ_TYPE_LEVEL_HIGH>;
-			port1-otg;
+			dr_mode = "peripheral";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index ac95667ed781..ccf6f756b6ed 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -164,7 +164,7 @@ ethernet: ethernet@4e000000 {
 	usb: usb@4f000000 {
 		compatible = "nxp,usb-isp1761";
 		reg = <0x4f000000 0x20000>;
-		port1-otg;
+		dr_mode = "peripheral";
 	};
 
 	bridge {
diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
index 4f7220b11f2d..2ad9fd7c94ec 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -144,7 +144,7 @@ usb@203000000 {
 				compatible = "nxp,usb-isp1761";
 				reg = <2 0x03000000 0x20000>;
 				interrupts = <16>;
-				port1-otg;
+				dr_mode = "peripheral";
 			};
 
 			iofpga-bus@300000000 {
diff --git a/arch/arm/boot/dts/vexpress-v2m.dtsi b/arch/arm/boot/dts/vexpress-v2m.dtsi
index 2ac41ed3a57c..ec13ceb9ed36 100644
--- a/arch/arm/boot/dts/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m.dtsi
@@ -62,7 +62,7 @@ usb@3,03000000 {
 				compatible = "nxp,usb-isp1761";
 				reg = <3 0x03000000 0x20000>;
 				interrupts = <16>;
-				port1-otg;
+				dr_mode = "peripheral";
 			};
 
 			iofpga@7,00000000 {
diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index 35a7667e411c..0aeeb12d3bfe 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -73,10 +73,9 @@ static void isp1760_init_core(struct isp1760_device *isp)
 	 * on ISP1761.
 	 *
 	 * TODO: Really support OTG. For now we configure port 1 in device mode
-	 * when OTG is requested.
 	 */
 	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
-	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
+	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
 		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
 		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
 		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
index 8fec6395f19f..7a6755d68d41 100644
--- a/drivers/usb/isp1760/isp1760-core.h
+++ b/drivers/usb/isp1760/isp1760-core.h
@@ -28,7 +28,7 @@ struct gpio_desc;
  * a sane default configuration.
  */
 #define ISP1760_FLAG_BUS_WIDTH_16	0x00000002 /* 16-bit data bus width */
-#define ISP1760_FLAG_OTG_EN		0x00000004 /* Port 1 supports OTG */
+#define ISP1760_FLAG_PERIPHERAL_EN	0x00000004 /* Port 1 supports Peripheral mode*/
 #define ISP1760_FLAG_ANALOG_OC		0x00000008 /* Analog overcurrent */
 #define ISP1760_FLAG_DACK_POL_HIGH	0x00000010 /* DACK active high */
 #define ISP1760_FLAG_DREQ_POL_HIGH	0x00000020 /* DREQ active high */
diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index fb6701608cd8..cb3e4d782315 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/otg.h>
 
 #include "isp1760-core.h"
 #include "isp1760-regs.h"
@@ -213,8 +214,8 @@ static int isp1760_plat_probe(struct platform_device *pdev)
 		if (bus_width == 16)
 			devflags |= ISP1760_FLAG_BUS_WIDTH_16;
 
-		if (of_property_read_bool(dp, "port1-otg"))
-			devflags |= ISP1760_FLAG_OTG_EN;
+		if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_PERIPHERAL)
+			devflags |= ISP1760_FLAG_PERIPHERAL_EN;
 
 		if (of_property_read_bool(dp, "analog-oc"))
 			devflags |= ISP1760_FLAG_ANALOG_OC;
-- 
2.31.1

