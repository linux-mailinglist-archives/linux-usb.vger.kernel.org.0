Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D4B55935F
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 08:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiFXGZp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 02:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiFXGZm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 02:25:42 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F6150B16
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 23:25:40 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id u9so2916949ybq.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3WRM/jegNDF7MJkfKHHwllsaLEoDBdN6Clej3P/Y4lI=;
        b=D530abNNVW04AkYbW5cBkqRo9d5231SDuKgu4fDW7AaH4jE4mVT5OFUcx+HC+Oclit
         8chp6jbBbNGEk0P3WtO4E/T3LUNKEl4CZYHCB8kDC72f1y33a5Jl8zQdYz/7h8rofzI9
         molKE7wLhlBuYhpF8PG8/LP34IC1bse0Fsc34U93w63mTGtgoR/kSBJU3IAZV6RJIDoX
         vewJ811NMZGN+RX3N8aqUoPR3IjQiufTbvKsQ7KYzVX9rrK377CYprRQ3djZSphTlWnA
         kr90KekhWjo1rMkgj80oOFkzfZZBsx36WCy428UlmluupR0YrGtaLVqkr96HnOa5PXRo
         +Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3WRM/jegNDF7MJkfKHHwllsaLEoDBdN6Clej3P/Y4lI=;
        b=TLOjD+473IXchyFt1lERfWq/F7Iz+MvnNv1F1Smv+WUW1P2+QghvAdl0/v7djiPzLf
         WG123h/PkHny5h9MH3CwmNEMqR+8fEolcjLdvbo/CGtStbD2hJPKvpXCVyBEXtVg9/FI
         YcJ+TlV/xNY5i8k8PVo/wuDJJ+YbrMT/TceAiWAHVA1yYXJ0RieyF6SlqVDSzsAJ0dhE
         UdlKJeFJJOreJicatrVcJHEHhsk5eM+lcKQZlWSe2k2h1byKQadEH8WaCX4trver31KI
         ovpUwRqadqnKwljrbKnDURd2EB7UKS1hEhVWnCq6OhdGJ173a7aEKvTncX6z9fFsnSga
         8Bjg==
X-Gm-Message-State: AJIora/fmKog3TDCsEyVlfN54reChQRmnE2lKG/n6E29OhkTM8lFXtjI
        u87XZXLuwijZKzSWBcVfl0611O68KbJvfef4G7gJpQ==
X-Google-Smtp-Source: AGRyM1sT2bkts91ktfEoGKQU7+LXoN5AOODxkIaXfQ8ZFlQvpAh1fKz3hE77tVb6U5oyh1MbZfwUv7onSbM8QOjAaWU=
X-Received: by 2002:a25:1f57:0:b0:669:b6fa:167e with SMTP id
 f84-20020a251f57000000b00669b6fa167emr4052148ybf.295.1656051940195; Thu, 23
 Jun 2022 23:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-13-peterwu.pub@gmail.com>
 <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
In-Reply-To: <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 Jun 2022 08:25:29 +0200
Message-ID: <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
To:     ChiaEn Wu <peterwu.pub@gmail.com>
Cc:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, deller@gmx.de,
        devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
        szunichen@gmail.com, alice_chen@richtek.com,
        linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, cy_huang@richtek.com,
        chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
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

On Fri, Jun 24, 2022 at 8:23 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> Thanks for your patch!
>
> On Thu, Jun 23, 2022 at 1:58 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 current sink type LED Indicator driver.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> (...)
> >  drivers/leds/Kconfig       |  11 +
> >  drivers/leds/Makefile      |   1 +
> >  drivers/leds/leds-mt6370.c | 989 +++++++++++++++++++++++++++++++++++++++++++++
>
> There is a drivers/leds/flash subdirectory these days, put the driver
> in that directory instead.

Sorry I'm commenting on the wrong patch.

I meant this one. Move that into drivers/leds/flash
 drivers/leds/flash/leds-mt6370-flash.c             |  657 ++++++++++++


Yours,
Linus Walleij
