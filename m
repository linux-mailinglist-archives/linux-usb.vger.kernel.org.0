Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BFF32D896
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 18:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236630AbhCDR0N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 12:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236205AbhCDRZt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 12:25:49 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75ECAC061756
        for <linux-usb@vger.kernel.org>; Thu,  4 Mar 2021 09:25:09 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id h10so35857093edl.6
        for <linux-usb@vger.kernel.org>; Thu, 04 Mar 2021 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dd7KDNO7pXIdpuZcWLRKydfKVZxOAkBI513NtjiUXYg=;
        b=Mm9ylSDEP1rqfd0aVL1Di4z7YCAEZYd/dpG3P6vR3IkqX8ZMMiFfgYAKG3A43crKUc
         wf1HqeMvDdrAxM00Ku1xpoPGq5dxO8bnXVjID5DBG5NsoHu2LeFZQdDhG4DEOZayGpEm
         yU+2tmol8R+C7UYNI4+rBwOBDEW4CpIDfRb/KKjXZiH+c6ukV80gPtKr4wfOSPewRDue
         NFSRfJaRRY3TKHLizFYcOSszDHS5zA7o+NiLkWIr65TG8+RPZwFir8s9xrPjxFg4exSU
         dXLrzbLNpiHV1moyridKAushV2o6onEzhTsdoAX7VBQpoosJFMpzHNvzklAohMguka07
         w5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dd7KDNO7pXIdpuZcWLRKydfKVZxOAkBI513NtjiUXYg=;
        b=bA0QgLFsSJsE6c2Rk9T7CC+T4HJH4dMZxbfisQ7z3fd+sfuefPCWrrbeScxvgAAmOn
         JO7eIWUMFAH5yc5ACuyfKbI7Hr7RPWhY3NUBMoFuszu0FGWHH7wzbo0lNzQ9kg9s9dk6
         k96u2eBy5pK/88ejzE25DA+ikB1z6nJU6AnTNyoyXb6HthnVnepIgUJ4KAfvOxo9yjBG
         nFBmgMVKcDSISFUDATCC3heuBcaBIrhvHfE/SUibR08NhC/N37NO1TNcQpm0Ba4zvZsY
         j9a1Zy9+JDA5neK9nGNIDPhDUCuMEjpKuklNF8z1Qm8tkTmqKglZLQ1htQDCclLqLvmI
         WFaQ==
X-Gm-Message-State: AOAM532Crv3M4A4kaMTk2SvKvJHW4yJ6Mt3G1ybmNZoU1eSf/Hxw6Hs7
        PqIC+mjzkGGxb7/Wi2SzPWEnSO+kx2XwfCfmhXasgUYoZkxo/aWz
X-Google-Smtp-Source: ABdhPJysnDIHieJcbdfHeNgL/sMVb+rIR8ooa1wFRpFL2X9KykSKEnKjaXWf1t6w7e5hqXA2FugzD+PsQVjqmfHVstE=
X-Received: by 2002:aa7:dd99:: with SMTP id g25mr5459320edv.230.1614878707950;
 Thu, 04 Mar 2021 09:25:07 -0800 (PST)
MIME-Version: 1.0
References: <20210222115149.3606776-1-raychi@google.com> <20210222115149.3606776-2-raychi@google.com>
In-Reply-To: <20210222115149.3606776-2-raychi@google.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 4 Mar 2021 22:54:56 +0530
Message-ID: <CA+G9fYvVdQ7t3AkguKXJDG5iNEpSXfF=U189ZPVz21tWQ3r+dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: dwc3: add a power supply for current control
To:     Ray Chi <raychi@google.com>, linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, kyletso@google.com,
        badhri@google.com, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While building linux next 20210304 the following builds failed,
 - mips (cavium_octeon_defconfig) with gcc-8
 - mips (cavium_octeon_defconfig) with gcc-9
 - mips (cavium_octeon_defconfig) with gcc-10

On Mon, 22 Feb 2021 at 17:24, Ray Chi <raychi@google.com> wrote:
>
> Currently, VBUS draw callback does no action when the
> generic PHYs are used. This patch adds an additional
> path to control charging current through power supply
> interface.
>
> Signed-off-by: Ray Chi <raychi@google.com>
> ---
>  drivers/usb/dwc3/core.c | 15 +++++++++++++++
>  drivers/usb/dwc3/core.h |  4 ++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index f2448d0a9d39..d15f065849cd 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1238,6 +1238,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         u8                      rx_max_burst_prd;
>         u8                      tx_thr_num_pkt_prd;
>         u8                      tx_max_burst_prd;
> +       const char              *usb_psy_name;
> +       int                     ret;
>
>         /* default to highest possible threshold */
>         lpm_nyet_threshold = 0xf;
> @@ -1263,6 +1265,13 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         else
>                 dwc->sysdev = dwc->dev;
>
> +       ret = device_property_read_string(dev, "usb-psy-name", &usb_psy_name);
> +       if (ret >= 0) {
> +               dwc->usb_psy = power_supply_get_by_name(usb_psy_name);
> +               if (!dwc->usb_psy)
> +                       dev_err(dev, "couldn't get usb power supply\n");
> +       }
> +
>         dwc->has_lpm_erratum = device_property_read_bool(dev,
>                                 "snps,has-lpm-erratum");
>         device_property_read_u8(dev, "snps,lpm-nyet-threshold",
> @@ -1619,6 +1628,9 @@ static int dwc3_probe(struct platform_device *pdev)
>  assert_reset:
>         reset_control_assert(dwc->reset);
>
> +       if (!dwc->usb_psy)
> +               power_supply_put(dwc->usb_psy);
> +
>         return ret;
>  }
>
> @@ -1641,6 +1653,9 @@ static int dwc3_remove(struct platform_device *pdev)
>         dwc3_free_event_buffers(dwc);
>         dwc3_free_scratch_buffers(dwc);
>
> +       if (!dwc->usb_psy)
> +               power_supply_put(dwc->usb_psy);

# to reproduce this build locally:

 tuxmake --target-arch=mips --kconfig=cavium_octeon_defconfig
--toolchain=gcc-8 --wrapper=sccache
--environment=SCCACHE_BUCKET=sccache.tuxbuild.com --runtime=podman
--image=public.ecr.aws/tuxmake/mips_gcc-8 config default kernel
xipkernel modules dtbs dtbs-legacy debugkernel headers
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc' cavium_octeon_defconfig
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc'
kernel/sched/fair.c:8384:13: warning: 'update_nohz_stats' defined but
not used [-Wunused-function]
 static bool update_nohz_stats(struct rq *rq)
             ^~~~~~~~~~~~~~~~~
mips-linux-gnu-ld: drivers/usb/dwc3/core.o: in function `dwc3_remove':
drivers/usb/dwc3/core.c:1657: undefined reference to `power_supply_put'
mips-linux-gnu-ld: drivers/usb/dwc3/core.o: in function `dwc3_get_properties':
drivers/usb/dwc3/core.c:1270: undefined reference to `power_supply_get_by_name'
mips-linux-gnu-ld: drivers/usb/dwc3/core.o: in function `dwc3_probe':
drivers/usb/dwc3/core.c:1632: undefined reference to `power_supply_put'

Build link,
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1071668201#L146

-- 
Linaro LKFT
https://lkft.linaro.org
