Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADCD2061AE
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 23:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404057AbgFWUrz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 16:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392568AbgFWUrx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jun 2020 16:47:53 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445B0C061573
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2020 13:47:54 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s9so44759ljm.11
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2020 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ye32jt5bxdPal72ZXWUg/6ZfZVx7wX+bvxwDfM6zrV8=;
        b=b/2lYZbrygcyLF+ltp98OuIs7+4sRe8gxl2FIQBC6ikaspSRW2YdRgAPrzb3dXTI6/
         4WrWwpKeUFhvb1mt1HSeZAfyXoxRI9JoR6cQ8NDMteEZeLXEjUxt1oQBgC+8WLcOM8/z
         w9adrgl2y5d6juXoUL9dOffyA4t0vxyxWcc5rXAB1Df3aN1AkStoO2d7wo7b24R5Pnet
         7s8HlLUGXzi2yhr+r42eBW5RsRBhvhvUQyXE8EnbSa+yZuiYfJ7vJqSQjooceN7VLNTb
         Y9Bc2WFfZjeCVww6Frk9oAF5qcjqiKCfLajN1rI7IipjVs0gIW1Ax93faqM61pD4A18O
         A45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ye32jt5bxdPal72ZXWUg/6ZfZVx7wX+bvxwDfM6zrV8=;
        b=Z5ZWgVNCgLtu3YbUd/StocjaYhBn8eA7Yx22kMcx87zlUd8CXO7nTusyBuqp022ZSM
         ydy+mz+Hvn6npWkkF8HkVyHQYSe96g9dP8W5bWmySAInFPOvD77xUfUCbK026jZEyjuF
         r4lFG/KDHB7TXZoE4EA0xfN1ixq8IXyYu4LT/b/QxFRZ1uS+SHu22nAyAcscKWdVvMka
         GlcWXBga/V5PBOu0dvsCgGpWr7zTTy973ty0UT1nnYuzsbsfkXug9PIetSQqrnHpq6Tp
         Wbe66mJ/5udk0mlTsOz+5ruFcUgigiCkdlUSZCjMfdbAXkbqpY8LP00ptZwfVLC9fx/R
         7vXg==
X-Gm-Message-State: AOAM531UPSwDlPoNBUb8YOyPIN7eQ8Jxd6lFDdskLY8PquIfG9Xk3xD9
        L1ZKm///EY1M3o0yy3tr5xTaZtSuyw1rVgZO+Vz73d1P
X-Google-Smtp-Source: ABdhPJzoUkrCAxAS9XUEnV3lEZPOzcQtz9xtAQAILpMEqbOGyUeSbKT9Gh1vz4QiX+bj48AqPJkm0oKbvH3ymVfXkT0=
X-Received: by 2002:a05:651c:1064:: with SMTP id y4mr12956766ljm.180.1592945272600;
 Tue, 23 Jun 2020 13:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <CACtzdJ2Yu_sHtJpWQ8UtF-yVEp5ON_vTWzaL72TJxW96MydVdQ@mail.gmail.com>
 <20200621095625.GB120230@kroah.com> <CACtzdJ3pWvHF=DVVoGse4K9Z1XA6vubX7=wwFQCpu2_LWiA7wg@mail.gmail.com>
In-Reply-To: <CACtzdJ3pWvHF=DVVoGse4K9Z1XA6vubX7=wwFQCpu2_LWiA7wg@mail.gmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Tue, 23 Jun 2020 22:47:41 +0200
Message-ID: <CACtzdJ22KinZwymuF-faLSrcpuZvZ+t0MSwtG570mGT1VGT6Kw@mail.gmail.com>
Subject: Re: kernel driver for USB liquid cooler controls
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Can you send me the cooler you have?
From some research I did, all asetek gen 6 (asetek is the OEM for
almost all AIO coolers) coolers should use the same protocol.
I currently have fan control working in an out-of-tree driver, I still
had a few questions I asked on the kernel newbies list I wanted
answered  before submitting this driver.
It would be great if someone with a different cooler could test the
driver as well.

Thanks,

Jaap Aarts

On Sun, 21 Jun 2020 at 13:04, jaap aarts <jaap.aarts1@gmail.com> wrote:
>
> I have a corsair h100i v2, I am currently only developing with that atm.
> I am currently using the protocol from
> https://github.com/audiohacked/OpenCorsairLink which supports pretty
> much all corsair products.
> I dont have the money myself to buy all the products available but
> https://github.com/jonasmalacofilho/liquidctl has other devices
> available.
> They are both GPL licensed so that should be no problem.
> I have no idea who would test other products/brands, but since a lot
> share the same controller it might not be that big of a deal.
>
> Jaap Aarts
>
> On Sun, 21 Jun 2020 at 11:56, Greg KH <greg@kroah.com> wrote:
> >
> > On Sun, Jun 21, 2020 at 11:39:27AM +0200, jaap aarts wrote:
> > > Hello USB mailing list,
> > >
> > > There are all-in-one liquid coolers for your CPU (like the corsair
> > > h100i), these are populair among gamers and high-end desktop
> > > enthusiasts for cooling their CPU. Under windows these have
> > > proprietary software that control the fan speed, pump speed and most
> > > importantly (for gamers) the RGB led controls.
> > > Under linux there is software that manages to control these devices by
> > > talking to the device via USB. But this doesn't allow for the fans to
> > > be controlled via generic fan control under linux.
> > > As a hobby project I started to implement some of the features from
> > > one of these user-space drivers as a kernel module.
> > > Some features would have to be device specific like RGB controls, but
> > > fan and pump speed could be controlled just like system fans.
> > > I was wondering if there would be any interest in having a driver for
> > > these all-in-one usb controlled coolers in the linux kernel itself?
> >
> > Sure, why not, just tie into the correct kernel subsystems and all will
> > be good.  What exact device do you have, I have one here that I could
> > test with if it's the same one.
> >
> > thanks,
> >
> > greg k-h
