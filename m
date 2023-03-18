Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8B16BF9EE
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 13:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjCRMTB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 08:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjCRMSx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 08:18:53 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B379D32E55
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:46 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso4840418wmo.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLd7HI2bUYorqCDaYSST2B2/Phylx7+zRqYsOZS+7qo=;
        b=nsNTikRLmNDmw/VvknWrCjttwANEloSgdqcOcAl4VsNrz21ekchdK2nQYZZ3OekKBI
         RjfjWo4F1dLK+i34tRBWRbc/AuzvAlULUROLOmUy/s8+iza4nkxgUGC28FMNpU5x34aB
         fJ5px8sdw2hhKgtJU+sIgxE/U2YhpCQ1z8xcsE9Mu8r8kVTwgJpTIJnGC6Tm+pngzosD
         nCxSePxx8S68y1Fvyts9qqE4Nh4ulvY6Fr3pzozqlZo4+CrKQDGPWUNuD2tLR68r6bRj
         EzE2WHOCN1/U4xTfv2HcpWBsQxqZ5G+zWRja7Vms8Sfpxo1xGOlmbS6OrMejMcRTdRZB
         PTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLd7HI2bUYorqCDaYSST2B2/Phylx7+zRqYsOZS+7qo=;
        b=Bzd9yHNClP437+jHSIRy+Xi4XZLE5O9u5xBNY4Ao1LYEUxjT9gu5gvJSz1jcc5kSKp
         iRit90e4lM3m8037zhSSoZX9yeCXP0GGlynTmP9CMY1HaWS3CDjReVDsd3wEMkLV7h6f
         oZ+ng5UWtrSyYj+MjOUYCJ0SUS/r8GkTI6gwWFN+PCMo2/2yxQGgGRBmO4hP1Fe59LQ1
         Q16IC67IpfxDW5UOM/kYT7sORtlrrR5QuFHY8F8G5JuC1mcj8ocwgPgSg28v7bYyWom7
         L4YLpmjQyKIWzrto2oLHaeQPyR/gdmOBtlqMlnbQcrXWypIGxFzPVatCdAcoejGBpd0g
         YxTg==
X-Gm-Message-State: AO0yUKXxQluAdcZSS2lED1s5ixdgM6cA6Gxa90UtYsHaDG1mJQyIayih
        YSETy0/bzfFqtnZdmUs42UTKOg==
X-Google-Smtp-Source: AK7set+3dKGjp0ekVrV6jLvGmCMjFH9/qHg/fX8HGtcPua3GPB2vAVZdH9/sOzgRxXzeAGA284b+Lw==
X-Received: by 2002:a05:600c:3790:b0:3e2:1dac:b071 with SMTP id o16-20020a05600c379000b003e21dacb071mr4928122wmr.13.1679141924982;
        Sat, 18 Mar 2023 05:18:44 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 10/18] dt-bindings: mfd: qcom,spmi-pmic: Add pdphy to SPMI device types
Date:   Sat, 18 Mar 2023 12:18:20 +0000
Message-Id: <20230318121828.739424-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
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

The PDPHY sits inside of the PMIC SPMI block providing register-level
ability to read/write USB Type-C Power Delivery protocol packets over the
SBU pins.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 8f076bb622b15..111aec53caeb5 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -140,6 +140,10 @@ patternProperties:
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
 
+  "pdphy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/usb/qcom,pmic-pdphy.yaml#
+
   "^rtc@[0-9a-f]+$":
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
-- 
2.39.2

