Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A941367B4C7
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 15:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235911AbjAYOgn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 09:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235771AbjAYOgH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 09:36:07 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022C959761
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:35:39 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id rl14so44837803ejb.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffl5HfqVus00IOo7wgMujA9coL7RO1cV9lKXrzUWgAg=;
        b=BmbFUdf9CwKT2kI6s8mGzqEAki+CP2qH/tUPAsy53AEXimitOvevkH9EK8c/rrSXcj
         nl3UaK7FKTinaWKUi9XAbf5jYhHmv8lm1Tj38w5jfNyW5FWtmW3ejwJrnWp6f0GgnCJ2
         fm8LdlYXdJe2FoBo+lJE+56zWDe8iMfI3Zi6LBmYVqJb31Zc1ctW9j5LUeEAeWbaeidF
         WRQcZIH0OXuew9tQeEBMFWmHRfq7PIrS0LXyU7wYt5q0s7dB3/G/OK0WQIJgfWsFTmaT
         DjMkf2+jvee8hn+4pPyHFY9zijxCUhtGtXEZrRMQYIQ5wvdbo8j9/VJ1AJB9m5VRUP1I
         Dplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffl5HfqVus00IOo7wgMujA9coL7RO1cV9lKXrzUWgAg=;
        b=D5IBR045hz+8e7zJhtd1BjibiCMc4P1zG/UtjKwWusSywk/6eqYEZgJeKc7PAh6aBm
         zm4AxnSYqJwRFsZowOQKTp1u48ZrySVvWbpz5UXSAw0aXjvzmtRFf90bQprZqn5ttNsW
         0fpJArHxh/A6rbQ5pfytN6UA/rURKZJpU9PoiSgz9aoy2PwVbJBLRUgFMka5IMb6d1tk
         sGP9Ng5RnKtzzdVZ/a5SHXap6b4Nvbz1OfbkMVaqhz0wLyW5cHPKz9RP2QtwZ5Mn4nhW
         Jb8vqp9GNO2hNgKzDmCNDkPEMQpuhlek5Ru3T1uf4cDB/pzLxLHFJ8kEdix/pxlo9RZt
         znOA==
X-Gm-Message-State: AFqh2kpm85KMQlXCLV/t9eKL57WwhqCmXGDN0DT+752kiMBVoElsrutz
        oNf5l/hNWCZpsD9q7LFTLdRo6w==
X-Google-Smtp-Source: AMrXdXut8oeAnia2W1mIY9PYEWFiUEG0BoWso+bqNF6URRYO0QLRv0+yUeszed1pDo9wzfdP0Y0ncA==
X-Received: by 2002:a17:907:8e86:b0:84d:43c3:a897 with SMTP id tx6-20020a1709078e8600b0084d43c3a897mr50385026ejc.2.1674657315713;
        Wed, 25 Jan 2023 06:35:15 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:15 -0800 (PST)
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
Subject: [PATCH v9 8/9] dt-bindings: serial: mediatek,uart: add MT8365
Date:   Wed, 25 Jan 2023 15:35:02 +0100
Message-Id: <20230125143503.1015424-9-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add binding description for mediatek,mt8365-uart

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index fe098d98af6ee..303d02ca4e1ba 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -45,6 +45,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
 
-- 
2.39.1

