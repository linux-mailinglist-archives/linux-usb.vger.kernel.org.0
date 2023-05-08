Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F0E6FB293
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 16:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234548AbjEHOXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 10:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbjEHOXb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 10:23:31 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E18F468C
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 07:23:27 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f4000ec74aso30684355e9.3
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555805; x=1686147805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ic2PzyBJMTnrdn9lavuhttp1+67QyuBjwBrtru82DN8=;
        b=KdolU75iBX+HJyXSiyTVFIPL62dkrW4l0mF9UhjnKy4sSCJAx8ejCrlLnpvIhdtbUq
         kghXrrW5a+xyEMG4+ErbK/HP/dHy7H1vpKe6y4Srgq6JrH4ijyTxx9+h7fKqrHVQkBKV
         TvaQrppv9Ro7E2377hacaz6ReTNVbzE9UEG0KzeRW+gmfzO56ML9vsvOyWvjZ+JFiG6b
         mAlei7x/Bbgzq2xS+z8hTK1vGat3Ls0ILPFA5qWMwVb7cTXOVJ1AAb4zK3wq5bjTidPo
         BaPd0BJ98NJ1TBOPF3VZCFp8BSm+JxPabRU3zu7rMiknQB5NMwDYaoqlVF0hQw9PgGvG
         jo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555806; x=1686147806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ic2PzyBJMTnrdn9lavuhttp1+67QyuBjwBrtru82DN8=;
        b=a0gx1sFM7YGriBguVcEC/nX+ffhB57UJekD4MoHGsJjViefkxcQn+Xps1E+En3QSbG
         FfNDrFj0rnl6LcEVecJ4WpH6HLZUZMHWauUwiRd2XHjRNRuQNJQ38zLCluxvYmMWospU
         GuiBRNOlUPHjsE1P7dWs26yhFm5yIEUImdWONEXUSofP7yjSHhQ1xNU7u2R5n8HtUzsx
         Q4jkn7cXoF4juHAgEov+vzxiXIJPwRXeCF/mAftK473phGA3qAuz7LdlqF0LhiwPnXDV
         OtgUaJA6h8RDzyfCFlcRsxPR2M0qpOsyge0Xpabdj+ro4ZlgJ5RAkoC1/loi9I7VG/TQ
         /hRw==
X-Gm-Message-State: AC+VfDxx18T7Nflmq44E7sQVFtSCRKd980FlwAqqNpn69iZVFHIl6OVk
        5XX5SRmAl/0a7sHj1Ww/wPHlbOrZRhIX8yTIHK3pbQ==
X-Google-Smtp-Source: ACHHUZ5IEHoh3CWXzOnc67hEa8W4VbRsJza45A7WRJPyWdfPC2KmuU8kybjfOj6Wpw1uBVIhFvF62g==
X-Received: by 2002:a7b:c318:0:b0:3f0:a08e:811b with SMTP id k24-20020a7bc318000000b003f0a08e811bmr7079089wmj.13.1683555805671;
        Mon, 08 May 2023 07:23:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:25 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 06/13] dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
Date:   Mon,  8 May 2023 15:23:01 +0100
Message-Id: <20230508142308.1656410-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
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

Add the PMIC Type-C port driver to the list of devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 36de335a33aa8..6e6f562a915be 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -158,6 +158,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^typec@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/usb/qcom,pmic-typec.yaml#
+
   "^usb-detect@[0-9a-f]+$":
     type: object
     $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
-- 
2.39.2

