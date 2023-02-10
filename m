Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2021692187
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 16:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbjBJPDM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 10:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbjBJPCd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 10:02:33 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07A423128
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:02:22 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so6475226wmb.4
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MopZfnAxrE892dJNZP2x7WlR8+pYZsNY1ZzIVrftexE=;
        b=lnxz75GIKgCx7zgq06BQsb5OpPmyQemaLle84Nua1IKMFsUHVOdwHYkbQtk2mk4n58
         HKHuTiqzrehNceMImwT43f9EaZRDmvlBANOt7/Kih7gD3CMRfPV9XNMjB8dtx2DxeY+p
         3rxtW3qTUobnalc/dE+GelTveMCupsWEEf6Iz24rSsdrcPG/XMTb3lirLKqgUdGMMzqa
         hT6Lg8ZMUZQWDHU7h1hmMaotk1uHdx7daKj3RMkVyeNFHuuRBQeATSNlOTKq+N99hCnu
         W0qin22RtcYGS+am1I98GPUGGCee4RRsnMqxfhdTZlP13CyYup6KZ1GSyl87n0hARJQi
         FoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MopZfnAxrE892dJNZP2x7WlR8+pYZsNY1ZzIVrftexE=;
        b=OQiBWbtvZETvdG2UcLZhntWSLUIVt6U5W2u4LEFqt2l0QyTOhs1ITZnMEqpU7P5U8J
         T9q7+tVodpcAY57fCWrEK0i0apJQQ6OAkaAenGFiG5wox0xuH9T8lk9UR0BFxA/Nap98
         ozu71tvSdzn54sIZOmMhHqAfc4PBHV+49iR5TThVdHQFPACUlpNa6hQaluo4ovNpHo7T
         O8KGDgudD4Ra1tmSxxJ9kUG7YxatlAMvl1qhEyFR1snE3ap5NE5gEUNMy0EfLRrEI/3b
         eTX6Om3czfumoQj+e37T4yZDkpiFzp0UjfuoYRVM/xj3DYQL+SGGmsUpyDd0tssM7tqf
         op3g==
X-Gm-Message-State: AO0yUKX/PrRPVDojXz7YB7XgE1zVe4kUE8sK1UH9epG6TMLIewKwFZ+e
        8bm+d4XXniUokKWxLy2awIRrJw==
X-Google-Smtp-Source: AK7set+vaHqwD0vN16prrNrLh/XjEGKnP6YpxSYoXsUu/IVHCaTtKCnE7I9gQL66ZC50DnEQEXK61A==
X-Received: by 2002:a05:600c:998:b0:3e0:95:ea3e with SMTP id w24-20020a05600c099800b003e00095ea3emr13303983wmp.22.1676041340760;
        Fri, 10 Feb 2023 07:02:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003db1d9553e7sm8282482wmc.32.2023.02.10.07.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:02:20 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 16:02:13 +0100
Subject: [PATCH v2 10/11] arm64: dts: qcom: sm8550-mtp: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v2-10-71fea256474f@linaro.org>
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

