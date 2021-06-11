Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92233A397E
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 04:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhFKCEj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 22:04:39 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:40720 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhFKCEj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 22:04:39 -0400
Received: by mail-qk1-f174.google.com with SMTP id u30so29482851qke.7
        for <linux-usb@vger.kernel.org>; Thu, 10 Jun 2021 19:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y6czCmeYJi+8/bsNpSEJ/y8kcHGUuFKrYFx1oGjn1Lw=;
        b=aMwR9u7nIahzHMBDEpY5f0zL7VrGlNOmUjnmZgbDXydaKm7bQ2GFyXRb+h+9M0hQax
         LeROgfnM6YdzsSNrffZPY3vsddToIFQHfVMQ0USESl/jCBi7dN4q0ZyGlN756G3GkfNV
         jjBZxO/H4mRKUNmF12xGzMy1vzjDYIvHkYeMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y6czCmeYJi+8/bsNpSEJ/y8kcHGUuFKrYFx1oGjn1Lw=;
        b=kUVrdokF364m/8AwfyrnssW8NeJ1sXw0vV5/fRI1Yk0WvHOdhnecU68AhhMIYcpZU3
         8l6cN6sCvzTkPQgUd1y8MzlJySurP+APVzMVPnN31JFLlQLTgRefplZPIJ2lVSGI2VrE
         pEGdeEzxwD5HC2M7w7/n1qUZ3Kz1fBU+yRnAVNJgpRu4wmwY471zN9ZXOOxI3wX4uPaj
         yER6y26GdNWD6Rl2yLHiVU2C4BIz+EdJbKL5eTiONyK2ibHXnXrDpLHUUQ0WPfzzFTyr
         hQJJP7vUALjBCwEdsbvUT05WuqzfjBmrRdMbrDdwXbvZmHPQwBfJ3t4wocla1IFYBbKz
         uw+g==
X-Gm-Message-State: AOAM531OvWTedHCEon0whvh+8BYvgF6AdXvzaeCvcRDDPMKqI5fEhFe1
        fanfjLy2Gp7zFwW/oUt9tH76dfsNAa+jVI7yHNA=
X-Google-Smtp-Source: ABdhPJye9Gjpi6NmptG+WU4kxxUGYNaUfEZaIAWWq6TKZOI1CDvF0+VnbGfypEcPGdkWsRKM8Hcvpc1WfYP9UCmatfc=
X-Received: by 2002:a05:620a:1485:: with SMTP id w5mr1648141qkj.66.1623376885199;
 Thu, 10 Jun 2021 19:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210610034957.93376-1-joel@jms.id.au>
In-Reply-To: <20210610034957.93376-1-joel@jms.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 11 Jun 2021 02:01:12 +0000
Message-ID: <CACPK8XegSCS074LJvpO2gOpvpDO_hgWORX4FNcxGe7j9xrGS8w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: fsl: Re-enable driver for ARM SoCs
To:     Fabio Estevam <festevam@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
        Felipe Balbi <balbi@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-usb@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 10 Jun 2021 at 03:50, Joel Stanley <joel@jms.id.au> wrote:
>
> The commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
> dropped the ARCH_MXC dependency from USB_FSL_USB2, leaving it depending
> solely on FSL_SOC.
>
> FSL_SOC is powerpc only; it was briefly available on ARM in 2014 but was
> removed by commit cfd074ad8600 ("ARM: imx: temporarily remove
> CONFIG_SOC_FSL from LS1021A"). Therefore the driver can no longer be
> enabled on ARM platforms.
>
> This appears to be a mistake as arm64's ARCH_LAYERSCAPE and arm32
> SOC_LS1021A SoCs use this symbol. It's enabled in these defconfigs:
>
> arch/arm/configs/imx_v6_v7_defconfig:CONFIG_USB_FSL_USB2=y
> arch/arm/configs/multi_v7_defconfig:CONFIG_USB_FSL_USB2=y
> arch/powerpc/configs/mgcoge_defconfig:CONFIG_USB_FSL_USB2=y
> arch/powerpc/configs/mpc512x_defconfig:CONFIG_USB_FSL_USB2=y
>
> To fix, expand the dependencies so USB_FSL_USB2 can be enabled on the
> ARM platforms, and with COMPILE_TEST.

This didn't work out, as there's some missing clock initialisation
calls that were removed when fsl_mxc_udc was deleted:

arm-linux-gnueabi-ld: drivers/usb/gadget/udc/fsl_udc_core.o: in
function `fsl_udc_remove':
fsl_udc_core.c:(.text+0xc88): undefined reference to `fsl_udc_clk_release'
arm-linux-gnueabi-ld: drivers/usb/gadget/udc/fsl_udc_core.o: in
function `fsl_udc_probe':
fsl_udc_core.c:(.text+0x1c44): undefined reference to `fsl_udc_clk_init'
arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x1dcc): undefined
reference to `fsl_udc_clk_finalize'
arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x1fe8): undefined
reference to `fsl_udc_clk_release'

We could add them back, but it's not clear if this driver is still
maintained. I'm looking to the NXP people for input here.

Stephen has dropped the patch from today's -next. I suggest we drop
(or revert?) this patch from the USB tree while a solution is found.

Cheers,

Joel

>
> Fixes: a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Fix spelling of ARCH_LAYERSCAPE
> ---
>  drivers/usb/gadget/udc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
> index 8c614bb86c66..7348acbdc560 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -90,7 +90,7 @@ config USB_BCM63XX_UDC
>
>  config USB_FSL_USB2
>         tristate "Freescale Highspeed USB DR Peripheral Controller"
> -       depends on FSL_SOC
> +       depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST
>         help
>            Some of Freescale PowerPC and i.MX processors have a High Speed
>            Dual-Role(DR) USB controller, which supports device mode.
> --
> 2.30.2
>
