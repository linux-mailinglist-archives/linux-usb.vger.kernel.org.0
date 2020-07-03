Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42A9213973
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 13:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgGCLj3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 07:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgGCLj3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 07:39:29 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB47C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 04:39:28 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id w6so33872880ejq.6
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pGISnOur8oLWYv7+8TQITcaX7jATXPB+L5kiXZAigBU=;
        b=WVAhV7ne7BUhACGeZniNHuofHwv1e3uzACAq19G6TvyM8UzQQ3aPIFlOvX8hBANhqW
         kfujOOTPzKDBiNQevPORCLkAIvXlp2J91jU57dz8k9o80ATdgl4x2yjW9Fb2AodKgHaV
         HH8Ta+IX+dWCZqnBa1JW1YqffWlmOn/haYYTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pGISnOur8oLWYv7+8TQITcaX7jATXPB+L5kiXZAigBU=;
        b=qCNBmI/OeSFBtNwxqZ6hiY77MMTfICc5FkHXrS12LE4H8eA4PiROMj6QprBYIgjn5R
         qX1rkDHor4F0FW4wzdh1Mf6l0mZY+bSRZOw5AmhE3B2gSdQIySCyQSNpO29iOLkuLcyy
         e+dmvhEiFvaSRK54fwSm8RWELCzFtGX6a7hMQiylA5/ih1MVzQ68aRCWr/5yfItoDW17
         /+lTlFjQfcS84ML1pnjlNzDyChtCVu0VBwjZOq7Ba80CIw6JAr3JIWywufRc02EvRNh8
         JmDy1zvc5fo7iSkLv/QxVm1IUjBhnDOzTpyxnu3WILkM9KtqTCaZuYyo38i91/+fqOuw
         wmpQ==
X-Gm-Message-State: AOAM5319Zx6mP8hjCxWmC2fbS3gwhnvRA26JndjbZr7oBcpUdLQrOFKF
        EBBwpRxKkvEyY04CbqOT4Cx7LkAtUjKOJeRKVw9b4Q==
X-Google-Smtp-Source: ABdhPJyNW3XMaAsmg+77KG3u0lZnz7EtGHkCDGxC54EevC5Q5fuKD2cd0qG4HzFGeIbC5k5ygQW2K3Lijlm0Dym68OY=
X-Received: by 2002:a17:906:2b12:: with SMTP id a18mr31303665ejg.186.1593776367452;
 Fri, 03 Jul 2020 04:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200702090504.36670-1-jagan@amarulasolutions.com> <f0ae5915-9cb8-9550-f05c-6cebad191a14@arm.com>
In-Reply-To: <f0ae5915-9cb8-9550-f05c-6cebad191a14@arm.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 3 Jul 2020 17:09:15 +0530
Message-ID: <CAMty3ZBBdYdNOf-nQTdKZfi-VagaML6k+4PkAh6Uz936h9auow@mail.gmail.com>
Subject: Re: [PATCH] usb: host: ohci-platform: Disable ohci for rk3288
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@collabora.com>,
        linux-usb@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Suniel Mahesh <sunil@amarulasolutions.com>,
        William Wu <william.wu@rock-chips.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 2, 2020 at 8:08 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-07-02 10:05, Jagan Teki wrote:
> > rk3288 has usb host0 ohci controller but doesn't actually work
> > on real hardware but it works with new revision chip rk3288w.
> >
> > So, disable ohci for rk3288.
> >
> > For rk3288w chips the compatible update code is handled by bootloader.
> >
> > Cc: William Wu <william.wu@rock-chips.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Note:
> > - U-Boot patch for compatible update
> > https://patchwork.ozlabs.org/project/uboot/patch/20200702084820.35942-1-jagan@amarulasolutions.com/
> >
> >   drivers/usb/host/ohci-platform.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
> > index 7addfc2cbadc..24655ed6a7e0 100644
> > --- a/drivers/usb/host/ohci-platform.c
> > +++ b/drivers/usb/host/ohci-platform.c
> > @@ -96,7 +96,7 @@ static int ohci_platform_probe(struct platform_device *dev)
> >       struct ohci_hcd *ohci;
> >       int err, irq, clk = 0;
> >
> > -     if (usb_disabled())
> > +     if (usb_disabled() || of_machine_is_compatible("rockchip,rk3288"))
>
> This seems unnecessary to me - if we've even started probing a driver
> for a broken piece of hardware to the point that we need magic checks to
> bail out again, then something is already fundamentally wrong.
>
> Old boards only sold with the original SoC variant have no reason to
> enable the OHCI (since it never worked originally), thus will never
> execute this check.
>
> New boards designed around the W variant to make use of the OHCI can
> freely enable it either way.
>
> The only relative-edge-case where it might matter is older board designs
> still in production which have shipped with both SoC variants. Enabling
> OHCI can't be *necessary* given that it's still broken on a lot of
> deployed boards, so at best it must be an opportunistic nice-to-have.
> Since we're already having to rely on the bootloader to patch up the
> devicetree for other low-level differences in this case, it should be
> part of that responsibility for it to only enable the OHCI on the
> appropriate SoC variant too. Statically enabling it in the DTS for a
> board where it may well not work is just bad.

You mean enable OHCI by identifying revision W with dts status "okay"?
doesn't it complex for the bootloader to update all effecting changes?

Jagan.
