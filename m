Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7372675607D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 12:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjGQKdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 06:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjGQKd3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 06:33:29 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE5F19A1
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 03:33:07 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b852785a65so26392155ad.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689589978; x=1692181978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6nS90cTjCSY7Tyo8KTgzDnh4BrkTy5UxyLb8PDeWUE=;
        b=c+09fdJb79CO8X/gmJ74r6rTnBbn0Pe5L63/elKMcPDbT0DESKOvmxcIxAPsxoBw0J
         A46rI4QatHrxVoCEz/OJCQUX8b3B54nHbRBYEF/xNUx3EWhZmoDSkkOmRAGE7Jcg39lv
         Q+AVd6RfWm9ahCcWtAVEqQSogWV+HKcoBnviU8b+4yGDVcXK7/XySHfHTYU7rtuN6Y4G
         Kx2LHT0begdXwscKvyf3ZDhWTe/mpX7RL51MWN/XAi6rZ2ZhyG0zRzORjerTPzVi1w8f
         4XpwZAldTnrds8BvA1jf+TqoJ88O7+8Pl+bkkQkW4Atii46aC/u0KQp9yxXA6pCUXYDh
         NYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689589978; x=1692181978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6nS90cTjCSY7Tyo8KTgzDnh4BrkTy5UxyLb8PDeWUE=;
        b=ZQ2zKLyj2dsURQt45eIVKMNUe485jteKLLO34BKsbK3pMenfKTFXjXWSU01+oEtK7A
         fFDUsx+VcHev0yLUcB1x4TowLbVA2fJKfq2gTHtUqadiprIPp5C6rA8RGe9BLEsRSr5E
         41Emw6VI6G4nHmO6Or0aG9aVk6mJP+jEo31sCwpgIMHdabH4+EB+tT3ftiMg8+THgMRi
         TnuEdFBcRvSvAf41o5mAlFNsvDaQjTfo3m5o7EmAUFPbMqOV3nuiYH/l4Y8aMZjJoqiC
         RlrxTfJYuaoLicBWzgcyHK6APvrDX1vNl7rvnRZnCucoJVI0nPhkU65Aeyh6c8MKo1bT
         /hKg==
X-Gm-Message-State: ABy/qLbj1zjdUjFmWmaB3knel+yi6/OY284+8TFS8WNgraWowh37qeSR
        uWLKQB/AC3ENoZAl42K9WVmwhw==
X-Google-Smtp-Source: APBJJlErZNuNmI4xKteu0wKevQatiM0x7wY/pvfwrBifAyKv1RyfDNKDm/Xj0yP3UaAu/ubjT54MZg==
X-Received: by 2002:a17:903:32c9:b0:1b5:5162:53bd with SMTP id i9-20020a17090332c900b001b5516253bdmr13332000plr.33.1689589977999;
        Mon, 17 Jul 2023 03:32:57 -0700 (PDT)
Received: from localhost.localdomain ([223.233.68.54])
        by smtp.gmail.com with ESMTPSA id ij9-20020a170902ab4900b001b9de67285dsm12633616plb.156.2023.07.17.03.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 03:32:57 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org
Subject: [PATCH v8 1/4] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
Date:   Mon, 17 Jul 2023 16:02:33 +0530
Message-Id: <20230717103236.1246771-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230717103236.1246771-1-bhupesh.sharma@linaro.org>
References: <20230717103236.1246771-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.

On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
needs to be set first to 'enable' the eud module.

So, update the dt-bindings to accommodate the third register
property (TCSR Base) required by the driver on these SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 42 +++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index f2c5ec7e6437b..71274bc978584 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,12 +18,16 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm6115-eud
       - const: qcom,eud
 
   reg:
-    items:
-      - description: EUD Base Register Region
-      - description: EUD Mode Manager Register
+    minItems: 2
+    maxItems: 3
+
+  reg-names:
+    minItems: 2
+    maxItems: 3
 
   interrupts:
     description: EUD interrupt
@@ -50,6 +54,38 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-eud
+    then:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          items:
+            - const: eud-base
+            - const: eud-mode-mgr
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6115-eud
+    then:
+      properties:
+        reg:
+          maxItems: 3
+        reg-names:
+          items:
+            - const: eud-base
+            - const: eud-mode-mgr
+            - const: tcsr-base
+
 additionalProperties: false
 
 examples:
-- 
2.38.1

