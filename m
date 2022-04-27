Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4D2511E32
	for <lists+linux-usb@lfdr.de>; Wed, 27 Apr 2022 20:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242634AbiD0QRf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 12:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242445AbiD0QRI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 12:17:08 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE15081FCE
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 09:13:32 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z19so2502992edx.9
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 09:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJ0Q0VIVseR/Xb4PlIow7xAWcCO8wMqCFaxsrqIqI0E=;
        b=z36uwV2biMuX7aEOYbj+qX86qD6s9FGt0SQ37STxHrtt4/vndOieapuTz7F7UCWZAW
         aiwA6CYM5/L0ZrALS2ikzoY2VbWvevf7pcQB9Jm0//GioGOqRtZH6zP29/BT9dvzuD52
         D3jNBi60NuVf30cZBAEIpS9Z/geexHVdwE4af7qnjwziiMnCGBAW2xJPx4RkjZSxfEX9
         T3cy7syL04bfGoPPIOIZz7hds3otV7gzlMEtSH7Q9wcbLUSeXsY2Gm61PIN8E+g4p2lL
         khBtS+fkTqh/o7EwWcaTD/tqYtsC6foBHUXUaDE0GpoXuwK2Uzowv6jKIAnBp/gisIuM
         UZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJ0Q0VIVseR/Xb4PlIow7xAWcCO8wMqCFaxsrqIqI0E=;
        b=zVK3rJm1gETwI2Dh20BRSwqqgLLAOxrGJo4VjDQ+Y9gEkAkAjVHeWMAvNktIlt+P4W
         J38A7LgrHMrzPey3+0EBjS93Cnw5cfH5aDaHCi6HtuR2X8Qp8emt2uNMOmtmWSNKQNJ1
         pWyJG9LJTyAwzpAjGzgz5Nq1ED9GiFO74hrijbn5lJ8dZL9zC3lBGctY5EoOB3JtwwJT
         CMbNDNkM57U9OMRjpOej/LmtbltSnFtLTNA42kC7z3Am4dY8LJPlOvBvShoVcILSM5zO
         IB7jwppyKceyd922eb872drXPFSKtB/Iev5cU38K8w3KX3fvHy5XUYpJwtduEhvXFiad
         pVNg==
X-Gm-Message-State: AOAM530ztWi+eQQEVchZJUHfnugbBx2ekX3d/oc54dzAmmrrpEE1SUPo
        XCjInkljg/sq+bxqCXQ1Q+QU6w==
X-Google-Smtp-Source: ABdhPJzSn0FYas1QV4SMn40wPscL93D8P1JanFGmr+WWiNVuEvgQMnwABPrQW4yIKtaPwlnhry7ubw==
X-Received: by 2002:a05:6402:34cd:b0:424:793:9f65 with SMTP id w13-20020a05640234cd00b0042407939f65mr31284723edc.88.1651076005315;
        Wed, 27 Apr 2022 09:13:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n5-20020a170906378500b006efb4ab6f59sm6991197ejc.86.2022.04.27.09.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 09:13:24 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ARM: dts: da850: use new 'dma-channels' property
Date:   Wed, 27 Apr 2022 18:13:18 +0200
Message-Id: <20220427161319.647342-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
References: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
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

The '#dma-channels' property was deprecated in favor of one defined by
generic dma-common DT bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/da850.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index c3942b4e82ad..0e8b42a95ba4 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -679,7 +679,7 @@ cppi41dma: dma-controller@201000 {
 					    "scheduler", "queuemgr";
 				interrupts = <58>;
 				#dma-cells = <2>;
-				#dma-channels = <4>;
+				dma-channels = <4>;
 				power-domains = <&psc1 1>;
 				status = "okay";
 			};
-- 
2.32.0

