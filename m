Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D276BEC5E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjCQPGx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjCQPEy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:04:54 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5919631BF9
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:37 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id r29so4704182wra.13
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrPRBzb1vVCm4YUTuPonj2zAD2+yOGeBsiiAQHsNxwQ=;
        b=mtwD9CPh4RF9cEzygLl7O4ivAapg9P+zloYpeqiYOBe6qtJnvmuCzIuUPtHogLozJY
         4vNbvhWt0pHxIklvGJjjWonCPcUTTCDWBMT30VxD3CMzk1guTj8CZvS/D617V2+rYA5O
         Ui3+fgQvg9X87QwwlbDauXtqwWNSIkWOXU9MdgfHAjY20ScD2yTomW3gMdw9ejFAoZ1c
         NHnntQs0caTScBlbWJrQ2bJ7pFfLEPdUi0zZG04/eBs2PiyZNiZSUiElsod+uwSuXvwZ
         Sy5B8c0r05+OaMiTXE3Vo0A9TMDu4b6ZKg0RFs+9trIO6VyKi/6W3Em7K7CdwnzZSuMy
         ikJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrPRBzb1vVCm4YUTuPonj2zAD2+yOGeBsiiAQHsNxwQ=;
        b=d5pKsvuq2MLXCHH98vgCLY4CSzGNdnkoTgt4Mfra9qnjycXjP6+0wUmICulhkFw6f1
         lf7HHPHIDeHK/hgS38X68skC+K73jcz1Yq7mZInRtEzvRem7RG2peOiPtOLs1gbBDqaA
         nsRgjpGwhsB6EqCZkSmjV6wPDMm/ha+wQMrhSMRvRYCyShw/QlJn6iGazCBfn6H2406d
         cUTDKtFxFkObFnqyRcgC2yYyh8M08facDeGhi1vimFrIH+2qWCJZp0WmU3ziDkHV7Pj9
         dwNYZoEC0X4mvGT5E2Xehst/eJNIO/BXA5VpvbmNuvfWJ9xxM7Vm5y2hi4SNbbHsD2Ek
         9nmg==
X-Gm-Message-State: AO0yUKXRDsGlNi4w6HfcqgrH5lZmjJZzEthPogOO/8LbQo8/TlV4mroM
        ZwutVOvi2rYcoQOo6/x1tEvelJWmpuQAAGxh7RTFSA==
X-Google-Smtp-Source: AK7set9rL3zq2hlFvGSyJn5a35eiZ43cks1oErWj6cSlSAeY4k00rhzmkaUR0ZdMZCydyDJe8kdj6A==
X-Received: by 2002:adf:ffc4:0:b0:2ce:fd37:9392 with SMTP id x4-20020adfffc4000000b002cefd379392mr7565138wrs.45.1679065474958;
        Fri, 17 Mar 2023 08:04:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:34 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:27 +0100
Subject: [PATCH v4 11/12] arm64: dts: qcom: sm8550-mtp: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-11-38bf0f5d07bd@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
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
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the pmic glink node linked with the DWC3 USB controller
switched to OTG mode and tagged with usb-role-switch.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 45 ++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 9d4ddb883a70..e2b9bb6b1e27 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -27,6 +27,40 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
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
@@ -561,7 +595,16 @@ &usb_1 {
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

-- 
2.34.1

