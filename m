Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4DE511D50
	for <lists+linux-usb@lfdr.de>; Wed, 27 Apr 2022 20:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242312AbiD0QQz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 12:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243817AbiD0QPa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 12:15:30 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BF33A6AF2
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 09:11:49 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g23so2492991edy.13
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sTnDbxdgS0mgXbKApiJHfHNISUe45/tlEA6w8LCqMVo=;
        b=irFFHDjYZSFyQbxpZ9xzTVBaGrJELJT/3G3x/FVcvn1xrfoe9s5IA93JcG3qBIDnxU
         iVkJIYjG9vKQqIW3FNSn5tP6ElMaBqr77XOAtGCDLYaf+Jg5THkhiNbMazW4hbvGIEh/
         NLmHWRqDRbwgEyfiv+QjroG0eMsO13vMO8aRCmbyCZ2dyl2CtS1RAelAPSuEkKom64vS
         pR+kfALVNMxQSLeIese1bDwf2/KjSk+yTA6+8g7B1UZfoL1/4u4xEgQpcmWjeO/hWY+c
         xJ04+AjqifWlGUlXOPe8zDglHMsleClC2lY7haam96Th65gT55+s/XyaQcqCHg9XBcRj
         j2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sTnDbxdgS0mgXbKApiJHfHNISUe45/tlEA6w8LCqMVo=;
        b=rXWwKRV4M64bOqwl+XBUwef0P5bzVyip3hTMblhU8p5Duh07lSxKgMiWwVW8WZyLuS
         7SIQtDwKK/UYbE2KYXN8fl3eWnu4Y0KC5rVc9FBm8XdtWed1yiNMpOuQpA9X3svZWIaA
         t1eT+t+/q+aCTLXXMrDwTTERi+yKFhrIVshc5BRUacc6wY8bxxO7hoNi8OWEJM4PwtnX
         0t5l/7c/KETi8i7s3avDAq6hLtscgs86/pyrjhFLVeRRqnzLeMAI9yT+UGcOnWlEjjpm
         71ZBGPXOm/i61IcQ7R3WYjy8mvTNZKxGlUotQOr9m173ER5lsOpXoh6dZEXlvAkiezXT
         liPw==
X-Gm-Message-State: AOAM531XNBG2tClo/1qJw/i07VPEBpLXSHjYgmloK+NqDSFGZn56fQUV
        Hzo8vuHDfz7Xb3xW7eeXuY5Lyg==
X-Google-Smtp-Source: ABdhPJyD298TvfzF7khDKxteqMwLExoT8s819j720DrOYWzLr70lt1vc+GQahx4WThk4AMSBa+pULQ==
X-Received: by 2002:a50:8dca:0:b0:425:e8a3:a79f with SMTP id s10-20020a508dca000000b00425e8a3a79fmr17010276edh.155.1651075906702;
        Wed, 27 Apr 2022 09:11:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id m1-20020a170906234100b006ef83025804sm7124610eja.87.2022.04.27.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 09:11:44 -0700 (PDT)
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
Subject: [PATCH v2 3/6] dmaengine: ti: deprecate '#dma-channels'
Date:   Wed, 27 Apr 2022 18:11:23 +0200
Message-Id: <20220427161126.647073-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
References: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The generic property, used in most of the drivers and defined in generic
dma-common DT bindings, is 'dma-channels'.  Switch to new property while
keeping backward compatibility.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/ti/cppi41.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 062bd9bd4de0..695915dba707 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -1105,8 +1105,12 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 	cdd->qmgr_num_pend = glue_info->qmgr_num_pend;
 	cdd->first_completion_queue = glue_info->first_completion_queue;
 
+	/* Parse new and deprecated dma-channels properties */
 	ret = of_property_read_u32(dev->of_node,
-				   "#dma-channels", &cdd->n_chans);
+				   "dma-channels", &cdd->n_chans);
+	if (ret)
+		ret = of_property_read_u32(dev->of_node,
+					   "#dma-channels", &cdd->n_chans);
 	if (ret)
 		goto err_get_n_chans;
 
-- 
2.32.0

