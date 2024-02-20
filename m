Return-Path: <linux-usb+bounces-6822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EF85CC6C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 00:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB827B21F55
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 23:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF6E155A5D;
	Tue, 20 Feb 2024 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agXLHifd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF615531B
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473539; cv=none; b=rhn0pzuKGMrmISygUnNnoORE/143PVQMhDkJzLI+R9wopMiHzVEd+h9ENwC9UMoi/yKLDVeixttzoIrDoR4kw2gxR1ydPL9P4ZXwXp8j7lTEz4RVJ9DFJhNdDmxMLLo6mtd33sOyAHaXi/jaKWVVUln/RtcwiSWCN7yK4NrA8+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473539; c=relaxed/simple;
	bh=xsb+gMgRC4mTpUU9Yd8ZeeQIHCjK1OYSoeQFs1OriYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmVcvnuTUwgsgnMBC1Gc+RMjkMhsrbimKLu2pi18Ikt/lFC9UB0wTRxOrXXGAbK7tSsSYy7zMQmLNYgrg3we8OFioqkzuvoBx1d8dTaesJCMe5gJQ+dKumwN/CEzdqj4tlZX5rf6wnpKp2U/wSLHSbrWdxpHuV5K+RexXFnU0XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agXLHifd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-512a9ae6c02so29398e87.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 15:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708473536; x=1709078336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dA3MUcPJas/uxeLjRMByLl/kgbZsDs9gZgJLp+b4wrs=;
        b=agXLHifdGYWzDBUftXYLhxjc+B84ZdK6ytaqkdPPhVk6Jzq88rZGI43dXBc3Kr+gpb
         i3NqZBpgCignzhGXYgEqUChvd6aOFcNJnR58mUDsY4R95AilpBvbZYrRlP/QozlLCYi0
         /wbGJ8d7IHR/gKSJabFKvNApIJ7t1Rr6dBL4pGrVJvNzeMkxw5C13DdrksQE6mTHSzBJ
         H61lsGHtuBDmScU9aCapV7Nxpk8YWZp1cI7qT3AY8pS8jPLHq4kTjKVbtvzcr9jNTOqU
         hqjVZTtJrCs59yareDuO1sptKRqh9rA3TqcSeZHQaAj7fzMsjsvAnOAwsNl/AaxFW2CE
         ygkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708473536; x=1709078336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA3MUcPJas/uxeLjRMByLl/kgbZsDs9gZgJLp+b4wrs=;
        b=lCk4obnLxGThArtgaTau3iQHalw3tG97hM0LLEdqlLe4q5VD/9/8/XNY8Gdfzl+g8D
         Sf5BmNX+MguP2uxEeEXVU2Y0o/+/Nj764yEuk0jkQVcVx58BhQqDNt9m1jjTrSaHG1Ec
         HD2K81Ut3+WZ34OpYIlz1ataZDRKOaRu2w3JS4fZZA9iELlumqtddZQ7L+y3U3/jyBR6
         ZWHE1CIFghXo6TUUVZoGijehY3uIc10L0owR96Dnrugt4o9Wj3y/HoB4bbUQFSTseRc2
         KK0I40Lka45kl55Ls16Jb7fG26Pijq5k4f2MUvQjjAs5dcz6Hx8+fhBo0sVuzCXfvCPp
         /2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVIP7NRA1NK/hLBa36scNX+L8vuE3EQYrrUEkLf2A8UHA0ZXGOrtz+SkCq1g5xUOfem7DDodFMRmc5Xpg+y2yS+4IxONBVCP14I
X-Gm-Message-State: AOJu0YzDYzfwAOrKLazVy7rL+c0ppD6ncw/eJwiplsOfR5q4FGdaTR8g
	CQ0ZvAhW9Ja5G44KLhS5fDzWKrHhrF0Ki4S6tU54+OvUI8AjHAvbrOyJ0284MyA=
X-Google-Smtp-Source: AGHT+IFzN/727bZfmIqxsB/3FdEc9lH6KIjR+lJYEL36aByz+IVlqWlJVUgs+pdB+gtWK5btx2W27g==
X-Received: by 2002:ac2:4311:0:b0:511:ac6c:2b28 with SMTP id l17-20020ac24311000000b00511ac6c2b28mr10179345lfh.56.1708473535709;
        Tue, 20 Feb 2024 15:58:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a056512055b00b0051167de8560sm1438831lfl.38.2024.02.20.15.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 15:58:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:58:52 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb2210-rb1: enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pm4125-typec-v3-3-fdd0ee0465b8@linaro.org>
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
In-Reply-To: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3414;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xsb+gMgRC4mTpUU9Yd8ZeeQIHCjK1OYSoeQFs1OriYs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1Ty8RroEUlU/+6HSZ6nK0sj6/jYQHz42WF19D
 MEDLFeAOD6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdU8vAAKCRCLPIo+Aiko
 1cnyB/sH0vdN6/4xtG4Kn4D3/kw4xXcH/bOexIniKW78xq8vdOzS2MVI+NxUF4fPS6JxYEQGFqq
 34XK2zaF/IvIrwJJZ1QODAr0ssZsm7gWX7UKCa5K2MHOJraZ+JET42xb7ZwBm8ItFg7k2pqKbFf
 O+6CyQQkH1choBBS+VmPpYeeWmAwpMLGq7MG2vHiSpvBfd933ifo7pPruq4qlGohBtT+aw07Yft
 vFlfNSfjM4K9+1efl5HLLNgmg6/6wLTsIOJWm2tlM6rcz8ZBpCP1si5lOklzVORuj5FuhLK1oca
 c3My7ejS8cpqEGvUs+GikTCQ1XmtnQnUXM5u/iJwD6NCt1l9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Plug in USB-C related bits and pieces to enable USB role switching and
USB-C orientation handling for the Qualcomm RB1 board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi    | 42 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 60 +++++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 89beac833d43..967bc98d02dd 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -694,10 +694,31 @@ usb_qmpphy: phy@1615000 {
 			clock-output-names = "usb3_phy_pipe_clk_src";
 
 			#phy-cells = <0>;
+			orientation-switch;
 
 			qcom,tcsr-reg = <&tcsr_regs 0xb244>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+			};
 		};
 
 		system_noc: interconnect@1880000 {
@@ -1380,6 +1401,27 @@ usb_dwc3: usb@4e00000 {
 				snps,usb3_lpm_capable;
 				maximum-speed = "super-speed";
 				dr_mode = "otg";
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 6e9dd0312adc..fca341300521 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -262,6 +262,46 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm4125_hs_in: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm4125_ss_in: endpoint {
+					remote-endpoint = <&usb_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <500000>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -535,14 +575,8 @@ &usb {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l12>;
-	vdda-pll-supply = <&pm4125_l13>;
-	status = "okay";
-};
-
-&usb_dwc3 {
-	dr_mode = "host";
+&usb_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
 };
 
 &usb_hsphy {
@@ -552,6 +586,16 @@ &usb_hsphy {
 	status = "okay";
 };
 
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;

-- 
2.39.2


