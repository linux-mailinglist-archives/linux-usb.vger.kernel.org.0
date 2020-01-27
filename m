Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816A414A3D4
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 13:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730593AbgA0M2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 07:28:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32837 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729465AbgA0M2J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jan 2020 07:28:09 -0500
Received: by mail-pg1-f193.google.com with SMTP id 6so5093650pgk.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2020 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cyKi2C2E/DAzDkpv5Bc8WYZz4cP/WF80nTy9kORAPME=;
        b=EV78N2yaNyur/ZLKrvmzkt7S1u7530+tYPA0SV6rAJ/bY8UyEqtU3oIx8TPXiWAh4+
         v6FLzakE+serof6o+wNI48WjZPub3p1OyfcskqfxSfi3G86L/FXJrnkjp0pmyTumxm3A
         YLmRWV6tnK5PKcjYpkj/nXnYwCZpi0w5f+VYcqIFeHdqAG9XjTQxF5l59hNuw1HtQrai
         nk7h0JXSKpL0emDeQC95VYwa0kjVvUjv8sS6w+mzAL9aSyJhCGjqw3tCz8qJdumcLAEC
         SKCeALbMGNadYxApuDHLkB1ax3fJKDjvlAojAsLRwVcOPOYZtWQ43NlXPNONAtI/6wSR
         pmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cyKi2C2E/DAzDkpv5Bc8WYZz4cP/WF80nTy9kORAPME=;
        b=p7C9RkDwwCyNfus+ktHpAdwx1Hb0JfP2dgfg4jkTyBD+sjcHTj4uxbQtNqRwzmhE16
         GIkULvW//O9POc58f73r++NsYsr74nGWU8jv/ygRz32LsI45eL063ENeUbOIEF8TRyJD
         v5i1+8q6Jof1cY0B68WWQ8NR7r3ci3AKmpq8X0p3OLgxWd2Ol40SeB22cPeJIuZByRA0
         B4FCnBSOPh/QprRrof6fqOgpKLSo/vqxxDhy1Zu7MUZHgmkpIBvUsva3iprjv0kJMma6
         BUqd0mqCTpBdK9eP/sRyPn7hnt9EqrQ3AycM7d6rb4IB+KgNcmYWN6irJOFhwwyM6cDY
         1nNA==
X-Gm-Message-State: APjAAAW66lDjE3X3WKAWAbOUdXJ5qd8ZgWFXqcgCvhCkr11iHiljfzJ3
        qmAYeFCx4i/9oTwx9D7TPbrPon646KiryuYF+VbC7Q==
X-Google-Smtp-Source: APXvYqzkc5LvBv1czBSlpohSy32KHfPPbYvVuxg1l19yqW3ryxB3bm5KIKRPhPdwTOrRZKiUXYCREAAmPkPBw8w+WcI=
X-Received: by 2002:a63:d906:: with SMTP id r6mr19362630pgg.440.1580128088829;
 Mon, 27 Jan 2020 04:28:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579007786.git.andreyknvl@google.com> <461a787e63a9a01d83edc563575b8585bc138e8d.1579007786.git.andreyknvl@google.com>
 <CAAeHK+wGijhTaCdoD+xcUY=PRWLUOv5uwg7OjD=uMrU8nqqrdw@mail.gmail.com> <20200122145012.GB59473@kroah.com>
In-Reply-To: <20200122145012.GB59473@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 27 Jan 2020 13:27:57 +0100
Message-ID: <CAAeHK+xJ_Xhy96vVXQLk2G_DqVtjh+3ivNM=yFVXFPBjZ6P3iA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] usb: gadget: add raw-gadget interface
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 22, 2020 at 3:50 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 22, 2020 at 03:37:46PM +0100, Andrey Konovalov wrote:
> > On Tue, Jan 14, 2020 at 2:24 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > USB Raw Gadget is a kernel module that provides a userspace interface for
> > > the USB Gadget subsystem. Essentially it allows to emulate USB devices
> > > from userspace. Enabled with CONFIG_USB_RAW_GADGET. Raw Gadget is
> > > currently a strictly debugging feature and shouldn't be used in
> > > production.
> > >
> > > Raw Gadget is similar to GadgetFS, but provides a more low-level and
> > > direct access to the USB Gadget layer for the userspace. The key
> > > differences are:
> > >
> > > 1. Every USB request is passed to the userspace to get a response, while
> > >    GadgetFS responds to some USB requests internally based on the provided
> > >    descriptors. However note, that the UDC driver might respond to some
> > >    requests on its own and never forward them to the Gadget layer.
> > >
> > > 2. GadgetFS performs some sanity checks on the provided USB descriptors,
> > >    while Raw Gadget allows you to provide arbitrary data as responses to
> > >    USB requests.
> > >
> > > 3. Raw Gadget provides a way to select a UDC device/driver to bind to,
> > >    while GadgetFS currently binds to the first available UDC.
> > >
> > > 4. Raw Gadget uses predictable endpoint names (handles) across different
> > >    UDCs (as long as UDCs have enough endpoints of each required transfer
> > >    type).
> > >
> > > 5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
> > >
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > ---
> > >
> > > Greg, I've assumed your LGTM meant that I can add a Reviewed-by from you.
> > >
> > > Felipe, looking forward to your review, thanks!
> >
> > Hi Greg and Felipe,
> >
> > I was wondering if it's feasible to get this reviewed and merged
> > during the upcoming merge window? This patch is the only piece missing
> > to enable USB fuzzing for Android common kernels on syzbot.
>
> No objection from me, if Felipe acks it I can take it...

Hi Felipe,

Any idea if you'll be able to look at this?

Thanks!
