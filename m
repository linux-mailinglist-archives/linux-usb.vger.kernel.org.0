Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65EC7047EB
	for <lists+linux-usb@lfdr.de>; Tue, 16 May 2023 10:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjEPIel (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 May 2023 04:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjEPIej (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 May 2023 04:34:39 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348C11BF8
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 01:34:37 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so4698731a12.1
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684226075; x=1686818075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n39E15PGjDj8uN9sFo8ahqxxlizMTEU4D+MYSXNiqDg=;
        b=f/nH6UmGxZ/e5ZoaUFUgaWakDcbhxMPVGuC0d2QyOCf9OLYlGKA7PEudWkcJ6zz26f
         LKnBq+pLc1Atr3ocvcxW4+FfXN8HL7YBnBsvxSUSn74b1KwHXJDWFPr55ceFEw8b9/t+
         qJbv6T1vaBpkFVpM9KnmmtL25nR/eVNPUubf75JBR0Pr1IuhLBe6IzmFBsNcwMMwSHVP
         albXW13kvgiA/lQECpCdzN0OjeEo0cpbixQb0Vv4WEegZZfrqS+66wMCp3KLYijkVr/s
         uL0p9/DVlIqgFoRXM3ZVUWBDGjzNO/EkfhWOXCR8CaDToPoeLamHUdDzC1IOmq5uzrwv
         2N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684226075; x=1686818075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n39E15PGjDj8uN9sFo8ahqxxlizMTEU4D+MYSXNiqDg=;
        b=ZfNJDfD9A/W8jRvaNaPcXv6I2cmA+MtAK9LhxKu4+SK9UGfNvfWqfeX3wvH2a6569/
         Xo46GZyFnY3zO+eyUx84oBx+ybSxtf3tkh+hM3SrBI7598co7xAmRCi8wiCEegCK7fQJ
         m3eCgzNr6cYQde6i/fwAlnxDBYWuY/YCWrduleJZM3jLYsYqriMtSJUL5NpLZiJLXiyB
         gKuA87anEqtryUHT8aKdzYvvkJUIdWJi17+unCBCXHBWXn4HE2Te9ikMV6Z+Bv+yoDoX
         IAdY1Ylxu279oYDG8fQZm/co5bRGqwt6oTdUfuRSmchTsgLxdmuWAWuaL2tdpTbh+c9Z
         aD3A==
X-Gm-Message-State: AC+VfDyK1nQ0xlQyTbc4n7qbobeOWM+4gz5ghMrZmH+mT6V4Qpawgs+l
        akhogr6/nnWHAIWDXh4W0UEXOA==
X-Google-Smtp-Source: ACHHUZ6TPJVmbW5y1bdoofnPxhKH7Z3RkDv6advyhvUw0+uCemzCoojKKt8w/G3/EO1dp4B51wmdeg==
X-Received: by 2002:a17:907:3e15:b0:969:df2e:d7d1 with SMTP id hp21-20020a1709073e1500b00969df2ed7d1mr23183413ejc.24.1684226075629;
        Tue, 16 May 2023 01:34:35 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:4d4a:9b97:62e:1439])
        by smtp.gmail.com with ESMTPSA id s19-20020a1709067b9300b00968a2286749sm10799059ejo.77.2023.05.16.01.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 01:34:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Richard Leitner <richard.leitner@linux.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marek Vasut <marex@denx.de>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        mike.looijmans@topic.nl
Subject: [PATCH v2] dt-bindings: usb: usb251xb: correct swap-dx-lanes type to uint32
Date:   Tue, 16 May 2023 10:34:32 +0200
Message-Id: <20230516083432.18579-1-krzysztof.kozlowski@linaro.org>
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

The "swap-dx-lanes" was never described as uint8 in original TXT
bindings and Linux driver expects uint32.  Fix the type to match Linux
driver expectation.

Fixes: fff61d4ccf3d ("dt-bindings: usb: usb251xb: Convert to YAML schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Correct commit msg typo (Marek)

Cc: marex@denx.de
Cc: mike.looijmans@topic.nl
---
 Documentation/devicetree/bindings/usb/usb251xb.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
index 4d1530816817..ac5b99710332 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
@@ -231,7 +231,7 @@ properties:
       power-on sequence to a port until the port has adequate power.
 
   swap-dx-lanes:
-    $ref: /schemas/types.yaml#/definitions/uint8-array
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
       Specifies the ports which will swap the differential-pair (D+/D-),
       default is not-swapped.
-- 
2.34.1

