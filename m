Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F70F2456B2
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 10:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgHPIde (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Aug 2020 04:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgHPIdb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Aug 2020 04:33:31 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8BAC061756
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2020 01:33:31 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 128so6581211pgd.5
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2020 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/1CEUZcvtf3c99vZTDfJMw1rXynYQ3pwAH+BrS1USpM=;
        b=M50pB3yTnCVZv/Gp1+Pb4/vBnxAG8l5vymVJUpQItt3YjhrjfRWa3BEn8mn6IAim7p
         QEjdR5p9gfyeP0bzeTrwoaDRZ0+bor4NtzYMcGcomWk+SmeXyEDA4sDAaD01ShYjaIax
         kwLlab0BIqcztZ5639ZcZ6j1tEyPmtA8IphR/qjLyR9+NwVyI5ZPsY/FgF1lRv+qLYaT
         74B5v5BRRCkW8kruc9BB6lE951CLGuiia7ddi+XRYcBfvlm+jGt8LLUPShb+Q69tRVqh
         jwd2zjkETQMTE3hlsc37qOBXjn+K7gYVMoe7dWN+wEbLa6vEdty1T9kQDS57C3iPTV7Q
         +3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/1CEUZcvtf3c99vZTDfJMw1rXynYQ3pwAH+BrS1USpM=;
        b=CIyUpNxQqCXEqInz7Z5vhwZWO3nWK9bgv1U6GDlqvLAIDdNzEVG5kLkH6ispYnwTwX
         hm1Rq4rertlPlqyqTt1vkGCc6Sm8iqrJuy/rX79NOjCgJ3YSPh1uBW3Q3HN/+jfCwien
         S4kKPkxGsgV1SpQpgSmv9471sS/v66cHOx6kYURcugNAco99k4jJcPcVxso+KTFG6QtN
         DvYg4zvCPPY3HPh+/beFRalf/EBKKMrf/IuyZEm0uICF5Qh9CvOBt5uYnVSHzf1TNbgs
         Ue30lVBPuPRsns8BbYaDzQZfbIKIEHZGk1YsJnBnW4pWEacQ/JGyZw5idSIp0PtoCS3l
         bQKA==
X-Gm-Message-State: AOAM532PvBmSI5cYzldceY5FgkrlWdYQKzrSU7BKCJF3xenPawMtnud5
        r7JYZ4kmtM4lCuJDqYqVFVI1Je5ipCY9PkPxrojm9vCY9qeMCA==
X-Google-Smtp-Source: ABdhPJyA3x+aUD7EWLGYTmmziyr0KRunLL0OV3qJ71yIG5RGIT5zJLZ1ZjF2dgG0fnDgsv5KBLFEUKtR6qUroodeQnk=
X-Received: by 2002:a62:158e:: with SMTP id 136mr7568340pfv.36.1597566810751;
 Sun, 16 Aug 2020 01:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com> <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
 <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com> <20200814180720.GE1891694@smile.fi.intel.com>
 <20200814195119.GA45072@rowland.harvard.edu> <CAHp75VdMXd3LWLM5ooBsWGZnSXnJBW3R5gH9Cpux0EHmcxjTvQ@mail.gmail.com>
 <20200815015000.GA52242@rowland.harvard.edu>
In-Reply-To: <20200815015000.GA52242@rowland.harvard.edu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 16 Aug 2020 11:33:14 +0300
Message-ID: <CAHp75VdCCe=sKuas+sdu__qYVSEO4pKqZ8RGq_Jxaoh91HXZ+g@mail.gmail.com>
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        John Garry <john.garry@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 15, 2020 at 4:50 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> On Sat, Aug 15, 2020 at 12:55:57AM +0300, Andy Shevchenko wrote:
> > On Friday, August 14, 2020, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > On Fri, Aug 14, 2020 at 09:07:20PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Aug 14, 2020 at 06:18:16PM +0100, John Garry wrote:

...

> > > > > -   usb_put_hcd(hcd);
> > > > >     if ((hcd->driver->flags & HCD_MASK) < HCD_USB3)
> > > > >             pci_free_irq_vectors(dev);
> > > > > +   usb_put_hcd(hcd);
> > > >
> > > > It's not correct approach.
> > > > We need to copy flags to a temporary variable.
> > > > I will send a new patch soon to test, thanks!
> > >
> > > Just out of curiosity, can you explain what is wrong with John's
> > > approach?  The problem isn't obvious to me.
> >
> >
> > Alloc vector -> create HCD -> put HCD -> free vector
> >
> > VS.
> >
> > Alloc vector -> create HCD -> free vector -> put HCD
> >
> > Of course I might miss something...
>
> Sure, the difference in ordering was pretty obvious.  What is not
> obvious is why this should cause a problem.

It may be not causing any problem right now, but with all these small
steps we may come to the case like DWC3 removal mess.

> Do you think that the host controller driver is going to try to use the
> IRQ vector somewhere between the pci_free_irq_vectors call and the
> usb_put_hcd call?  If that's not going to happen then I don't see what
> difference the order of the two calls makes.

I think that this is a bit incorrect to rely on side-effects to ruin
the clear understanding of what ordering is going on. If you insist,
you can take John's solution, but I won't give a tag on such.

Also take into consideration the possible copy'n'paste of this example
to other drivers. I have seen a lot of bad examples were
copied'n'pasted all over the kernel during my reviews. I don't want to
give another one.

So, the review process, in my opinion, should be slightly broader that
we usually understand it, i.e. take into account:
- *run-time* bisectability
- possible copy'n'paste of the code excerpts


-- 
With Best Regards,
Andy Shevchenko
