Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E188D8142C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 10:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfHEI2A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 04:28:00 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41187 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfHEI2A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 04:28:00 -0400
Received: by mail-ot1-f68.google.com with SMTP id o101so84436512ota.8
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 01:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qvG85uu+23wc3aOz56jKz9zl98RKrlFXnI9v0RdgYHY=;
        b=gn0LHf8ENoBGwjVAUPWk1trAn5THo247jg8e6zjlOG+W0AiNseHCflLSx/XH7Kcfy9
         2wSOMmbwOPfMbBjkX6M2RQupJ/NbQ7i1OeZV4x0b7UaMTogOPcjGAh2WD4/Wzn3oFz+S
         s68do0KW/i5W4PVQKdwoTVYuoajMggDI1ujveZBBQeM1XkbfxbcpVORGDNzhN6D90l0s
         nchBa36BsovaPAw4h8M0gY9GSFJmJ6RPIM5M8O2TBp8svyqdG+/Z77FGfO1gxNobnwjE
         Hl6bo1835l7C2TEp1ARt072yPf+OHySWwJSl6kUR7uAp3M2jEwLs21KSIEzQgcwZEeFx
         EIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qvG85uu+23wc3aOz56jKz9zl98RKrlFXnI9v0RdgYHY=;
        b=RWLsLKD0LxNDIb5ih7OhOx91VFeWjH8UkUicyMPCgBe9Pu/Ejv4BlqUvIjrWCQz8XU
         UTcr1X1FM5W4q6YQFfvmL7Kp/rxdu9OIjP2oOQQc8eZwRwouNevr+AedHnLUHtXdRVko
         7MYfUSAqUqJ1Z02ak0lWfodf4ggRVnd1fp/t0YiyLijnPixZILPBjUu3ahkdQXwouIYA
         fXDFNyDo5TRfdrKx05ReTrW4aU2zIR/S/4/xVYdeKWu70VyGkov7RkFF74wCgQ1kpNze
         xf57Kw8ggZXableXBHe31bPI6dozNv1Qr5EpMKMdtSIHN61/jkRPE52WCWMYR4ZeAHPy
         JIRg==
X-Gm-Message-State: APjAAAWiB5uovLRhy7VLsxNcE68dyRyJoQhahvw7hTPJNqBdww6dS7A1
        lKWRGr5cZieyTsQ9vfZ7PlsphJZlMry4wjbLwNurqQ==
X-Google-Smtp-Source: APXvYqyHiFzcWgwMSYIdyYbnaCWSjRwGweIT3RKPv1xwORdpLKUPWaLHXzDYxYbuZLEk4t8xeoYAy31E8HbSzjuIfD4=
X-Received: by 2002:a9d:2969:: with SMTP id d96mr115002880otb.85.1564993679131;
 Mon, 05 Aug 2019 01:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190731195713.3150463-1-arnd@arndb.de> <20190731195713.3150463-6-arnd@arndb.de>
 <CAMpxmJWFfT_vrDas2fzW5tnxskk9kmgHQpGnGQ-_C20UaS_jhA@mail.gmail.com> <CAK8P3a3KpKvRKXY72toE_5eAp4ER_Mre0GX3guwGeQgsY2HX+g@mail.gmail.com>
In-Reply-To: <CAK8P3a3KpKvRKXY72toE_5eAp4ER_Mre0GX3guwGeQgsY2HX+g@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 5 Aug 2019 10:27:48 +0200
Message-ID: <CAMpxmJUdSnp0QNwWB0rJ1opFrYs9R2KSVS64Tz8X5GDYAJYLpg@mail.gmail.com>
Subject: Re: [PATCH 05/14] gpio: lpc32xx: allow building on non-lpc32xx targets
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, arm-soc <linux-arm-kernel@lists.infradead.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, linux-serial@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pt., 2 sie 2019 o 13:20 Arnd Bergmann <arnd@arndb.de> napisa=C5=82(a):
>
> On Fri, Aug 2, 2019 at 9:10 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > > -#include <mach/hardware.h>
> > > -#include <mach/platform.h>
> > > +#define _GPREG(x)                              (x)
> >
> > What purpose does this macro serve?
> >
> > >
> > >  #define LPC32XX_GPIO_P3_INP_STATE              _GPREG(0x000)
> > >  #define LPC32XX_GPIO_P3_OUTP_SET               _GPREG(0x004)
>
> In the existing code base, this macro converts a register offset to
> an __iomem pointer for a gpio register. I changed the definition of the
> macro here to keep the number of changes down, but I it's just
> as easy to remove it if you prefer.

Could you just add a comment so that it's clear at first glance?

>
> > > @@ -167,14 +166,26 @@ struct lpc32xx_gpio_chip {
> > >         struct gpio_regs        *gpio_grp;
> > >  };
> > >
> > > +void __iomem *gpio_reg_base;
> >
> > Any reason why this can't be made part of struct lpc32xx_gpio_chip?
>
> It could be, but it's the same for each instance, and not known until
> probe() time, so the same pointer would need to be copied into each
> instance that is otherwise read-only.
>
> Let me know if you'd prefer me to rework these two things or leave
> them as they are.

I would prefer not to have global state in the driver, let's just
store the pointer in the data passed to gpiochip_add_data().

Bart

>
> > > +static inline u32 gpreg_read(unsigned long offset)
> >
> > Here and elsewhere: could you please keep the lpc32xx_gpio prefix for
> > all symbols?
>
> Sure.
>
>       Arnd
