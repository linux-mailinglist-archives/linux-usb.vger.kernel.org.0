Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 922706BF9FE
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 13:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjCRMTK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 08:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjCRMTB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 08:19:01 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348673BC50
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:52 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso6535281wmb.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adWouj9TAfQywdhRumc5cG6O0xCwlWjxDmV+i3e04SA=;
        b=lIeURAy+0w90okDqHG4p1/1K/X6UyW1VRGHQ34SlIH6TevX8QACxPyFRgq9pzfgWqu
         bOi07xAazuK7JfFQR4um/YT5LU1TCdrlAhruZquNQoEmnb0DmdZSoch6CMpwOczykjam
         iDf7wTO9nGvKtyqNo43Zbgaho7ykPMRmhDzRj5HoJBdhkmEdLgb8RF0TDWar61UIw583
         ctcyQ0Uzf7f1fxc+GMSOfsmLAkMc6x+U90MeRZPRlNwHYN0pVV8mPnw12TAkRxPFCpkj
         Hv4zbuOaU3aCD2NGEgJjVxxADSVOeIueatp81ogfwUbJnlJwmIiIYpIAfEZelhG8cCa0
         glFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adWouj9TAfQywdhRumc5cG6O0xCwlWjxDmV+i3e04SA=;
        b=TV4e+nx7KOVAsgrz0NbaG/KB4lFqMcOqE5V0O8rsWcNBcX+oux2Bon4SB3lHTunu4L
         YMe+gFkbBhjCU9PmAJ2NyVEr7917tA3ImOX5wpOcx3VsW6u+2VT8irwnekVLrozIRJOC
         SKgkslLpBdbUJOeIDm1+o27XBC8Ywk34RKuJW+k0zfNFpKw4bVDbuvZZx3/W6oFy6K7U
         G22Jd2xpgsxnNYCueatHDMGHbCkdyFWDUGKQGXBGL8+G+2OdNsNxbK/ZjoWdoxIevnPx
         eVt/DZaDgqVUogYN1clDId0SVAE9+164vh2qK7YWOE+2U0cSiCOtUjppVpE/AIT0Krjb
         2xaQ==
X-Gm-Message-State: AO0yUKVFl7TTVgvi/0bkoXD+uOlji6FZdkYNofyTzMb+qPbeLJpk0HNQ
        WuKS4NmAQvKZQAwVFG+SQxE8VQ==
X-Google-Smtp-Source: AK7set895Nk8b2XqmlaqePhN7M+btOb2bRg9N0LHOClkoGe9ONhdpG2UDKfwC8pB5wojmkVPf3VQyw==
X-Received: by 2002:a05:600c:4f02:b0:3eb:39c3:8844 with SMTP id l2-20020a05600c4f0200b003eb39c38844mr28511771wmq.12.1679141931565;
        Sat, 18 Mar 2023 05:18:51 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:51 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 16/18] arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
Date:   Sat, 18 Mar 2023 12:18:26 +0000
Message-Id: <20230318121828.739424-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Switch on TCPM for the RB5. Here we declare as a source only not a sink
since qrb5165 doesn't support powering exclusively from the type-c port.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 1ce88f0c31db2..965742a5be7ae 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -1339,8 +1340,32 @@ &qup_spi0_data_clk {
 	bias-disable;
 };
 
+&pm8150b_typec {
+	status = "okay";
+};
+
+&pm8150b_pdphy {
+	status = "okay";
+};
+
 &pm8150b_vbus {
 	regulator-min-microamp = <500000>;
 	regulator-max-microamp = <3000000>;
 	status = "okay";
 };
+
+&tcpm {
+	status = "okay";
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		source-pdos = <PDO_FIXED(5000, 3000,
+					 PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+	};
+};
-- 
2.39.2

