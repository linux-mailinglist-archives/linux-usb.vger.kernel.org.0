Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D4555934D
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 08:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbiFXGXk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 02:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiFXGXj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 02:23:39 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEC3289A1
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 23:23:38 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3178ea840easo14894157b3.13
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 23:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pWYuiEty7n8qfKXbe+MlxripfjF42zMy4YaNonGDYE=;
        b=LWlf67Kpn5DO70LzfZDzY/86k3RghUlz3LHvmFCRfp9vgWrB54PqfNu2vRF/Bdm7wc
         ap99VK+4MQUQ+6cin3CVK00IbKjFwKj9hJY00FJWKZ+T6+Tsx1JzMXtnbwqHGT3mulUt
         H0L5JKLz7ywUjS16o9iBqqT0TcachObVtQ0ucF3TSwp90e9HmJH9RNV0ZQ6J68d/kYAX
         nEwFuUDUzDBezOwyq+6kVSYL3YCsnU3Px78klL9yrKaUWJlgIKUKeZJtWjG29iFkSFiR
         pek0U91njY9MeCQ1UyKutB0l8JPIg8lysMDZ0xBMr3cTNS7GpTVSDFQe1FKYX2yHrOFZ
         WIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pWYuiEty7n8qfKXbe+MlxripfjF42zMy4YaNonGDYE=;
        b=LceX0R50FPO94QpdM0VXw3zIS2YSwR458jhbFgmTCZDBGzQg1ITRSVJrSGZml12rzi
         JCdcMxoUO2rkMq8qZ240KnfBBIEMOdkmr0b9Qeqf0rd784wWqG05iMw4Aj1vDd3L+4wY
         PJyR/qHI05uw8FwmEfuQ/H2jHF3h7uD9cDrix2hH2wp/NEtRX73P85wB2s7o/6rF2aCQ
         /Um07xeI2m77fzaRhRlZwr66yB5r6aw8jtvBeBqINblm9KDcjNfga207rbjglRejTWgd
         xLt0x64pJG7brAdgLpKF05/fOffh+m9guc8CVQxJ1eEsqcdG6qVU+I7yfVtbeJRbDpiy
         g8ug==
X-Gm-Message-State: AJIora/Ge9A+nD+bM27WE31CPVBjEaIWZjtdH0049F5rnwzTxv9UHZtK
        n0KcPLtzRh7zBnYY8PIbz9WH34fPClzuAf5Z+wCwzw==
X-Google-Smtp-Source: AGRyM1ugT6Af5nX5Ixp3Ow5c+O9Je/TdD9Y/945uEnJCiYAwQr3zWQy2YOg5odN0QU1EceYIiYefh3gmTCwAPJv1mBE=
X-Received: by 2002:a81:6587:0:b0:318:38c2:2fb1 with SMTP id
 z129-20020a816587000000b0031838c22fb1mr14986240ywb.118.1656051817552; Thu, 23
 Jun 2022 23:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-13-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-13-peterwu.pub@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 Jun 2022 08:23:26 +0200
Message-ID: <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi ChiaEn!

Thanks for your patch!

On Thu, Jun 23, 2022 at 1:58 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add Mediatek MT6370 current sink type LED Indicator driver.
>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
(...)
>  drivers/leds/Kconfig       |  11 +
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-mt6370.c | 989 +++++++++++++++++++++++++++++++++++++++++++++

There is a drivers/leds/flash subdirectory these days, put the driver
in that directory instead.

Yours,
Linus Walleij
