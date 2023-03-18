Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659D16BF9F1
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 13:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjCRMTC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 08:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjCRMSy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 08:18:54 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1046410B2
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:47 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g6-20020a05600c4ec600b003ed8826253aso1487578wmq.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht/SWuDYXnevXoEkhNpATVLiHltFCqt8r9SyP29xT4k=;
        b=QvjZJDcYpNTQEkV11pdQMormGyP1I9+/P6omCWW6NSyxyN5ZZxRZUGJuEO5pDXInNP
         KUKJYj6S6Tc98tWooci/slFLDZn7P0XssdDOHkqSh9BbZy1oUFEq+mpmp0ig5jMSvE0n
         3OCUiQcbz83BlJziM8xPsEEWIBT8DPYUp/nOPLxhGdu4FkIp7/Ky50QWjtf352WTBLUP
         6TyLdIiSNC4lqBFG7od8a0WrkvLzRGXJ05N3/f9ovmw/l7OWUuHVzuYJCkzgpi1m/Vod
         FiWpFUwcb5fLaFfnqLwGFPJFGwzo/yBEYnVOx/r2QiksoOqEgAP8HOUg8V85uRJycMkI
         ZA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht/SWuDYXnevXoEkhNpATVLiHltFCqt8r9SyP29xT4k=;
        b=7wvoVtWbnZwRgp3W3K/9ewgfZgxliLlyd5UEplpzzd9es4zfbmMg7wsxzkkS8FPCxr
         kjnVkSWqmnN5dTfYRZRmKT72bIZ925BkloBjokEFvbowcT5/RexhpUEp8Gn3htjwJBoG
         CbYeriJSXDwEhgxGD3XFiRaqn3c32DmcYNcpIPW/FSRek8yrTRJuXFmRrdsz7+vIBxbr
         4sQYNeYM0tpA11ygwy52K8XeqNkZ26IE/5kT2HuqqFqGfMHMDmq32xCqI00Gwj6XqBG7
         vADbALeJSVl+0MmRpWO6pBczNni/wFagPoOE1E7OL4KtHid3O4Zxv6Gm1ES+OLvtinFH
         pJeQ==
X-Gm-Message-State: AO0yUKU65+vzYA0g65/lgEI/lSAWzB9o2alpPc8lmrBJFAQDssMKMZK1
        OyafjcuwqE7iCgom+Rf+K9wp3A==
X-Google-Smtp-Source: AK7set/Z573jzBu8Hjbd29QCCYPbw3UTwZEWg5JLKIkNkDlnJmmMTyT2kjlezi3LmHGv2rWyTDzOEg==
X-Received: by 2002:a05:600c:3c8f:b0:3ea:bc08:b63e with SMTP id bg15-20020a05600c3c8f00b003eabc08b63emr29033660wmb.2.1679141926000;
        Sat, 18 Mar 2023 05:18:46 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:45 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 11/18] dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
Date:   Sat, 18 Mar 2023 12:18:21 +0000
Message-Id: <20230318121828.739424-12-bryan.odonoghue@linaro.org>
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

Add the PMIC Type-C port driver to the list of devices.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 111aec53caeb5..44e1dbd5c0f32 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -152,6 +152,10 @@ patternProperties:
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

