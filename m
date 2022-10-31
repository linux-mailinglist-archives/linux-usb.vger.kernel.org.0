Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2205613E95
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 20:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiJaTzW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 15:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiJaTzV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 15:55:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DB413F88
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 12:55:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id a13so19048028edj.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 12:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DF4wkWvWXegmip018YfFTMUIfpvZ++f68WTZSD1bWH4=;
        b=b/AhgHxwilfewDUeFdF7w5tS1qudHYwzeXYHCeNTee8gy7zQX39fPcLeEM+Wg2XbVc
         OMXGEWO82RD7yGQEkDfRc2i0aqOuYklgxxBLGlc3zsxIFDUxm5azTpth70VNAT6C/K0V
         Sp55l2H8ExCVM971zGFtptSmbXODgOa63SoNl/bpXl2unUrPP8r7gJoRJ5lyg749pl8u
         tk7UmZgFsHQ6SrAr8fiCmWbrqAdFMgUuBhxhyH5fE2JHga4rzsYrQkaLeck9SCqq868x
         v9dDgVFzZdrz6jmTK0GaAXL6a36GJmr4G2f5Kt0kQpPmy2lPsBMyIQ8bASyY8Ivup2CE
         0YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DF4wkWvWXegmip018YfFTMUIfpvZ++f68WTZSD1bWH4=;
        b=4gPmS1AqAvZjB3tLi9y88oHA1bd+vqWnusYrIxe+Hl9waXXg5zN/H/+KcufSGkOybY
         kihhRcJHMOOFZ/I6VyEwTm39u2Bqbw4+KRJfpac9uwv+7Y5V7MoG81pwW2qUY/jTbG2Q
         dGredIJl55orJAhEYjyj8Fi7UBsbNZRm71yZuKVeJsSOAFMcC9vC8EclNJbUIphe6Bqq
         oIyY2pHbfWgp+pK3ZRk1M1PQVQ/4wBZh8wm8ZuTNZXwkEuD1d9C3v3rSJlMBOmlr1S8U
         56gU+JLW/N3FOaaibkHnZbo1YkvtGFTGwUZbM+zixVoi29uwhEI4dfI7DMEdVk0mUIyJ
         CGGA==
X-Gm-Message-State: ACrzQf2KfTwbAx6YQ6sorOhQHCM4vQ1CkVg6qmR0EtTC6qWTovRmr1LG
        7cPxemhE+SX1SiwHNGb9/qCyc3LcB9t5RbWIY96J3Q==
X-Google-Smtp-Source: AMsMyM56VjnjVqw1pPVrEHK3+oaJydtdMBXaE2SuGomtgUtwtlegLzPacGGZ1UIeWQGuFFHcB8CXww6lQcbWYaPdUiY=
X-Received: by 2002:a05:6402:1bdc:b0:463:6315:1b96 with SMTP id
 ch28-20020a0564021bdc00b0046363151b96mr6249924edb.158.1667246118524; Mon, 31
 Oct 2022 12:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221021155000.4108406-1-arnd@kernel.org> <20221021155000.4108406-3-arnd@kernel.org>
In-Reply-To: <20221021155000.4108406-3-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 31 Oct 2022 20:55:07 +0100
Message-ID: <CACRpkdYayAm4rxg3taUqDa_9YCTK+EFiGKAoMETQd+yg1C83-w@mail.gmail.com>
Subject: Re: [PATCH 02/11] ARM: sa1100: remove unused board files
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        Lubomir Rintel <lkundrak@v3.sk>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Chubb <peter.chubb@unsw.edu.au>,
        Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 21, 2022 at 5:55 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The Cerf, H3100, Badge4, Hackkit, LART, NanoEngine, PLEB, Shannon and
> Simpad machines were all marked as unused as there are no known users
> left. Remove all of these, along with references to them in defconfig
> files and drivers.
>
> Four machines remain now: Assabet, Collie (Zaurus SL5500), iPAQ H3600
> and Jornada 720, each of which had one person still using them, with
> Collie also being supported in Qemu.
>
> Cc: Peter Chubb <peter.chubb@unsw.edu.au>
> Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
