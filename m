Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD9B6F30A8
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 14:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbjEAMLW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 08:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbjEAMLT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 08:11:19 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF94E58
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 05:11:17 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso23903355e9.2
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943076; x=1685535076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mot1s4oJJqHfzgUo3NAC8eaCnGWNaTZ4CyGiPVoRb5c=;
        b=uqOyDSC22sOs0nt4i7bdoAxv0GYcWx0ewomIfLjfn51gULBPrPS+CUF8coiWT8OLRN
         tSEz+9b1t+X+qf8nScNMkgNef6Jwv1ogyWKKBMxZf2gNpSgoj45EA5KqMZe6YKgZQjdX
         olBF09A5BSruO7Y6N6KUcix7jjqkDau7zKBxk3s1zxLP9nVgP2FnKefdlLoJP6bKU+Pw
         PfVc6PMla2Y+W/TM4ml5Q3ORT1FnvdST9dnl2/N1tGlUYx2glqaWbO1iepLhpCjzvlfz
         zDXluTc6QdtCFKdFeFXLBsgKGMpOcBJIU89UtwQ45XNvQgy2z/aUvO/jyGo2Ehw8pMkP
         jkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943076; x=1685535076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mot1s4oJJqHfzgUo3NAC8eaCnGWNaTZ4CyGiPVoRb5c=;
        b=QocHQVVDayVgk4bH73ySI3DnfeE1L19d7vPMbXGRA8KR2Uj69P+kSEnoGgvkn9OcEO
         J7yDRP+aSjM6oStGZ9GMtXa9vMlLOqE20zEbJ0gaf6GKQ8lvdPE+uav9vZ/uECg2PSMO
         KycFEG8Dk+J2S+NcX/SltVG4O4mR477W2XL4Q0r/0EWheWZFbRuJxngIjc7dJZjbT9Jl
         FgHQCmigX2WrBs3t35Y12LP377BM3JPXgVADeikgFvnTYKXn3X3N1qYQPo0uvf9YQcNP
         AHSPbSIMzmEzQqD8gFPgZSq0vE6Mxt3no4Bm9vSGXZLa1c3RrFIyYu10ENbOJCdli7Cc
         h6Nw==
X-Gm-Message-State: AC+VfDw+aJFub+O7WIEUFW6fyAdpCpUe+f1QPCGDv6FcjwNhC7CWIHXN
        NAgQhvbQGLGJpOZgMEbzZH+ggg==
X-Google-Smtp-Source: ACHHUZ4xCpe9cElu8P3DGKibwgCjoYK0mIIy0HLAyq2w2hF9q2lo19kYkSKnph2M/a6OQjNfhC1b8A==
X-Received: by 2002:a05:600c:299:b0:3f2:50ab:1bba with SMTP id 25-20020a05600c029900b003f250ab1bbamr9981355wmk.19.1682943076016;
        Mon, 01 May 2023 05:11:16 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:15 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 02/13] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark regulator-*-microamp required
Date:   Mon,  1 May 2023 13:11:00 +0100
Message-Id: <20230501121111.1058190-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
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

The VBUS driver needs to know the regulator-min-microamp and
regulator-max-microamp so they should both be marked as required.

regulator.yaml defines those two dependencies so include regulator.yaml.

We need to change from additionalProperties: false to
unevaluatedProperties: false.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/regulator/qcom,usb-vbus-regulator.yaml      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 7a3b59f836092..89c564dfa5db5 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -14,6 +14,9 @@ description: |
   regulator will be enabled in situations where the device is required to
   provide power to the connected peripheral.
 
+allOf:
+  - $ref: regulator.yaml#
+
 properties:
   compatible:
     enum:
@@ -26,8 +29,10 @@ properties:
 required:
   - compatible
   - reg
+  - regulator-min-microamp
+  - regulator-max-microamp
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -37,6 +42,8 @@ examples:
         pm8150b_vbus: usb-vbus-regulator@1100 {
             compatible = "qcom,pm8150b-vbus-reg";
             reg = <0x1100>;
+            regulator-min-microamp = <500000>;
+            regulator-max-microamp = <3000000>;
         };
      };
 ...
-- 
2.39.2

