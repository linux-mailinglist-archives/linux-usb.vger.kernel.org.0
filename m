Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E59D702E56
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 15:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242367AbjEONhA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 09:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242382AbjEONg5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 09:36:57 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4544D2702
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:55 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so30451895e9.1
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157815; x=1686749815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggSMkeabkRyeGybJTXAm1fOlvZBRSl1KVDzGWTu+biw=;
        b=cisBOs+OO5O1BlEtvnWguj7l6fCUM1Jtt/5D8V5mMhUdXAKQ58DDfkMZI4HdJ8E9vs
         ZZ/AapSSgLyDD86KxAtdQy1bs73xU2TFqNOPHEponbvBDWwgId1FyYuHoCQNqM/q/YMO
         onEark7MXo/V78h3vaIFTvYD2VZxc1k5ciIoL5H3zv1fTf2lRleyLFBYDCp6doqV0mLT
         E0vBAGCR9j1KKOJr16Cfx4Fy7cOdkPFQbMZKpvJOQw8/AzhAgi76y2PMjTeZtfFYhCRw
         LiHJo8vG8wHlwt/9SZPkGSw7kkxg4B+aHqbdIdDaNIm82JmmXxhy0ieN50x6Hrc8FQaH
         0hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157815; x=1686749815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggSMkeabkRyeGybJTXAm1fOlvZBRSl1KVDzGWTu+biw=;
        b=NOCgkUr7mmiWAvwbzU5TmuIW6zo/Dnm/kTelrx9WFIDtEOzZUbY/6b1OppqB5Q4lKX
         vRjwMAXAbL1fGo1mIuMOqA/gQF/fqWhxENq+ooOVeAouhywOtYgBFmPabW2Z35SwARIl
         QeM0xErMOH3n7mazWfExXTVUuxnZZ1YbJb16fEfVu6uowt9LQrlZLk5aUz3UavPE0ezJ
         qk57+aDM34BOUWZ4hcPF616xCmvUFuHS5rRByhUgwzOObp2+k7zq7WnLUKog/wjJ1rfZ
         uadNuTeBXoc3HIj2BSAeOyDucnikXj2L/YLc/+VM2GpqQ/CxpuYrW2Lsdxjtgw5qqZ3T
         rswQ==
X-Gm-Message-State: AC+VfDwryoTTheIZUGWI+xPJ45ZyShlIFlsTn3deSrzI5prcUCcxJ9V2
        aunvkfVyAy+9h9WupQ1GVDF+ag==
X-Google-Smtp-Source: ACHHUZ68t16OYRiGKeuRpFNC+3RQeFe28+T9T+TjaWQDJT1cOLzoD0CMojZyEMWtAZwgr2tUUxpHng==
X-Received: by 2002:adf:f4cf:0:b0:307:5091:5b96 with SMTP id h15-20020adff4cf000000b0030750915b96mr26254165wrp.22.1684157814737;
        Mon, 15 May 2023 06:36:54 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:54 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v8 07/11] arm64: dts: qcom: pm8150b: Add a TCPM description
Date:   Mon, 15 May 2023 14:36:39 +0100
Message-Id: <20230515133643.3621656-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Type-C port management functionality lives inside of the PMIC block on
pm8150b.

The Type-C port management logic controls orientation detection, vbus/vconn
sense and to send/receive Type-C Power Domain messages.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 66752cc063d60..136e5f96a3d53 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -59,6 +59,46 @@ pm8150b_vbus: usb-vbus-regulator@1100 {
 			reg = <0x1100>;
 		};
 
+		pm8150b_typec: typec@1500 {
+			compatible = "qcom,pm8150b-typec";
+			status = "disabled";
+			reg = <0x1500>,
+			      <0x1700>;
+			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect",
+					  "sig-tx",
+					  "sig-rx",
+					  "msg-tx",
+					  "msg-rx",
+					  "msg-tx-failed",
+					  "msg-tx-discarded",
+					  "msg-rx-discarded",
+					  "fr-swap";
+			vdd-vbus-supply = <&pm8150b_vbus>;
+		};
+
 		pm8150b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-- 
2.39.2

