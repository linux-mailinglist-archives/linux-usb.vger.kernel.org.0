Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04699761092
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jul 2023 12:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbjGYKXd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 06:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjGYKXd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 06:23:33 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEEB10CC
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 03:23:30 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-991f956fb5aso791400366b.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690280609; x=1690885409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ja4+MqHfl9X0tKSYm800u8KwnOGZLdpwubmp8VoMlQQ=;
        b=O+18cz9q0RR58TDgOKYgTYov+m+0R9fEuoRTb6OKJoK/JGW+YcI61YlQXhZeL8biQ0
         hjUeozP4G0k7EXRCF17f9p+lMPNvY65hgqBjWzvS+v8yFLQ7ZIwKzB9mBh/zcVrcw58G
         ct8ilL7SjMYd8PL+cl/3sh6HAMag3kGAmuMbDkwjzG/1eeODZxzrS8ixlkEfVha6HlQ4
         HEU7vujNoVLlk0xRdEpCFowLT0lNwMj192ZwOvAPto93q5y/HjPskn4unYEVzpcFTkt0
         upP4RTpxzxX6ZlM/o+C/bn68fQmHNDvshFHy+TPTPkzVn8icoNXAJoArG4epe3jnzFF+
         jGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280609; x=1690885409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja4+MqHfl9X0tKSYm800u8KwnOGZLdpwubmp8VoMlQQ=;
        b=PiwS6medoVZOdgt7cHQetjQgFG2CAzVd/fvddceoaoOl/pRpV1M5NhRySCd/D5A/nI
         AjvJKk9EneFaASe+4lBfdKpj75NZndX6IbuROsv+s2m6zJZ8dK9Xnfv1f817orPy6cPs
         XGhvcTE8uTlCefJ9atJ93B0uogX0bnmgJIwyykAv3YQltPElgNke4+TKhCkrB4g7HoMM
         TnJpIJY34mpXhc5ns/2L0YYYUdIGDfsfgssgV6DQCiUOX85Q1ljzcgTLGtjZxRbCqqSJ
         mqHqg4tmP5KHdPWIHrPaUJ6AvkQO+HZLQVFYSIohz/LjNme4lQ3LtLWb2cMKWRFQLqnS
         Y8yQ==
X-Gm-Message-State: ABy/qLYFL4Rqk/onHBHHqKWdpZTU0hpPPOesNcgIyug7iJXAbWpTPVIW
        onfoVGQJXnAJzBb8G9OHSP1lgA==
X-Google-Smtp-Source: APBJJlEnJZpNRqox/mI/F+UVFWcjxKilSCWS+31W6pOEKBcwwQ2PZ/TVSqbTP/NQeP//kD5YeBtq2A==
X-Received: by 2002:a17:906:300d:b0:973:d06d:545f with SMTP id 13-20020a170906300d00b00973d06d545fmr11568811ejz.24.1690280609327;
        Tue, 25 Jul 2023 03:23:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id m26-20020a170906849a00b00982a352f078sm7832471ejx.124.2023.07.25.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:23:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Prashant Malani <pmalani@chromium.org>,
        Wayne Chang <waynec@nvidia.com>, devicetree@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: usb: connector: disallow additional properties
Date:   Tue, 25 Jul 2023 12:23:25 +0200
Message-Id: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB connector bindings is complete, thus no additional properties should
be allowed.  Add missing 'reg' property and change additionalProperties
to false, so the schema will check for anything not unexpected.  This
also allows to drop the 'reg' from other bindings referencing the
usb-connector.yaml and make it required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Make usb-connector.yaml additionalProperties:false (Rob)

v1:
https://lore.kernel.org/all/20230723071105.40157-1-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/chrome/google,cros-ec-typec.yaml    | 6 ++----
 .../devicetree/bindings/connector/usb-connector.yaml        | 5 ++++-
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml       | 6 ------
 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 6 ++----
 4 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 3b0548c34791..9f9816fbecbc 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -29,10 +29,8 @@ properties:
 patternProperties:
   '^connector@[0-9a-f]+$':
     $ref: /schemas/connector/usb-connector.yaml#
-    unevaluatedProperties: false
-    properties:
-      reg:
-        maxItems: 1
+    required:
+      - reg
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 1c4d3eb87763..e1b8b8b63120 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -30,6 +30,9 @@ properties:
           - const: samsung,usb-connector-11pin
           - const: usb-b-connector
 
+  reg:
+    maxItems: 1
+
   label:
     description: Symbolic name for the connector.
 
@@ -264,7 +267,7 @@ anyOf:
         - typec-power-opmode
         - new-source-frs-typec-current
 
-additionalProperties: true
+additionalProperties: false
 
 examples:
   # Micro-USB connector with HS lines routed via controller (MUIC).
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 6440dc801387..bceb479f74c5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -38,15 +38,9 @@ properties:
 patternProperties:
   '^connector@\d$':
     $ref: /schemas/connector/usb-connector.yaml#
-
-    properties:
-      reg: true
-
     required:
       - reg
 
-    unevaluatedProperties: false
-
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index 75eec4a9a020..89fc9a434d05 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -43,10 +43,8 @@ properties:
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
-    unevaluatedProperties: false
-    properties:
-      reg:
-        maxItems: 1
+    required:
+      - reg
 
 required:
   - compatible
-- 
2.34.1

