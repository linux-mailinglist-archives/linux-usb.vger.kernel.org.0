Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7A735E453
	for <lists+linux-usb@lfdr.de>; Tue, 13 Apr 2021 18:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346940AbhDMQtx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 12:49:53 -0400
Received: from mail-qv1-f45.google.com ([209.85.219.45]:39526 "EHLO
        mail-qv1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346913AbhDMQtT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 12:49:19 -0400
Received: by mail-qv1-f45.google.com with SMTP id dl5so6115197qvb.6
        for <linux-usb@vger.kernel.org>; Tue, 13 Apr 2021 09:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p3mUlShf81QJLmhUlMcOw9mclmIpURef4oQyxssABgc=;
        b=fwiMPyVBdcSe4gq0wezY20tMNglfx0QVAInWvpJvTjYP+vN1BHpEbr2WTiiRL/7YjM
         BcraYEhQg9zr+Ia0APvYIFaXbBe5M4GkoLbDytyIxdsdhkYXjKT7cJ3I6jdCNdLpLOCx
         6Uwn9sEr3BE7C4Ic4HZcrF2xi55EpwcpV/C75BQEEbP7z1cWfmo3Hfqr+r0S5IRBQWhE
         dzfveWYE83jwd1GFmGA+R8HAbg/ps9RchLD/vfKAviUzzWEjZk7UbYntTe1GT2FKfbPp
         /cDaMMFZE8ufousHH4i+n0iGVj38v4EuFQ9SEWSChz3m9flqaUU3HYckV3vKI6GsBhTn
         LHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p3mUlShf81QJLmhUlMcOw9mclmIpURef4oQyxssABgc=;
        b=f45IdPgBODftIIOT1rujoiG5VivjMKy6fPjYQRwqOyvZCJQm1frqKq0uOecxqDp2wD
         EUxju9HA8+vj397E7r2LTqJxjPICtBG1TfBrjQTS1p3dk1j1wiQYxkg2t38vNIvLLgct
         gMqrKy9tdDeK8iYLy8SnLzpqAsXWol9u/WTHdAnnXKyOjOHqpFMiscFohcJC7tjON76h
         kBGgx6y2dH6hIMs/d0Bjf/24UTAIRqPlh8AQ4AM/I6lT+bF6VLxvybemxUCPMfejFFyW
         3iSC5NuE1R47I0jDLu8lnrVdaEl0MWxpHtMdcDrFXhNrjNxeX7E3xp8AE+5zvZGgt2E4
         YHkg==
X-Gm-Message-State: AOAM5314V+vBW2KVv1DfYUd0veQuFjqiF2qNmpD1KQ7G/NWVJD6YbNW8
        kW/hGy8r9TFAe7yVnIWlZ2wcyM2MOyJcB6Yj7YqeTg==
X-Google-Smtp-Source: ABdhPJzdEjgNaz8GgrskgJ4kqiq82ogr3hw9ZmC0QJLm3hmagALOJdG1+mVaC9jPPMOcF2mcXbnvsyL/N9yELsq1Up4=
X-Received: by 2002:a05:6214:20e8:: with SMTP id 8mr33029255qvk.13.1618332479202;
 Tue, 13 Apr 2021 09:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000075c58405bfd6228c@google.com> <CACT4Y+bTjQz=RBXVNrVMQ9xPz5CzGNBE854fsb0ukS-2_wdi3Q@mail.gmail.com>
 <20210413161311.GC1454681@rowland.harvard.edu>
In-Reply-To: <20210413161311.GC1454681@rowland.harvard.edu>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 13 Apr 2021 18:47:47 +0200
Message-ID: <CACT4Y+YEw4iJPxY4b6LPXrU91TODfu09dG=53exvQkwjPBg23w@mail.gmail.com>
Subject: Re: [syzbot] general protection fault in gadget_setup
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 13, 2021 at 6:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, Apr 13, 2021 at 10:12:05AM +0200, Dmitry Vyukov wrote:
> > On Tue, Apr 13, 2021 at 10:08 AM syzbot
> > <syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    0f4498ce Merge tag 'for-5.12/dm-fixes-2' of git://git.kern..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=124adbf6d00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=daeff30c2474a60f
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=eb4674092e6cc8d9e0bd
> > > userspace arch: i386
> > >
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com
> >
> > I suspect that the raw gadget_unbind() can be called while the timer
> > is still active. gadget_unbind() sets gadget data to NULL.
> > But I am not sure which unbind call this is:
> > usb_gadget_remove_driver() or right in udc_bind_to_driver() due to a
> > start error.
>
> This certainly looks like a race between gadget_unbind and gadget_setup
> in raw_gadget.
>
> In theory, this race shouldn't matter.  The gadget core is supposed to
> guarantee that there won't be any more callbacks to the gadget driver
> once the driver's unbind routine is called.  That guarantee is enforced
> in usb_gadget_remove_driver as follows:
>
>         usb_gadget_disconnect(udc->gadget);
>         if (udc->gadget->irq)
>                 synchronize_irq(udc->gadget->irq);
>         udc->driver->unbind(udc->gadget);
>         usb_gadget_udc_stop(udc);
>
> usb_gadget_disconnect turns off the pullup resistor, telling the host
> that the gadget is no longer connected and preventing the transmission
> of any more USB packets.  Any packets that have already been received
> are sure to processed by the UDC driver's interrupt handler by the time
> synchronize_irq returns.
>
> But this doesn't work with dummy_hcd, because dummy_hcd doesn't use
> interrupts; it uses a timer instead.  It does have code to emulate the
> effect of synchronize_irq, but that code doesn't get invoked at the
> right time -- it currently runs in usb_gadget_udc_stop, after the unbind
> callback instead of before.  Indeed, there's no way for
> usb_gadget_remove_driver to invoke this code before the unbind
> callback,.
>
> I thought the synchronize_irq emulation problem had been completely
> solved, but evidently it hasn't.  It looks like the best solution is to
> add a call of the synchronize_irq emulation code in dummy_pullup.
>
> Maybe we can test this reasoning by putting a delay just before the call
> to dum->driver->setup.  That runs in the timer handler, so it's not a
> good place to delay, but it may be okay just for testing purposes.
>
> Hopefully this patch will make the race a lot more likely to occur.  Is
> there any way to tell syzkaller to test it, despite the fact that
> syzkaller doesn't think it has a reproducer for this issue?

If there is no reproducer the only way syzbot can test it is if it's
in linux-next under CONFIG_DEBUG_AID_FOR_SYZBOT:
http://bit.do/syzbot#no-custom-patches





> Alan Stern
>
>
> Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
> +++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1900,6 +1900,7 @@ restart:
>                         if (value > 0) {
>                                 ++dum->callback_usage;
>                                 spin_unlock(&dum->lock);
> +                               mdelay(5);
>                                 value = dum->driver->setup(&dum->gadget,
>                                                 &setup);
>                                 spin_lock(&dum->lock);
