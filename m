Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1507F77490F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 21:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbjHHTsI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 15:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235090AbjHHTrp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 15:47:45 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975834BBFA
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:52:14 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-997c4107d62so820395366b.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Aug 2023 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691513533; x=1692118333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+/8A+T5kJZ2sAJcy7n9I+3axWMphmfRgNl05Gm90p8=;
        b=p5+5j+TqBHX6JDlv33bY4LrKL7skkWsaqTxc0b58EeuUDkmRKcgerX2TZABHdsjF2q
         QPCdxQUgrSO7aq5ZQq9Jdl+s+rCU6k9R315UjV8Rx1rrVBlIMVtMfZLGmZal1ZAzk3wD
         j9P1lKOGh0t2lOJdVd2853RFyYc2nmiCAp/vAen2F91OkI66uARi0q8zQ3Plvx4lSrKK
         VFGgq7U3ApezkJNtYqAwGZDmA3DI3MiAKPAJKD39ZSuXME3XUh1FhKpU6LzlHedtSRoZ
         3entS9xnfGKvfD+uWiux2KNkZOWqyB6HlbFneniA+rtP9rjzlGajDKSudqUeQ2bukLf7
         OfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513533; x=1692118333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+/8A+T5kJZ2sAJcy7n9I+3axWMphmfRgNl05Gm90p8=;
        b=ftTMbBKsyeaDZPixe9jjX5NxRLnsZ+e9rrgHpFXExRYj01FLRVH4W8N5VoTBr39AG3
         0nVsxbA2hvyxqH5llxEmxGKjSAk989m9aTphA2y/cgOYqrivyEwHCLl24/BEozt6O+7h
         7o8rZ3Ff4FQ25p0Tt4jLveOU4UaqTnJUtb4MjHi2JYpMSioSAl/8AgttMIstb5YAJkCJ
         Fp0W58V0adPv0P3yDa+rQTgNvHeECPlcxoPf3WsISEDUSf97m+SIhFLaxrWMmoUlD+V2
         9+kRCubyRWWzFaNf4JijX4EBxEi7YqvhdjQfM6RWi+00xprjNAvqXfn9Dcw6Gr4B4a9g
         HH2g==
X-Gm-Message-State: AOJu0YyB8GQEO2tZNzfaLc2qFMj4uUSFx17sXJAx76KRKn+13+ZwFe2d
        L3GyLS2/wFAj46KIEJCOC/s0vhnYXBklBas2k8A=
X-Google-Smtp-Source: AGHT+IGCn2asXBAYQXYX9ZgKLoWcp+AtEuDppAqyRaH1bhY7zh95GS9v1NDzWXazD0FnzkfprrmIWA==
X-Received: by 2002:a5d:6d51:0:b0:317:f7b0:85f with SMTP id k17-20020a5d6d51000000b00317f7b0085fmr1442288wri.33.1691489279549;
        Tue, 08 Aug 2023 03:07:59 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:efd4:f3df:2c50:1776])
        by smtp.googlemail.com with ESMTPSA id e11-20020a5d500b000000b003143c9beeaesm13109420wrt.44.2023.08.08.03.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 03:07:59 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, Da Xue <da@libre.computer>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: add device for Genesys Logic hub gl3510
Date:   Tue,  8 Aug 2023 12:07:45 +0200
Message-Id: <20230808100746.391365-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230808100746.391365-1-jbrunet@baylibre.com>
References: <20230808100746.391365-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add gl3510 USB 3 root hub device id

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index cc4cf92b70d1..a7e7142651f8 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Genesys Logic GL850G USB 2.0 hub controller
+title: Genesys Logic USB hub controller
 
 maintainers:
   - Icenowy Zheng <uwu@icenowy.me>
@@ -17,6 +17,7 @@ properties:
     enum:
       - usb5e3,608
       - usb5e3,610
+      - usb5e3.626
 
   reg: true
 
-- 
2.40.1

