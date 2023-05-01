Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69A16F30AB
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 14:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjEAMLY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 08:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbjEAMLU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 08:11:20 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E28138
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 05:11:19 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f315735514so128911345e9.1
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943077; x=1685535077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lSyNZ2HtWZEUWBo+n5QAmOJQC6AAMQbbNN6fuawseI=;
        b=Tlwmq14PmtSt/fi73yxsXirMZfGjtTpb0rwCBmtx48o75eV4xa62T3pLi6MoVj5pdx
         jSg+vcxHzrLUITmH1Hhc5L7bucqfXj+JeL2LFVwpnoYYu79MtGOe1detvixONSN5DZuB
         xeIiYwCvroeWOl90wJsnmapKeXvvncbBHF8RMI+XxMnhMhUAAsE53lky6IVOeSB9eU+x
         2o5+xm9gP9c5BR9EIcMCMbjdwRNZHIk1GSWyKj/B53EH7dVTXcHYI4KZkdqMzz7Ej9sI
         AtHjY9n6N3uwalbmXpaJ/QiIUsww4++aEGKA7RCzauX0hjeFX6typW5xjlj53kpXOVVH
         xXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943077; x=1685535077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lSyNZ2HtWZEUWBo+n5QAmOJQC6AAMQbbNN6fuawseI=;
        b=GP28LDdZtzuDMgXFUlIlp4iUPXnaeglFXgBJoQBrFGzYhU0xWrJJZmLhuhDIE0X00w
         QwH9lf8GcGvB759NTt1RecOiPmUcapoRwSa5sidM89pgp8kUaPfD08hydx2+xtHyk0k7
         E2MVEmgB6CJ4N+78HUtrUOH2Ff4YZOJxbHuKPWjMRY8IWPBKRlo9V83mG6BSNn2pp8ZV
         Lf5WJuvO5+KFPnXhYEiIOWLSQRd8NoWIvc+QmpvkWWdV9Ip79TinF09QeU8lYxbDAbNe
         xYHXykGuYgzpmfzlK6Oopv0SMNZB8wJi6XJ4Z0Oiy5CPIC80TTC3nj6yCsMyfc8cvwO+
         fUhQ==
X-Gm-Message-State: AC+VfDwMlWuXzapJBT59Itw341bkMez9efwrPyA2Zs9GnOrZwVM/XplL
        C7dQt1n6DX4O1HvkgxE/+N1E6g==
X-Google-Smtp-Source: ACHHUZ4Yy5Qoa+ZqUjN20+x8UJuF5y3PoKO5MisE7R4CvA9faJbt6neUhrQTxYXFGHV1VGYaOgS3zQ==
X-Received: by 2002:a1c:f717:0:b0:3f1:71d3:8ddf with SMTP id v23-20020a1cf717000000b003f171d38ddfmr8603590wmh.14.1682943077519;
        Mon, 01 May 2023 05:11:17 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:17 -0700 (PDT)
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
Subject: [PATCH v6 03/13] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch as optional
Date:   Mon,  1 May 2023 13:11:01 +0100
Message-Id: <20230501121111.1058190-4-bryan.odonoghue@linaro.org>
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

orientation-switch it the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation change
messages.

Add as an optional since not all versions of the dp-phy currently support
the orientation-switch.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index 0ef2c9b9d4669..d307343388888 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -61,6 +61,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
   resets:
     items:
       - description: reset of phy block.
@@ -251,6 +255,8 @@ examples:
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
+        orientation-switch;
+
         usb3-phy@200 {
             reg = <0x200 0x128>,
                   <0x400 0x200>,
-- 
2.39.2

