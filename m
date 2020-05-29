Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39EB21E8744
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 21:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgE2TIJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 15:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbgE2TIJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 15:08:09 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BBAC08C5C8
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 12:08:09 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id z13so2124531vsn.10
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hYzBcSnkeRqRYhmGL7q3zEPzCsMFScEKB+M/Qrm/VHQ=;
        b=oVyGGWu8PSqsm//SI6gN6AlXZFjRuxQgHR/52JZH0oroovxvat+dmzwGbc2pIwNxKH
         BSJbvttfON0fH9JZe5ClupdFpQoZ8deQsDOJIxhu0JE9pFouRD/28xbac3YfI6bo9Vh7
         OQ/6Qkeee7AAZAfx4oQMW7QaVQiCxl5DCD/A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hYzBcSnkeRqRYhmGL7q3zEPzCsMFScEKB+M/Qrm/VHQ=;
        b=tnqlNNFDtPkTWtFAVKNEo3IzGjQk8edsM2f2d0OygP3iP8jakcXlMJIgf0gVdoDpw9
         I51DZIOxvMsks1kVi4LcZISg1L/ToqOnTnHD0ix+lbZxV23qoTuZ1jTzI4jpgrv6d9K5
         pmAf127tNLIpjh/u3DVMZnySKDaQXw+9c19/eapyId5BDVaRMzXAF9z/N8m1M0SHNjSo
         t68XGzZ8WMOZfJaj7gci32bhtTZf7iy1FOXjijFJ+QSZef83BwT3CpgMyDDQpi2bM7Ad
         b6WnMg6jHJn9ttaqeCQxbWhrwdUvyC+UI0SUaEkJoTnnO1tCEvMbVSZBS7xwgxyBSOxa
         L+WA==
X-Gm-Message-State: AOAM531QsfKaW2DK+B+JZweCj/gF1nQSgID2IflyeViMdfmMA3WNREs6
        z9s6wILE7raNoUh9a3tJtDHmbIgq0+Q=
X-Google-Smtp-Source: ABdhPJwOK+h+ozdcJtmsg9r+PxR50AS6L8UfH97Qm17L+4fQWD9bbygnlzWpNQBMINtX7xdeQCBpOA==
X-Received: by 2002:a05:6102:3ce:: with SMTP id n14mr7274871vsq.113.1590779287745;
        Fri, 29 May 2020 12:08:07 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id c193sm917524vke.17.2020.05.29.12.08.06
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 12:08:07 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id j28so940707vkn.8
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 12:08:06 -0700 (PDT)
X-Received: by 2002:a05:6122:11bc:: with SMTP id y28mr7354684vkn.75.1590779286439;
 Fri, 29 May 2020 12:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <1d3bae1b3048f5d6e19f7ef569dd77e9e160a026.1590753016.git.hminas@synopsys.com>
 <CAD=FV=W1x_HJNCYMUb11QNA8yGs0heEiZzHZdeMPzFaRHaTOsA@mail.gmail.com>
 <0f6b1580-41d8-b7e7-206b-64cda87abfd5@synopsys.com> <CAD=FV=UCMqyX92o9m7H40E3sHzAFieHSu3TUY953VqNb-vuPPg@mail.gmail.com>
 <CAJz5OpfDnHfGf=dLbc0hTtaz-CERsQyaBNeqDiRz7u4jMywNow@mail.gmail.com>
 <CAD=FV=URUeE55xyL3iB5GmS7BRoDG2ey3UE4qSwwc7XZHR0c-Q@mail.gmail.com>
 <CAJz5OpdMDumfdYC+aj0N20p4qVEkEkHhNY3uKest6RSpPtrDWQ@mail.gmail.com>
 <CAD=FV=XsLA3w2QPcNF3-mgZbZoGsz4kg_QvHcoZV=XTVDYhnSg@mail.gmail.com> <20200529190031.GA2271@rowland.harvard.edu>
In-Reply-To: <20200529190031.GA2271@rowland.harvard.edu>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 29 May 2020 12:07:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUULUgw_fnpbv2b-m8=CrOJimOba+ewRJj_hMB7niK1A@mail.gmail.com>
Message-ID: <CAD=FV=UUULUgw_fnpbv2b-m8=CrOJimOba+ewRJj_hMB7niK1A@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: Fix shutdown callback in platform
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Frank Mori Hess <fmh6jj@gmail.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "# 4.0+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, May 29, 2020 at 12:00 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, May 29, 2020 at 11:45:53AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 29, 2020 at 11:21 AM Frank Mori Hess <fmh6jj@gmail.com> wrote:
> > >
> > > On Fri, May 29, 2020 at 1:53 PM Doug Anderson <dianders@chromium.org> wrote:
> > > > >
> > > > > I don't get it.  A hypothetical machine could have literally anything
> > > > > sharing the IRQ line, right?
> > > >
> > > > It's not a real physical line, though?  I don't think it's common to
> > > > have a shared interrupt between different IP blocks in a given SoC.
> > > > Even if it existed, all the drivers should disable their interrupts?
> > >
> > > I don't know, it's a hypothetical machine so it can be whatever you
> > > want.  The driver requests shared irqs, if it doesn't actually support
> > > irq sharing, it shouldn't request them.
> >
> > I guess?  As I understood it drivers have to be very carefully coded
> > up to support sharing their IRQ with someone else and I'm not
> > convinced dwc2 does that anyway.  Certainly it doesn't hurt to keep
> > dwc2 clean, but until I see someone that's actually sharing dwc2's
> > interrupt and I can actually see an example I'm not sure I'm going to
> > spend too much time thinking about it.
>
> This is silly.  If the driver says it supports shared IRQs, then it
> should actually support them.

Ah.  The IRQ here is "shared" because of the way that the dwc2 driver
is architected.  The "gadget" mode and "host" mode driver "share" the
IRQ.  ...but there is no non-dwc2 device sharing.  In other words,
it's not like there's a UART or and i2c device that would share it.


> > > > > Anyways, my screaming interrupt occurs after a a new kernel has been
> > > > > booted with kexec.  In this case, it doesn't matter if the old kernel
> > > > > called disable_irq or not.  As soon as the new kernel re-enables the
> > > > > interrupt line, the kernel immediately disables it again with a
> > > > > backtrace due to the unhandled screaming interrupt.  That's why the
> > > > > dwc2 hardware needs to have its interrupts turned off when the old
> > > > > kernel is shutdown.
> > > >
> > > > Isn't that a bug with your new kernel?  I've seen plenty of bugs where
> > > > drivers enable their interrupt before their interrupt handler is set
> > > > to handle it.  You never know what state the bootloader (or previous
> > > > kernel) might have left things in and if an interrupt was pending it
> > > > shouldn't kill you.
> > >
> > > It wouldn't hurt to add disabling of the dwc2 irq early in dwc2
> > > initialization,
> >
> > More than it not hurting, I'd consider it a bug in the driver (and a
> > much more serious one than shutdown not disabling the interrupt).
>
> Normally the first thing a driver would do is reset the hardware, and
> that reset should disable any interrupt source.

Yup.


> > > but why leave the irq screaming after shutdown?
> >
> > Sure.  So I guess the answer is to just do both disable the interrupt
> > and make sure that the interrupt handler has finished.
> >
> > dwc2_disable_global_interrupts(hsotg);
> > disable_irq(hsotg->irq);
>
> Drivers with shared IRQs don't call disable_irq(); they call
> synchronize_irq().  It will do what you want (wait until all running
> handlers have returned).

OK.

-Doug
