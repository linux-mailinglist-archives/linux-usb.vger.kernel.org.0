Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B356F7D19
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 08:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjEEGlH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 02:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjEEGlF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 02:41:05 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91665160A6
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 23:40:56 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aaf21bb427so9959635ad.1
        for <linux-usb@vger.kernel.org>; Thu, 04 May 2023 23:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683268856; x=1685860856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpKnP1YDIVbRZiADGr23D8oPufyg/cq5r9T3i6z6bvI=;
        b=WDGKOcE/FqB/GE1K1S4uwtGh0vKOxbxdgPVXny6oxcV6ELPkwE0oO6wteOa7dVpuGF
         4IZcPC5nAhF0NwCIuS5r8t660wUQiFv7/JbH/q05Nj2/mH7hrP2N2rIhCFDxMuQ6veao
         KlugUTS4vzzLdHyHSCxwORtKZq7PAcznLjS1Zv/DvBrU1xRJkmnuD2R4x4vx5sG7TxFr
         awrWCIZK9QBEg78rcfnGvTcHb92YzObLp2+bAf5lXL2Cwt8Y7/BlvWTzp42z/O0z2Gcf
         QyS1Y5FilonYnTVz53rxVxcuyYPtBe/KXXybt332TQUpNnga2nEZrIwY8CbEpLI+l85l
         AlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683268856; x=1685860856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpKnP1YDIVbRZiADGr23D8oPufyg/cq5r9T3i6z6bvI=;
        b=GRrU2XrDZ0NA8jhOoJWH3CT8s+xwNK0yC43Iimz5nljYFecTXN4E77AlKedN+BKAVh
         dJEYW7qWRKV1tgo6a83FY1+Y6Ji6KqNldE6x/zj3dXhxes2Cs2tzv7iHX3VnB9wW6+kr
         eYCOHzwQ0auELtxneGhJzo34IXqOfHTBlQZh7k8+xXpvzkRsRKN/BGllCQKnDRb1oiXn
         9s5SPKODMdaY2y1Bwjl6vpYxkHsu+v4MJ4kvcht0cI0nLke7cik7uHPD4TLb0pnPeJ9p
         kwhJAJ7+IFkyNMRgG2a+BSbI75DPE07R+F6zmcl8AIYqjH2Wplkw/vnNpAnGY2bJdfqF
         +jTQ==
X-Gm-Message-State: AC+VfDzWJLEFgzm9Iny49I3JV8rqW0DqJgvYDCMUOcdP52l10ELOQw45
        8vwCr20OuQJ9hKSS2ZkF6HprAg==
X-Google-Smtp-Source: ACHHUZ6MMo/HLA1Gv2YAbG3oUKKVDbJY3AY4Pc1AnYFRJAXjH15QHfQWx74AKStc9XKhLJc+KdzF9Q==
X-Received: by 2002:a17:903:2405:b0:1a6:4b60:3195 with SMTP id e5-20020a170903240500b001a64b603195mr437377plo.66.1683268856042;
        Thu, 04 May 2023 23:40:56 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902848400b001ab0b2dad2fsm816251plo.211.2023.05.04.23.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 23:40:55 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH v4 2/5] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
Date:   Fri,  5 May 2023 12:10:36 +0530
Message-Id: <20230505064039.1630025-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
References: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

Also for these SoCs, introduce a new bool property
'qcom,secure-mode-enable', which indicates that the mode manager
needs to be accessed only via the secure world.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index f2c5ec7e6437..3b92cdf4e306 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,17 +18,33 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm6115-eud
       - const: qcom,eud
 
   reg:
+    minItems: 2
     items:
       - description: EUD Base Register Region
       - description: EUD Mode Manager Register
+      - description: TCSR Base Register Region
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: eud-base
+      - const: eud-mode-mgr
+      - const: tcsr-base
 
   interrupts:
     description: EUD interrupt
     maxItems: 1
 
+  qcom,secure-mode-enable:
+    type: boolean
+    description:
+      Indicates that the mode manager needs to be accessed only via the secure
+      world (through 'scm' calls).
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
-- 
2.38.1

