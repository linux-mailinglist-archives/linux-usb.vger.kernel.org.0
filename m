Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33233C77A9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 22:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234698AbhGMUID (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 16:08:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39978 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229944AbhGMUID (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 16:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626206712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BwIcVGw+0Tpi8eO5Of2PjsJTRkujnsB8Az7JZMygUWk=;
        b=AlgNADvHVS4QPv7MkOKuj6PPi4npqQsNfF0XnUJprdXjjkbrlQbSKpTtWLbV71EUfV8501
        QwPSFHQbWcevQsY4Z5VuLYnxgoZbSGsT5jMG6N1MJfn443IdBKOM8RNHRAtgX5p8R4s/6Z
        r62CrpREAm2SeU3/GJjJ/E8GjN2i6N0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-uT_6MYJ6Nbmx0fbNn4AOnA-1; Tue, 13 Jul 2021 16:05:09 -0400
X-MC-Unique: uT_6MYJ6Nbmx0fbNn4AOnA-1
Received: by mail-qk1-f198.google.com with SMTP id ay38-20020a05620a17a6b02903b7bed4e05eso15063818qkb.6
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 13:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BwIcVGw+0Tpi8eO5Of2PjsJTRkujnsB8Az7JZMygUWk=;
        b=BAzGzqgNyL/3/O7g4KR1qEMi3XP+ZNsu8yZFIxY+UASG7f9RarWX0WfutbsnzruCJm
         1BP/iNIIvZhc8Cy87plPPZeUhA/uVB5nAF+kfTTsmfzFT2QgOue04xDSDWxYeLiqlbZA
         A6PKeojeQws3DamMFWbP4kFDExoAKBktRdtyZiZ85GgVe6R8IFaAWnQrdsGinnYaBCgz
         JetNIE3vhtY2RaJI6L0bRdcRV8Hg/ri9vMQb+xkjMMbtTWXCSL/3T9euG+AzHcf2/T+X
         a2ic3ewNfQM0nmk5wNLI6yMgHspea97g70oqiUkYd33ksO1I5nJc2LGsevC8AKhZhRO5
         s+vw==
X-Gm-Message-State: AOAM533jgVEyiuBOAPJ9FF0LLy+0JXuhKLJiAA3BqKIkrvpdZ7eu/MwR
        3O+SoUN0r+OyxGKvaaqKgihTeCCEMuVqpphcujcNiBtKSK4csLgrXWXcG0qSQhXH8nVmkHFbIyn
        hA7hmhJqV92sDHzPy1s7H
X-Received: by 2002:a05:620a:1998:: with SMTP id bm24mr5884469qkb.319.1626206708845;
        Tue, 13 Jul 2021 13:05:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDe3cstj1D1Ox/lILQfJ1rWd/L6BO4hUZ+6gTyqkymvtoSEiAmhV61ahK+2haONOa4F1/U3g==
X-Received: by 2002:a05:620a:1998:: with SMTP id bm24mr5884447qkb.319.1626206708504;
        Tue, 13 Jul 2021 13:05:08 -0700 (PDT)
Received: from loberhel ([2600:6c64:4e7f:cee0:729d:61b6:700c:6b56])
        by smtp.gmail.com with ESMTPSA id x7sm1514955qtw.24.2021.07.13.13.05.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 13:05:07 -0700 (PDT)
Message-ID: <e4cfb11631b00cb45b385be6048d5b39d301f433.camel@redhat.com>
Subject: Re: [PATCH] usb: hcd: Revert
 306c54d0edb6ba94d39877524dddebaad7770cf2: Try MSI interrupts on PCI devices
From:   Laurence Oberman <loberman@redhat.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        stable@vger.kernel.org, emilne@redhat.com, djeffery@redhat.com,
        apanagio@redhat.com, torez@redhat.com
Date:   Tue, 13 Jul 2021 16:05:06 -0400
In-Reply-To: <20210713191548.GD355405@rowland.harvard.edu>
References: <1626202242-14984-1-git-send-email-loberman@redhat.com>
         <20210713191548.GD355405@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2021-07-13 at 15:15 -0400, Alan Stern wrote:
> On Tue, Jul 13, 2021 at 02:50:42PM -0400, Laurence Oberman wrote:
> > Customers have been reporting that the I/O is radically being
> > slowed down to HPE virtual USB ILO served DVD images during
> > installation.
> > 
> > Lots of investigation by the Red Hat lab has found that the issue
> > is 
> > because MSI edge interrupts do not work properly for these 
> > ILO USB devices.
> > We start fast and then drop to polling mode and its unusable.
> > 
> > The issue exists currently upstream on 5.13 as tested by Red Hat, 
> > and reverting the mentioned patch corrects this upstream.
> > 
> > David Jeffery has this explanation:
> > 
> > The problem with the patch turning on MSI appears to be that the
> > ehci 
> > driver (and possibly other usb controller types too) wasn't written
> > to
> > support edge-triggered interrupts.
> > The ehci_irq routine appears to be written in such a way that it
> > will 
> > be racy with multiple interrupt source bits.
> > With a level-triggered interrupt, it gets called another time and
> > cleans 
> > up other interrupt sources.
> > But with MSI edge, the interrupt state staying high results in no 
> > new interrupt and ehci has to run based on polling.
> > 
> > static irqreturn_t ehci_irq (struct usb_hcd *hcd)
> > {
> > ...
> >         status = ehci_readl(ehci, &ehci->regs->status);
> > 
> >         /* e.g. cardbus physical eject */
> >         if (status == ~(u32) 0) {
> >                 ehci_dbg (ehci, "device removed\n");
> >                 goto dead;
> >         }
> > 
> >         /*
> >          * We don't use STS_FLR, but some controllers don't like it
> > to
> >          * remain on, so mask it out along with the other status
> > bits.
> >          */
> >         masked_status = status & (INTR_MASK | STS_FLR);
> > 
> >         /* Shared IRQ? */
> >         if (!masked_status || unlikely(ehci->rh_state ==
> > EHCI_RH_HALTED)) {
> >                 spin_unlock_irqrestore(&ehci->lock, flags);
> >                 return IRQ_NONE;
> >         }
> > 
> >         /* clear (just) interrupts */
> >         ehci_writel(ehci, masked_status, &ehci->regs->status);
> > ...
> > 
> > ehci_irq() reads the interrupt status register and then writes the
> > active 
> > interrupt-related bits back out to ack the interrupt cause.
> > But with an edge interrupt, this is racy as another source of
> > interrupt 
> > could be raised by ehci between the read and the write reaching
> > the 
> > hardware. 
> > e.g.  If STS_IAA was set during the initial read, but some other
> > bit like 
> > STS_INT gets raised by the hardware between the read and the write
> > to the 
> > interrupt status register, the interrupt signal state won't drop.
> > The interrupt state says high, and since it is now edged triggered
> > with 
> > MSI, no new invocation of the interrupt handler gets triggered.
> 
> Wouldn't it be better to change these other PCI drivers by adding 
> proper MSI support?  I don't know what would be involved, but 
> presumably it wouldn't be very hard.  (Just run the handler in a
> loop 
> until all the interrupt status bits are off?)
> 
> Alan Stern
> 

Hello

Agree with you that is a big hammer approach,  but it's such a key
piece of the massive number of HPE servers out there and we have many
affected customers.

While I did all the test work and discovery etc, I am definitely not a
USB kernel guy very often, I spend most of my time in storage.
I will listen for the other replies to see how the folks who know the
subsystem better than I would want this reolved.

Thanks
Laurence



