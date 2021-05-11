Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D35C37A298
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbhEKIw3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbhEKIw1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 04:52:27 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AB4C061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:20 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o127so10634991wmo.4
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B0EKwpT/Juku6OOFlNyblK5SG01UBE1YBGTNS7Jt+sQ=;
        b=LYnr5sRUw/wM8+TO66O9Ow0wV459YrMybON7fuoFTjDcT/t7IRycjIT09wirBXMFhq
         44Iq6/l7jCLvJrA1+Nypvg/1QTVdBvAlllSHe+k/9CUSNt8URP1wry9d4qj3yt5muMF1
         eAsoyX6sxbdeqGwL3qpw8hg5X+53jDHSHeRnetAbPLp7vwd4T5l3jAProTjvI4lPfXXH
         bU1+XnTGidolnMN15Zny7iZEJ14GCZ37TXFvdBHB+p7ASvr9YHkGc8BqT03XCo/xeZaq
         PZLrbCjUvl076IuTTgQ00NXRHFinCz8kMoER2pLlmbCBslOo3RhDiKYqxiOEIOqzsTIF
         +/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B0EKwpT/Juku6OOFlNyblK5SG01UBE1YBGTNS7Jt+sQ=;
        b=mL6xBzac6JdROsrkvTPc/SGESb7I0EgbMn1Vln4K/6Vmqcb0gJg56toIVOdXvPeZKE
         5xQGTozjO7i5ht1xQkGh1NScC6L+zuGPk0+1Llsiuj0JJxlJNxZ6Lb5Y2uP4Pirh7Ngo
         cl3eK1FBer3tBIGZf5xzyFffNTz0qjQHixYpzIFcBqcjqHTGomZA1jfqp98/NtiZEQJJ
         I8IkVIpku9ewdR+b1vXLV1252c2RnQXOaaaP4NZsS8sogCx7Hcjk1nREukEAH8d0M2rA
         62ay4j9iczCsx8HgC6NS0WCbp+0SWk7wg34bQeL7rBEbWFdJrqBT/3Kj1F8VOivtbx4n
         WNVg==
X-Gm-Message-State: AOAM532RgVNW0ws7TBzEdUPxkSKs/R1xry02kJ4O2Y895dwhLUEfSMSP
        rZyXGfsfh2i+ulnHiDYj5aXCb7i6u54kuA==
X-Google-Smtp-Source: ABdhPJwS7RiD87ZaboA1KXryc5ZF+LH/MwhmHuIpYPas11PugYfuhSnGvVhl+l2XA22zcqV8pQvEsg==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr31728967wmi.6.1620723078983;
        Tue, 11 May 2021 01:51:18 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j7sm23042980wmi.21.2021.05.11.01.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 01:51:18 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 6/9] usb: isp1760: use dr_mode binding
Date:   Tue, 11 May 2021 09:50:58 +0100
Message-Id: <20210511085101.2081399-7-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511085101.2081399-1-rui.silva@linaro.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
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

