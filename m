Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC98A539272
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 15:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345081AbiEaNwY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 09:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345075AbiEaNvt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 09:51:49 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537B9994F1
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 06:51:03 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id s24so11460977wrb.10
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3wGkmcChS3N6J5I1U5dOklUlfdbKJPPT1/iNxESisgg=;
        b=fikIkFwWuhYcaTcEmINCMiakOznAvwOTyoARO2Ked0fxXRKlokFWxS4v+L3ZHkVXNE
         KJo6JQRplqeWtr7bcHSDaD9wimVN6J5/aFLVwkOlxuupl3wfaWdmJLh5kAYbdtTckmjS
         7ZGd0V7af7yBcvxj28ftOe7vntKmkUDl58co3QLQMh7EDttwJw6VIn65mWVSUtVSY17w
         C+pC6wz1nhlOvs9cYDgkL55ay0oOBepTQ5OOmFShvRgJzHHRi41+K+1jqITOGGjVGPtn
         sjkv7Mviq+G4VnQO6P1IU33v5RSiZUvtdFZ0EWYtGwnjrF0dBp7r7qRY6vrkRwHkHUXK
         npvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3wGkmcChS3N6J5I1U5dOklUlfdbKJPPT1/iNxESisgg=;
        b=bWlvG/YA7lJrGneYSY1UMtbUIzKnw3XwtdydCz0e5jqRkkIDHAmJZpK/e+OPfOupr5
         v607S5/XyOmZtrit3k7hfPSfRAYj9F/MWtykGbkbB9T9bjARE6ruFuW95gs8RaEZX4Qv
         h0pnrJGcGjz/lTSqu6qclPcJ/1vX74HPiClR8weXExP90kMmIAOfBHGpGw5U6ho1C4ee
         66zlvYocLpAsPlwg4cRpnsP9Kg9mK1wxiF+bj+Rzo8iw8Akj2dZy9PdPI3ZhNgz1dX3j
         c2+wjtku6x65k+uVhbjM6jdrSJrKtELwjdWiC/QNYx9aIwDjTW4GAI3Eb5oL5zNPy5tY
         PcVA==
X-Gm-Message-State: AOAM533AOPLSo3NJOLwW5Tt4zSjEAZx8ePl2Walsi7z95CQ7llTFpXZT
        mz18eTvG1dOnmamR+R2BiKFkmw==
X-Google-Smtp-Source: ABdhPJxcPkJR1D9vj54qvl0alyjM+fo9L7Ht5RN1swDsTiyvQa4xekfb3jUiJKdRl+jEckFF9F7nug==
X-Received: by 2002:adf:e0c5:0:b0:206:1ba3:26aa with SMTP id m5-20020adfe0c5000000b002061ba326aamr50251741wri.645.1654005062859;
        Tue, 31 May 2022 06:51:02 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:51:02 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 13/17] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date:   Tue, 31 May 2022 15:50:22 +0200
Message-Id: <20220531135026.238475-14-fparent@baylibre.com>
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

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index df766f8de872..9ede6069d9e6 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8192-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.36.1

