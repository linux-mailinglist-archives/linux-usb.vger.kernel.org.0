Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9558A617C13
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 12:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbiKCL7h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 07:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbiKCL7a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 07:59:30 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C49B12A8D;
        Thu,  3 Nov 2022 04:59:29 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id f5so4558930ejc.5;
        Thu, 03 Nov 2022 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vv3d+RU36KsT2gC4q9HXyCBaMJEHEArWbibkXUxmfek=;
        b=eO3DTUQoa1XIeSZIXmM6/4/sWQ+BQDk+7UQ7TmxIxWgOpK/07e/ORpt2EJ0F6jtkRb
         81Anp/oiLyIlU8BMc3gO7eNJ3OtkHPkM9Yzw+6Z0Q5CEjzzT6u/I2ATJOB9IpBQcEbE8
         H4hVgfjpD/06dlgW/JTTf2kkN70FL+3PJk5utJlHwq1bAdsEbkF4BalcXxd4Jc18rbEu
         BHP9j9R/i8PDNWDrDMu31w5lIMFRWhAetX1pM1Hb+oNi9cLQlfDZ2VVFCuaHuyOjUISi
         reiuNmZ8JneH2JoXpLxAajMYqT+NnrezfWTOBv2Dh1s8/+jYKNkKxhBLbJDHRye5hXIZ
         PUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vv3d+RU36KsT2gC4q9HXyCBaMJEHEArWbibkXUxmfek=;
        b=xU91C4NK3AG0EnlxscmPBTSmjQivK07D9mBfu1HrOf4ZWaf4fn/MFBFC6kZ8jtdD7X
         JyIWyrckF/s0ZAIuyfrt3x8WjiSuHsVn9Lrn6D1fhwVwXKD/unhGvU+wcfopsfs9XFmF
         iiIlu7zoFKWYqZp8kx+BNTwFWjIQ5Sj49xCAuFDImmHXVEYKuIxAntD/x2kn6v2f+5S6
         2Ovv1pJRjEyNzg6WPGkLLltgVn0foCyioAr56gssArZ7bAaANCmnjDAUY0hR11BY8JM1
         w+pQKoThVQ28b+lojCaqU+qkqW0FQgCU7IUCvUtoQOLhO8kYjvvH5KL3S7asK3QCev/r
         eQNg==
X-Gm-Message-State: ACrzQf2oR0d1JlKuT9cDvkL5m4lYLH03kfthClERDjN57ByWg6ZnINsZ
        6SbfQdv7ZhQaTC5int7t07w=
X-Google-Smtp-Source: AMsMyM4dvGjcQX70jdSLU+t0NoiOWU5ctm1PtVsZN6fq5wnfaZJu06W7O+BNTdVCXCbqC9RyqpRkQg==
X-Received: by 2002:a17:906:ee88:b0:78d:1a9a:b2db with SMTP id wt8-20020a170906ee8800b0078d1a9ab2dbmr28949481ejb.225.1667476767814;
        Thu, 03 Nov 2022 04:59:27 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kw16-20020a170907771000b007822196378asm401035ejc.176.2022.11.03.04.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 04:59:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: usb-drd: Describe default dual-role mode
Date:   Thu,  3 Nov 2022 12:59:23 +0100
Message-Id: <20221103115923.1467525-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The dual-role mode default, in the absence of the dr_mode property, is
already documented to be OTG. Use the "default" property to mark it as
such more explicitly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/usb/usb-drd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-drd.yaml b/Documentation/devicetree/bindings/usb/usb-drd.yaml
index 1567549b05ce..114fb5dc0498 100644
--- a/Documentation/devicetree/bindings/usb/usb-drd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-drd.yaml
@@ -27,6 +27,7 @@ properties:
       should default to OTG.
     $ref: /schemas/types.yaml#/definitions/string
     enum: [host, peripheral, otg]
+    default: otg
 
   hnp-disable:
     description:
-- 
2.38.1

