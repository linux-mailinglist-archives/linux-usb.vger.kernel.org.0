Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A50EA2C7
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 18:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbfJ3Ruw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 13:50:52 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34168 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbfJ3Ruw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 13:50:52 -0400
Received: by mail-qt1-f196.google.com with SMTP id e14so4448273qto.1
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2019 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aHAG5QGlfTZcV0ev6KxjaigdKgxCpJWBp61pmiRVhto=;
        b=CCJNOLqBQ7EqfGi77fpKdyM+s/IREZlN72gGYoExLAMS5QR9PfLRsZnFmPWqbcc9Yp
         GZKOU3a6pPPGt+6B6UqiXy0bsZzAmu89nQWybhiSY//73ztlC4Kv7S4zz840p5UBNi+4
         MzEZGDILlOsGUnpPRUzIg6naA9LsGhvSV4ZrFJ3BxTL4qGeRpgHquplE22eYBuiny9XJ
         UHk5MC5EvU4SqKjwDaaR+JnsTFiiPQS6LOfXn9SQrmEjlrvO21cU/cajfDMCKQHti+/z
         /OHqy949GoLmJrxexRO0yn/kD6nNwbgsaR5F2WLRL5fXm9FxWO51e/Aj3OTcxdTfH6Tu
         Mtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aHAG5QGlfTZcV0ev6KxjaigdKgxCpJWBp61pmiRVhto=;
        b=hasRlMyJe+hnBJIad74oIodxOCsNWwXUO7byn+l1czDz4nrptOboDCV2TpS4L4VOKJ
         1WBFVA9DTkTyDuI/pU+3TZrUt0gn3V9DqRRJvZIwRV1wBfAV3l1w077utH0NDRkB9N/1
         xyjVXwsUKdVg15Rowy9C4Gz9DV1V0hvkuy+HToOK2W1DL3aCk2LXJgb219JfLg9hZPaA
         EsW7f1L4209HflmLD4aWueUtfkyOssvAcx5uW3zTdfbtXjBU7R+RISE2hyS3v6S3ivRc
         nwbISzh/ypD6AnjKRVb3SRyMdOgwJFDsmTM9BA1WgQJrTZkebbLm4BvDNzNPwldUce7b
         qK5Q==
X-Gm-Message-State: APjAAAUUxoaSrdIKCB/9g0BZEY4mCU8cdWP6ShLKpUsN/EZYnOSeAMjV
        gBtBrNlZE7FDDHs6IlOZWiLNL/T2cCgbRTwqJbU=
X-Google-Smtp-Source: APXvYqwT7Y4406iDzbNo0bjXF+UX1OQ/pkV18E5pWAQKCaZRYA0p+Aybj6lZFhHy2OVMPW4U6o8NmPJF0Qe1kBeTl6Q=
X-Received: by 2002:ac8:80f:: with SMTP id u15mr1358783qth.193.1572457850268;
 Wed, 30 Oct 2019 10:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191028182254.30739-1-pgwipeout@gmail.com> <20191028182254.30739-2-pgwipeout@gmail.com>
 <1572315115.18464.11.camel@mhfsdcap03> <CAMdYzYoOQ_C_f2v-3XBid8X0fc6z3Bw0XqRi3CQiwCzRLT-_0g@mail.gmail.com>
 <1572404361.18464.24.camel@mhfsdcap03>
In-Reply-To: <1572404361.18464.24.camel@mhfsdcap03>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 30 Oct 2019 13:50:32 -0400
Message-ID: <CAMdYzYphK=R-3tw67xrutRv-fxOq7=dPXg5=4kT6bkivH77E0w@mail.gmail.com>
Subject: Re: [PATCH 1/5] phy: rockchip: add inno-usb3 phy driver
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     katsuhiro@katsuster.net, linux-rockchip@lists.infradead.org,
        linux-usb@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 29, 2019 at 10:59 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Tue, 2019-10-29 at 11:26 -0400, Peter Geis wrote:
> > On Mon, Oct 28, 2019 at 10:12 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > On Mon, 2019-10-28 at 18:22 +0000, Peter Geis wrote:
> > > > Add the rockchip innosilicon usb3 phy driver, supporting devices such as the rk3328.
> > > > Pulled from:
> > > > https://github.com/FireflyTeam/kernel/blob/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> > > >
> > > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > > ---
> > > >  drivers/phy/rockchip/Kconfig                  |    9 +
> > > >  drivers/phy/rockchip/Makefile                 |    1 +
> > > >  drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 1107 +++++++++++++++++
> > > >  3 files changed, 1117 insertions(+)
> > > >  create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> > > >
> ...
> > > > +static int rk3328_u3phy_pipe_power(struct rockchip_u3phy *u3phy,
> > > > +                                struct rockchip_u3phy_port *u3phy_port,
> > > > +                                bool on)
> > > > +{
> > > > +     unsigned int reg;
> > > > +
> > > > +     if (on) {
> > > > +             reg = readl(u3phy_port->base + 0x1a8);
> > > > +             reg &= ~BIT(4); /* ldo power up */
> > > > +             writel(reg, u3phy_port->base + 0x1a8);
> > > > +
> > > > +             reg = readl(u3phy_port->base + 0x044);
> > > > +             reg &= ~BIT(4); /* bg power on */
> > > > +             writel(reg, u3phy_port->base + 0x044);
> > > > +
> > > > +             reg = readl(u3phy_port->base + 0x150);
> > > > +             reg |= BIT(6); /* tx bias enable */
> > > > +             writel(reg, u3phy_port->base + 0x150);
> > > > +
> > > > +             reg = readl(u3phy_port->base + 0x080);
> > > > +             reg &= ~BIT(2); /* tx cm power up */
> > > > +             writel(reg, u3phy_port->base + 0x080);
> > > > +
> > > > +             reg = readl(u3phy_port->base + 0x0c0);
> > > > +             /* tx obs enable and rx cm enable */
> > > > +             reg |= (BIT(3) | BIT(4));
> > > > +             writel(reg, u3phy_port->base + 0x0c0);
> > > > +
> > > > +             udelay(1);
> > > > +     } else {
> > > > +             reg = readl(u3phy_port->base + 0x1a8);
> > > > +             reg |= BIT(4); /* ldo power down */
> > > > +             writel(reg, u3phy_port->base + 0x1a8);
> > > > +
> > > > +             reg = readl(u3phy_port->base + 0x044);
> > > > +             reg |= BIT(4); /* bg power down */
> > > > +             writel(reg, u3phy_port->base + 0x044);
> > > > +
> > > > +             reg = readl(u3phy_port->base + 0x150);
> > > > +             reg &= ~BIT(6); /* tx bias disable */
> > > > +             writel(reg, u3phy_port->base + 0x150);
> > > > +
> > > > +             reg = readl(u3phy_port->base + 0x080);
> > > > +             reg |= BIT(2); /* tx cm power down */
> > > > +             writel(reg, u3phy_port->base + 0x080);
> > > > +
> > > > +             reg = readl(u3phy_port->base + 0x0c0);
> > > > +             /* tx obs disable and rx cm disable */
> > > > +             reg &= ~(BIT(3) | BIT(4));
> > > > +             writel(reg, u3phy_port->base + 0x0c0);
> > > > +     }
> > > Try to avoid magic number
> >
> > Since this was not my driver, I only pulled it in and made the
> > necessary changes to get it working, I tried to refrain from
> > modifications as much as possible.
> > Do you want me to convert these addresses to definitions based on the
> > comments in the code?
> It's better to follow register names defined in register map doc if you
> have

Some of these registers appear to be in the rk3328 TRM.
Most, such as the tuning registers, are not documented anywhere I can find.
:'( Why rockchip, why?!
> >
> > >
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
