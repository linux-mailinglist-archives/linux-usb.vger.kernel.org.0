Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612C251685F
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 23:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376336AbiEAVwE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 17:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350281AbiEAVwC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 17:52:02 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639C349244
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 14:48:35 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f7ca2ce255so131576947b3.7
        for <linux-usb@vger.kernel.org>; Sun, 01 May 2022 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IF3vEg3+jPF9cVJcI8jPci4JS9DP0GVP7RD7934mEjE=;
        b=zwY5ZnqN7kNhGK99pE/WVaiRJMMJk1J46UwT4pwImXGX6UOmFH90vIl3pqBFOiefpf
         XGDauOFPVnr0N+wehwWqxGedJrPEnCfA7QYfI1Ud6pUqjR0VJCUMCPCgmokVJfJlO5J3
         9fgUKiXoKaLiNlZ2lnMOc8odLW1cWM39J6DifJp1VzhPP3yFCswh3y7kpJGPLRycUKkx
         MOm6n0oCCKvOF9FQQTqGTr1+Nj0qDNWhyJnFD6sUHzDc8vvEHbsUWHtvJVGJUVLO7jGU
         zEl/kVv1ENb3aFDPeJIshWrcYr3gbS2Bho2vG2ESmIY+jYGxLU0tAEUviHdRTMa60iKl
         bN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IF3vEg3+jPF9cVJcI8jPci4JS9DP0GVP7RD7934mEjE=;
        b=U1bA1IlyfphizIfA7HJnORG43FgMyxonLhb9fw8AzTlxygneRHLhg3nZsXL/35gL/L
         uE5GGmCKX4wrBa/4Yueplq2Y+VHiRqveb7RsT7rP5f9jVWpvhdHOs/iqjD9IjuM1npsX
         F3wsUEaimJAw5ipR9gBf8ZMrFOVo9ZXzbdIzKpfKaHhDM0l+C/5fiJh41SRkSvu4luYO
         AAMFEvD9NMy1ObvJAgVMTF3vv+o03Ty11wnq4I0rEyAu2tPFooX+mhVCeLsfIehl+UxL
         w5ffs4V0rTi3SGmt0bRzRNpBpfRJBX1neLQEt2iZ9thX35K4ANtYVEZw5UQBEeJsjDAF
         cEag==
X-Gm-Message-State: AOAM532V9QQVYba4PDVAWbWVgVblQWWR/l9zsUfVo6njggRTiWLPEXZJ
        xAk59/gRMJPN2Qs/eJaLBz8XGRjIKArIqq11sTnAog==
X-Google-Smtp-Source: ABdhPJyC4yrP3wkFWKCa3+OUAbpp0OAp6QL2ydyOZCULhsvaONngjc+9/s4GocTjYt3qkP0LOVwZrKfaB6+LtqaJLgI=
X-Received: by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id
 z186-20020a0df0c3000000b002f4d2919ddemr9084184ywe.437.1651441714674; Sun, 01
 May 2022 14:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-25-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-25-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 23:48:23 +0200
Message-ID: <CACRpkdb8kDuia5udsUSF0f2rvPeyYGoxeUVV_ppAvEaA7cRxiQ@mail.gmail.com>
Subject: Re: [PATCH 24/48] ARM: pxa: mainstone-wm97xx: use gpio lookup table
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org
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

On Tue, Apr 19, 2022 at 6:42 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver hardcodes gpio numbers without a header file.
> Use lookup tables instead.
>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
