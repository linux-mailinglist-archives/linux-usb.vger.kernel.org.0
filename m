Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D0221EED7
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 13:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgGNLPF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 07:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgGNLPF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 07:15:05 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22309C061755
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 04:15:05 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id s20so8306902vsq.5
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zl7LrnxmYaHwxZmWf03+01i+kBk3EWopG805KjftjH4=;
        b=Bo33t4ngz26caatoDZYR2BfiO1zoVEeyOR68GXWsLo33BHLjKd7kPV/BbRKiV7kf3I
         hxtdEuZmMT36Mvivn5/6er7gAdwe7fJKu/MGjSPP01hPBGKWsMqN5TKjpM5qlaNr7Lkw
         elfejWgYsxIxwGg2SACsIe4TPRHbJYnzCbN5qKBj16mfr5Dt5Zf1gTLTd9pvC+GCsnqL
         CpGb8p+J63ctF6yjLEoOhY4/MISlHtgVauUthP3lgQI/+S1X41xXT2ka7skCd3hn3Rx0
         HDp4c4wbfT6nnuaDLv6bFsEuMqUrub00PQwp6Kn3AQSewjQkco6OUlZglMIfAq65cz0h
         Genw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zl7LrnxmYaHwxZmWf03+01i+kBk3EWopG805KjftjH4=;
        b=hwjabzpqk10rdLdmL8bcaEJ1fwTIqLq6c0kkAGh6yE8v0gWHybsf/RAQ6r7wSrjNVA
         bhsRZSKZGU7hihxiby8o2t0gY3IC4tj+2xnXNcEAYRIQYSjxl9cRQPrCDORnpD0WA7sC
         RBwFe4IN75+iQOKo2WPJYtWoYw0Ly533Mte/X2u8VEKYPEQb6okdp8wQ5tGm5taHmyUt
         CpNMCKgE0MNLxC4FSm+di7JmOg+4l5Rmjm7gWfKh4ih7NI8ra3Zer5XUMaQM5LhX6K4L
         lLlsmXDUUvv6PHtNovV6OdQm6Cr70ppEBomx5otdNzYJIx4wTDPbQpHfyAurmB2F5pEE
         9EBA==
X-Gm-Message-State: AOAM530JpOtNQL1lxDi8emcKUZ7Z6FRwNMdfq+r5SiW1MU7KmOAIeuBr
        7movkkhQv36TyfGQYghHwoK0SvEZAqmeJhdKgVno3UTBMeo=
X-Google-Smtp-Source: ABdhPJzfJbpffiujAkohhR2Us0KZ1ACt5WJPbnZl24ESaWVgjI/h+N+hXRemoM426mL3TG47ksA+NcuwXFOyY9tUX8Y=
X-Received: by 2002:a67:6c47:: with SMTP id h68mr2678913vsc.126.1594725304187;
 Tue, 14 Jul 2020 04:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200709222126.5055-1-angelo.dureghello@timesys.com>
 <20200714100851.GB3453@localhost> <20200714103727.GA2626@Mani-XPS-13-9360>
In-Reply-To: <20200714103727.GA2626@Mani-XPS-13-9360>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Tue, 14 Jul 2020 13:22:03 +0200
Message-ID: <CALJHbkB+hmD4XWghQ13fz33D9wB==0VuifyK9-ibyjk1uV6vmg@mail.gmail.com>
Subject: Re: [PATCH v2] USB: serial: add support for MaxLinear XR21V1412
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Manivannan,

On Tue, Jul 14, 2020 at 12:37 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> Hi,
>
> On Tue, Jul 14, 2020 at 12:08:51PM +0200, Johan Hovold wrote:
> > On Fri, Jul 10, 2020 at 12:21:26AM +0200, Angelo Dureghello wrote:
> > > From some researches, this driver is available from the IC
> > > constructor site, but for older kernel versions. From there, decided
> > > to add a much simplier mainline version, written from scratch.
> >
> > Do you have a pointer to the vendor sources for reference?
> >
> > > This initial simple version is implemented without any flow control,
> > > tested mainly at 115200, but all standard baud rates are supported
> > > and applied as per serial terminal settings.
> > >
> > > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
>
> Just curious, how are you accessing this chip? I mean any breakout board
> or integrated in any custom board design.
>

well, generally i design boards too, so i select the chips as i like them,
but this time the chip is mounted on a custom design i work in.

> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > No need for a reported-by if the robot catches issues during review.
> > Just mention it in the changelog as you already did below.
> >
> > > ---
> > > Changes for v2:
> > > - fix test robot warning, PARITY_ defines renamed
> > > ---
> > >  drivers/usb/serial/Kconfig     |   9 +
> > >  drivers/usb/serial/Makefile    |   1 +
> > >  drivers/usb/serial/xr21v1412.c | 361 +++++++++++++++++++++++++++++++++
> > >  3 files changed, 371 insertions(+)
> > >  create mode 100644 drivers/usb/serial/xr21v1412.c
> >
> > Thanks for the submitting this.
> >
> > There was another driver for this device posted recently, and which
> > appears to have more features:
> >
> >       https://lore.kernel.org/r/20200607162350.21297-2-mani@kernel.org
> >
> > Would you mind taking a look and see if that one would work for you?
> >
> > I had some comments on the latest version that needs to be addressed,
> > but I'm assuming Manivannan is working on a v5?
> >
>
> Yes! This driver is being worked on in my limited spare time. So I'm a bit
> late to reiterate the patchset but planning to send v5 around this weekend.
>

Ok, as said, i don't want to overlap, wasn't aware of the job in progress.
Going standby on this. Good luck.

> Thanks,
> Mani
>
> > Johan



-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
