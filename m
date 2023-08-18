Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4949780A07
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 12:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359279AbjHRK30 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Aug 2023 06:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359699AbjHRK3R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Aug 2023 06:29:17 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEE626A8
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 03:29:15 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a1681fa868so29048766b.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692354554; x=1692959354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HIXdHmbJ/1H+7sVStqZs6MCT28eORkXsThJXsBANxyU=;
        b=kZZuRn+2N/u+2djWTn9I0tqO9da2n6zBwV0W7bFuBfVxZFYtQ9anaguWhkEo7sVbGd
         zbjjzjTkGYGZ61VZPrswwdxIihftexIcSMQ/SSBnqH7bJ3DbBkNHhFSVK9H6YfFgzTAZ
         ZL7MCjzNFZfKa3LBC/jFGUgqfXhAfd3mcjbQCne0EiGTHvN2K6ZxulcXnwLss1QcMJnD
         jlOdfDIiHY4YQJPzRn5AKi1p8zCZBSJF6rRUJe8vEJDuO9252keS1ErpklpVyEcT+a0+
         ikEXiIbPGR6yQf133kqxdeKgXYLDJrQgXRe11vIO994AZ3y/Z8wyUFHfnN6PyFQnttQ7
         QqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692354554; x=1692959354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIXdHmbJ/1H+7sVStqZs6MCT28eORkXsThJXsBANxyU=;
        b=kfp9n17RoQgLxVJxlKKLal5e5etdT2JYp62QgbI2SjEu8+gRyNe8IfFRCBhDG6VtgR
         m5IU0qyv/7wzHqgRGHMrGFOVQ4qPuIy+JwdVcDdACAVbS7GXDBXD0BLLGR8j+LDpBFUt
         /H0a/o11KWT4FX+h3MeAtmRs45C78C4uZiT4xHgx4Tmnub3/kOtrjtU4JBb9FtZmn1hM
         zs+F/jVV9d7xOn9YBk+Da+pMdwFigWel1WbKyaA3nioduenCfKg294HF/OCDviSXAa5x
         hpI1VWHXgE77CLvAJQLg6ZweFnNVXzLvSBjEYEBnr0PyY4UHKJ+9gj/hXc2VzV7e+0p+
         8wjg==
X-Gm-Message-State: AOJu0YxphEt1AxtQcxCXBKr0Q6VCvCx+gg39THdZWNXoGpmko1w0hA64
        05oyQpfETA/GMi2rXddMD5Dceg==
X-Google-Smtp-Source: AGHT+IGyaHg28rUIREhoYmqbDtr2UtDKWZmkPT4qvdhoOEqX0b2crmbXQiLYzf5Z3vgW3SHSSt89Og==
X-Received: by 2002:a17:907:7792:b0:99c:3b4:940c with SMTP id ky18-20020a170907779200b0099c03b4940cmr1690618ejc.7.1692354554437;
        Fri, 18 Aug 2023 03:29:14 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id fy3-20020a170906b7c300b009894b476310sm994053ejb.163.2023.08.18.03.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 03:29:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: fix order of clocks on Exynos5433
Date:   Fri, 18 Aug 2023 12:29:11 +0200
Message-Id: <20230818102911.18388-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Exynos5433 DTSI had always different order of DWC USB3 controller
clocks than the binding.  The order in the binding was introduced in the
commit 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to
dtschema") converting to DT schema.  The Linux driver does not care
about order and was always getting clocks by name.  Therefore assume the
DTS is the preferred order and correct the binding.

Fixes: 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to dtschema")
Cc: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 240f41b7133a..deeed2bca2cd 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -82,8 +82,8 @@ allOf:
           items:
             - const: aclk
             - const: susp_clk
-            - const: pipe_pclk
             - const: phyclk
+            - const: pipe_pclk
 
   - if:
       properties:
-- 
2.34.1

