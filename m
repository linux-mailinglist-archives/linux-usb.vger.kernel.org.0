Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2195D6D5127
	for <lists+linux-usb@lfdr.de>; Mon,  3 Apr 2023 21:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjDCTS6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Apr 2023 15:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjDCTS5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Apr 2023 15:18:57 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B008B2136
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 12:18:54 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id i5so121734210eda.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Apr 2023 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680549533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZSGEHV1wcF9QDw9X095419CyG9Yv6xnJ2egeD+2O1o=;
        b=LklJQBi7hsnfQA5KrRPllFlnLE/+fwiO4CR61oHAc7N1n+GjhMt19kI7yYcf4mWKZx
         ovEN6BtGWxjdFpBTVrtJERecaOcriMZlEVboCoqEcFaPJZ/zNoLKhUFzTivWRryVmRbJ
         lDIvn0kBqh0e3DEm7TOz072Dbc1B0T+QHLxzK4XbQhEnRKhO/cLQ2zcEt/NIhF0t3cdl
         kZRuzyaZTTZuCkkgMqF8j1htHmUKHhIEsWULDQD/v2fLBab0geReln5011mAJxQ+Vcn3
         RRBfWrEM8GN/dVPpxskCHBrhlmBWyZmjbKR9MPCCN4Hv0ZHDwfhKlZr5cYWFvNdm7CLs
         /+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZSGEHV1wcF9QDw9X095419CyG9Yv6xnJ2egeD+2O1o=;
        b=zVaSHRpVum9skDFisEAn2Wu2UVzCk75UxJeoffH12lfv2YoT0nIZNimlAQAG6/R42I
         xrNcik7vHsemcJf0V13PqwF8yXBeg3AWdMmYuVIHRpNEEK/NwS49bbwdQ2kckKpvZzIT
         J7CTvyiQedW2LlMk74jfVg7fG6NTIjTCcMmx6tmaVkIw6xxSYitS4WEt3wcBeG9RgskJ
         Adb+ob4zjlBVy5M7Dk7JGr94XLooPayPolUIwE8+h0n5xHDUZANvkyRZxDTCESA8eAsZ
         kfzERMpeBhUzh7/EacBqe49yC6DLJXAl8SvZo1CaouaSdFd+s6tn/xuompQMpl9KS8KJ
         Hc8g==
X-Gm-Message-State: AAQBX9dQBu4TMqDIHuVN/m3PBynh/CE8YtUXIclo9c08GTbDtxjAkyf2
        d2n/mpLwCzGBcpn4LntiwjmLIg==
X-Google-Smtp-Source: AKy350ZQ8gkFRQMSmLb2vCdVeG/SCcQL8iLCV2k8kwWTOf+zZkhnJeiPAPfb4yy7X5429anR4EH5TA==
X-Received: by 2002:a05:6402:4403:b0:4af:6e08:319 with SMTP id y3-20020a056402440300b004af6e080319mr18475608eda.15.1680549533217;
        Mon, 03 Apr 2023 12:18:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id n19-20020a509353000000b004c09527d62dsm5022999eda.30.2023.04.03.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 12:18:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: usb: mediatek,mtk-xhci: drop assigned-clocks
Date:   Mon,  3 Apr 2023 21:18:48 +0200
Message-Id: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The meta schema from DT schema already defines assigned-clocks, so there
is no need for device schema to mention it at all.  There are also no
benefits of having it here.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml        | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 556bedb96165..72639c6b4e1c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -87,14 +87,6 @@ properties:
       - const: dma_ck
       - const: xhci_ck
 
-  assigned-clocks:
-    minItems: 1
-    maxItems: 5
-
-  assigned-clock-parents:
-    minItems: 1
-    maxItems: 5
-
   phys:
     description:
       List of all PHYs used on this HCD, it's better to keep PHYs in order
-- 
2.34.1

