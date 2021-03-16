Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47EF33D804
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 16:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCPPr7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 16 Mar 2021 11:47:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51718 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhCPPrn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 11:47:43 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMBv3-0006LZ-3X
        for linux-usb@vger.kernel.org; Tue, 16 Mar 2021 15:47:41 +0000
Received: by mail-ed1-f70.google.com with SMTP id n20so17946828edr.8
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 08:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=inY6i8A4Tqqf26IRTTPmHrEemCAIy4a8P6L1PcnGZLw=;
        b=NFxMoq6WuJx8mTvFOkWkhEEiQcyOP/hhjNZEW3O0tujwXrtCLa5FHMKFtcQa3dEJZa
         QyZwziateET5lTXpayYl8rcXIeNUuQ1JH5b9PsRJreViquiNVFYF+QEMYD1GjZ1TtB6n
         aGYeaMuBCdC9RNhbI/ZK42tqSLGhT4QB8r9J7EsUPBVK1nImQhXjRw0K16JA+auxLEEs
         V5BczAim3DJvdlEum2uExxlTrFTNrKVmwYd90yoeIkCEUbHKKsFno0VI67Oj5kibzO5S
         5sXclyyWG2QovLl2QT5ZUtu8AzFA8ZsWSA/MUpHgaqmmaoxLsCQZxhfDDpT2PNwK4IIW
         a2kg==
X-Gm-Message-State: AOAM530Jo3SeLNASvRl8VpEQH4rREWgnDwbNCoyXA7bLKqQ5/22bFEy9
        9KuAMNApsZmKtO72rbrvlwRXj3zgAL7RE1DojIcQ3wA1H/A86b1kQselStmPKLirs7v842GcWA0
        UnFcviYe0/3g0ODVnjk6P7WPf+5SeqHDIcU5toERvqm4uEL9gx6Sahg==
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr36699080edy.49.1615909660871;
        Tue, 16 Mar 2021 08:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuw/dJQo9rH0tFlvYp4nm03MBWw0FLDNdvROj1KnIALerZB4yUNuZjOR6eHwi+Wa1HgbEZ0IePzPZ4lEB2wsg=
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr36699067edy.49.1615909660757;
 Tue, 16 Mar 2021 08:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com> <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com>
In-Reply-To: <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Tue, 16 Mar 2021 16:47:29 +0100
Message-ID: <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
Subject: Re: [PATCH v2] phy: tegra: depend on COMMON_CLK to fix compile tests
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 16 Mar 2021 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 16.03.2021 10:55, Krzysztof Kozlowski пишет:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > The Tegra USB PHY driver uses Common Clock Framework thus it cannot be
> > built on platforms without it (e.g. compile test on MIPS with RALINK and
> > SOC_RT305X):
> >
> >     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
> >     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. Depend on COMMON_CLK always, not only for compile test.
> > ---
> >  drivers/usb/phy/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> > index 52eebcb88c1f..7500e77a7d01 100644
> > --- a/drivers/usb/phy/Kconfig
> > +++ b/drivers/usb/phy/Kconfig
> > @@ -163,6 +163,7 @@ config USB_MXS_PHY
> >  config USB_TEGRA_PHY
> >       tristate "NVIDIA Tegra USB PHY Driver"
> >       depends on ARCH_TEGRA || COMPILE_TEST
> > +     depends on COMMON_CLK
> >       select USB_COMMON
> >       select USB_PHY
> >       select USB_ULPI
> >
>
> But if COMMON_CLK is disabled, then include/linux/clk.h provides a stub
> for clk_get_parent(), meaning that MIPS has its own COMMON_CLK, no?

Hi,

It depends on the platform. Not all of them implement every clk API,
so you can have failures:
https://lore.kernel.org/lkml/202102170017.MgPVy7aZ-lkp@intel.com/

Best regards,
Krzysztof
