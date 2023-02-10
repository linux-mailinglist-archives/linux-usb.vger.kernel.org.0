Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53391692179
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 16:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjBJPCr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 10:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbjBJPC3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 10:02:29 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDDA7394C
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:02:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id z13so4035540wmp.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvwO1p90Dx+jLmKc6nBk99sTCQ2dp6oywQPc85KLqO4=;
        b=XR32bXtIKzszu1K2fC6Gh7ICQ1i0UJ77nRa23WzsuejYKcg5aUIfHzdMPyHE70y4ZT
         FhRFnvUmbXpXbrF8WJ3fb0RKEjaYyGdOjqqyLjzw/gXz1VAmdnGlC/8a6JF0mikKyNOH
         MY7g+kfdw0ZA3yX3Zpx1I1WZXPiVmAS4Z4tsNmvrqLaocWiIERCvaXQaZoUDJooPraxQ
         O5USxd2pIbV30tR3lDuhHd0msO8/vl7RdM2euEnmYIFtjp1PqotsUQQpFB571Lz9r5V7
         iHMkO+3K66/rvwUu5etMlrHqcz53msvHbFYawpPEdcoo6I5ltqDg75MaSyOKkvs0FhgA
         8S4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvwO1p90Dx+jLmKc6nBk99sTCQ2dp6oywQPc85KLqO4=;
        b=Rwahp7586rSrKUO546F6+PeFWDZjx+Sdbe/e9my3X6VY8ZB2xV6OLgVzbAATY8K4Tu
         gS3HSGGG+xu+8EVXTMZ+YB+FXtKKCYwiQ6CPR07Xwo/zj5Vw58Shcr3oWZTWq0yrMWDT
         dl821h7D6q8nNa57lAqlWojIMIMbIGpOaJDYjUXSr8WUlrWvuEv5+4rJ1QIN1L6yl6VN
         09Fj3OFwnWnrRzjH8JBeaVJTZLyeEma7Ujx25BiI5Fk1FvHsmFqbr2Q+d9nRhUPuyXI9
         dwPCYpIfs+zndCFtlxHVpQerMe+/+coDX5ZOAbWFEJ5hebXQjaY5KMvpiMNjaKT4pdN5
         gyKw==
X-Gm-Message-State: AO0yUKW75LQPtIkhXiucG8W9oUozuTL+vOnPngoOwic96zTJYoCWQcZu
        K7HqBu2cBGuyPppSDsizDjiPyw==
X-Google-Smtp-Source: AK7set+BpOhiS04BYivgz4Ynweah84SZWxgIjtl7c6AJEGGh9AfIUw+ftJNBdL4+9sbg40ZbStHzyQ==
X-Received: by 2002:a05:600c:91e:b0:3dc:5362:134a with SMTP id m30-20020a05600c091e00b003dc5362134amr12593096wmp.9.1676041338380;
        Fri, 10 Feb 2023 07:02:18 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003db1d9553e7sm8282482wmc.32.2023.02.10.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:02:17 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 16:02:11 +0100
Subject: [PATCH v2 08/11] arm64: dts: qcom: sm8350-hdk: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v2-8-71fea256474f@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the pmic glink node linked with the DWC3 USB controller
switched to OTG mode and tagged with usb-role-switch.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 77 ++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 54654eb75c28..28fc9a835c5d 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -31,6 +31,40 @@ hdmi_con: endpoint {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8350-pmic-glink", "qcom,pmic-glink";
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
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -666,23 +700,42 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	/* TODO: Define USB-C connector properly */
-	dr_mode = "peripheral";
-};
+	dr_mode = "otg";
+	usb-role-switch;
 
-&usb_1_hsphy {
-	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-	vdda-pll-supply = <&vreg_l5b_0p88>;
-	vdda18-supply = <&vreg_l1c_1p8>;
-	vdda33-supply = <&vreg_l2b_3p07>;
+		port@0 {
+			reg = <0>;
+
+			usb_1_dwc3_hs: endpoint {
+				remote-endpoint = <&pmic_glink_hs_in>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_1_dwc3_ss: endpoint {
+				remote-endpoint = <&pmic_glink_ss_in>;
+			};
+		};
+	};
 };
 
-&usb_1_qmpphy {
-	status = "okay";
+&usb_1_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+};
 
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p88>;
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
 &usb_2 {

-- 
2.34.1

