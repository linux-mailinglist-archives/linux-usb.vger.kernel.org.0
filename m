Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF8822122A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 18:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgGOQYI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 12:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgGOQYI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 12:24:08 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B94C061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 09:24:07 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id k23so2845177iom.10
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=12LxliN030EpDlt82garvZNOZBnbWkfz0ZbLC9PZFCY=;
        b=KXHv6g8ZCBEvX2uhDddeeCw+EExI+/b+2lTH1x6AnGC0pqlqm9UI8/ReWwkxE7y7Wx
         kpfTIiwSOs0tZXMZYRCKNwtRBlVnF+TuW7zZOw4kcUP7hW8qjo1X6xYLjkZBSxveLNF/
         ZofhlzimIyoTbzM1ZooA9FiyWuLnzgUPMXF31oC7xjKW+oBRAQfo6k0Bwe8A60zR8UPM
         nZ5XP67zW3xVbesg4fRiSLqLERP9uOLY53N249cX6lc+RlsGx9TQ/F8xrSmVN8iNfjM8
         8bvmnTldYQIZUz/cMoDwZSMJ24LtjJKxxhoL80LCAt3zDQp7ieSXdwPF3BBtM0fKaUGs
         6OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12LxliN030EpDlt82garvZNOZBnbWkfz0ZbLC9PZFCY=;
        b=atG66L8kIsG91QVy24ZWE+MvIs5uN+JCV2QXmcQzYAzqBr/R35vcFF1t6A342W1i54
         pU0aL1DMV7uJ7f0erVjgXQlsEaRsrdt7ChAi/a7LiKW03GEXcB5Io+DNDkyHPQDH/3NT
         XVFBC0CqbbvvN2AAE0jH4Q5Y8TrxMJy4VIGmQeD0+1F3HLnDcZq5wYL36cr1T7TYZ5Bg
         kF40n+YZrO3299kXtJREFvEa62NzPUQBs8fsSCwe4LteLXAdHQSXtHdxism+rbOvhDrM
         aL5GmDvIAC0DuCeWrfX9MBgYr82FtA1bM2F+oP74qgTPxnflpoeWXyvhag8sz9RrOSRY
         7kkw==
X-Gm-Message-State: AOAM532Gnzov/mUehpV3OC4oO+CdogDezJ3xSmDB/IF+cvidtRDGe6OV
        D3NI1YryvKuc9NN/Ua3IXM+Gd0Z6wTIaC++7Z9g=
X-Google-Smtp-Source: ABdhPJy2kt+e/iOL81CiSbq6iHd4SFXsD9dDUWUbPh4F2dWxNpf8kILAMnAMsnJkPMZT9SphqXGwElr06H8atBUuROQ=
X-Received: by 2002:a05:6638:164a:: with SMTP id a10mr192538jat.126.1594830247326;
 Wed, 15 Jul 2020 09:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com> <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
 <20200714133024.GA27406@gothmog.test> <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
 <20200715025849.GA8160@nessie>
In-Reply-To: <20200715025849.GA8160@nessie>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Wed, 15 Jul 2020 21:53:56 +0530
Message-ID: <CANAwSgRpfex_SroibCNxzOooXoUCi1NyRShoyonS5R=GrtH38A@mail.gmail.com>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Dan Robertson <dan@dlrobertson.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

On Wed, 15 Jul 2020 at 08:48, Dan Robertson <dan@dlrobertson.com> wrote:
>
> On Tue, Jul 14, 2020 at 08:57:35PM +0530, Anand Moon wrote:
> > Hi Dan,
> >
> > On Tue, 14 Jul 2020 at 19:00, Dan Robertson <dan@dlrobertson.com> wrote:
> > >
> > > Hi Anand!
> > >
> > > On Tue, Jul 14, 2020 at 12:26:57PM +0530, Anand Moon wrote:
> > > > hi Dan,
> > > >
> > > > On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com> wrote:
> > > > >
> > > > > When testing suspend for another driver I noticed the following warning:
> > > > >
> > > > > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
> > > > > Hardware name: Hardkernel ODROID-N2 (DT)
> > > > > [..]
> > > > > pc : reset_control_assert+0x184/0x19c
> > > > > lr : dwc3_meson_g12a_suspend+0x68/0x7c
> > > > > [..]
> > > > > Call trace:
> > > > >  reset_control_assert+0x184/0x19c
> > > > >  dwc3_meson_g12a_suspend+0x68/0x7c
> > > > >  platform_pm_suspend+0x28/0x54
> > > > >  __device_suspend+0x590/0xabc
> > > > >  dpm_suspend+0x104/0x404
> > > > >  dpm_suspend_start+0x84/0x1bc
> > > > >  suspend_devices_and_enter+0xc4/0x4fc
> > > > >
> > > > > In my limited experience and knowlege it appears that we hit this
> > > > > because the reset control was switched to shared and the the use
> > > > > of the reset control was not changed.
> > > > >
> > > > > > * Calling reset_control_assert without first calling reset_control_deassert
> > > > > > * is not allowed on a shared reset control. Calling reset_control_reset is
> > > > > > * also not allowed on a shared reset control.
> > > > >
> > > > > The above snippet from reset_control_get_shared() seems to indicate that
> > > > > this is due to the use of reset_control_reset() in dwc3_meson_g12a_probe()
> > > > > and reset_control_deassert is not guaranteed to have been called
> > > > > before dwc3_meson_g12a_suspend() and reset_control_assert().
> > > > >
> > > > > After some basic tests with the following patch I no longer hit the
> > > > > warning. Comments and critiques on the patch are welcome. If there is a
> > > > > reason for the current use of the reset control, I'd love to learn why!
> > > > > Like I said before, I have not really looked at this driver before and
> > > > > have verify limited experience with reset controls... Was working on
> > > > > another driver, hit the warning, and thought I'd take a shot at the
> > > > > fix :-)
> > > > >
> > > > Thanks, I was also looking into this issue
> > >
> > > Awesome!
> > >
> > > > So best Fix to this issue is to drop the call of reset_control_assert
> > > > from dwc3_meson_g12a_suspend
> > > > and drop the call of reset_control_deassert from dwc3_meson_g12a_resume
> > > > With these changes we do not see the warning on suspend and resume
> > >
> > > We definitely would avoid hitting the warning without the
> > > reset_control_(de)assert calls in suspend and resume. That is a valid use of
> > > the reset control, but why would that be best?
> > >
> > > From reset_control_reset():
> >
> > Before entering the suspend state the code tries to do following
> >      clk_bulk_disable_unprepare
> >      regulator_disable
> >      phy_power_off
> >      phy_exit
> >
> > After this operation it's needless to call *reset_control_assert*
> > I tried to move this call before all the above operations
> > but still no success with this.
>
> How so? Once the reset() is removed prope() and deassert() is guaranteed
> to have been called before suspend, like what is in the patch and similar
> to other uses of shared reset controllers, this is possible.
>
> > Similarly on resume we should avoid calling resume
> > *reset_control_deassert* earlier
> > as the core is just reinitializing the devices.
> >       clk_bulk_prepare_enable
> >       usb_init
> >       phy_init
> >       phy_power_on
> >       regulator_enable
> > >
> > > > * Consumers must not use reset_control_(de)assert on shared reset lines when
> > > > * reset_control_reset has been used.
> > >
> > > If we use reset_control_reset() then we can not (de)assert the reset line
> > > on suspend/resume or any other time. Wouldn't we want to be able to
> > > (de)assert the reset line? And why do we no longer want to (de)assert the
> > > reset line on suspend/resume?
> > >
> > > > > Can you try this attached patch?
> > > >
> > > I think I had already tested something similar. Removing the (de)assert calls
> > > but keeping reset will definitely remove the warning, but it means we can not
> > > (de)assert the line. My guess is that this is not what we want, but I could be
> > > wrong. Thoughts, input, or references to documentation on this would be
> > > appreciated.
> > >
> >
> > As per my knowledge suspend to mem will do complete power down of the
> > devices with support suspend and resume feature sequentially and then it tries
> > to bring the device up one by one.
> > So it should also take care of reset lines as well.
>
> So do we only _actually_ care about the reset line in the probe? Seems like we
> should remove the reset controller from the structure if that is the case.
>
> Cheers,
>
>  - Dan

Sorry I am not the _expert_ in suspend/resume feature but I can debug this,
Certainly we need to look into whether reset controller calls are needed
to suspend or resume for this driver.

First thing we need to get the RTC driver to work on Odroid N2 for
suspend wakeup
to work properly.
For this I have created the following patches.

[0] https://patchwork.kernel.org/cover/11665865/

With these patches the RTC feature for wake up is broken right now in
my testing.
Once I get something to work further I will update you.

--Anand
