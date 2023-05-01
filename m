Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126736F30BA
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 14:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbjEAMLb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 08:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232504AbjEAML3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 08:11:29 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BB01727
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 05:11:25 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f196e8e2c6so23829045e9.1
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943084; x=1685535084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy2VqxQ0CXo4WaSyrIIsf6gNNOxqYn5NZo41bw1Nchg=;
        b=ouvSwWhnYGC18n0NRFidiAiGJ+6ghzXgtfNQ4k2MhmWSG2PLUoXabfqdCsp6ihvdCI
         FR7AUcdfks8qQldbMAT9+F6slQGwq8UrDXBOJ3p500n+7kMI8fMUPHVT8Uu1ylCTMblZ
         1NrpUf79QfghBCgBnjRTDLDtalMdxEEwUx8eKhyXGNCJCueIaOrqTgFxxe5czBkl4GWl
         0VaYJUGFkRyB/S74/44cMnU4jWXlsbaW/jrdTPdd+x1DZdt0Gymo365gkoXI0dNZOHLa
         DmriEckmBb7FSRCU5FW+yFjKaTrf3CXkxvdB3i2Ci4JsBmG3GNz9uPoozbjJQLUu6nYh
         eDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943084; x=1685535084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy2VqxQ0CXo4WaSyrIIsf6gNNOxqYn5NZo41bw1Nchg=;
        b=Vtme5WPpI/hFSZd88qRlCnRMbvZrZ7x81wZfIxE6I/RN+sGO3GPdmNcgGUJx/yJOy4
         uqFfXomMugH1CLxkD/MGzrWI2L9HbJKuPPZW/BFJfLDiW3duwzfkanefQlz/QcOtiWCe
         V5GGXq8s3YnyzkXA6tNZbZwMlD8I2FinQmSOFrlkfrYq+J0YWBYAk1m8zwIi2sGNWbPu
         PNb7J3c7k9QMZn53BVvUH+aQvhcYsE2F/IyWu86l4hTyZpwhdVY6DnPMdiHK02sXQJ5o
         ex8PszPePYElUtVg+i2/6EnaFX3f8gELXaOi/dEisfjBIya9FbTIqPvQTIhrwDGgfani
         +log==
X-Gm-Message-State: AC+VfDypu1f71SQKbVAhSRSJF1TqyqBnSyRd+3aVqIgtbTHwA3Ub6ylF
        6lMewo0URHeetFN6XyxZ+AnENg==
X-Google-Smtp-Source: ACHHUZ4h5x0Q6CL+NXPB7tNpi34fW96boFO4YW66pOc8CmnebQl8b+VL1Z6/xJAlgWaVn/HuE6upOw==
X-Received: by 2002:a05:600c:2212:b0:3f1:73c1:d1ad with SMTP id z18-20020a05600c221200b003f173c1d1admr9492510wml.35.1682943084368;
        Mon, 01 May 2023 05:11:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:23 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v6 09/13] arm64: dts: qcom: pm8150b: Add a TCPM description
Date:   Mon,  1 May 2023 13:11:07 +0100
Message-Id: <20230501121111.1058190-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
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

