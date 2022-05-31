Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4494539218
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 15:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344932AbiEaNux (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 09:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344884AbiEaNuo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 09:50:44 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67245713C
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 06:50:40 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e2so18821677wrc.1
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cScg/ppMZgoA29VxGDOmoca/GEpRNiY6uz4ypL3t+ho=;
        b=zwHfoJRh4qEpqnVW4tO8Ww9mFoI0xkeYeX75NLKUzehMYnvddYiXCNrP2wQktLHmL4
         xUHKKb7OGLzcssDx/jyB4RczL28TaZiSTc9JCpmzDJYjcwk/WdM34S2cFCTARqFkGFl1
         LdctYQzJ9woSuCXBJJsxCZRZHlDhQYnY+IAfX3K1OOxNV0l0E0RleUd2ISc2Rgk1qo4K
         fJhqz0GMYoawCe4viZIZ0erbtsOEipTnqJ8vO42ycO5gH009W5gktb3F6y4C7C3zfS+j
         5f6GW9K2Xo/l6wVaOyzBpfe3OMOKhDMwN9sL4RSAhrtp1Bm0pcpeYrF7Ky+FohTwGoxI
         YHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cScg/ppMZgoA29VxGDOmoca/GEpRNiY6uz4ypL3t+ho=;
        b=BNtiG3o4WKk1/tlbXHL38KnQ1y3r11f3zopqIS05Ph/PisysYS7XEjLxU9E5o3jqUV
         dVx56ij5vZW1V3N/89IeCqHNvTBX+BTlpZ/GvdXevDNGnhucfQlf54XXNm6dLq0vsUC+
         7POieX2L8t2teUR8UrpbZQESlwy1MfAp1BOG80AoBL4BKBQeMkupMTjiPqSil/Ns0Bbr
         3ganJQc7L3OGlkGcVajHNRXtol9d0RY20YvMmMeva2zAn17+pAjHDC3MWFo49E3xzvK9
         MIvUKBobyh7Gahl0DnrVGDL9UFnzfuT4ZhhP1ZwsXR7n7zz/C7rvL08FEhxOKflRiYSI
         B5Rw==
X-Gm-Message-State: AOAM530xR8gUZt8YFJNTFe8Dx5FFYIpifNQf6SMmVWGR0Vy5QQVlTJep
        guqVBVKWdi0M8K2BWnWgRf9L2g==
X-Google-Smtp-Source: ABdhPJyHAelw16D3P0Yimp6zHFw2pjrB1y1+t5Sxv+QQxbBuBodm5ZmZ3Iw3GAh8m1iPVVk6MgPgrA==
X-Received: by 2002:adf:d1ee:0:b0:210:d63:6570 with SMTP id g14-20020adfd1ee000000b002100d636570mr20704871wrd.673.1654005039097;
        Tue, 31 May 2022 06:50:39 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:38 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 01/17] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
Date:   Tue, 31 May 2022 15:50:10 +0200
Message-Id: <20220531135026.238475-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 16a1a3118204..a6fe0d8b0cbe 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -43,6 +43,10 @@ properties:
           - enum:
               - mediatek,mt8195-i2c
           - const: mediatek,mt8192-i2c
+      - items:
+          - enum:
+              - mediatek,mt8365-i2c
+          - const: mediatek,mt8168-i2c
 
   reg:
     items:
-- 
2.36.1

