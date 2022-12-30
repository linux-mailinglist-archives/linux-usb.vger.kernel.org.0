Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAEE6659C17
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 21:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbiL3Ufz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 15:35:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbiL3Ufv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 15:35:51 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEC1CED
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 12:35:49 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id u28so26873138edd.10
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 12:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQFWSjnAmXGCxMB5DVpOmGczTzlI1ebWvjBAsrHPlS4=;
        b=1nNFGNhve3KqK6RlreucmsxHteknOmdOaNO8JnlwNb9lHY07YiAC33PsEJ6zXeLFBb
         dt3prhxRI8yPypDpacPQDKNYm9TIehRAzpLeaO1JFw2tWWF9W4tE1BXFkFJcJkEihdz7
         wnXCmTavn5xqaF+Bdy08/LRhSZ0vxhR/5iRrILZW0iigMFRyd71lK+5rl+vMhid1zpl0
         YjwbLrimNFd5xcm/3wYwRGhOTK/D1lxc4XBLq5OQ6KIEAGcDZDSx/29SRt0wAec6Cc5J
         MRkh89LQz13Q8yrBvctjUr0GjMWh8qpTpQv2sLqRUENPWd29JaxIU9Dz6I/1pGwr5Ed3
         MFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQFWSjnAmXGCxMB5DVpOmGczTzlI1ebWvjBAsrHPlS4=;
        b=Qb1+qQN7cV53cRrfiob2gNJgvK//9z04MWQx00uVe4vpHdejfzJCJdhT2OUkRahVhJ
         NQdQ5gE3TBHshO7I4z2Ga1t2+L23FnOcPc2Ti9iHt0A9t9+A2RiMjQeNOZiaeaYxfhxV
         jD6/BJvD/Pa5tVm856t/oEeaPBxQ86cQxQmyF614vBpcKsFcuLZZshh0+JkrJj3AGCyO
         Uyu10Ykvz0qFqE5wjWnlX9FFpfWBT7mc7lx8m+kj3IPnYvJhzZEG1hHZH9DiLXeZYPYF
         nU9kWmx84OuijL+tJXf6WR09GOrFKpFy2oRfQ1mgMB/9J4nLVtp8qc+I0DFM6iGvnAwy
         vVog==
X-Gm-Message-State: AFqh2kqrVkSO5GfEm7mRRZWbCDcUMymySj/xc8R2AkfXAsY6HntNq9l4
        tL7fvlRFjjXRHKbCaht83+DqzQ==
X-Google-Smtp-Source: AMrXdXvRRE7qV5S21eWJi/mZqwiBlRqXMqidqBxglTJ3pjDMqDyO+pFxWrpZ6hNS5jG3xuf3JUKRtA==
X-Received: by 2002:aa7:db47:0:b0:46d:b89a:de1e with SMTP id n7-20020aa7db47000000b0046db89ade1emr25833171edt.1.1672432548199;
        Fri, 30 Dec 2022 12:35:48 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c22-cd9d-4b00-ef17-3c78-1696-7315.c22.pool.telefonica.de. [2a01:c22:cd9d:4b00:ef17:3c78:1696:7315])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402158a00b00482c1f1a039sm8350500edv.30.2022.12.30.12.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:35:47 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        chunfeng.yun@mediatek.com, linus.walleij@linaro.org,
        lee@kernel.org, maz@kernel.org, tglx@linutronix.de,
        angelogioacchino.delregno@collabora.com
Subject: [PATCH v6 5/7] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date:   Fri, 30 Dec 2022 21:35:39 +0100
Message-Id: <20221230203541.146807-6-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230203541.146807-1-bero@baylibre.com>
References: <20221230203541.146807-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 7168110e2f9de..d2655173e108c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -28,6 +28,7 @@ properties:
           - mediatek,mt8188-mtu3
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.39.0

