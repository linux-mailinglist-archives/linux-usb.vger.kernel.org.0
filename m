Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10EAF6C32AD
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 14:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjCUNW3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 09:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbjCUNWO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 09:22:14 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A172596A
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 06:21:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so4316031wmq.4
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 06:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679404911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izzeCf+pHsYw9M71UmqZ8fPNSMJ3FJyXF/8Z16vTQAE=;
        b=lOG80+7WzvAhKTZNKnR0on1aczhP2R1vDak/tPAijiJOzCKNRGmmgsebcM6fmeghH6
         /ZpbTTxcIaFdCgT9FYCc80UPMs13No54JgVG/DOJMQfgOTD2DVZULLjPY3zZLVKUjT/p
         O+PDNcALpCezf55CanmXdQxN9NZWROsZjcXiU3eyqpRZIvrmwnH3a9KBtkONnSVNVDE5
         Z/Zgo0GJnN+jD9BPSCxVrOMHb5h1fdFaFwmWCr/PsLsS5plCeyIJvTSbOFaRDn7coFZs
         IVtl8AmMNMiYD0wJS0/AIUqVRKQ9L8unFkGDXXT9UnfYMKn5E0JQDukjQ3gz6mCwFPj+
         nAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izzeCf+pHsYw9M71UmqZ8fPNSMJ3FJyXF/8Z16vTQAE=;
        b=WrqPpTgaIgM31bSKk0+JCx8JM7/0ZcoX/xbHZpWopjuQ1Zsyj5aZuq74xuvm0tZN65
         mFcuOta3Y6vhcRKWvkgbxvNUNKFvc/NHIkONCCqYL8MJkee6vrKpVe0BbDvTjTEJ386p
         ugNriCsz+JGFCVo64VYIiaUj84nvlgfU/NOZHBoBuq62jsTozlG144r72DW69gJSMDhO
         deMznhEIZqRmWMS5XJ7CDTa+69P6y00aHtLYEDZ2UlpiI9O2w2bCbWS9dD2YJhYGgdVA
         NGBwuVsPjMST2T0fiaN41OPOZiuP2PljlTla8RwEgh3msK8m5IF3jLDMwWEX/aOWF6Q9
         8aZA==
X-Gm-Message-State: AO0yUKUfSODz6udvt5KzWY1/E7jOzp8z0fpo8cCRnpWgQ+ewL/BFMQI1
        W5STzYwN6JWiNec1RkEyYY0m6w==
X-Google-Smtp-Source: AK7set/K7D6vruGNSB6lAqYTFjMr0HCjs2DodJ5bc21C8LTQegS2qNCNB5etk/bceNupwptsDH9V7w==
X-Received: by 2002:a7b:c7c4:0:b0:3ea:ed4d:38f6 with SMTP id z4-20020a7bc7c4000000b003eaed4d38f6mr2400904wmk.4.1679404910863;
        Tue, 21 Mar 2023 06:21:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003eafc47eb09sm13393016wml.43.2023.03.21.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:21:50 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 21 Mar 2023 14:21:49 +0100
Subject: [PATCH v5 09/12] arm64: dts: qcom: sm8350-hdk: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v5-9-552f3b721f9e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
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

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 46 +++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 09baf6959c71..a10bf7c8764f 100644
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
@@ -674,8 +708,16 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	/* TODO: Define USB-C connector properly */
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

