Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3956E0C9D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 13:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjDMLfU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 07:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjDMLfS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 07:35:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A959A5C9
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 04:34:49 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id j11so17542365wrd.2
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385683; x=1683977683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mot1s4oJJqHfzgUo3NAC8eaCnGWNaTZ4CyGiPVoRb5c=;
        b=OQGV2qJUxkyKlwYfFWQP44tVqXSOrof8DNjnLytDDLR2WZzztC/9p0m2SvXokBXXLz
         3Xs0WNbyQ+F7GIvJ4JCZBkztn+3bxA2jT9lCtPxTDAsL5HeX8QFE8pbay091GITYYhyk
         9deGuOqy4y4PdkXLJqmFeIM6ExY6aQ7CzW+L7IM6wzTvid7Ou2DvtOx1xF1StZaB33eh
         WlUbmW1exjvyzfO4mo2ps3lhQXw7c62KjhCZpaG1qc6SNteYj+xa6YTILdBjr/8DVhj9
         Ttx7pXuWkVnVOO9yuHdwJQOJBssSKOdCpZ8guZ/rHQbj136hjSVYmgvmuqZ7B0kMiBDJ
         QgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385683; x=1683977683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mot1s4oJJqHfzgUo3NAC8eaCnGWNaTZ4CyGiPVoRb5c=;
        b=dCeyP5RF1yFP26DMaWC2oZ8ahX3EzQ1LLffjXaePKHg29w/POSiFl5pOEnmV+IGomJ
         qg07mCjgRqxKt0bBYRqPW2mF+xuAm4HF4i391kMIc0v4UPUYGE+UgZ0eIsVepuyCDNuM
         1yOWEYgDnMwNpZrIxmRirP8Pz8gS3+QGDgQ/Tyhl05Eg/dRj4tpw56kYcjwB64DsGqix
         j6ilx1e3OOW6SIbZosTqUjgRif3GWOGhwZnJmQYIFJmWMQHPwkvKzSbwsNg69dJj+Bha
         6i6j9odzBfV+sKnorZasWkHYk/zkQD39CfDa7UuAeWA+FjCLkgoPi9kh497eXmSmG1B8
         MD0Q==
X-Gm-Message-State: AAQBX9cznaPWjAPLCIFjawYsppDb3vr5qTXNUhdFyXQ322btFftCgLPz
        2RNZk22F/c2c/Q100Io6gHOecA==
X-Google-Smtp-Source: AKy350bjygdt0XDqdCpO7FC/55v0UWQWgzxyKdxtxl37exC8eLcq6MK1mSW8qs4b0RIBpiYdGyV5AQ==
X-Received: by 2002:adf:f4d0:0:b0:2f5:fcb:c4a4 with SMTP id h16-20020adff4d0000000b002f50fcbc4a4mr1186830wrp.52.1681385683460;
        Thu, 13 Apr 2023 04:34:43 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:43 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 02/14] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark regulator-*-microamp required
Date:   Thu, 13 Apr 2023 12:34:26 +0100
Message-Id: <20230413113438.1577658-3-bryan.odonoghue@linaro.org>
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

