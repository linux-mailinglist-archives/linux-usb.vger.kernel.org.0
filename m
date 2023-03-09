Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978126B2567
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 14:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjCIN2x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 08:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbjCIN2P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 08:28:15 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71470497CF
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 05:28:10 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so3597597wms.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 05:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReaB5rrl626TQ7XHSiG6p5ZQGCluXJKDnds+E5f0Tbc=;
        b=Xzv7XXOWlFkB3kKPUs6OuKS3sUaS7dyHeB1WDXJly1IsBwZ9Q0fF4nXh/ngynrFm7t
         kP6dgG2HUeA8CDfIBQeVisX0jeJVJ87Pkh/Px+LCEGtYPgL0EXjWIW53U9wIFLkdb2kP
         Z1S/t8okKccZDBcJ3AiLQ07i3v9bTCeDaUykryD5MaEwLZVuZEG1vPuRDmXAxS15MDDW
         o2MdFt9zUBieerqUBAW6DHr/zb7i8cwtW8sKqBO8RcLs4/oNiRLtepmXo0rKQMTcTOQ2
         CFUyMjARzxuupvAu8HODdduPmTAEvrnM65qafvtO7UabpQhLXHzJxUCwSu3FBrLwCG6T
         Aorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReaB5rrl626TQ7XHSiG6p5ZQGCluXJKDnds+E5f0Tbc=;
        b=d6y8rk4fp1cEaYUjJq4pRTuTqgWr5JtcWFDFAeB7GQ1eK7RuB/HCg8bdpiD/QAlxJO
         qhyvkua5/dlwVMO/aZY+FgTxzi5W5K8kN6jse/ojpgsa/gjgC4Qj7mTA07ysQV4Akc6j
         iflArg6Dmx7i7FFwh+DYBAWP9rsqsE8psNAhNpJTo2kINDIfZxUG7hVvckNJhD6ZNoJf
         GsJa2lDc16AasndPNWTbKnR+NBrXC5zN5niGHV45DQ2BzNNoiKava0tdB1Dj/WkIw0j8
         7IR/QTnR93GjKRAp5E13CEv3j/4N0/p381hjHDQbWVRVT61+FOo99wid7+EaOKOxXYud
         zdDg==
X-Gm-Message-State: AO0yUKXd8rUs9aAUWgrIIJLHZ1vFMnyp8XHGkrrJKOCRudfrtT2JRESq
        Aw77oNjVsYPpXeEgA7XbT95bqg==
X-Google-Smtp-Source: AK7set9Ke2GYuzXZOHRyQ5gjDuq/mtkGU6o5Qw3F7UxAo87lUPDBB0M28TwkotZINF/9hkvQ7sZEbw==
X-Received: by 2002:a05:600c:4fd4:b0:3eb:2b88:867e with SMTP id o20-20020a05600c4fd400b003eb2b88867emr19334386wmq.10.1678368489885;
        Thu, 09 Mar 2023 05:28:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2926714wmo.2.2023.03.09.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 05:28:09 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Mar 2023 14:28:00 +0100
Subject: [PATCH v3 09/12] arm64: dts: qcom: sm8350-hdk: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v3-9-4c860d265d28@linaro.org>
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

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 67 ++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 09baf6959c71..01affb16d039 100644
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
@@ -674,8 +708,37 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	/* TODO: Define USB-C connector properly */
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
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

