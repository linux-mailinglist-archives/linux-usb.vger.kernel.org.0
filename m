Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B065F52F6
	for <lists+linux-usb@lfdr.de>; Wed,  5 Oct 2022 12:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiJEK4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Oct 2022 06:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiJEK4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Oct 2022 06:56:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7DC69F46
        for <linux-usb@vger.kernel.org>; Wed,  5 Oct 2022 03:55:59 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g1so24978646lfu.12
        for <linux-usb@vger.kernel.org>; Wed, 05 Oct 2022 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=QoDfMwxNE5RO6K45C6RWkiC9D68UwvM8sQfQYMLiAaY=;
        b=fptdpyVHDqOxRI1n0lQOxKecoi3FTfmCVkG4foHIhI1Z4XAOyTlznEJFYreQTrQkZm
         +665ZwY0pe0XVfgMG9L1ME8m40B+9MVadvVweswpzvIIQihSHc+o4el2lA/5RpywvLAV
         FLqN5ya9GDY8McG6y46xKzkIavW5REjVOgyJr9ULj57ij5ymVQeIcYptEN58SPqU81U6
         LFDG4Zha6QPxEvKx1H3l8MEiSZqULj4c5dQveebr+6+kmhZLTrpb6O7KRvVSvn2AQj3B
         8yA9CEGISyAPbC+CrGVss1XVkAyzcW7PX2PQUkMTW4ezcU+lsnskqbpaDCWfG2FcMEbI
         JczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=QoDfMwxNE5RO6K45C6RWkiC9D68UwvM8sQfQYMLiAaY=;
        b=jcrnQlB1nFHYV4j1Q3eusufNP5Erca3b7Ps18kXBRU4eNBVXs+U7yjTEF8oj73bbpU
         REVGmOtGfPAUMInVaTObDjiHuPNFjZhA/UKEzd9ONS71uLRUZO8PtjJi0U3bh4NkCWFO
         PK421OlDuh/u8Cb2KfZxq+6EKlzjOcEF9EjoFoiHRXmD+EJ1qz81MPvAkI4hEwCGpnW0
         8WMweycCjcy05OyRoa6JsokAqOQGtgCWTdTqoOuf2ZefNXoPrpsA1UpccoueoxXpbtPG
         Gh5HX+abdv0BcdtRoNCLDf4vgENH6l+vvPK0PpeUkixzQrvM/OG/aXPxWjFdKUG0Ef6K
         tD7w==
X-Gm-Message-State: ACrzQf1d+dsEp6x++o+k4ijbYE9A6ddktEE9cgx6wx9bj0H7deq2asyK
        TV8kFIrngxbJJvy1Bkk7nAwiNg==
X-Google-Smtp-Source: AMsMyM7cNrbXV0MiFkOqIpAXh5jjmyHmPx1eK8J8gu1cf8c17hiuvckZlMmTKiMZfr3t6f7ACe0/TQ==
X-Received: by 2002:a05:6512:c18:b0:49a:d44b:435 with SMTP id z24-20020a0565120c1800b0049ad44b0435mr10020472lfu.468.1664967357686;
        Wed, 05 Oct 2022 03:55:57 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id p5-20020a2ea4c5000000b0025e778f6f13sm1589877ljm.4.2022.10.05.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 03:55:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: dwc2: Add some missing Lantiq variants
Date:   Wed,  5 Oct 2022 12:55:55 +0200
Message-Id: <20221005105555.2665485-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These IP block variants appear in various vendor trees and
are distinct variants which needs to be handled.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 1bfbc6ef16eb..4378f61d7a0e 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -42,7 +42,10 @@ properties:
           - const: rockchip,rk3066-usb
           - const: snps,dwc2
       - const: lantiq,arx100-usb
+      - const: lantiq,ase-usb
+      - const: lantiq,danube-usb
       - const: lantiq,xrx200-usb
+      - const: lantiq,xrx300-usb
       - items:
           - enum:
               - amlogic,meson8-usb
-- 
2.34.1

