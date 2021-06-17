Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90A63AB514
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 15:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhFQNol (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 09:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhFQNok (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 09:44:40 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5492C06175F
        for <linux-usb@vger.kernel.org>; Thu, 17 Jun 2021 06:42:31 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id t3so4078024edc.7
        for <linux-usb@vger.kernel.org>; Thu, 17 Jun 2021 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oOaJQIcCyNWj1wfkuxFXnauy7qajNPtRo3ir6b4xKrU=;
        b=dCBUEhvUCeXDJ2ArbTaxnml9mikTJU7Tid+cvqEDy6X284r+mQ+BgblFnrd/49SBC5
         nKCbA6iatkFImQapUCCGRvCNDD0xuOawMucT0r1Pqih1VT+TrP0YAXdVbYLS387OGnGE
         AujnA56yVoFl8bbXN1J23XZU72U03aNSTKdAiG+v5Cgk4Iaz6/r3qhwWFMncnkCJEieT
         9xTibGAjeAwcwbcRzk2/JM4bB3rKxnauCAH3v3LoznQkO6wsjOjuXnZeffHtpXJ8ZxK4
         YBSw3jvU04KjMrmDEqawHI4H2Ea/Ce6XOfybyRklmul5KyPieNSFfzNL+ItyIeh6omrG
         O8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oOaJQIcCyNWj1wfkuxFXnauy7qajNPtRo3ir6b4xKrU=;
        b=TsFWT5ayP1/RDLqKukdRY4oTfnf7WeJ/ngGUI+dQJvj8Uo+iH0iYj/oCqqOsGub8BV
         yrXJL8yvp0YYKQuSkRab0vTWz5wyjYVdBJhZMQLIc9tAEYxghPv6oFG1G0GZU0buOlUQ
         ldeyLNrntN+8DPjT1DGoyJ8lwo33+FvcvpmHgfYnt5KZEIv9QXedZYNQlXkJx991TBSZ
         CUPNxn9mRizpPj2WtyoHqnW1iT2wjeBjuk3GRBzGP6VhNiWgPLFmZqnlI9whEdKXyOKG
         /LOEhNqnm3H0wtDyhNs6d1J40Mna8pWGqZwNUXg12w7uhLyuRSjC+qQ98v4sRlsRIckb
         IHag==
X-Gm-Message-State: AOAM532jzadPwQjAi9j8TcDWIFEGt5AyrXRjeq05MxUNmzH9Ol/G3pyO
        2hU8h2CIeU01qJLgwmXChbxlDX5mUQra4kh+C4gvgw==
X-Google-Smtp-Source: ABdhPJzoXPzFTb0Y8YMHk+/newTpxqce3TAq4tlpZ/Pgb4C7h4RGjzu440TjUvqpuB++gyoIfwLzOVijCTFnpUMiQrA=
X-Received: by 2002:a05:6402:28a:: with SMTP id l10mr6522215edv.365.1623937350279;
 Thu, 17 Jun 2021 06:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu6er1nZ602gCnrY+-JNtDHrUJk-RH2biPmjRoe06_m4Q@mail.gmail.com>
In-Reply-To: <CA+G9fYu6er1nZ602gCnrY+-JNtDHrUJk-RH2biPmjRoe06_m4Q@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 17 Jun 2021 19:12:18 +0530
Message-ID: <CA+G9fYuL0wzb1icGrwkcwy3+8-XcB4Hgmiq5SwBnGG5hM3iycw@mail.gmail.com>
Subject: Re: [next] [arm64] allmodconfig build failed - xhci-plat.c:427:
 undefined reference to `onboard_hub_destroy_pdevs'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-usb@vger.kernel.org
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+ linux-usb

On Thu, 17 Jun 2021 at 19:09, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The arm64 allmodconfig build failed on Linux next 20210617 tag due to
> the commit,
>
> c950686b382d ("usb: host: xhci-plat: Create platform device for
> onboard hubs in probe()")
>
> build error:
> ------------
> aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> `xhci_plat_remove':
> drivers/usb/host/xhci-plat.c:427: undefined reference to
> `onboard_hub_destroy_pdevs'
> drivers/usb/host/xhci-plat.c:427:(.text+0x82c): relocation truncated
> to fit: R_AARCH64_CALL26 against undefined symbol
> `onboard_hub_destroy_pdevs'
> aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> `xhci_plat_probe':
> drivers/usb/host/xhci-plat.c:379: undefined reference to
> `onboard_hub_create_pdevs'
> drivers/usb/host/xhci-plat.c:379:(.text+0x131c): relocation truncated
> to fit: R_AARCH64_CALL26 against undefined symbol
> `onboard_hub_create_pdevs'
> make[1]: *** [Makefile:1252: vmlinux] Error 1
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:222: __sub-make] Error 2
> make: Target '__all' not remade because of errors.
>
> steps to reproduce:
> --------------------
> tuxmake --runtime=podman --toolchain=gcc-11 --target=arm64 --kconfig
> allmodconfig KCONFIG_ALLCONFIG=arch/arm64/configs/defconfig kernel
> modules
>
> Build:
> --------
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_sha: 7d9c6b8147bdd76d7eb2cf6f74f84c6918ae0939
>     git_short_log: 7d9c6b8147bd (\Add linux-next specific files for 20210617\)
>     arch: arm64
>     config: allmodconfig
>     toolchain: gcc-11
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
