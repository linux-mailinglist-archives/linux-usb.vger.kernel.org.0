Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E588375DE74
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jul 2023 22:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjGVUQ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Jul 2023 16:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjGVUQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Jul 2023 16:16:28 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5D91FE1
        for <linux-usb@vger.kernel.org>; Sat, 22 Jul 2023 13:16:25 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99313a34b2dso443356166b.1
        for <linux-usb@vger.kernel.org>; Sat, 22 Jul 2023 13:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690056984; x=1690661784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=22S5ZsP6aUTYCVscJMLeCJZnNpGh+kjGFevs0ee9dAQ=;
        b=GdcIopZT1Ubb31DIRUvWziH+QEzLqJ4k7y+f0FizH8694GYdyRgSIJwOEKvs4LRpfE
         YfTqsXZ85xiH6OhczhfMyk5KsspNBGeVrYu8T7kZKgk4vO3TZRqqus8it86ge9kP9/ls
         +xxT2tji7cwqDFc/GGXUTN1TCU6Zgj3KMTAhxp6vLSwN43cbbCXUWrN8/dC9jfgKxfut
         ZPouIIvSVy34tHK6RI7gE9a3ZR5AamMT8unk5oDe9jgcMpYA6hBe2mm+yJhQ2vmDi+g0
         HWyfoglWlXjRZHC4BCeFtShHyoJNuFgSNvIVD0YIRiPYC9yVOLDoDBr0tPt0WsJ56weo
         VPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690056984; x=1690661784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22S5ZsP6aUTYCVscJMLeCJZnNpGh+kjGFevs0ee9dAQ=;
        b=CnDpcA647Tnj20hiOmbx1+jlFcKCQ88LuC/tE49NWfP8r0+eRy987PYwBpyKrD91Fz
         6imyRjF7UXOAJbHkPSefp4M8S42Krvk1+rytqTaxw9ivPs08omomuYhZhfdVfBHq5k85
         LmcZU4DXvOUyUT28NnIwQWLjuCU0F5fwkNmWCj/ewnEHmZ8Z0m+qTkkqiiE2bnVg7UJN
         RNXlb8OXo7AAP1Rr7YCX9UVXxUaNwgorgDp2NrzXcPqOKR1zCV4dTtW1MLmj9w+Ts6eM
         dqESHTdKKwpuy9Yhf4vh1sjU8aX4pCpzu59erwKdPHPBkZiz/goBpLMQ4evJWbxK9WT2
         JDeA==
X-Gm-Message-State: ABy/qLaOD0xzEk7jgcthOc/mPxKvAeSS+nIPIemvLG1mpg0ZD0kLtOqi
        glA7DwcJYbMJXlky8DbrnMUvNg==
X-Google-Smtp-Source: APBJJlHjpnxaktmWMV8dpQg70mraF0bMrm6rPEWeHLNPmD8JLn1qYm8w2zLqN9IGXe2PwpZRYF+9og==
X-Received: by 2002:a17:906:10cd:b0:982:cfe2:32fe with SMTP id v13-20020a17090610cd00b00982cfe232femr4903374ejv.63.1690056983603;
        Sat, 22 Jul 2023 13:16:23 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p26-20020a170906a01a00b00992f81122e1sm3951920ejy.21.2023.07.22.13.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 13:16:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: samsung-hsotg: remove bindings already part of dwc2
Date:   Sat, 22 Jul 2023 22:16:20 +0200
Message-Id: <20230722201620.35489-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

samsung,s3c6400-hsotg compatible is already fully covered in dwc2.yaml
bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/samsung-hsotg.txt | 38 -------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/samsung-hsotg.txt

diff --git a/Documentation/devicetree/bindings/usb/samsung-hsotg.txt b/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
deleted file mode 100644
index 0388634598ce..000000000000
--- a/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Samsung High Speed USB OTG controller
------------------------------
-
-The Samsung HSOTG IP can be found on Samsung SoCs, from S3C6400 onwards.
-It gives functionality of OTG-compliant USB 2.0 host and device with
-support for USB 2.0 high-speed (480Mbps) and full-speed (12 Mbps)
-operation.
-
-Currently only device mode is supported.
-
-Binding details
------
-
-Required properties:
-- compatible: "samsung,s3c6400-hsotg" should be used for all currently
-    supported SoC,
-- interrupts: specifier of interrupt signal of interrupt controller,
-    according to bindings of interrupt controller,
-- clocks: contains an array of clock specifiers:
-    - first entry: OTG clock
-- clock-names: contains array of clock names:
-    - first entry: must be "otg"
-- vusb_d-supply: phandle to voltage regulator of digital section,
-- vusb_a-supply: phandle to voltage regulator of analog section.
-
-Example
------
-
-	hsotg@12480000 {
-		compatible = "samsung,s3c6400-hsotg";
-		reg = <0x12480000 0x20000>;
-		interrupts = <0 71 0>;
-		clocks = <&clock 305>;
-		clock-names = "otg";
-		vusb_d-supply = <&vusb_reg>;
-		vusb_a-supply = <&vusbdac_reg>;
-	};
-
-- 
2.34.1

