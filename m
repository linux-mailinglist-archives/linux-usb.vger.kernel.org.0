Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D522702A8A
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 12:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241054AbjEOKds (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 06:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241027AbjEOKdq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 06:33:46 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86238E6E
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 03:33:42 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so110068123a12.1
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684146821; x=1686738821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1Io9xJbU4JX39VK14nXRnzKFl0uDZxNNtw5+nQANrY=;
        b=ope3CTSsmM5+nVGa6nDQ23eDeo6m42GlWQq+HNb7BKilPdW4bR3mXUiy091oi8TPC1
         YDgjX/ggvnKelkEWVBwh4rW9K/Hi0TNylwpuoJuksl1pgoRTmrKacrdvDQWlOUDdEs1D
         ld7YGKdDoAE9qimRne5zWKkxo4V1rqx7cUus7iPdEkNUPTw+4wnCayYYIhN9ZpLkGIUg
         YrVLX89UGrv0rqMFwW8pqnXtYWjFvw2MQxxOUcbgufaHs5uWIHJbFA1+PSVD60ogtvrC
         v7+23INVZGFKvD+lSaTb/n4dqSengc8Hsh2F50J3E1r44oa11XHil+JEc8lm4XNtp1yZ
         BLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684146821; x=1686738821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1Io9xJbU4JX39VK14nXRnzKFl0uDZxNNtw5+nQANrY=;
        b=lsjxgZY12XZym03UpwgR9tmhma3omIdCtb2T5nZN+rkyX0YczIaLIaJgdE/R5Wq/EI
         v5XmNNkn0Yy+xLyVqc6oU8UlDn0sUv+WCGJKeGKJoaBrChDmU/mTKWAa0aBVgv//zhHO
         zZTyH96FIMvxResuYrPP6KTLTfOYXJATXzBzjyAG7xbI8LFsIRwWtoJBZl9sMkqmaPsE
         3hz9QTVrQbWfsfw0BkGLQzfBxOAxuIlYPLg3Yfw2GDQ2hOfV5Ls483z+/uSZffJHuJgY
         cyy2bmmzJLRUmhRiaTVqhT/EE8UVrwTTgssKyXIyYB1Uc6DTVmeZz/MY+quO5x+EEXSi
         ftEQ==
X-Gm-Message-State: AC+VfDzTuPEPfpfknZ4cEGf3zeMT/wlM4wVTvQSVn22b3MPcU+6dHskl
        3P0bkbzrZE5ykTj3r0tL/JYgKg==
X-Google-Smtp-Source: ACHHUZ79XKwcCPu/JTFUpdIw2AzsRhVp+XYMqqRIaOwDce/uXxAthld1TOf1T6g3strjFczZX+lKUw==
X-Received: by 2002:a17:906:da8c:b0:94a:653b:ba41 with SMTP id xh12-20020a170906da8c00b0094a653bba41mr16678956ejb.15.1684146821031;
        Mon, 15 May 2023 03:33:41 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id ci18-20020a170907267200b00959c6cb82basm9276788ejc.105.2023.05.15.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 03:33:40 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: usb: usb251xb: correct swap-dx-lanes type to uint32
Date:   Mon, 15 May 2023 12:33:37 +0200
Message-Id: <20230515103337.130607-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The "swap-dx-lanes" was never described as uint8 in original TXT
bindings and Linuxx driver expects uint32.  Fix the type to match Linux
driver expectation and original binding.

Fixes: fff61d4ccf3d ("dt-bindings: usb: usb251xb: Convert to YAML schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

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

