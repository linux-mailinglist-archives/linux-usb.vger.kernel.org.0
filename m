Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D5E6BFA00
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 13:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjCRMTM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 08:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjCRMTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 08:19:05 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57173C788
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:55 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id g6-20020a05600c4ec600b003ed8826253aso1487630wmq.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9jBbxddMPOzw1mqqKfwsKM1tV280U+NcSqrBp7AXSM=;
        b=QM8gySjjhDgZjhWGs5XRPGb56gHvY9mP106k8jXRIWxfobClWlZnrDkQ2nceySbziP
         z7i9A5mzpMjIOvasUMJwgdOmXjCE21V+koi/QPXDt7VqLrRhn7X5OAS/lRJ9734WLscq
         N7l+JEUMIWirax8wgS8+Xx1YCwbHxoqCncMDQKvDmjox86h+iMMAQ0L4ZWBH/boar7Vs
         ZER4MX/yLSWqr/4DkhFThOlnEpix7nkV2TAflZu108iCMs12iNgWftMDiBxkCAZMiZd4
         /TgyCUq25recQ3styT7jcVsHwrssyY4XQ0UHxld04ivXjLolX71GebfSOJV9OTxYKTAI
         pTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9jBbxddMPOzw1mqqKfwsKM1tV280U+NcSqrBp7AXSM=;
        b=Tpqrhli5hSlsvjPn1+yIEfTNRfX72T3q97CrpOUTQNFC5/J6o9784x9Bf3J3Tvv+S5
         iZkBRgPR98OmqUQxSFs14T1Qc94qxRNnCG3C9KrtJKwMMGTHGw6kUUXYx/wNKNR1HROK
         hmjYfxvOw5fJtbhOI8K0rBtYgwQHF8xauo8/Xvm/AsPGnZWl2MCJlaGOdbByYhIF1LRl
         D2zV4j7SNJ8I9rRd5T+sYGdbOrJCrxjSnF3rWwZftRQPTn0bLkiaev1FBlOU719I6/xJ
         D3JABxK8SY4DQH7vmZ49Yxt4tikOrnGhcQbNpmSqaYoGb4yVGIatQOtOfJzMMl3V/bgj
         N6vg==
X-Gm-Message-State: AO0yUKVUjP5MtjlF/Uhf5xpheMMR0yeKu0FChaI7+ml9aZ8MRSsnG9JF
        TmvbdYIMLccIMDK7B+Ageghkqg==
X-Google-Smtp-Source: AK7set8ZP4I+O3O//Cm1ixM1bdVD0Gb3KrIoiircm16kGQ5iTGMG7sANSo0TLiOgatzSMwPStTmDlw==
X-Received: by 2002:a1c:4c0d:0:b0:3df:fcbd:3159 with SMTP id z13-20020a1c4c0d000000b003dffcbd3159mr4632261wmf.3.1679141933751;
        Sat, 18 Mar 2023 05:18:53 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:53 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 18/18] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy
Date:   Sat, 18 Mar 2023 12:18:28 +0000
Message-Id: <20230318121828.739424-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Switch on USB orientation-switching for usb_1_qmp via TCPM. Detecting the
orientation switch is required to get the PHY to reset and bring-up the PHY
with the CC lines set to the appropriate lane.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 43d549d6672e9..e5eecf02653ff 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1295,6 +1295,12 @@ &usb_1_qmpphy {
 
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p92>;
+	orientation-switch;
+	port {
+		qmp_ss_mux: endpoint {
+			remote-endpoint = <&pmic_tcpm_ss_mux>;
+		};
+	};
 };
 
 &usb_2 {
@@ -1379,5 +1385,17 @@ connector {
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
 					 PDO_FIXED_DATA_SWAP)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pmic_tcpm_ss_mux: endpoint {
+					remote-endpoint = <&qmp_ss_mux>;
+				};
+			};
+		};
 	};
 };
-- 
2.39.2

