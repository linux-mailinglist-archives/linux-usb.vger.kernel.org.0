Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2CC5B89C3
	for <lists+linux-usb@lfdr.de>; Wed, 14 Sep 2022 16:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiINOCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Sep 2022 10:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiINOCD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Sep 2022 10:02:03 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5755C792D7
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 07:01:17 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id r12so16827612ljg.10
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4I1nWuKw3OANLT7/DYo/zylVSp6G+u/GpJfP6xzHR3E=;
        b=brLbhteVZvljyIvgq/BZuRLdaBrU3dauTxDoV0afpm3D8G8eC+PzDhihujize4u5bY
         xgox21O6n2RkerLtHPJSxFlI9Ypd4EaaCMtXQ7yq5LZNyMV3rxWn43mV+DL93secxJ35
         4Mo/5OnJiR6EUaDKMTG+vYej6lxDoTN17UAF7qfMYvtkuVe2JYPn54zshCzOug6c4hnm
         0PMtdZptGI+KTwKQPmr17gsklS46PN+JxnAiFa0Kz1YXmHRDDEHnUiBiga5Vbxp6gH4i
         w0hl0XbK0nFJOe2yMuLg3FVQgvh34lleAXvP2oQC+kW2m8mmi10ye76Qq7J6zmCtULXy
         wI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4I1nWuKw3OANLT7/DYo/zylVSp6G+u/GpJfP6xzHR3E=;
        b=bNcCszXkebzTNg3NFTNmxcQnAdHbuAGkmSlkfpRID8MROw8pn+UHysgo1/E6BLXNiP
         SPwBbrKo7lBnk8o+lO96dl0Q8C0pYLiN+lIp5hW7GYEBYDZFBkFdB8qyRqSzn/qEbKa9
         W6rnxO0D11jAUCo7/35WuEgoX8/dDUO0a3wgLLi/YmQ6YEjytS+eqfiB+2zpmyGlY6lC
         ELfSYb12/cnksPPXq5ZHkxb00eCYY+w3pqn0khEPrjWnWg1ymPuaVnCdx/lZL/2rIsR8
         0H+ReeGHSc9v8Q1brIcaz9IoN3PcVhJYfD6QZWD54JL51PAmRUwyy/S+1X8KWqo/gcxB
         IXIg==
X-Gm-Message-State: ACgBeo2xNTHrfSeIUUw2Pu+iQFqeHQxC8/SstJdJOIHT/9d8txE1dpBW
        7wuqJBPYQQUROcx7s1Vl02fnflm7cL6ESyJAMPke8Q==
X-Google-Smtp-Source: AA6agR6JkJbCqyE2gTrtp6CclhDjtY75sWE4XsKvRX/lZhn/DSwVZZASJB/yTmhXGA6tUkOdrnfrqI0qNyYf9XVzF8k=
X-Received: by 2002:a05:651c:214:b0:26a:b03b:9e0c with SMTP id
 y20-20020a05651c021400b0026ab03b9e0cmr10198201ljn.463.1663164075540; Wed, 14
 Sep 2022 07:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220909212543.17428-1-jbx6244@gmail.com> <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
In-Reply-To: <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 14 Sep 2022 16:00:38 +0200
Message-ID: <CAPDyKFrF5Tn9a_hqp7mrp14YCrcX4LV6Y5qNxOz2ZSRJJuMmCA@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] dt-bindings: mmc: rockchip: add rockchip,rk3128-dw-mshc
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        kishon@ti.com, vkoul@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, gregkh@linuxfoundation.org,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 10 Sept 2022 at 00:02, Johan Jonker <jbx6244@gmail.com> wrote:
>
> Add rockchip,rk3128-dw-mshc compatible string.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index bad28bc74..95f59a5e3 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -32,6 +32,7 @@ properties:
>                - rockchip,px30-dw-mshc
>                - rockchip,rk1808-dw-mshc
>                - rockchip,rk3036-dw-mshc
> +              - rockchip,rk3128-dw-mshc
>                - rockchip,rk3228-dw-mshc
>                - rockchip,rk3308-dw-mshc
>                - rockchip,rk3328-dw-mshc
> --
> 2.20.1
>
