Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABB912E807
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 16:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgABPYF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 10:24:05 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43313 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbgABPYF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 10:24:05 -0500
Received: by mail-oi1-f193.google.com with SMTP id p125so10766577oif.10
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2020 07:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m4dUfK4O76LeGW5xc8TGTXDvbkOnSX5v3rh5n9es6Rg=;
        b=I7qEVkBlNxBkwH5beRCKOxv8w6xICSDw+bbI42w+HLEppCt5sGl8F5v6gCMLMsTlus
         hnpbkjAdZcExADQVkZwgUfoCnZTD6QeyRxVXqtLZtV1JLlsuJRr+SnheuHPA5j544WaQ
         RVC3nXKbEpzIImRczrL5k1Rl4eGIXmbQZ7Mimrw2vp/h1ZGS1wJTiYyuNINEiozBccrs
         KMaa4udSs4JwjimiT4BkZ8p+rUUM+hpPJaWlzjwU2+S3ngY978ZAAIAJuC7cyO8axE4B
         wN25PAIc6TiuCj9BRIwe4W0WkM432cHXVMx46YHFVDSLzOrYL7BgZl34xo/crjG4rtNS
         7oCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m4dUfK4O76LeGW5xc8TGTXDvbkOnSX5v3rh5n9es6Rg=;
        b=XA8rNfw7A20R8QP8Da6WUZgHNvgBPkNWaBOudf4/M6P8fXHh3FjZwte4y/xkwf2yDM
         8DyNjU0Qj1/9KVqb9psJLn0w5jx5U2fymneswcEAdRAPQmPme1CbsGgSIIlErPBz3E5c
         z7xHaZqZsTrjpTi8kABP0Nbs71i1qWhBHe/qRvKFKFHloC6aoLFNUEp27TFkUIrTZdy+
         jKirpbnykEHBGdjhuzNT/fS3ygtIgcV+uhafAjkzrytw+LHasoz13U4PjmAjWLP2HcIa
         r0Tn5rgxHCUv8pWXqcgkFIgdGba0mA37+5QoLMHSFLp1JfPlEIIkOAUTyfcSIn3OvoHa
         DA1w==
X-Gm-Message-State: APjAAAV5Zbtsbr7ddbvSY2/WU3lOSiau190xlEoI1j1ROO91oYreaa8Q
        FYF5kneMEU40aKNJXbeYRrC8qkX4FIP/rhhUs+s=
X-Google-Smtp-Source: APXvYqzv/+MfGAkU9LG36p03Dvr4CEYDI2GT6IEKXupoJFKL1IeXJnH2wRZDLVzlOA98iyhGoUlag4qKCPZWnM9yqyc=
X-Received: by 2002:aca:1e0f:: with SMTP id m15mr2434296oic.58.1577978644459;
 Thu, 02 Jan 2020 07:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20191231174848.741314-1-linus.walleij@linaro.org>
In-Reply-To: <20191231174848.741314-1-linus.walleij@linaro.org>
From:   Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Date:   Thu, 2 Jan 2020 16:23:53 +0100
Message-ID: <CAChTM2TOj-5LVz0XY_=WYo3n_hEhEav-+e=P=nA5HA81NdwXVg@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: phy-gpio-vbus-usb: Convert to GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On Tue, 31 Dec 2019 at 18:50, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Instead of using the legacy GPIO API and keeping track on
> polarity inversion semantics in the driver, switch to use
> GPIO descriptors for this driver and change all consumers
> in the process.
>
> This makes it possible to retire platform data completely:
> the only remaining platform data member was "wakeup" which
> was intended to make the vbus interrupt wakeup capable,
> but was not set by any users and thus remained unused. VBUS
> was not waking any devices up. Leave a comment about it so
> later developers using the platform can consider setting it
> to always enabled so plugging in USB wakes up the platform.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>

> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

> ---
>  arch/arm/mach-s3c64xx/mach-smartq.c | 13 ++--

> --- a/arch/arm/mach-s3c64xx/mach-smartq.c
> +++ b/arch/arm/mach-s3c64xx/mach-smartq.c

>  #include <asm/mach-types.h>
> @@ -124,15 +123,16 @@ static struct s3c2410_hcd_info smartq_usb_host_info = {
>         .enable_oc      = smartq_usb_host_enableoc,
>  };
>
> -static struct gpio_vbus_mach_info smartq_usb_otg_vbus_pdata = {
> -       .gpio_vbus              = S3C64XX_GPL(9),
> -       .gpio_pullup            = -1,
> -       .gpio_vbus_inverted     = true,
> +static struct gpiod_lookup_table smartq_usb_otg_vbus_gpiod_table = {
> +       .dev_id = "gpio-vbus",
> +       .table = {
> +               GPIO_LOOKUP("gpio-pxa", 9, "vbus", GPIO_ACTIVE_LOW),

IIUC the chip_label here should be "GPL", so we match the GPIO bank
properly. Otherwise looks good to me. With the typo fixed feel free to add

Acked-by: Sylwester Nawrocki <snawrocki@kernel.org>

> +               { },
> +       },
>  };

--
Regards,
Sylwester
