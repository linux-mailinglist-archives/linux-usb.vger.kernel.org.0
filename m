Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B91DA0FEA
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 05:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfH2D0b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 23:26:31 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41602 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfH2D0b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Aug 2019 23:26:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id j16so1809898wrr.8
        for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2019 20:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4VXtdUN33mfInmL5wwfclcs21XFuQJDuRee8LI2f6Xo=;
        b=MEFBjgMlGSuqfcOMN7uFDfidUYJwIBaB1Mtu3zVMqHFfHU9gVzku7oMjjFV5aUw9Kx
         H2zFI1WGyGQ3nKD0fLm+QiZJiZgdbE6EULlVW064Y7dAg5HGsoNaGeUK0Nw7KbTbTE+R
         XSWrl0DJE5yh+WMNEYhhifodgWcXjlo4uns2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4VXtdUN33mfInmL5wwfclcs21XFuQJDuRee8LI2f6Xo=;
        b=P88C0WcMwpTDK0Ls3YqWA+lNBsS40neqgExoa0ELFOKThRYNiKe9p3RD4bDirv4iry
         7P9d8waqiaT5/C1zmX2h6Z6tSJfruRb9KBPC6ia2/D7QnT6JrEPCndIdWeD760xOjZw+
         i95joqxAYn2aIImDuFNDuCBT/Cqxr/B653XwLhH4bkqMA5vJf5pScHe0WP0vBsoktIdb
         Zq88aVPObWuzmuOXqXjL+2jl2XPWptwAJD2HbRceZqrjShT47QYB1C1b+Eblr0E2SPMT
         az1bx65OLULn7qquJPmKMrzOahtc1bJIQy8h4YZgazo1rAHX6WbRG3h90X6bL5NvFZ1L
         QWTQ==
X-Gm-Message-State: APjAAAU4yuGHxrlwX6Ps3SmBWNlyWeZFGjb5M210/jWIoG8bMzqIk8zi
        XZ3G5rh3DB8IzgVHx4kV56S2IgcO5jFfW2DJTRZI8Q==
X-Google-Smtp-Source: APXvYqzBHim1x4cIaQbdne2bFTfS/GBlw3QsCk9quT3L6KA2YVmxiN0FWnixRTTK8IkD+SbUs20wWRp4WD0vpCdq2/E=
X-Received: by 2002:adf:facc:: with SMTP id a12mr8284203wrs.205.1567049189131;
 Wed, 28 Aug 2019 20:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1908281155100.1302-100000@iolanthe.rowland.org> <bac067d344bef4e6fff7862fcad49cdbf4cd4ab5.camel@redhat.com>
In-Reply-To: <bac067d344bef4e6fff7862fcad49cdbf4cd4ab5.camel@redhat.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 28 Aug 2019 20:26:15 -0700
Message-ID: <CAODwPW-+c6Ty_gqEFEaE0YhtutMR2tFnhEFOQre81uyM3mfMVA@mail.gmail.com>
Subject: Re: [PATCH] usb: storage: Add ums-cros-aoa driver
To:     Dan Williams <dcbw@redhat.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Julius Werner <jwerner@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(Thanks for the reviews... I'll get back to the kernel code details
after double-checking if this can be done from userspace.)

> > Besides, what's wrong with binding to devices that weren't switched
> > into AOA mode?  Would that just provoke a bunch of unnecessary error
> > messages?

It's not about devices that aren't switched into AOA mode... it's
about devices that are switched into AOA mode for other reasons
(connecting to other Android apps). I don't think a kernel driver like
that exists today, but it could be added, or people could use libusb
to talk to an AOA device. AOA is just a general mechanism to talk to
an Android app for whatever you want, and the descriptors sent during
mode switch clarify what app it's talking to (and thereby what
protocol it is using... it could be mass storage or it could be
something entirely different). But a device switched into AOA mode for
whatever app will always use that same well-known VID/PID (18d1:2d00).
So if I just add that VID/PID to the IDs bound by the usb-storage
driver, it would also grab a device that was mode-switched by
userspace to talk to a completely different app. I need some way to
make sure it only grabs the intended device, and there's no good
identifier for that other than comparing the dev path to what you
originally mode switched.

> > > +     /*
> > > +      * Only interface 0 connects to the AOA app. Android devices that have
> > > +      * ADB enabled also export an interface 1. We don't want it.
> > > +      */
> > > +     if (us->pusb_intf->cur_altsetting->desc.bInterfaceNumber != 0)
> > > +             return -ENODEV;
> >
> > Do you really need this test?  What would go wrong if you don't do it?

Yes, otherwise two separate usb-storage instances bind to the two
interfaces. The second interface is meant for a special ADB debugging
protocol and will not respond at all to USB mass storage packets, so
eventually the first request to it times out and
usb_stor_invoke_transport() will do a port reset to recover. That also
kills the first interface asynchronously even though it was working
fine.

> > IMO the userspace approach would be better, unless you can provide a
> > really compelling argument for why it won't suffice.

Well... okay, let me think through that again. I just found the new_id
sysfs API that I wasn't aware of before, maybe I could leverage that
to bind this from userspace after doing the mode switch. But it looks
like that only operates on whole devices... is there any way to force
it to only bind one particular interface?
