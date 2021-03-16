Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2BC33D830
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 16:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237473AbhCPPvo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 16 Mar 2021 11:51:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51844 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237538AbhCPPvX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 11:51:23 -0400
Received: from mail-ej1-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMByb-0007iR-BM
        for linux-usb@vger.kernel.org; Tue, 16 Mar 2021 15:51:21 +0000
Received: by mail-ej1-f72.google.com with SMTP id e7so5911062ejx.5
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 08:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RZxwh0t8F0/MB+nIBsx55CaTklvvT0q8IQWe2LFV49A=;
        b=B8LUqTDIBLn/XihhTjlyGPBGBs/4Ajc7+R9VDQPu8SSv/qCob0B+8mm8dZbTqKgdWZ
         Pu5c5d7+u3ve09VLmEzLRkC9SpALnvRlcRhJpAzbkZEYQOZRSPthi79HivC3wShl+JKM
         wqe6aylIIAh+pEutUDCflesTrh+QH71PaKNoEjWASyR3Ov4xAHxWWCBG8uTwqTGiT6FQ
         1s/byFOJclropc/2CQUu5ajaLSGwXU5OHmuXbVeQm3lrKA7Hvmb/NcotXW2rwE9aowDT
         gzLjORz3dm4JVpcx3j+JuA9zOlOfElFk8nxcWxX7eyc19Q1D3c7nW5uuk7ORDI/aIGta
         A+Xg==
X-Gm-Message-State: AOAM533s9Kt1G540bC2fNpt3xkI2fwrbQxc4T/gk1qOBjfrzzq38NKi7
        U+jECS9GJXZCj+Vz9s6XCt6MOE0p7/I79e4L1GZqK6cJxX4obEby3+phRT6Hf8gDaItYQypGBJI
        u1nXIOAZHmxWdVqJUniy/KNDNTP64KXty+CUHCViP/E5M4a7/MJ2K7g==
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr36357669edd.359.1615909881051;
        Tue, 16 Mar 2021 08:51:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCWwhJRSrCvCm0ahr7KMKeVzMwuwrMmx4YP7y2/DFeymMxrfWCexvNraEJX/4U746unkcfzQQxOpR9gSYKhtM=
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr36357652edd.359.1615909880849;
 Tue, 16 Mar 2021 08:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
 <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com> <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
In-Reply-To: <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Tue, 16 Mar 2021 16:51:10 +0100
Message-ID: <CA+Eumj4WirHRgr3si=nkQpNdUBcCwqLXvs-ihSi2nuJokxg=Xw@mail.gmail.com>
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

On Tue, 16 Mar 2021 at 16:47, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On Tue, 16 Mar 2021 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
> >
> > 16.03.2021 10:55, Krzysztof Kozlowski пишет:
> > > From: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > The Tegra USB PHY driver uses Common Clock Framework thus it cannot be
> > > built on platforms without it (e.g. compile test on MIPS with RALINK and
> > > SOC_RT305X):
> > >
> > >     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
> > >     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v1:
> > > 1. Depend on COMMON_CLK always, not only for compile test.
> > > ---
> > >  drivers/usb/phy/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> > > index 52eebcb88c1f..7500e77a7d01 100644
> > > --- a/drivers/usb/phy/Kconfig
> > > +++ b/drivers/usb/phy/Kconfig
> > > @@ -163,6 +163,7 @@ config USB_MXS_PHY
> > >  config USB_TEGRA_PHY
> > >       tristate "NVIDIA Tegra USB PHY Driver"
> > >       depends on ARCH_TEGRA || COMPILE_TEST
> > > +     depends on COMMON_CLK
> > >       select USB_COMMON
> > >       select USB_PHY
> > >       select USB_ULPI
> > >
> >
> > But if COMMON_CLK is disabled, then include/linux/clk.h provides a stub
> > for clk_get_parent(), meaning that MIPS has its own COMMON_CLK, no?
>
> Hi,
>
> It depends on the platform. Not all of them implement every clk API,
> so you can have failures:
> https://lore.kernel.org/lkml/202102170017.MgPVy7aZ-lkp@intel.com/

Ah, you mentioned the stub, so let me clarify more. The common clk
stubs are not used for cases like !COMMON_CLK && HAVE_LEGACY_CLK (or
HAVE_CLK, I don't remember). This is why you can have a MIPS platform
defining some of the clock operations thus not using COMMON_CLK at all
(and neither the stubs).

Best regards,
Krzysztof
