Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488B4511F85
	for <lists+linux-usb@lfdr.de>; Wed, 27 Apr 2022 20:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242353AbiD0QRA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 12:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243823AbiD0QPa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 12:15:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2B5C42F0
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 09:11:46 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id j6so4336352ejc.13
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JKLzCL9GRVwGSc0r2wworp9J5CsZD53o2CgTBmT+PEI=;
        b=ZBb8Sbv/8yazigfumcrHKn3jqhnSD4csRjnITAkp2hHyD6uZh1coAbcZLoKsNiHJSh
         sgaggV8ataQA3Audmu7ecawSpOaaQ5iz7/Bgc4ihOy5KW6GjEJGAC7w3Mflk/UuGsBwL
         JudgVfogSEgNSVQSElo3yX6ChPh8olEfY3mHxuIXTFVT2udJfcIHKUBFj+edA9YAl2W7
         ZYQHRIP9czJeaUP+3LmS+30xiQMdxR51iylGZX2Efk4QHDm7WlHZzVAgDyeIg8pa0Rwo
         C3K1JiXvYjoHEVAgVOQJqXcuB5tTK6vnwDNldYjkmkUbuNLmIBpDVzx3NSXdtiuZutqR
         CXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JKLzCL9GRVwGSc0r2wworp9J5CsZD53o2CgTBmT+PEI=;
        b=g9muMnY/i1GFBHyOlRQef5dZgHNtWxryK+X0dygJLVSFQHMqvModI0MFYFqfpB599O
         hzPMeU89q47/IDzxmj4pPrDdawzQS4c8ne6M2M0fZUYWw90o3U1KNtBHcRFYYmEFAfG5
         jUJb3cR3FrAPFEQBHApWIAptNK3/KX9hxA/ZwBlMqSTbSMzuGpFPlDJGAd8+rRQlxSjG
         7LNyWjGnF8E0Jlhe7oD/r2Iu6WTrJ2aocWm6jFNUU0+6S7WvyVX1XctJarIPqU7aC4/4
         8Uc12hXNt3mXGAQPGOnzAcH8sN8gV+7s0xeo8kGJeWZ25Q9a5+UNQkE8w/E0jze7iOTi
         sN/g==
X-Gm-Message-State: AOAM530sJ3JrSIHtrHxlSF45oRN7AgfAPgag0fwMpCSltXQaALeARhlZ
        phHOGOGKjezgbxx22iCg8A6dOw==
X-Google-Smtp-Source: ABdhPJyMP/J5GpCo0ncYqIKuqqPzoIIXiaYX3cIMzzq6c6IdI3lhr0fAM8UwM9/VTiJul7+YCDs1UQ==
X-Received: by 2002:a17:907:2d93:b0:6f3:8524:6f92 with SMTP id gt19-20020a1709072d9300b006f385246f92mr19238744ejc.556.1651075901602;
        Wed, 27 Apr 2022 09:11:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id m1-20020a170906234100b006ef83025804sm7124610eja.87.2022.04.27.09.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 09:11:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/6] dt-bindings: usb: am33xx-usb: deprecate '#dma-channels'
Date:   Wed, 27 Apr 2022 18:11:21 +0200
Message-Id: <20220427161126.647073-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
References: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The generic property, used in most of the drivers and defined in generic
dma-common DT bindings, is 'dma-channels'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/am33xx-usb.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 7a198a30408a..654ffc62d013 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -61,8 +61,9 @@ DMA
   endpoint number (0 … 14 for endpoints 1 … 15 on instance 0 and 15 … 29
   for endpoints 1 … 15 on instance 1). The second number is 0 for RX and
   1 for TX transfers.
-- #dma-channels: should be set to 30 representing the 15 endpoints for
+- dma-channels: should be set to 30 representing the 15 endpoints for
   each USB instance.
+- #dma-channels: deprecated
 
 Example:
 ~~~~~~~~
@@ -193,7 +194,7 @@ usb: usb@47400000 {
 		interrupts = <17>;
 		interrupt-names = "glue";
 		#dma-cells = <2>;
-		#dma-channels = <30>;
-		#dma-requests = <256>;
+		dma-channels = <30>;
+		dma-requests = <256>;
 	};
 };
-- 
2.32.0

