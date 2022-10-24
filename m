Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4E860BBCF
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 23:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbiJXVN5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Oct 2022 17:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbiJXVNa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Oct 2022 17:13:30 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3A99F34B;
        Mon, 24 Oct 2022 12:19:08 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id n83so11832935oif.11;
        Mon, 24 Oct 2022 12:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIBzsXoRmDPCk+QGItVKsAnVTVNA5SJC3SeSu8UPZ0Q=;
        b=mxQII/Jy11+yUIWhqP2PeP/Lr5BZnFAyoiWSsR67VgllbOqCaHbffVdgag7PditIqG
         T3Yj8xynxS6yQkYDJQkTQSS8HcuG+KCC3qKsR0yIr207Fj43g9WgxVgWEU8lpAjWdmoc
         6iLCrydLb2bIii1k6Rjkxy9/B+NhHDbeT320FBBRLnFhva8C3l8tHL2JopTXczJafejH
         LQcmBzdFDRNXzHb+gBZRobEDhjQtczFcpHHAGKnFTdWQ5MABWWZ1iU7iNm7JPiNBH12L
         4q0FP/5M4u0OGmjH1JbEzWFAUhpF00tQpHTWcQDfSeMLHlDdNXpedQ/UyETzFyiHPGAd
         UQDg==
X-Gm-Message-State: ACrzQf2tz6RR+gTPoOrmHhTioArP0XOk3sgav0UoPNkTiWTa44V34FZO
        sb3vKL91t8/7pItXlJ2A3DVOWr2T+g==
X-Google-Smtp-Source: AMsMyM4MB6WxE1PPXgNUticTmOt/0jgwpX4JDtNdVwFd2Y/nV7ZFEF/0yX9UhR/ug7Xqhywv3Aw1Dw==
X-Received: by 2002:a05:6808:16a6:b0:351:7211:6192 with SMTP id bb38-20020a05680816a600b0035172116192mr17441079oib.251.1666638994336;
        Mon, 24 Oct 2022 12:16:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x6-20020a05680801c600b0035173c2fddasm172201oic.51.2022.10.24.12.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 12:16:33 -0700 (PDT)
Received: (nullmailer pid 2064239 invoked by uid 1000);
        Mon, 24 Oct 2022 19:16:35 -0000
Date:   Mon, 24 Oct 2022 14:16:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v1] usb: phy: phy-gpio-vbus-usb: Add devicetree
 bindings
Message-ID: <20221024191635.GA2060090-robh@kernel.org>
References: <20221022121149.3329641-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022121149.3329641-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 22, 2022 at 02:11:48PM +0200, Linus Walleij wrote:
> This adds a simple device tree binding for a GPIO-based
> VBUS detection PHY.
> 
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/phy/phy-usb-vbus-gpio.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-usb-vbus-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-usb-vbus-gpio.yaml b/Documentation/devicetree/bindings/phy/phy-usb-vbus-gpio.yaml
> new file mode 100644
> index 000000000000..4e10b58f8235
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-usb-vbus-gpio.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/phy-usb-vbus-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO-based VBUS detection USB PHY
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: A VBUS event occurs when a USB plug is attached to
> +  a USB host and peripheral, the voltage (VBUS) is exposed from the
> +  host to the peripheral when the last of the two ends of the
> +  cable is plugged in. This can be either on the host side or on
> +  the peripheral side, whichever comes last. It is possible to
> +  provide a very simple USB VBUS detection mechanism by using a
> +  GPIO line that will trigger on an edge event on the VBUS
> +  pin.

We already have Vbus GPIOs in the USB connector binding and there is 
also the usb-nop-transceiver. Surely one of those works for you? 
Preferably the former.

Rob
