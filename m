Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 312706B256C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 14:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjCIN2z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 08:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbjCIN2Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 08:28:16 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E315F5ADEF
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 05:28:12 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso3597583wmq.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 05:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIZWCHCizmiTMP8MFw+MH5pBPpvUyoLccf+K3c1L/7E=;
        b=LxcvCptu3EzybjaWZJZ0utZ7LAutdKi38euSYe6Qqxkoz0VXk2l1SIhUeZXhI5SbAo
         TxDy/EiOtMhguUD5v8j5LJXxtgcFx390LZPdqQ5NSehbEhzPssTT6prmFZ1iaCfQowsh
         xpJLEZI82FjCmts7ryzv1PCL/dVlAUpdublpWLuOS7AWBiV+iF+8HQ6XC/721AwrjQhc
         T8Vnt84NcdvqYvR8t/m1FGRLZ19friVcuftwU21GXk+XlKCfRWLMtqsxLNrr1M05reuJ
         DQLlxOC1XHlwX6ZSROU4AhsUpWF5sujEs/JtVTP6ERBUlVpQkXeDDHX0B338HQ+Z7Otp
         qZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIZWCHCizmiTMP8MFw+MH5pBPpvUyoLccf+K3c1L/7E=;
        b=FzBZzaEaRGAhNBEr1P2ecG78flHmdj4cbvbvryiiRbaU+6kaBEwze60iUAWjMQxBye
         aAgJNgPNGf8RBxE+R3QVJaTpMMfQYCE37A1liyYDIdmHUsajN3w4noMmocxD8R8hmeHL
         Vc4fCVKm76GJLj3eExVb7Y/cX3Y3gZDOgJWdBGOJWjfBmNECZF+AdGrXqV38jitYotUK
         AP5EAwfjqiy2+EOzT+yxCYWMM0pCEuiXf6t0xUrg3BcScMH97Y8ynTucJHepC/4tJp47
         zuaIRTZl7ZySbDwqPUlpGolUMiJEK6siJh2BjdCUdWpc0SB2HBqf5Z49zmuVybqxYO/C
         62kg==
X-Gm-Message-State: AO0yUKXAQsgGJnZv6WtfiB8SUeawzDLyqzCqMwZo9QjP4pnw5AvwQ0vn
        0LOkyQ36qFuk5P5XDh0wPZBbOQ==
X-Google-Smtp-Source: AK7set+SXASWXIlSw1jtik/OR2b2fvlDM/JlBoHcAPKL9xwjWIWWmcVJ62UtqhmZPLLyVIXtWCBb0Q==
X-Received: by 2002:a05:600c:2150:b0:3eb:253c:faae with SMTP id v16-20020a05600c215000b003eb253cfaaemr19432799wml.36.1678368491817;
        Thu, 09 Mar 2023 05:28:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2926714wmo.2.2023.03.09.05.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 05:28:11 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Mar 2023 14:28:02 +0100
Subject: [PATCH v3 11/12] arm64: dts: qcom: sm8550-mtp: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v3-11-4c860d265d28@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v3-0-4c860d265d28@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v3-0-4c860d265d28@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 5db6e789e6b8..7b880cb7e022 100644
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
@@ -546,7 +580,16 @@ &usb_1 {
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

