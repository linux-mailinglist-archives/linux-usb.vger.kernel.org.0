Return-Path: <linux-usb+bounces-4411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C1A819C07
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 11:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF2D1C22589
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 10:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F082B21347;
	Wed, 20 Dec 2023 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="j5QOHoos"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B1720DDE
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55333eb0312so3377857a12.1
        for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 02:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703066583; x=1703671383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4XO7eTq5V2tgbn1CZjnff0P0/4EZ/7bk+Ag+yNw4uk=;
        b=j5QOHooskpbZ7tJuuKSIB8sbjQnrdcakB7oZ9VNifwJw4tFAzosdquKB00DZck5jib
         x+q4fnnap/YHifOqsB57hKF9NNdxpmmLu+nwwwQCStp3A/HLklSdrcVeyGR/7UUvZ7dX
         ELqsj3YnqvyUIrgqz3Wi+CyJ5kWyyEn9QmtC0Dme7fPcW7lSd4T1Dnie9YxCVtJg5cPB
         cM9SI1gU/4xygGzeBMtOsXGqugZhEofuTWT58NV7Qdg0ZKplWZP/c8xGvgCOOdnbxkBT
         0HwpcOg7pYTuVJmu7FlUNQ4ybhkgpSDAl08oYW48wupB9RwPmZwTsrAURSA/XnuW0qPF
         ymyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066583; x=1703671383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4XO7eTq5V2tgbn1CZjnff0P0/4EZ/7bk+Ag+yNw4uk=;
        b=N0+pr9Oq6nyWEy2/v8pRJ86fpgRWKqCKPo1ePCVS0zfVLhUcNRCzG2S5hJmzQJMld+
         Nrb4VXn+Y13j2YTmaAMyuL+iigXYcOog8b2kZbn5v+iAGmcw3ZNNRB8lluzbDeVP81sz
         21KMKwBKW4Y/kePs2h4/U+FqAB4EWxkKBTqugpRAZNvL8ULT7SeQtkLA4JZooO/U9IH4
         2GMcI0vPeHrzvL/nSC2vfUoOABtiFStxemrzDjVSYvqKy6wgHydcGWynvl0PfHgYDBGa
         5wFo6VQEHMSeIspPyx6MsswWK9HYfzlWp5c5POnNBhyDxeemCIlEwJYwN4PgNhYsgf0L
         POGA==
X-Gm-Message-State: AOJu0Yz7yseztXv+GmTS/LpepnIiF6Unld2fVOWHbKXsVmJOcYPIerRj
	y44SsVPK2+lXkmuwGpS0sPdD2w==
X-Google-Smtp-Source: AGHT+IEbEhGD1wKLG7GiNnVJ3JrKSvGoOg9IQgsOKKagASOiSEzuam7Zj/WVz99NylAwPsFOW50kKw==
X-Received: by 2002:a17:906:19:b0:a23:6084:d5c4 with SMTP id 25-20020a170906001900b00a236084d5c4mr2144865eja.34.1703066583077;
        Wed, 20 Dec 2023 02:03:03 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id f18-20020a170906561200b00a2356a7eafasm3718681ejq.199.2023.12.20.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:03:02 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 20 Dec 2023 11:02:58 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PMIC
 GLINK
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231220-fp5-pmic-glink-v1-3-2a1f8e3c661c@fairphone.com>
References: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
In-Reply-To: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Via the PMIC GLINK driver we can get info about fuel gauge, charger and
USB connector events. Add the node to the dts and configure USB so that
role switching works.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 46 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 19 +++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 176898c9dbbd..e9076d92ebd1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -71,6 +71,41 @@ event-hall-sensor {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,qcm6490-pmic-glink", "qcom,pmic-glink";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	reserved-memory {
 		cont_splash_mem: cont-splash@e1000000 {
 			reg = <0x0 0xe1000000 0x0 0x2300000>;
@@ -886,7 +921,16 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index cd7641fd09b2..3b268620bea8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4065,6 +4065,25 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 				maximum-speed = "super-speed";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.43.0


