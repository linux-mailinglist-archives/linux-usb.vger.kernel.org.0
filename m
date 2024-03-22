Return-Path: <linux-usb+bounces-8146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E798867DE
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 09:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26E97B23E0D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 08:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAF1383B4;
	Fri, 22 Mar 2024 08:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wvEqhEIO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604F13ADD
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711094518; cv=none; b=g0E+TNp1mCJbQbr5sVl1etXYlPaCEkqQUlwAdk9gX7UA1nuWGN44uB0GbM9IJgtfyLgx1d7t/nrJXX2l2qThvTZ65QWcnfstipDWjZ8N+ZuF/AW+UML5PWuF6i6sdM8e8MAq0GEzyv7aqgA+zvG++CoZXlAraNrJM14RDf05QZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711094518; c=relaxed/simple;
	bh=c9oseDZUUXTqJN7LS14WFIW9fB6ocM05ox/NaZ76+/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvsVmv/mBW5zLvWVE/lt3aSHud2OQPlaheFN7uD8RdNTSlR03euz1rQgtcy+nPyFEd+TZ4mI5Wzr2OpkatzQT8omEGH+dOFzVhdED/qyfmtZsNT12S1y0FSOKDhaD4Vr1Dn4zdJ/FnzSHUVCpZ78qvxnACLYoyP/xqwH34XkLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wvEqhEIO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513e14b2bd9so2220816e87.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711094514; x=1711699314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWERVSAHlJVwwhvb1oFx+Pf4sIxWeoVfA34irUNvYi0=;
        b=wvEqhEIOGNyxjbdM90hG8WXi+dZB0J4Z3c9qrDS3tlBz125GH91v8iADcfRCYGranf
         o5YZ7h+1JVamsNf6ZH1/FwhBgcHjjf7Ti5wqPqmlyzQ1rAJ8rAFav1dpRqRbkDm6bFev
         P1f7BZbaP+m+jsmSYkBsi5gM82bHPwT4N0Z2W8tB79cwLFkOGoTHujGdJ8ALrPWWtv1J
         sJhxlH8xz9dP9S/8Wd7c03IEX1wRCrkElD6oMcpk9UB/c6XdmjnGDwI2lPQctcgjFES8
         OHFgAZ/q4FcwQZmyqv3abudkbg6lTi0tKBlhqqnu9S2EOQiaeoIMCsZtyywyd4wL5lGj
         pobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711094514; x=1711699314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWERVSAHlJVwwhvb1oFx+Pf4sIxWeoVfA34irUNvYi0=;
        b=AVMw75k5OPWAds0htCcB1fwWVMzVqgENe7rcK7AWeoM6+xSGksmPkBHLGM1Y9C53XL
         khuI/lp3UqGrIqQeHO2NDhLHfh8khtHWjoKxEJCTw9z0vI5j/FQhSWfe4Zs2HxGfpVq0
         IvyEtz9YYiEw0hgURXw0jbg4X/2pJzQX7VDdo+MRcE/2RiZa0RIZAHAnnTHGmvAaVUHN
         Qj9NhJONsVvJYXEFR5loDaCq8weOQPqZUAhc97JygYangG9u3BimUehl2y/fCsPmJIBE
         Tjhf2cuHzPzY/JeFcgSRtgknb+R+qm5iTAlYtil1aVA7CG17enftcvfkr146d8oIVdWT
         agWA==
X-Forwarded-Encrypted: i=1; AJvYcCUfQzh/HjsQLb4GbEbjWw6REp3u7elW1jLNqD2F7VZZyCQNdekrYbv4bDIQKyAHFxrj5Uw2bKNMoyroGHgLu9NDwsT7xmxN9nUN
X-Gm-Message-State: AOJu0YyRCABjTlUjamAVwkmhycGQ6Gr2oenRugh2iyZ+yNc3C4SG7crn
	Y+s3Ah4Yx5B93YbEgc7L9LHz7swqLOYta0TYfms2dOIEdFQ3MhSpFAfHXdHIUVngY7w2eLi0JwB
	y
X-Google-Smtp-Source: AGHT+IHGt+ZVwxuyh9yGGHkfee1Qe7heWSrQxIuOb2MV+H3sfuBxiyY7vRVo3wCCCyZYYvJbso0/Iw==
X-Received: by 2002:a05:6512:214c:b0:515:8bb2:72a2 with SMTP id s12-20020a056512214c00b005158bb272a2mr962134lfr.55.1711094514045;
        Fri, 22 Mar 2024 01:01:54 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (046125249120.public.t-mobile.at. [46.125.249.120])
        by smtp.gmail.com with ESMTPSA id p29-20020a056402501d00b00568c613570dsm739889eda.79.2024.03.22.01.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:01:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 22 Mar 2024 09:01:36 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 role switching
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-fp4-tcpm-v1-5-c5644099d57b@fairphone.com>
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
In-Reply-To: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
USB PHY, so that USB role and orientation switching works.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
With this patch I'm not quite sure if the 'ports' are connected
correctly, though functionally everything appears to work fine.

On some other SoCs port@1 in qmpphy and a second port in dwc3 are
connected together also - one port of USB 2.0 HS, one for USB 3.0 SS.

Here I'm following sm8250's solution. Also checking the binding doc
doesn't reveal anything useful.
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi              | 25 ++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 57 ++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 24bcec3366ef..b267500467f0 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1686,6 +1686,27 @@ usb_1_qmpphy: phy@88e8000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {};
+				};
+			};
 		};
 
 		dc_noc: interconnect@9160000 {
@@ -1861,6 +1882,10 @@ usb_1_dwc3: usb@a600000 {
 				snps,hird-threshold = /bits/ 8 <0x10>;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				port {
+					usb_1_role_switch_out: endpoint {};
+				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index bc67e8c1fe4d..104f23ec322d 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -19,6 +19,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm7225.dtsi"
 #include "pm6150l.dtsi"
 #include "pm6350.dtsi"
@@ -543,6 +544,50 @@ conn-therm@1 {
 	};
 };
 
+&pm7250b_typec {
+	vdd-pdphy-supply = <&vreg_l3a>;
+
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		source-pdos = <PDO_FIXED(5000, 1500,
+					 PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm7250b_role_switch_in: endpoint {
+					remote-endpoint = <&usb_1_role_switch_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm7250b_typec_mux_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pm7250b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1500000>;
+	status = "okay";
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };
@@ -726,7 +771,12 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	maximum-speed = "super-speed";
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_role_switch_out {
+	remote-endpoint = <&pm7250b_role_switch_in>;
 };
 
 &usb_1_hsphy {
@@ -740,10 +790,15 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l22a>;
 	vdda-pll-supply = <&vreg_l16a>;
+	orientation-switch;
 
 	status = "okay";
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm7250b_typec_mux_in>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l4a>;
 	vdd-1.8-xo-supply = <&vreg_l7a>;

-- 
2.44.0


