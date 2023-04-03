Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8021D6D5129
	for <lists+linux-usb@lfdr.de>; Mon,  3 Apr 2023 21:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjDCTS6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Apr 2023 15:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbjDCTS5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Apr 2023 15:18:57 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6ED126AC
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 12:18:55 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id ek18so121575440edb.6
        for <linux-usb@vger.kernel.org>; Mon, 03 Apr 2023 12:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680549534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T50vLVbG2ABwfUlTpSJpYxSsSe8WTt2ADzn7FKCrPrc=;
        b=lxDkaT0emfLY1s6ASwAH+xPT1yl1OINFW3kEQzy5PxOvrSnFuNt0wX1voX3n3/V1hV
         y5/N6ZhPpWV/HQUrOoSd8uL+DsVe2441goDeqN0ehD5Qq0HNdmeOsasBHYYkWsqDVh3s
         HKElw/fVzdmX/RGxoJGn4K6m8O6oMhhfapJidAkBiwvi3QxmpcvuqYesrqm6zYT9FQaY
         YCDW1zbhf5HW0OAWy5POQIxYpw4SmrZ4ksgpqTZdFYPLmQ43dI9A98gNENk5uPF3GtdP
         zSs0FcMGyJ9t/AQnQ0sCuZGxmCyyG8DNgnjzRXvD9CRZHhmps86zfFIgrOjUYR1rHlux
         jeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T50vLVbG2ABwfUlTpSJpYxSsSe8WTt2ADzn7FKCrPrc=;
        b=DlYsFWY/53eWFJxAzJGvh/ahdNnvNn9mKSmJtLir8s3IWp1WGKQpmWxcmPCZC7ObK4
         qvpQVo2kvK/KIkUi+X2NzuhZPlViXm0Ww1m5RE1tUhppKzuER6wSU5aZxJonzo2edknp
         DMg+E6Xxgy39nYANgbdSArLEpXNFkREN97kLWGo8eGrHnIE9y253mfw0f6Vmwh/V+NE3
         fBjGf6uwDyAOn8SleXhyPvG/+/WZ05kIiwqQrdeZ5z6qB2ZOHS+vVtIMIGueLKeZlUVL
         9O49zsdLCxcQRvZJK9ywcWWXm9EO02PhOciXWaU0qhD7qRHgPZ+Lit6A8dNIANHfF+Ka
         jvDg==
X-Gm-Message-State: AAQBX9f8eZTDsWNFVPOc9/SAj31MAdYlFlo3eL8cX/qu1vMldY3+7An9
        57mAeW62EVMOcsmUygAWJpHqNQ==
X-Google-Smtp-Source: AKy350YBucBFpI7LWLV8I9pfg1VQ8D2Lt2FtPllMkqHAraFUGDE/STpHjDWLQK4w/9H5f/INQk23Lw==
X-Received: by 2002:a05:6402:604:b0:502:45e7:4139 with SMTP id n4-20020a056402060400b0050245e74139mr207649edv.37.1680549534219;
        Mon, 03 Apr 2023 12:18:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id n19-20020a509353000000b004c09527d62dsm5022999eda.30.2023.04.03.12.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 12:18:53 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: usb: ti,j721e-usb: drop assigned-clocks
Date:   Mon,  3 Apr 2023 21:18:49 +0200
Message-Id: <20230403191850.374839-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
References: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index fd36dd02fe74..95ff9791baea 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -53,12 +53,6 @@ properties:
       VBUS pin of the SoC via a 1/3 voltage divider.
     type: boolean
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-parents:
-    maxItems: 1
-
   '#address-cells':
     const: 2
 
-- 
2.34.1

