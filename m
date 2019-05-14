Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE6B91C8FA
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 14:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbfENMnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 08:43:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32771 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfENMnm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 May 2019 08:43:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id z28so9105701pfk.0
        for <linux-usb@vger.kernel.org>; Tue, 14 May 2019 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jt+E/KFmKVQhenlSs2lydx7Dk7b/ufeiwExkuKxRzps=;
        b=aio8oqIvQmNraGRKsSjxTxRyxOX6dBDL7vx4isciLWp8f4JAf4CKs/jCEiVbB+C4l7
         LgBPT547rCqQHy7+d+eTB9mwiU4awP3d7ZAvgw7xq8xTlDERwfhuL/+zGQtj43eaD6aN
         jzHOyRQcu6eVqWhmSsXzoEVL4j+IgECLYGKORH0b6o/RBKUoJHXTD32Rzpaz9a3IX9ks
         YCzKUx5LMAeNhVIGiRnRNRIU1AY41r4KiOy9fWC13vKiKoF8I5hbKaKP0TeLCgM6O+DA
         4nhtpFIRJ99MITsp/DNHZVmIz4Wu02Rgt1u+wIEDr6bdG+3MYYbaMFarR1m4yN/E1HRA
         KUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jt+E/KFmKVQhenlSs2lydx7Dk7b/ufeiwExkuKxRzps=;
        b=aqWctIRzh/ieJaqIv6erBguYGBdbQkTfYB+Wz1QuL/i8Do9vU835cUtJ8dCNEqKev4
         5q+E7e2x36saQSVPd1CbgwtaEEkuoep3/5x5PrNVK5jmnLCeIx8VvFGqyXSXu4nRemyO
         k5/zljIB2AdTn7BoO+FA2+JOEca9qp3GMmUJ33z+NQ+P5sOBgjr9DRo2ypRrsXq/oxwN
         jEypGS4YmE8a41IqpuNRnezFdrFr06oMOZavOOE1AgmVHmJ6R9tGsXxxT1jRhOzcubXY
         YQzKrHxQbUDmykMkoaYc5boUrbl15X5rGdMMaJdl2ILXO8t+UiwxurKiwLtLeDHoJboQ
         eeHQ==
X-Gm-Message-State: APjAAAWpYyFCnp5WID60CZ2w9sLkEg97C8S56ck38FRxwzmlhtLD1THY
        bN/GupxiMTt31cDwovXtJkLcQrDd393II+srvu98hw==
X-Google-Smtp-Source: APXvYqyWh1Llr9M8edoJU4kWkXRI6JvJORmh4SwqcfBz1IIsM/AspEhs3EazTwIlY0KpOUer2U8MCvCQCCG+PYCJ52M=
X-Received: by 2002:a63:2a89:: with SMTP id q131mr36791400pgq.359.1557837820920;
 Tue, 14 May 2019 05:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
 <20190419083529.GD28648@kroah.com> <CAAeHK+zOg=SKynp85f9xQm56V1NzDrECaxBBu8UcBj_HBj9=+Q@mail.gmail.com>
 <CAAeHK+xGGfK03UqNKhXsogTer3dBNbvEEOk4y3dN0Y-xkcOz8Q@mail.gmail.com> <20190425142516.GA28336@kroah.com>
In-Reply-To: <20190425142516.GA28336@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 14 May 2019 14:43:29 +0200
Message-ID: <CAAeHK+x0X9fVpjGr89OhYPOszaZEVP3PfFopvOCAB0RtENWr+g@mail.gmail.com>
Subject: Re: USB fuzzing with syzbot
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, Apr 25, 2019 at 4:25 PM
To: Andrey Konovalov
Cc: Alan Stern, Gustavo A. R. Silva, USB list, Dmitry Vyukov, Kostya
Serebryany, Alexander Potapenko

> On Thu, Apr 25, 2019 at 02:44:11PM +0200, Andrey Konovalov wrote:
> > On Wed, Apr 24, 2019 at 6:05 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > On Fri, Apr 19, 2019 at 10:35 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > > 2. Is there an easy way to figure out which config options enable
> > > > > drivers reachable over USB?
> > > >
> > > > Looking for all options that depend on USB is a good start.
> > > >
> > > > > Right now our kernel config is based on one of the Debian kernel
> > > > > configs, that supposedly enables enough relevant USB drivers. At the
> > > > > same time it enables a lot of other unnecessary stuff, which makes the
> > > > > kernel big and long to compile. Ideally, we would to have a way to
> > > > > auto-generate a kernel config that enables all the relevant (enabled
> > > > > by at least one of the distros) USB drivers. I've looked at whether
> > > > > it's possible to figure out which particular options in some kernel
> > > > > config are related to USB, but it seems that neither the option names,
> > > > > nor the way they are grouped in the config file, are representative
> > > > > enough.
> > > >
> > > > Yeah, it's hard to just carve out this type of configuration, but here's
> > > > what I have done in the past to try to be sure I enabled all USB drivers
> > > > in my kernel configuration.
> > > >
> > > > First, start with a "minimally working configuration" by running:
> > > >         make localmodconfig
> > > > on a working system, with the needed modules for booting and operating
> > > > properly already loaded.
> > > >
> > > > That gives you a .config file that should take only minutes to build,
> > > > compared to much longer for the normal distro configuration (also be
> > > > sure to disable some debugging options so you don't spend extra time
> > > > building and stripping symbols).
> > > >
> > > > Boot and make sure that configuration works.
> > > >
> > > > Then, take that .config and do:
> > > >         - disable USB from the configuration by deleting the:
> > > >                 CONFIG_USB_SUPPORT=y
> > > >           option from your .config
> > > >         - run 'make oldconfig' to disable all USB drivers
> > > >         - turn USB back on by setting CONFIG_USB_SUPPORT=y back on in
> > > >           your .config
> > > >         - run 'make oldconfig' and answer 'y' or 'm' to all of the
> > > >           driver options you are presented with.
> > > >
> > > > That usually catches almost all of them.  Sometimes you need to make
> > > > sure you have some other subsystem enabled (like SCSI), but odds are, if
> > > > you start with a "normally stripped down" configuration that works, you
> > > > should be fine.
> > >
> > > I suspect that make localmodconfig (+ switching CONFIG_USB_SUPPORT off
> > > and on) would likely include a lot of stuff that we don't need (there
> > > are many options that are =y, but not related to USB at all), but it
> > > definitely sounds better than what I have right now (converting almost
> > > all =m into =y). I'll give it a shot, thanks!
> >
> > I've tried this and unfortunately it doesn't work as desired. The
> > reason is that localmodconfig will only enable options for the modules
> > that are currently loaded, and if a module that some USB driver
> > depends on is not loaded, then this driver won't be enabled after yes
> > | make oldconfig. For example my machine didn't have the cfg80211
> > module loaded, and thus e.g. CONFIG_AT76C50X_USB didn't get enabled
> > after oldconfig. However when I plug in a wireless USB adapter,
> > cfg80211 gets loaded together with the USB driver for that adapter. I
> > guess the same applies to other kinds of dependency modules (e.g.
> > bluetooth). So this would only work if all the dependency modules are
> > already loaded.
>
> Yes, sorry, I thought I said that with:
>
> > > > First, start with a "minimally working configuration" by running:
> > > >         make localmodconfig
> > > > on a working system, with the needed modules for booting and operating
> > > > properly already loaded.
>
> I guess "working system" implied everything that you _knew_ you wanted
> to have loaded :)
>
> Sorry about the dependancy mess, hopefully you have sorted this out
> better now.

I've written a script [1], [2] on top of Kconfiglib [3] that merges in
all USB configs and their dependencies from a provided (distro)
config. The dependency extraction a somewhat best effort, but seems to
be working. Maybe you'll find some use for it as well.

Thanks!

[1] https://github.com/google/syzkaller/blob/master/dashboard/config/kconfiglib-merge-usb-configs.py
[2] https://github.com/google/syzkaller/blob/master/dashboard/config/generate-config-usb.sh
[3] https://github.com/ulfalizer/Kconfiglib
