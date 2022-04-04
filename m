Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8CE4F1C69
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 23:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380017AbiDDV0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 17:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379183AbiDDQmu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 12:42:50 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A424435855
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 09:40:53 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b24so11777528edu.10
        for <linux-usb@vger.kernel.org>; Mon, 04 Apr 2022 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ZqvkPw3Hjyi4guP02Qxx6l3xEam/WU15QhmnpKxTbA=;
        b=giIzCO1vBg7bdLXYJ0jHXWpMyuBAPdR/crAo7hdQl76bbonFJ/KpJa9sqrQeG+eShV
         OSuWw3bVC1JBb4raXTUMtkkpWZBqnJYUJI9NE9Fs6suiXNBgGFTIm1vm0Szyo2N7NPAs
         m09XFd0REdtCLingfc8O1k2ipntxCAdK5Xwi6IwoUoAzfAT1RqtlTNZW73pWLXpMYgM1
         872n72c2L2sD+Fq/W26z6S97OQfrdpdAX/AwW8z1kVB+fi0AfvECnStJ6m+y4T7wKlHC
         Aa5rImUCWKsC76cOaOfqEZnww1whGheyVEMa9S9pQtIlIGZJiLwul8ocoDo6Z9i/4uV2
         eokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ZqvkPw3Hjyi4guP02Qxx6l3xEam/WU15QhmnpKxTbA=;
        b=SYmxJpLX/AVw/ia2dcGcFUqwlaap7tYXZjdqq0Fr91rAsfsFbZwEwfL6Tn64sUzUrA
         ezCGTlMbDf6iyEbfg/ui7SeJjmexlZnpgRTZb7Onj2N6Mo7ompabBr1ou1doZZw84rhU
         cX2+aGg5NuoapbIXV59K/R4kEuWIowdfDVBh5wDIvlfv7k4U/Y8sJPWCFDFm7hJSUg1A
         m6NY+p7RucefCVtkM9U/CTShlBsTlcDdTZp8ip+z16y8eKBm2GjJC7432A5gfYPD9g4/
         uqu6XHZPsgyVT3H3wRTaEXonbZsTCF7CIUpiusgpMZvb0EeExxLGP4T7M5XIrukyjeqv
         Ce9g==
X-Gm-Message-State: AOAM5311qsvAxHKT1gs+8n3hhVaYyFEQ7pouH0BC3kogFBj5DgZGpWQ0
        9hHoHBTLafLpErGYkzZXRIjxYA==
X-Google-Smtp-Source: ABdhPJygljYbgi62MuSIHPxfZNrGxKsv/yrrADdG2l5X1N2m213B0uch95wM9MHAqG+Z9mZJYOs6Dw==
X-Received: by 2002:a50:9358:0:b0:41c:bcf0:3a95 with SMTP id n24-20020a509358000000b0041cbcf03a95mr1086251eda.20.1649090451998;
        Mon, 04 Apr 2022 09:40:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id pk9-20020a170906d7a900b006e05b7ce40csm4548231ejb.221.2022.04.04.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 09:40:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v5 5/9] ARM: dts: exynos: fix ethernet node name for different odroid boards
Date:   Mon,  4 Apr 2022 18:40:47 +0200
Message-Id: <164909044624.1097466.11264335549854460793.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216074927.3619425-6-o.rempel@pengutronix.de>
References: <20220216074927.3619425-1-o.rempel@pengutronix.de> <20220216074927.3619425-6-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 16 Feb 2022 08:49:23 +0100, Oleksij Rempel wrote:
> The node name of Ethernet controller should be "ethernet" instead of
> "usbether" as required by Ethernet controller devicetree schema:
>  Documentation/devicetree/bindings/net/ethernet-controller.yaml
> 
> This patch can potentially affect boot loaders patching against full
> node path instead of using device aliases.
> 
> [...]

Applied, thanks!

[5/9] ARM: dts: exynos: fix ethernet node name for different odroid boards
      commit: c1ed0f41032f54e47c03088f096f8b37cae40d8e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
