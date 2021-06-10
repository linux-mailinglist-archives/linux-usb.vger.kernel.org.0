Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046F53A229B
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 05:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhFJDQS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 23:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFJDJ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 23:09:56 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B29C061574
        for <linux-usb@vger.kernel.org>; Wed,  9 Jun 2021 20:07:32 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn21so2688952ljb.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Jun 2021 20:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uGJuGe9Mb5XmAyPYwxLJlGYNRHWrY7TCsKD4dEygoc=;
        b=F/2/TpxK/1Ifo0A7NOQqeZX/SSPgF/SpE8RssNXUBZIqiR74/dY4AuZBlQ+vqoSWvx
         DBLbum5oB4SKiMIVCJzxZbO/Mq/2eAfinRYQl7JRsxiSw3pFV8CXyugaFf51gaqmtx/e
         FI5WTt2Z5Rgd0TGBv9K2KYmAQG/5Ar+ODGm9SoV70eP5Ykv1pu9MWuVfSOtuEBtDKeXU
         I499Xlt+Vi45crcImmM1UEqTIW+IvLaly61h3qFu3RGvrpH8RXPxVW/zI+QQdpeqXL6B
         eGSd+q9eHgpvQE/U1CdBg204m35oCkRUkx6tzsshb2Az8IQk5eaZ6UDumfNEYHhCxul4
         Rnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uGJuGe9Mb5XmAyPYwxLJlGYNRHWrY7TCsKD4dEygoc=;
        b=aCRh+igofBLUJLrBqUAfCwsSIoOUGRy2qz4FSGcttFY3TCSC88gAdQoUz83IQRg37G
         0SOKcMoGG6hyLPlmM08zNpQaY5AiStm6drkWgPjghHyCL/G+2r+JqdD1fiui+F7AMRnW
         BwtD1KB1JprzyNHkaAcidW+nLIpg89U7tY18/sFlFk7cXLMMGp/JUKRjIeASNKVjDThF
         58KpwX+3irlMVXdQNdeiEAQEwBgIkhtNnc4EcBiPlMLug4TlPIyJgQwHKI0GgOaxvcRl
         5AvBlb1TujnHq18zLrjTk636AD5ZJchnSTbX7pObxuweA8ogNUQeY0e0Rk2FVc7/2QUD
         UOoQ==
X-Gm-Message-State: AOAM533HbxMjfGaelBzQbdH84NuoqX1vYuzXqVSrIvhrsTU68EtApwal
        HQvuL/Mybww+tuACpSMlcsZjSab1c+JS9l4CAm0=
X-Google-Smtp-Source: ABdhPJwI4QoOu99oca4P0J8CGU7PL9QcbBCqsMv8WWQfpkMhV/9ppzzKb45oLL9PmOsITHHMx6cYMky/wQWgWNGzPMo=
X-Received: by 2002:a2e:93d0:: with SMTP id p16mr534395ljh.444.1623294450487;
 Wed, 09 Jun 2021 20:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210610030035.76864-1-joel@jms.id.au>
In-Reply-To: <20210610030035.76864-1-joel@jms.id.au>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 10 Jun 2021 00:07:19 -0300
Message-ID: <CAOMZO5AfiuaL4MhL7Xam_SPL2b-jCiMd96RciP88rMRq4G-3uw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: fsl: Re-enable driver for ARM SoCs
To:     Joel Stanley <joel@jms.id.au>
Cc:     Peter Chen <peter.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Joel,

Thanks for your patch.

On Thu, Jun 10, 2021 at 12:01 AM Joel Stanley <joel@jms.id.au> wrote:
>
> The commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
> dropped the ARCH_MXC dependency from USB_FSL_USB2, leaving it depending
> solely on FSL_SOC.
>
> FSL_SOC is powerpc only; it was briefly available on ARM in 2014 with
> commit cfd074ad8600 ("ARM: imx: temporarily remove CONFIG_SOC_FSL from
> LS1021A"). Therefore the driver can no longer be enabled on ARM
> platforms.
>
> This appears to be a mistake as arm64's ARCH_LAERSCAPE and arm32

Typo: ARCH_LAYERSCAPE

> SOC_LS1021A SoCs use this symbol. It's enabled in these defconfigs:
>
> arch/arm/configs/imx_v6_v7_defconfig:CONFIG_USB_FSL_USB2=y
> arch/arm/configs/multi_v7_defconfig:CONFIG_USB_FSL_USB2=y
> arch/powerpc/configs/mgcoge_defconfig:CONFIG_USB_FSL_USB2=y
> arch/powerpc/configs/mpc512x_defconfig:CONFIG_USB_FSL_USB2=y
>
> To fix, expand the dependencies so USB_FSL_USB2 can be enabled on the
> ARM platforms, and with COMPILE_TEST.
>
> Fixes: a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/usb/gadget/udc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
> index 8c614bb86c66..b32cea2fb99f 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -90,7 +90,7 @@ config USB_BCM63XX_UDC
>
>  config USB_FSL_USB2
>         tristate "Freescale Highspeed USB DR Peripheral Controller"
> -       depends on FSL_SOC
> +       depends on FSL_SOC || ARCH_LAYERSACPE || SOC_LS1021A || COMPILE_TEST

ARCH_LAYERSCAPE here too :-)
