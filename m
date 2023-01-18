Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D738671544
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 08:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjARHpV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 02:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjARHop (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 02:44:45 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AB461D40
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 23:09:33 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id b4so28838905edf.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 23:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz/0Vx6eDg0DiBO/TaaOaa2oRiAZoQpqzz9GXBsd0QI=;
        b=BOmgKM0ZDO1zyDLyzTQDcxlUBStdroCvk+RDaDQ/lnIrEIpNzUZ8LhHH497vVWux0C
         lUInWZVL2l+49/noO6Kr/fJXPJ2QzISh2921HrIvaqfnHQUKxyvcNH7/MZy/ZTT3XLoL
         YmDQcT8cVo1wWxud4qZolFXblmCWHxw6mxM5vjbXCetXdYipM1Uvl36Qxgyqrx1AD/2X
         unfn9T8iEQ28UpQge+cj8q/+/59hV+ii7noq2IAYbnOBZICU1yxqd+K0V3E1KS7jq8Oo
         aF3tDoDuQac/ObCPPrSE1Xlpu8AIq+rhFqOH39hdNXUZdwB7w09kXQcs5vT+OtAm+m2h
         TwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tz/0Vx6eDg0DiBO/TaaOaa2oRiAZoQpqzz9GXBsd0QI=;
        b=ELxtVB7O7SxJzQrxSUvRE57S3kvBx7loSjlQuPiipny79cMpfmPSHOZTkMYzS6QFgP
         zdZ1hXDwll47455qn4X+Q1nk5+iMwNSpyB/K/RgVm08F2jiGid7ZGLIcM/VJn1R3eq8W
         T/vNNmzShQZbfMIei0KOfGj2tg3BbDpQzwEw/+6TsFJuY2PzgM8hzl2Ce/qy3Qxyh0ZJ
         angvu40MSZEXEmchf8vyS+0YM9UgxTuvWQMNQQCVs5dwqH0U2PGT8JYTqelpm+Rq4RFo
         rgSqokkWSUcF+NcAYgLlnjHryrt5v5OLG09Sxw81hiNYTU9vf6hOXKmtNubH8LfJy5Un
         IBGA==
X-Gm-Message-State: AFqh2kozw3pp/2XewgnIUObbgs594KV+S1eRj8Jf3tM4oQ/ez/xBcsG8
        JrH/IqExsa29PtTa1HbziNulow==
X-Google-Smtp-Source: AMrXdXt4Udi3FAFMC87aqlBsx9ONEbBCJsUYVUhdK45xI3OBB1BGdOLJFxK/Wg0POwC86YiL+z+ZFg==
X-Received: by 2002:aa7:d887:0:b0:499:1ed2:6461 with SMTP id u7-20020aa7d887000000b004991ed26461mr5812989edq.17.1674025771805;
        Tue, 17 Jan 2023 23:09:31 -0800 (PST)
Received: from fedora.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm13596984edb.93.2023.01.17.23.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 23:09:31 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Jan 2023 08:09:15 +0100
Subject: [PATCH v2 1/7] dt-bindings: usb: Correct and extend FOTG210 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-gemini-fotg210-usb-v2-1-100388af9810@linaro.org>
References: <20230103-gemini-fotg210-usb-v2-0-100388af9810@linaro.org>
In-Reply-To: <20230103-gemini-fotg210-usb-v2-0-100388af9810@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It turns out that this IP block exists in at least two
incarnations: FOTG200 and FOTG210. The one in the Gemini
is FOTG200, so add the variants and rectify the binding
for Gemini.

This affects things such as the placement of certain
registers.

It remains to be seen how similar this block is to the
third USB block from Faraday, FUSB220.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drop stray word "bindings" in description
---
 Documentation/devicetree/bindings/usb/faraday,fotg210.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/faraday,fotg210.yaml b/Documentation/devicetree/bindings/usb/faraday,fotg210.yaml
index 84b3b69256b1..3fe4d1564dfe 100644
--- a/Documentation/devicetree/bindings/usb/faraday,fotg210.yaml
+++ b/Documentation/devicetree/bindings/usb/faraday,fotg210.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/usb/faraday,fotg210.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Faraday Technology FOTG210 HS OTG USB 2.0 controller
+title: Faraday Technology FOTG200 series HS OTG USB 2.0 controller
 
 maintainers:
   - Linus Walleij <linus.walleij@linaro.org>
@@ -17,10 +17,11 @@ allOf:
 properties:
   compatible:
     oneOf:
+      - const: faraday,fotg200
       - const: faraday,fotg210
       - items:
           - const: cortina,gemini-usb
-          - const: faraday,fotg210
+          - const: faraday,fotg200
 
   reg:
     maxItems: 1
@@ -66,7 +67,7 @@ examples:
     #include <dt-bindings/clock/cortina,gemini-clock.h>
     #include <dt-bindings/reset/cortina,gemini-reset.h>
     usb0: usb@68000000 {
-        compatible = "cortina,gemini-usb", "faraday,fotg210";
+        compatible = "cortina,gemini-usb", "faraday,fotg200";
         reg = <0x68000000 0x1000>;
         interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
         resets = <&syscon GEMINI_RESET_USB0>;

-- 
2.39.0
