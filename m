Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3D83728AC
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 12:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhEDKUs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 May 2021 06:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhEDKUr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 May 2021 06:20:47 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C29FC061574
        for <linux-usb@vger.kernel.org>; Tue,  4 May 2021 03:19:53 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id b11-20020a7bc24b0000b0290148da0694ffso924383wmj.2
        for <linux-usb@vger.kernel.org>; Tue, 04 May 2021 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1UBH9ITwIAcKPr9DvuKH90paGVIeBAReB8HtHUfRWfU=;
        b=AIi5VG7PdwoiBZChRRMOWC4FUuAxjE8+A0Fao4bDeMrkBeFmfny6/N42xot5fynMlk
         6gu2/18BTo7VnFhqxG5w/QCQIWM/t1ByF15OLwQt7yPCs6uBiQxELs15X8YRbiCP3irb
         1Q0R8YWC529FCWpDc32W0Lk6QONKdGy3SOyDsos2od/xhK5OXzngVE5pVOKDN6nihF6q
         o4D+tYbJF5scl2wyYC7oOldtQcbBr591QDIdL9Giu3Zad+BLisBnNH9ZGs7uhihlP6ut
         a3vjXapf9boWXKCCYM8ZQj6mHl0C+4Ghb23lScn144iQVesn/1djCRPqkt7YAVIUtkIC
         dpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1UBH9ITwIAcKPr9DvuKH90paGVIeBAReB8HtHUfRWfU=;
        b=n4oMrKb/SWb+NLOOXMB1sQuJ919Xg3HI+iS+sJ9PyUrmnEUmV8jwDSQA335N8baWzl
         uw0S2fbVsgAYBkjqYlB7TqET/AHPOfmXmcJJgo3q7ndXEjW29KUgKzCf9+IyWBWLxm5D
         sRAAgLJeyaXeUnrJBmTr5Gy+RCWgx6G9ACGsUo9KJab6bKM5NKwjRqOs0HNJSfp+TBsr
         5Gmo/Cfsb+QPfIcbviNNgvSSdSiuRwrcI/FFwV510OdMiJ360LJBrW5lDFSMq5Sfs5xo
         NZ6a+xwUHklAcMCNpDIBPXkExVAi7Wf0DPVUrMeV4JaKR+txUeeOLw8fbunkCJAmVHLz
         2S/A==
X-Gm-Message-State: AOAM533aEE7mH0IArKReCD9jtEuJOofsOIpAwoIL6yMCNHr6/P1YyV0l
        P94ys4ayrF4y+Z72w56wZ0hUKg==
X-Google-Smtp-Source: ABdhPJxAGePhPyqy0NPsfuqcB7mjDlUbLKYf0PPNAlFXgXaLjO01Q+Rl4s9lcL7n1P9IoP4otVbxrw==
X-Received: by 2002:a1c:e38a:: with SMTP id a132mr11825572wmh.135.1620123591733;
        Tue, 04 May 2021 03:19:51 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id d5sm16293789wrv.43.2021.05.04.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 03:19:51 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 4/7] usb: isp1760: use dr_mode binding
Date:   Tue,  4 May 2021 11:19:07 +0100
Message-Id: <20210504101910.18619-5-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504101910.18619-1-rui.silva@linaro.org>
References: <20210504101910.18619-1-rui.silva@linaro.org>
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
index 2f16adbc7624..51b2443ea5f8 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -72,10 +72,9 @@ static void isp1760_init_core(struct isp1760_device *isp)
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

