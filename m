Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3AF813C556
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 15:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbgAOOOS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 09:14:18 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37990 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730140AbgAOONY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 09:13:24 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so15907725wrh.5
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 06:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9aBaxFgJsTga954Qm6zNhUUnNGmgfW34IhkNOpEshlk=;
        b=lFG+V7KbRtKUR58h85Ew+6RHQb90bJ/Ow0VU5/XrCz7/XsKIE26cPIT+GGdFDPKVcs
         OwDoGOou1RfgDYWbvZuxLl+G6zLG+VZbFdPjsKi3y3U2VRYcfRz84gRfrSFe56ijzQtE
         AO14sb+K/tT0fBVDEouCOpj+Rn5OQDBhFophY7ysM2oaDoT9xGxVhSIP6l26dGVNHmBP
         QjdGTXYRt50/VGM3AU+zRr5lyif/kACNzHUqgxycisOZ6feU4PK0TC4Ays6iQGztGkGb
         Je7a2mp+hKulKW0Or0BNmHIVPt2UuUnu6apBjNUxR1oiRgHjx0DxkfBWmY1qyF262HIN
         db0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9aBaxFgJsTga954Qm6zNhUUnNGmgfW34IhkNOpEshlk=;
        b=DuP+aa2qw0ld4cr6NG60gpD18oNGyjxb6qoRr41NYEi1zLRXQv0mm/f/k/62q15AAS
         tS0x5aBC/0MTgXeQVRxGrg4OksjE4kN0FhFKwi2h4HYYIPjvYvVh+PfAoh0uPP3s2z7G
         w6UH3Xz9BNawzJoAhtUDZdBd/AOXs6q5q4LxBFey7piq8OPJrcuIJ9nfP2Hedkei2Fa5
         st8YLa4w7dIH2DAGduAuuYa7242Iz+0mSFdI4Vx0XkrawB3fxJpkLnixQwqmb8RNfgR5
         OhI6m2AVkjSSgr/bFIlOjUGChb2eBIOfS1mSrbDf/8X/uAuAnCJG5zcVmB7Xv+37QYCu
         m8hA==
X-Gm-Message-State: APjAAAWyHtdhERITRW10dz/ny+suCds5ecytXjse73vF4BWG7/4HiPaq
        zhvc7+sWyxWV1yvLeX55vwH44A==
X-Google-Smtp-Source: APXvYqzNW7YiZWcM34HOLFv0zjGD7SaO1QjCQnXbkcWRwP+zmaniq66baux42mlmJeoD8H3iLCwyxQ==
X-Received: by 2002:a5d:6652:: with SMTP id f18mr14714314wrw.246.1579097601858;
        Wed, 15 Jan 2020 06:13:21 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:21 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 12/19] arm64: dts: qcom: qcs404: Add USB devices and PHYs
Date:   Wed, 15 Jan 2020 14:13:26 +0000
Message-Id: <20200115141333.1222676-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

QCS404 sports HS and SS USB controllers based on dwc3 block with two HS
PHYs and one SS PHY. Add nodes for these devices and enable them for
EVB board.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 100 +++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index f5f0c4c9cb16..73565a5b99d1 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -272,6 +272,48 @@ rpm_msg_ram: memory@60000 {
 			reg = <0x00060000 0x6000>;
 		};
 
+		usb3_phy: phy@78000 {
+			compatible = "qcom,usb-ssphy";
+			reg = <0x00078000 0x400>;
+			#phy-cells = <0>;
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "ref", "phy", "pipe";
+			resets = <&gcc GCC_USB3_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_BCR>;
+			reset-names = "com", "phy";
+			status = "disabled";
+		};
+
+		usb2_phy_prim: phy@7a000 {
+			compatible = "qcom,qcs404-usb-hsphy";
+			reg = <0x0007a000 0x200>;
+			#phy-cells = <0>;
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+			clock-names = "ref", "phy", "sleep";
+			resets = <&gcc GCC_USB_HS_PHY_CFG_AHB_BCR>,
+				 <&gcc GCC_USB2A_PHY_BCR>;
+			reset-names = "phy", "por";
+			status = "disabled";
+		};
+
+		usb2_phy_sec: phy@7c000 {
+			compatible = "qcom,qcs404-usb-hsphy";
+			reg = <0x0007c000 0x200>;
+			#phy-cells = <0>;
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+			clock-names = "ref", "phy", "sleep";
+			resets = <&gcc GCC_QUSB2_PHY_BCR>,
+				 <&gcc GCC_USB2_HS_PHY_ONLY_BCR>;
+			reset-names = "phy", "por";
+			status = "disabled";
+		};
+
 		qfprom: qfprom@a4000 {
 			compatible = "qcom,qfprom";
 			reg = <0x000a4000 0x1000>;
@@ -379,6 +421,64 @@ glink-edge {
 			};
 		};
 
+		usb3: usb@7678800 {
+			compatible = "qcom,dwc3";
+			reg = <0x07678800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&gcc GCC_USB30_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_CLK>,
+				 <&gcc GCC_USB30_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
+			clock-names = "core", "iface", "sleep", "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+			status = "disabled";
+
+			dwc3@7580000 {
+				compatible = "snps,dwc3";
+				reg = <0x07580000 0xcd00>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy_sec>, <&usb3_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,has-lpm-erratum;
+				snps,hird-threshold = /bits/ 8 <0x10>;
+				snps,usb3_lpm_capable;
+				dr_mode = "otg";
+			};
+		};
+
+		usb2: usb@79b8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x079b8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>,
+				 <&gcc GCC_PCNOC_USB2_CLK>,
+				 <&gcc GCC_USB_HS_INACTIVITY_TIMERS_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "core", "iface", "sleep", "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+			status = "disabled";
+
+			dwc3@78c0000 {
+				compatible = "snps,dwc3";
+				reg = <0x078c0000 0xcc00>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy_prim>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,hird-threshold = /bits/ 8 <0x10>;
+				snps,usb3_lpm_capable;
+				dr_mode = "peripheral";
+			};
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,qcs404-pinctrl";
 			reg = <0x01000000 0x200000>,
-- 
2.24.0

