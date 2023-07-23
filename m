Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2F875E282
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jul 2023 16:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjGWOQC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jul 2023 10:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjGWOQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jul 2023 10:16:00 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F73E41
        for <linux-usb@vger.kernel.org>; Sun, 23 Jul 2023 07:15:59 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5222c5d71b8so136182a12.2
        for <linux-usb@vger.kernel.org>; Sun, 23 Jul 2023 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690121757; x=1690726557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/DSLBdhH7X1vmy5xHTXlVJgN8n1W999F5GQeMTfdzg=;
        b=KArJUGnZtn3cujM7E/FdcVSqCgs3QHFWEqsrcwPmq81wOqDXSdNpXEAh5VC61S7F+8
         /uSQJSkDqdbVQX+I2xPjfYAXouq3w8r3oLPbnxs2pNKry8MbubYsuQqlZ1v9B5PcCxBF
         sWOK3mj+hqpT1alPLsvXbb1jEYfh7jwm5VVx4alzxeSzs0uITxA86WIDUhj0OR+pqsXY
         9mpVKpHttv5r4JHBIaSbWULqQm1UsANQHCxAeWM8K3HU2VVpQIPi6hhpF9Mjudj5BI6G
         hsImMWY1LhOsBzaTLZkk1ZJbz9Wkk38DrAOcxYlWUyqa6gdUHwwl5A3Lim5Wr89fKy6z
         yi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690121757; x=1690726557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/DSLBdhH7X1vmy5xHTXlVJgN8n1W999F5GQeMTfdzg=;
        b=RsicgnEV43rC7uA/RAmYvUSGFwXIZv/Z29lGnYWS3qBvxjaY1Rb+2XZB2FT64rC0Wz
         SU8o3+N3jGLYuFO/bwqA7TkZlNZowl+mofudi2Ukx3GSN/NMMckPt/c2YWjbAsnnepH8
         gCTMdhZoFCsjCt5NQjySxNh9AhPPqRt4T4/yLEB1G4DPnviPjZProPf2svLbkqKoRBvB
         wPPHO77HcmHif+hVrJPBAre6yJmETa64CR4QUt5k1e0yBjOe6SSm1WROr4K8Hgk/V8pV
         UthuMMQt1jWzmWDsyhzpDMsuolT5q3It2c6bHnH/qLHocdhnllWgvURHsADb6UQJauIB
         oPCA==
X-Gm-Message-State: ABy/qLb0KhCMQsfIOuDrRXgsg4fqjDEI+Xr2K3TeL0JvXXM8JrlrQJ9T
        9jM5UwytISDBY51lPNOxmXw1hA==
X-Google-Smtp-Source: APBJJlEX4LpS3ZjHEDOOmi5Cx26BxCrgURM43YDUukHpadNoKXFV9WgIjp5o/vmtrybGGVuyGVJOYw==
X-Received: by 2002:aa7:ce0f:0:b0:51d:9682:e30c with SMTP id d15-20020aa7ce0f000000b0051d9682e30cmr6814890edv.5.1690121757715;
        Sun, 23 Jul 2023 07:15:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id g6-20020aa7c586000000b0051dd1c10c13sm4810592edq.29.2023.07.23.07.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 07:15:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: usb: qcom,dwc3: correct SDM660 clocks
Date:   Sun, 23 Jul 2023 16:15:50 +0200
Message-Id: <20230723141550.90223-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230723141550.90223-1-krzysztof.kozlowski@linaro.org>
References: <20230723141550.90223-1-krzysztof.kozlowski@linaro.org>
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

SDM660 SoC has two instances of DWC3 USB controller: one supporting USB
3.0 and one supporting only up to USB 2.0.  The latter one does not use
iface clock, so allow such variant to fix dtbs_check warnings:

  sda660-inforce-ifc6560.dtb: usb@c2f8800: clocks: [[37, 48], [37, 88], [37, 89], [37, 90]] is too short
  sda660-inforce-ifc6560.dtb: usb@c2f8800: clock-names:2: 'iface' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/qcom,dwc3.yaml    | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 7cedd751161d..b84b104f2975 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -284,15 +284,23 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 6
+          minItems: 5
+          maxItems: 6
         clock-names:
-          items:
-            - const: cfg_noc
-            - const: core
-            - const: iface
-            - const: sleep
-            - const: mock_utmi
-            - const: bus
+          oneOf:
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: iface
+                - const: sleep
+                - const: mock_utmi
+                - const: bus
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+                - const: bus
 
   - if:
       properties:
-- 
2.34.1

