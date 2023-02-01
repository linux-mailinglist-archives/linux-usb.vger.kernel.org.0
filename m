Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47AE867B4BF
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 15:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235901AbjAYOgj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 09:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235764AbjAYOgA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 09:36:00 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06ED259574
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:35:36 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ss4so48030938ejb.11
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5xBfE/ZGOPJTnop+MEy0u8c1qaCOncm13Ltk1p/JL4=;
        b=RCcY4EJr7DH2OZHGreyGRn7U8BeObsCO7+xpPYJ3pKfVd6rljsaPpdjEIhr+OW4kBr
         WOwmN5BBww/4oDETxVCE47sQrY3R9E4AAv3cBQWWAPApk+d0hczKbUdenY+NV2SUbGLJ
         oBTdyw7zTPFg3MUlCDTol+WhJglkv8o3/WA4FtPvA03NVl/wQ3BjBCjnvEM9Z3JpOjhq
         gujPyVFd5wwQlCvCPYC6G7tnGOxEvItCEW/ya7suORjREvdxL2FIXES9yyYmbpqk4i6g
         csOvUnMEay4pAJQDYKuom/jjCO4naJpOicO0AHlwWeI240cJnNh02fZhvFJ7QK7dzeSD
         4LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5xBfE/ZGOPJTnop+MEy0u8c1qaCOncm13Ltk1p/JL4=;
        b=Kb2Zjlrc7Vcd1mpKDpLb+t9OyO63N0gT4fRPicBYbfmHo9A/5zHKEUmZK7aPuJUA6J
         AV/jF/IdCiTIKKyTLCL2nx1jn0HucpK8Gl/+QNm+hHybDcq3pM2Vx8UFeLAntPIabll9
         KNpdhzexlgJyBqf8gVwTm8Xi9DjVZdJIj7Ec6Ufdd4A/RHNOtZz9QvoqQWTBrR7wM7tL
         Yv17HXvM+ptRfR1zIW5rQ3B0W+gcqz5077BdPqjRzxztC1fczNDukJIz9rLzTVRY3OYH
         3V3SfcLXfVYUJMc0NeCOTg/1HcHFUWOpzJTz6UrS88hBALoxpPwpH6neYeUeNQqky5Cj
         0TaA==
X-Gm-Message-State: AFqh2kpA7jZPx/BApfTYo5fGvt/Ume1QD2EsOFoQpugNtB0RkkL2h3SX
        YghcIrWPkAXO8YmdENO5jtA4+g==
X-Google-Smtp-Source: AMrXdXv3P6+YtNux80G5HQOCQm6qla2fel2TtE0oSEz8Qv8aX1zImaVTVApIjkTYGEXQd0inEr4zzQ==
X-Received: by 2002:a17:907:b9da:b0:872:21b2:9a1f with SMTP id xa26-20020a170907b9da00b0087221b29a1fmr33800112ejc.58.1674657313338;
        Wed, 25 Jan 2023 06:35:13 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:12 -0800 (PST)
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
Subject: [PATCH v9 6/9] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date:   Wed, 25 Jan 2023 15:35:00 +0100
Message-Id: <20230125143503.1015424-7-bero@baylibre.com>
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
[bero@baylibre.com: Cleanups suggested by reviewers]
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index a3c37944c6305..c119caa9ad168 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -35,6 +35,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.39.1

