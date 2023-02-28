Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF6A96A5B8F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 16:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjB1PVU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 10:21:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjB1PVT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 10:21:19 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD58305E8;
        Tue, 28 Feb 2023 07:21:18 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id h3so10623352lja.12;
        Tue, 28 Feb 2023 07:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Nj/pyEGuI2AXqgkIb0HRmRTV4X7oh8Cg+NkzxMSXyE=;
        b=e/kka9ze2Ac2aosUsCElFaOe4xyEfl/9pt+rhObyBHt20lPmDANwQwQ9zQQqMqdkVB
         dL3EChcmknH4C3WcVj67B01J/y5d3TD2SS9EZSIQw9Xz0bw06By9aCmqevYbhcU1+GsT
         +HUMMshk3WcC64C5JC+ENak3IlJROdiTIe0RhZzJkEbb+huQpRhp+hvAQVfcNMonVEU3
         BNOf1K75Z/bcMBStFFDquZ8S2xURa9JdsyTtI9q8NTZ8XviJ7tFVGB9kHW3U4c4jX+dG
         +qCmoTMiMinsGU21D9ZQVuaTbboxUF0FA0jpBje4P/eBOc3lDfxPHbCN3Am8Mt1zgqHb
         YSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Nj/pyEGuI2AXqgkIb0HRmRTV4X7oh8Cg+NkzxMSXyE=;
        b=h4UowyY0DU5EKoJm1Kn94xfOdBl4iQZ1qZvTfQe9JscbTfzfbn2rKijEDWrfOtJPr2
         7ZDmswPWTrDQ4a+3NAn/5WePm7HThtwJv0zT7dyy72vlLwBCpurRzRJy2Tkvc3Is2OEU
         Ldu2BACPgDwy/8Q1bzRPdZ+3BN/ICVkZ11jyHyhvGfxkL20gWRNK+lQfM3KixjqO0m6v
         82nNhGGC75hY1a1brnY5Apu5Uu9gzbdW+NaBa+2O5jtAZj/waO+Ou7JtT08zU3kLGlZD
         GoruG24DbQ6IDgq0i/gwEAkAjgQy0GhIh208+ucQc4iikpk7ZDi8DawnRBGRGIiLQL2L
         DwKQ==
X-Gm-Message-State: AO0yUKUyQdbCuURKeRObp/TWm9rVyIVjln3uhAbJKaT6Ns31OU8WTtau
        BqRm5Xux9SSnuZ67Pgr08pU=
X-Google-Smtp-Source: AK7set/FcmcYsDNF6XQYprkpedxT1Kf7l65zKwo9vcdbG1v5K8Ts0+j/iaRdXfhYKtiYHI4MQK/3Og==
X-Received: by 2002:a2e:91d4:0:b0:293:2bf4:d939 with SMTP id u20-20020a2e91d4000000b002932bf4d939mr889019ljg.12.1677597676374;
        Tue, 28 Feb 2023 07:21:16 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 198-20020a2e05cf000000b002935a8d9351sm1268866ljf.55.2023.02.28.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:21:15 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: usb: allow evaluated properties in OHCI controllers
Date:   Tue, 28 Feb 2023 16:21:05 +0100
Message-Id: <20230228152105.25358-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This binding uses usb-hcd.yaml so replace additionalProperties with
unevaluatedProperties to allow generic USB HCD properties. It's how EHCI
and XHCI bindings work too.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index a9ba7257b884..d06d1e7d8876 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -148,7 +148,7 @@ allOf:
       properties:
         transceiver: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

