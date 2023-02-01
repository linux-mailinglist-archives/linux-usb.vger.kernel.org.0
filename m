Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C27D67B4C8
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 15:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbjAYOgp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 09:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235833AbjAYOgH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 09:36:07 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068275998D
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:35:38 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id os24so4423092ejb.8
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2giSoKpmUMBjrMl9HUkga8ekHANL68RCzLpYCFzHvs=;
        b=kQ6L5xYgk2+18HedslxV9VP4htolCDeVl8W5FgmN6R2IIAyhioZtcO8nXaShcD/YWY
         FANg3prPs2LeWtuHWif4TiHdjhnYzEZdBre23zbuwBJeEWvupV2VdCB/scDoW4Xb4XJ7
         nKF5fFAmNdr+qdpvzRLL5JhqmyzLxdBWyB3RpdxnW6zSDbaYduRoR2h0ffFxe4z2THZs
         nwc6eAOGrOO6a9Nh1Zejul1Wmzli4sM4uurgDn94D9auMiw4qQw8HJVfVjjH6aOE0pUF
         cowXWQmv5I5KRiyq9W9TqdQiAu+EmXSbyBuKRbddoXSpViuqORK9tpSMNNi2miLlBoRG
         gj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2giSoKpmUMBjrMl9HUkga8ekHANL68RCzLpYCFzHvs=;
        b=0fQR0tMD53c4JYsVOl1zJ5t8mbZRuywMcQwamVbraQn+61j0yQIm8X6il/7LCxbmGQ
         Eh9pO9S7N9v5fllJz2A2bRStVLYvBo093UCt5cI/Js29xdRvxLlbxb+n94YoYScnqsJw
         Gl9Q5LNU4OzuwUCQc4GKMRQ/hHONDDsbkAOzKGZEACcY+dQBQjtv5/pDfTihiT0LdwEa
         nN5m44jv8tCucCOwxEayeSKdvAIakPqiCauHc2QZ9rWTDaDrIN+tegjFiBeTREDXB6YI
         0Kf7t81JJqS2pgcj+l5iZeSLag0+A+Fqk1Om5XSxmLtOFOlEsghjmZZ2dALHqa6auegn
         jKKA==
X-Gm-Message-State: AFqh2krGYpeqnUZec4zKb0gVHPrZTgMn8GXgzPo9aYyjnR8kOZTVXpsq
        zkUs3PTCmN7cJViQ1Y0a0Jux+A==
X-Google-Smtp-Source: AMrXdXtaIZrEnurCkz3yd2v2DJFwcX9KOokSAkiudb0bv0MpXe7Oawbn60EZB1shhY8H52QO+UJv9w==
X-Received: by 2002:a17:906:eb8e:b0:871:6b9d:dbc with SMTP id mh14-20020a170906eb8e00b008716b9d0dbcmr33632150ejb.21.1674657314542;
        Wed, 25 Jan 2023 06:35:14 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:14 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
        maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, gregkh@linuxfoundation.org,
        daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com,
        angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
        allen-kh.cheng@mediatek.com, sean.wang@mediatek.com,
        zhiyong.tao@mediatek.com
Subject: [PATCH v9 7/9] dt-bindings: timer: mediatek,mtk-timer: add MT8365
Date:   Wed, 25 Jan 2023 15:35:01 +0100
Message-Id: <20230125143503.1015424-8-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
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

Add binding description for mediatek,mt8365-systimer

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 8bbb6e94508b2..b3e797e8aa313 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -33,6 +33,7 @@ Required properties:
 
 	For those SoCs that use CPUX
 	* "mediatek,mt6795-systimer" for MT6795 compatible timers (CPUX)
+	* "mediatek,mt8365-systimer" for MT8365 compatible timers (CPUX)
 
 - reg: Should contain location and length for timer register.
 - clocks: Should contain system clock.
-- 
2.39.1

