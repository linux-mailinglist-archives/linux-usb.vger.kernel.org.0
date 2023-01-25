Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 621E767B4A6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 15:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbjAYOf4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 09:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235736AbjAYOfi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 09:35:38 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F463EFCF
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:35:15 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ss4so48030064ejb.11
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=;
        b=v+pZY1FqnOLtnw6Qx4mx4BS36Xs8JRYRNLk9FEFKaWbVnIyvJxvNCoum9KWiP5kv2P
         1W117xRbwSUz2cM05vigF58g78LxW1P5RwHOONrh5g/SG3ZiyLoH9cYJOGqPYYRj/ZYP
         GxOnGgcRF1vC1ZZOkueX4ZD2IhM5wZNY4dINgrPJirO5BwypPM7x4BYS2RE5B1pQNwrW
         sWcIL76xuOLM+cdCOQ//8nTAv6jo7iGSH7DmaTHgwk8SG5dGoOD+HT0T0RPuxGRulmK0
         bsLXs44t+7OxZ2I2ZVWUkcw33k77pMxu+gTnGAZHuEVJ8Xc6kq3qyQFdVuWj2UlT5Zdb
         +9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=;
        b=zRXRZ1yagpEe36bcDVpgVLOskmIqVZ4EX0L231KQdHZJL7hffH+lOhO82FZmgz6XSn
         7/C0XR8s8hxB13gKSJd6N8f5O/1gEPQVkjQTYDSFbDIM/1IX3RKIHF5/ATxUuM/15ixe
         aaBpm//UO6W1U03RZXeJ0oR8kzCfHLwk0Cn8sLL9X/0OxdgQAjCMdhBwP8neUf++zidr
         I7iuc8YqY7xyclae4Q2o+0fEXgga+SKMk0+4QjxpEbjZurSsLfWwNJZM+eq6WyRqIGBX
         iYJe1KvNfxcL8qIeGyc6Z4PsLoycCV0dm1tLy3Wq2ezk6mAfi7PWNUwsiubZbbI67nWI
         7MoA==
X-Gm-Message-State: AFqh2kqrr9Q1+mPijJavfKQISdulfPPjBSMgym+Xha2Vr90CYZbZvvUH
        E0lJpQRH7ulafLaTYwkAdPjGYg==
X-Google-Smtp-Source: AMrXdXvGswLjKTFKStJKK5MMwCshqT+defETqAcFpsMxkCizGLfF2quhPwyyiVyb0Ln9ODBiPmaRFQ==
X-Received: by 2002:a17:907:6e02:b0:84d:2eb0:57d6 with SMTP id sd2-20020a1709076e0200b0084d2eb057d6mr48685082ejc.52.1674657307165;
        Wed, 25 Jan 2023 06:35:07 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:06 -0800 (PST)
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
Subject: [PATCH v9 1/9] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date:   Wed, 25 Jan 2023 15:34:55 +0100
Message-Id: <20230125143503.1015424-2-bero@baylibre.com>
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

Add bindings for the Mediatek mt8365-evk board.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2275e5d93721b..ae12b1cab9fbd 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -244,6 +244,10 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8365-evk
+          - const: mediatek,mt8365
       - items:
           - enum:
               - mediatek,mt8516-pumpkin
-- 
2.39.1

