Return-Path: <linux-usb+bounces-5747-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A178464B5
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 00:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A9731F24D44
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 23:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E132D482CF;
	Thu,  1 Feb 2024 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xzT0Xm6z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AD47F7F
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 23:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706831723; cv=none; b=V7XViuDcH6296TYFxXKsNc1fXfM8d2yp8/7Hs//JlB1WXBSwRE8wIKEfZjtSwPk8FBIdX3aJC3Fs9kdAgDFpsKpJnrUc2g61zDVtjOuMwAln8LVZJ5wItX4ECHC9MVYQsUcvwDa5GKgIKZ4CkhH3X/mGQ4hXZbNvHBZsJ8zKm/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706831723; c=relaxed/simple;
	bh=83gYrzQudk78eyKHtCcC6T6p4vOvmjk2orjuBLLUm0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEqSPnAIW9pLVaFo4kj+1aOxDZkbOH2wz0NGSFUBsrzIWLa9q32ZVKEvVcK7I7tuiJGfiFJr+VK/A9mHXipXFkJ7ZHmhUOthnURDJ6pD7ICRsNZrxYNXUrcFMvx+oToAaXqrZInXPfZ4u6cse5P/KMchTHEEYy5+esZCJlbHHHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xzT0Xm6z; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5101f2dfdadso2297965e87.2
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 15:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706831718; x=1707436518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woT6Fq4hECPiCieMSUBXYBSHMFciLNE7+9YNtI+agvk=;
        b=xzT0Xm6zAwCz0zLCgaxs5Dz2QKJCKZRUEr3pCLfz2JBvT9JscdTgBVMIocDvCw9BCf
         E1wfFglMqgxpskeEhrxaRFt5Xp912GFGiihwGuShK7JTc1M8omwkVN7NGIdvxSJpb2e3
         ZCWEuAzZXSiQq67oZ930rAWv0jL6l0qKsXc/DZXF5zsAVwQhITDpNHziQPB7PFdmRP9Q
         fc9UtAOInWFYb8Ph9x0SQH1NuOmC7au9ax1EseB0/Z49jLD4nLCwKXL6UvOAPlU4jGeK
         W/VER3sF+ZnyEMlAdZVjSIpezgs7BYUeDxT59GxnoR/wrkx3NLxshzfVHvCDFpHDYiF6
         HIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706831718; x=1707436518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woT6Fq4hECPiCieMSUBXYBSHMFciLNE7+9YNtI+agvk=;
        b=aRTGPgYhrckcfF3HXLScP16DGTIv90u1rg89M27s7PQkp4g9772jx+EzWjdylO8wmF
         I9dv4m/FKGzn8dxg5JcGEEijORNgY2fjz0+RsxA4CcnOCmLRk4gR6EkWVv4XX57/bd87
         cjPgZ5ljs3YBFm2DGcQ/55pq+Dm8LDtzZKBcmzrKgxgg8xRSG7T/h+hOxAHd6dE5Fdg9
         EisspB5Pg4wciacwocHTbVftlFaCXFOSd49oOp9fe9wT5813NdjZwSAqwWXCQox4I3Zh
         KhPkyjIPbqfreS5AF1RAAkPOKiqvp7spo3XU9+hS840JCLOMu4KKiwcWgr/Gn+jMhWlZ
         ym1Q==
X-Gm-Message-State: AOJu0YwwZAFMjSNhab2ald5cMNHjNHRVF1Rivy3pIa8Bd4aYleCw1YuX
	tTwxm+H82Sot7zfRrzgRkcqO/r5OacgVmYUNRm35LWG3fniBpSj1BOApsOOTYDk=
X-Google-Smtp-Source: AGHT+IEin6/Zmwt0mBfhfuvMkurbWVOl/u7f/0ITHpW0VBOltCVTbjTeO/aHnIlOgt2rsVLn/2bBkQ==
X-Received: by 2002:ac2:43b3:0:b0:50e:5a25:efbf with SMTP id t19-20020ac243b3000000b0050e5a25efbfmr242714lfl.42.1706831718409;
        Thu, 01 Feb 2024 15:55:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUIsC5rkplcN4XV46vNbaQqRHz+NYYD0sAR4cWas699qkz64W55dnCFWidYN2OdcdzUx6H4uysL1Wz514KvXaoOKzWDiUNGVjKRbxU+tSbn7iA+NhqwCU9SgZ/vxPHEjf3C/WDmfkAxwbvEVL/sThGJ19ms/T2i2pB4kmBWttSDhMWfgkI98qp/6AIlxq8IbG6H5JZU+JotJqVfpGm1FiErt+tXzWuYooL5izApkZX998W65dc7i1Fyq7bM3L8V/pnwvMa2ZgpOlDavixAho3iRLwaRukObPFEouYW5m06KdyImbOMp5zI75bOTjvFAcxZ3RYQs1Et+bKQXPg4ZBial6ntt8bgPQxdjfiiGZsPb2FGCF6N2tYBheUvlUvzgLU55iuwGCJ5OvYJgoJHJT9fje7gsJhBGsh3DEEqKxxW4X0R+FnzJ
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u13-20020ac24c2d000000b0050eacc0c80bsm106754lfq.131.2024.02.01.15.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:55:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 02 Feb 2024 01:55:11 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: qrb2210-rb1: enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240202-pm4125-typec-v2-4-12771d85700d@linaro.org>
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
In-Reply-To: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
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
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3368;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=83gYrzQudk78eyKHtCcC6T6p4vOvmjk2orjuBLLUm0A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+oe/aSLhhon9yy4wdbJybmtPbe7I2zbPFsGDuvYdcfmx
 vwUnsLYyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ2Mqx/xXkUOe7tIupTnhO
 5OdCpoXTJ505k7SpSvpxXNymqSf3ZDUyrQvaL1N6da2B/LRZrF+qv2QXVyWEvvJmu7Lyas2VhEd
 r3C6u9Si8Gyf/il3d8qkM75zYjtMlbFnv5h8O8qmfsLxUtP2v4eHlP7w21Ft4RFfpcqaaXQw8KC
 p4P239P5dbfF1nW7Z/dLUpX/D5oKL4A/kXl5R/p7nr32uyirII175gcb1t2cobLtWbt++4cFPTk
 uGpb5sGk0BDk+fz4Bfz1eTDW7zZ97B8dQu2b/7dXKghz1Zi8PxWfPzNJpPHb7gy/FfnNfi31Mop
 2jKUWC6yjr0/d+LU5Mnf9dlNwgr1NHXK2uT7z9uacWUCAA==
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
index 0911fb08ed63..6e9a92556423 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -689,8 +689,29 @@ usb_qmpphy: phy@1615000 {
 			clock-output-names = "usb3_phy_pipe_clk_src";
 
 			#phy-cells = <0>;
+			orientation-switch;
 
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
@@ -1373,6 +1394,27 @@ usb_dwc3: usb@4e00000 {
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
index 64b2ab286279..00fcc01326ff 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -244,6 +244,46 @@ &pm4125_resin {
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
@@ -517,14 +557,8 @@ &usb {
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
@@ -534,6 +568,16 @@ &usb_hsphy {
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


