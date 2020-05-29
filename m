Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2063E1E86ED
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 20:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgE2SqI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 14:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgE2SqH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 14:46:07 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B5BC08C5C8
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 11:46:07 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id v26so2107942vsa.1
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tNT7fd5a5yCD0C0Z2Z4mwv1x2FkdYNtaJ3P0m6Fclrk=;
        b=b1MYcNOgv1z4rpkHsSr88+iEZMenD4UkJ6g3KlTefzvkaBidRRIzFtkNptDlZrSp5o
         N1vDR/d6VlcU0pdFdhgaWiSpIs3B218HmqY6GbOiQah2GZt6ephq1jdGWEduptGQpYY2
         AoiTcDDN5kg6WG93MEIYvJDL6nzG8WMOiJMX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNT7fd5a5yCD0C0Z2Z4mwv1x2FkdYNtaJ3P0m6Fclrk=;
        b=TyFJ3vH0KMl0ZhKLBDXKMuaCHPnuk7riCvBN7/EukIGK3yN66gqX/uZIBmTkQzgT9D
         X/HxkeZnEid5nMP9Zw6Qv4gy/qQ3er1NAqFtCp8Ogy5MgFnJTdN8htVcMehcr9CF2+GD
         rTRfkaj6juRTxh5cbqxCKUi8BuzKyQTKLrqimi2KWXHl4iL9J/LkJfyMYhB+3y4zPMxT
         b+KMC04dHAUPQYJi+3/d79LHnxozSbyM3r9WJoQ2F5NxD7gyr9dXxGdzKalRgsJWvW7E
         CPc3E9reXrcomu/maWWw7Jqv6XxRyKIuMGG3NF2X5DRrpekHQP544zPYLDTfnEEpjIKR
         qDJg==
X-Gm-Message-State: AOAM532vnUesGK63oA2nSS/wuUM7FQPTNTPU0JHirhUOibD7PURV3xbr
        Tc96GmTwVjSTTAgM8FiGpIi4Vp9ok34=
X-Google-Smtp-Source: ABdhPJw4sUjSrOF6hYKwajtyjeMkMyzb0VJqhGa+oJoVViC69u21k+sJVUwFAH7rCsDo3lxcLueBZQ==
X-Received: by 2002:a67:ef4a:: with SMTP id k10mr6601530vsr.20.1590777965713;
        Fri, 29 May 2020 11:46:05 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id r21sm1021455vsa.27.2020.05.29.11.46.05
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 11:46:05 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id g34so1155601uah.4
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 11:46:05 -0700 (PDT)
X-Received: by 2002:a9f:24c1:: with SMTP id 59mr7147726uar.91.1590777964650;
 Fri, 29 May 2020 11:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <1d3bae1b3048f5d6e19f7ef569dd77e9e160a026.1590753016.git.hminas@synopsys.com>
 <CAD=FV=W1x_HJNCYMUb11QNA8yGs0heEiZzHZdeMPzFaRHaTOsA@mail.gmail.com>
 <0f6b1580-41d8-b7e7-206b-64cda87abfd5@synopsys.com> <CAD=FV=UCMqyX92o9m7H40E3sHzAFieHSu3TUY953VqNb-vuPPg@mail.gmail.com>
 <CAJz5OpfDnHfGf=dLbc0hTtaz-CERsQyaBNeqDiRz7u4jMywNow@mail.gmail.com>
 <CAD=FV=URUeE55xyL3iB5GmS7BRoDG2ey3UE4qSwwc7XZHR0c-Q@mail.gmail.com> <CAJz5OpdMDumfdYC+aj0N20p4qVEkEkHhNY3uKest6RSpPtrDWQ@mail.gmail.com>
In-Reply-To: <CAJz5OpdMDumfdYC+aj0N20p4qVEkEkHhNY3uKest6RSpPtrDWQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 29 May 2020 11:45:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XsLA3w2QPcNF3-mgZbZoGsz4kg_QvHcoZV=XTVDYhnSg@mail.gmail.com>
Message-ID: <CAD=FV=XsLA3w2QPcNF3-mgZbZoGsz4kg_QvHcoZV=XTVDYhnSg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: Fix shutdown callback in platform
To:     Frank Mori Hess <fmh6jj@gmail.com>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
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

On Fri, May 29, 2020 at 11:21 AM Frank Mori Hess <fmh6jj@gmail.com> wrote:
>
> On Fri, May 29, 2020 at 1:53 PM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > I don't get it.  A hypothetical machine could have literally anything
> > > sharing the IRQ line, right?
> >
> > It's not a real physical line, though?  I don't think it's common to
> > have a shared interrupt between different IP blocks in a given SoC.
> > Even if it existed, all the drivers should disable their interrupts?
>
> I don't know, it's a hypothetical machine so it can be whatever you
> want.  The driver requests shared irqs, if it doesn't actually support
> irq sharing, it shouldn't request them.

I guess?  As I understood it drivers have to be very carefully coded
up to support sharing their IRQ with someone else and I'm not
convinced dwc2 does that anyway.  Certainly it doesn't hurt to keep
dwc2 clean, but until I see someone that's actually sharing dwc2's
interrupt and I can actually see an example I'm not sure I'm going to
spend too much time thinking about it.


> > > Anyways, my screaming interrupt occurs after a a new kernel has been
> > > booted with kexec.  In this case, it doesn't matter if the old kernel
> > > called disable_irq or not.  As soon as the new kernel re-enables the
> > > interrupt line, the kernel immediately disables it again with a
> > > backtrace due to the unhandled screaming interrupt.  That's why the
> > > dwc2 hardware needs to have its interrupts turned off when the old
> > > kernel is shutdown.
> >
> > Isn't that a bug with your new kernel?  I've seen plenty of bugs where
> > drivers enable their interrupt before their interrupt handler is set
> > to handle it.  You never know what state the bootloader (or previous
> > kernel) might have left things in and if an interrupt was pending it
> > shouldn't kill you.
>
> It wouldn't hurt to add disabling of the dwc2 irq early in dwc2
> initialization,

More than it not hurting, I'd consider it a bug in the driver (and a
much more serious one than shutdown not disabling the interrupt).


> but why leave the irq screaming after shutdown?

Sure.  So I guess the answer is to just do both disable the interrupt
and make sure that the interrupt handler has finished.

dwc2_disable_global_interrupts(hsotg);
disable_irq(hsotg->irq);


-Doug
