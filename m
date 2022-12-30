Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBDA659C12
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 21:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235461AbiL3Ufx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 15:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235422AbiL3Ufs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 15:35:48 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490C31016
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 12:35:46 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id r26so26508197edc.5
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 12:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=;
        b=LLQoS38OnHASC8acnayjA4I5IhqidYoxtW1YHfRPgckuXaIsfjLalsXQBSlCse7MnE
         fWqmi8FuRnXAGGRvUF/tFAZhGn0L2ArZ+yhcCK1YnojVIyD6N7VtD6/RnnCaPqLFnRRi
         HEcPa/UwJ5H1PEthsRu7N9Zw4bwR3ISVRYQzp3A/0lBXtkmb0Yqs/qzchm74/MhrVDLQ
         3s0gq05bYZrEQS+LpY73SKxiuqPl3BkbZ1MYRSruBcMVzUfJZFOwxawLJNsORlHbBvgQ
         bpy8yuJCFNBXcuNIBHY0ucKZpljOO5vT0h6WLooiHHwFQBJ286iliUyCJFV09zwpu9vv
         wZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=;
        b=VQz3gupNa2LQfJoRPNF1/Eph4atXJZQagfPl9z5k5m0FT8LtMU3a1+lDKPIEuqlckL
         4C0dkIA5plDIAimigrzfZT6GJCmCG6piNdr3AAxMJHChs9xmZjNcrVT6RR2wNeUmhr9f
         cxdG56WPMW3y9vPUT6uwFsTk4eetAJkBbCOt4L99I0fl78yBstAWWiAA8Ed+QdudrJr3
         +/g/hfFWNd431clsz1dLmArVXCt3It+xzkptEqMLWBloEaix1qV7kUVNg6I4Sud3QXrL
         pssWbBzHgPkFlSk8SbTWxiGJzLTPmmUkAHpwIeNTRx2jGugywGJshLwPSPD56jhMBxMZ
         x4Iw==
X-Gm-Message-State: AFqh2koom1vly7z5/Xnik3ZGFyGPev6Aq4kDCT90XQnZ3eD/phz4+WmV
        rfO0hhodybziAGAa/HXBTpbyuw==
X-Google-Smtp-Source: AMrXdXu9goJPB88HKG+CvZxdGOglMZLhVQ70bS4NdrOMdf68jLD6EjYBlX8RUCF8snwUJ6O4JCUJhA==
X-Received: by 2002:a05:6402:456:b0:484:8b49:e117 with SMTP id p22-20020a056402045600b004848b49e117mr16804743edw.3.1672432545224;
        Fri, 30 Dec 2022 12:35:45 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c22-cd9d-4b00-ef17-3c78-1696-7315.c22.pool.telefonica.de. [2a01:c22:cd9d:4b00:ef17:3c78:1696:7315])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402158a00b00482c1f1a039sm8350500edv.30.2022.12.30.12.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:35:44 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        chunfeng.yun@mediatek.com, linus.walleij@linaro.org,
        lee@kernel.org, maz@kernel.org, tglx@linutronix.de,
        angelogioacchino.delregno@collabora.com
Subject: [PATCH v6 2/7] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date:   Fri, 30 Dec 2022 21:35:36 +0100
Message-Id: <20221230203541.146807-3-bero@baylibre.com>
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

Add binding documentation of mediatek,sysirq for mt8365 SoC.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 84ced3f4179b9..3ffc60184e445 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -25,6 +25,7 @@ Required properties:
 	"mediatek,mt6577-sysirq": for MT6577
 	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
 	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
+	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
 - reg: Physical base address of the intpol registers and length of memory
-- 
2.39.0

