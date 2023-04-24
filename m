Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864AF6E0CAE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 13:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbjDMLfc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 07:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbjDMLf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 07:35:29 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CBF9768
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 04:35:10 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso14560376wmq.2
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385691; x=1683977691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy2VqxQ0CXo4WaSyrIIsf6gNNOxqYn5NZo41bw1Nchg=;
        b=zQ98AVXUEtIowT99NVHkPPG6uKRb/w8E6VWz6yL2IpgnfxXUIV+tChdVc4fgGn5j2s
         ZX8DbQNgDdFXZY50kJWWsCOqV3FAEivjo3z/zC23Dky3/XwH88Wi1xWj6xt7rgPHH3MX
         SxuXQyoBRV/xd1b9sJPenri7KSoGCbSWlXlQgDufNVkqvA1hTCdAtnBOqOI4kGZSAU8o
         jKhO3JUWQKpWqWvb+Mwpcr/iWlOJ4S9iaSbI3Jj4hgKtx4JwPILwoAHhkGmmK0yN2Ux8
         0Ouc0bj+5OBPrmg9XPntvppl2IYO1+WMqTbkdKhD1+5Fgt0Rse/sTEnitaiUZuB2cyRW
         0EXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385691; x=1683977691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy2VqxQ0CXo4WaSyrIIsf6gNNOxqYn5NZo41bw1Nchg=;
        b=L/HfGi9bcY2MtVRPD5aL3Bh6QICnGWhd8ToGT8K6nId90eS2eZKxpxXQLOMlZaGQZ8
         ZiFFwIrnhYIMvOShJIE6SqkoQZzsuSGy4XY1Liy/4GTyRrDr/YczMNBwN29hUpx5qL4Q
         zpFpgLzq5GpKMM+U2UT9j5VdRbZ0ccdYr0GDsFWjyUZfhEE9qRDhoOEWqUy8qYeF3RbL
         jR92RB3yZJH0nX2HwioMFb8a8CC2GNB0qpVjuwP0yZ04G55GMTLDEz3J69I7Fh0fEuqm
         WUxzPmZK08q0Rf1rVBEaFmcRPJKRhIu1rBXi1TfqM/KcK3K/Sjysa+ihjgq8s7XcBHgO
         03yA==
X-Gm-Message-State: AAQBX9f1cnXiXo5zZPpPxAEpy3O8zmBxiaOOVznHNjen91/Z3qhmDwb0
        9tcg99xCN5nXPl+aIWkDctEgNQ==
X-Google-Smtp-Source: AKy350ao6OJRAd609JBY0bJ25LTtpnEzyGMuR3qmhr0EQJB4z8aj/wQthlX263t0l7jJwK9pMktiDg==
X-Received: by 2002:a05:600c:b49:b0:3ef:294c:de50 with SMTP id k9-20020a05600c0b4900b003ef294cde50mr1199760wmr.29.1681385691467;
        Thu, 13 Apr 2023 04:34:51 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:50 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 08/14] arm64: dts: qcom: pm8150b: Add a TCPM description
Date:   Thu, 13 Apr 2023 12:34:32 +0100
Message-Id: <20230413113438.1577658-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
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

Type-C port management functionality lives inside of the PMIC block on
pm8150b.

The Type-C port management logic controls orientation detection, vbus/vconn
sense and to send/receive Type-C Power Domain messages.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 66752cc063d60..ffec8cfbd82a2 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -59,6 +59,46 @@ pm8150b_vbus: usb-vbus-regulator@1100 {
 			reg = <0x1100>;
 		};
 
+		pm8150b_typec: typec@1500 {
+			compatible = "qcom,pm8150b-typec";
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
+			vdd-pdphy-supply = <&vreg_l2a_3p1>;
+			vdd-vbus-supply = <&pm8150b_vbus>;
+		};
+
 		pm8150b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-- 
2.39.2

