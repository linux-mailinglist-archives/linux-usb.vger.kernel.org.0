Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68476516844
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 23:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358419AbiEAVtV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 17:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356960AbiEAVtR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 17:49:17 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3625B844
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 14:45:49 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2ef5380669cso131575337b3.9
        for <linux-usb@vger.kernel.org>; Sun, 01 May 2022 14:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3VTjpYc9+BjQELkkDsO6dDpNInM+ADeLzZMH34mpi4=;
        b=IlP4JxWiKPX4bdEFyXCD3r8ZIjy820mwzPJu5QBfX6JOIDpKbziHZBpvkLwS1biul5
         Vimbnc6q3YqDRk8Lv5gWl87dhWqMWENdviVtYTsAxbIk9GG8htKIqqRPSBp/+9HtETZK
         b/t8bZ+U1wIG7y6zWRcffdetv4BAhU7UA2QEHAQwMXONuSvmCO2rY+CtjgbI5/Ma6YlU
         kWAGtHNrt343kNKsGD+I2Y/6PvJNoiyDTUg4ZMBuoELLk6FST+Q8DrxXYDX/Mansop6f
         o3Bzc8R/DTDYkzc4Hc1n9ke1F4dA09COrrypaspfm37rYZnvy7T/tJTY1N+SNxQtplpo
         NoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3VTjpYc9+BjQELkkDsO6dDpNInM+ADeLzZMH34mpi4=;
        b=ivPj896VxqyD+brIlIoPcdZz9dGH+Me7q1+/FTamMDqUT8R8P5mbDCjF2bCYihpAT1
         XXqFJLn0sjSTiDldlWAZ5lWPnkJkk1KT2A1oDUrxJJEjIKmWt3WrqzqKPuzYKfQgVcan
         NDi2R/Vaxv94haFA8jXPuOAKkU9VyhdnqKAGGtrMoxz6lk0s1ar5HNv8RuuLbmQ582+f
         PTCPom+VbSruYn9Mv3kg1EuTnrepR9WWwZlEpE4AW+xRxVOfnRRQ2OtTGVgsVvVJa5DT
         0Z6WHwShoJ4D2z/ehXh8o38/1Ckj1iSmP9Iu6OrprdeHjFiF5ufHuG54K5OA6uOIJzMl
         2K8g==
X-Gm-Message-State: AOAM53217YGuwySKh8/AEeTt3pCmcA3zDSLh7szieylrzgGv+crO9pzy
        Qgxfpnt2xhKKa3DvCh34R/fsfXkODQM/r6Bv8X7R3Q==
X-Google-Smtp-Source: ABdhPJwxWmrDPa3pAAvzVAJiLkxc6AUbWqJKUhGlchnr506qlQhemC8j8o9s5HTpW2MMnSqOK1sjRziG/+tL7yd80+w=
X-Received: by 2002:a0d:e5c6:0:b0:2f8:c866:7af9 with SMTP id
 o189-20020a0de5c6000000b002f8c8667af9mr9171844ywe.268.1651441549128; Sun, 01
 May 2022 14:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-23-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-23-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 23:45:37 +0200
Message-ID: <CACRpkdbHyjJ+nbaU0=JSs6yDzFfNnqCJqGiKG_LW4HyAJBw8aw@mail.gmail.com>
Subject: Re: [PATCH 22/48] ARM: pxa: z2: use gpio lookup for audio device
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 19, 2022 at 6:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The audio device is allocated by the audio driver, and it uses a gpio
> number from the mach/z2.h header file.
>
> Change it to use a gpio lookup table for the device allocated by the
> driver to keep the header file local to the machine.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
