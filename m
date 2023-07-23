Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033B175E037
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jul 2023 09:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjGWHLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jul 2023 03:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjGWHLP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jul 2023 03:11:15 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39C91BD0
        for <linux-usb@vger.kernel.org>; Sun, 23 Jul 2023 00:11:10 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9926623e367so576799866b.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Jul 2023 00:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690096269; x=1690701069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BSnPyqSVu2gHuo4+AEA/XPUph33hXuxTtyCncXN2YGE=;
        b=CbuvaxRC2zvv3P0eIIxrewtQjuqAVLctBR2m/DK3a2/J9tofsuzchHLy2zAbS2aKV7
         5ewjm2fM6XC+ugXghFd5KdRBK+QcERtuU12p3F4cxKYl4q0Sjd/+AB6Nx3p29fSil6uM
         4YzFnlmhyPAyCsDfPlgmsD5bucxqnPBLPueRgRw2XPtUDkOnBCos6qbZWaglamY8Zzrv
         rZflz8T5CgF+bXSWzwhjBjto/+c3QaV3hg/4HP5LnLqwJakWLEYdoBDt+e8v7U95yYwa
         1+UazmkzHpIxjRWxSAzyqtOEPlwsyNiA9Z2at61Sg+KbY//dXxnizdvDE7ViiGpUbbci
         OPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690096269; x=1690701069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSnPyqSVu2gHuo4+AEA/XPUph33hXuxTtyCncXN2YGE=;
        b=ipvKeg+iinY8v20gKDWMWncJc0ikjFdD0ZVgcrvbOFuo1/Dt9oXc301yN1yvzLJOBL
         jQR2gEEssVZmmCeP73gseF8EdJqcC5lUbI826nmFawgTVUXwutDagxgvsPMZJ6siLS/z
         HR4RRx81Lpng0i/6x3QZNCJ2bh7De5Oe5jvvjaTvz2SGeXT3rALFbqAhdxfzVGLHuPtb
         1jkaHMK/I+jcvZnQpxbkK1LjgMvpM9L6HhWF8XkZNp3yKfFuzwGExsRbP2xk+I1Hsj+F
         SqCR0w4fX8ryXMBqFaWUnDUsBq+wBSIiO0+hNCwyKcOUzaU0S9tB+nVDdSOuwbDBQ02h
         lWfw==
X-Gm-Message-State: ABy/qLZgz7f9QZ5eWSm0Av5ywqV6R/Af4Nyq9MX3NWu14p82O3dPviyN
        1GHOShmj1z0fZcHt+0UbE/ITnA==
X-Google-Smtp-Source: APBJJlFdI6DsgDD9WdFYKSmdJf8XSslYUGbeWU0JC3fnxF/QaGLkeRSv/Bwh8LcGsfNdj8uVBWBNXw==
X-Received: by 2002:a17:906:648a:b0:997:eab5:f1c6 with SMTP id e10-20020a170906648a00b00997eab5f1c6mr7319944ejm.30.1690096269496;
        Sun, 23 Jul 2023 00:11:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906299100b00989828a42e8sm4639518eje.154.2023.07.23.00.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 00:11:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Jagan Sridharan <badhri@google.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Min Guo <min.guo@mediatek.com>,
        Gene Chen <gene_chen@richtek.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: add missing unevaluatedProperties on USB connector
Date:   Sun, 23 Jul 2023 09:11:05 +0200
Message-Id: <20230723071105.40157-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The usb-connector.yaml schema allows any additional properties, thus its
usage should finish with unevaluatedProperties: false.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml       | 1 +
 Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml | 1 +
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml        | 1 +
 Documentation/devicetree/bindings/usb/mediatek,musb.yaml        | 1 +
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml      | 1 +
 Documentation/devicetree/bindings/usb/richtek,rt1719.yaml       | 1 +
 6 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 276bf7554215..45e093978b82 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -25,6 +25,7 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Properties for usb c connector.
 
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
index 053264e60583..42b9d3a35c67 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -29,6 +29,7 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Properties for usb c connector.
 
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index a59d91243ac8..7eb880e4a270 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -144,6 +144,7 @@ properties:
 
   connector:
     $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Connector for dual role switch, especially for "gpio-usb-b-connector"
     type: object
diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
index a39d38db7714..924f74d45baa 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -66,6 +66,7 @@ properties:
     $ref: /schemas/connector/usb-connector.yaml#
     description: Connector for dual role switch
     type: object
+    unevaluatedProperties: false
 
 dependencies:
   usb-role-switch: [ connector ]
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 8da4d2ad1a91..980235e27a7f 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -36,6 +36,7 @@ properties:
   connector:
     type: object
     $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Properties for usb c connector.
 
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
index 4ced2f68e2a9..27978580b234 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
@@ -34,6 +34,7 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       Properties for usb c connector.
 
-- 
2.34.1

