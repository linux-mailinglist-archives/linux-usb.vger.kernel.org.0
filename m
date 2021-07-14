Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A733C880C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 17:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232399AbhGNP6R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 11:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50426 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232318AbhGNP6Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 11:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626278124;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JZDfl3PLCGmOghFWWUsOqniH0oIIVxbPL+1W1WosxqM=;
        b=KLzT0zNFYMdxumFHaXdrUDZ0+FtEDdmHPVT8CDvBIL/xnqMWKKinbmfYU7pEkH0QeL6jNB
        iHR/c6CVsBc9PcphRVJFnfhKfwVbr2cSiLByYL3YJF9XZaMnHdsXDhcsAMoXb4B/AiOGya
        NMUz4LU3cGw3Z5Nnmnp8Bs4O/DoTlVI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-mnGO1BuaM3WNNw8mPX8qLA-1; Wed, 14 Jul 2021 11:55:23 -0400
X-MC-Unique: mnGO1BuaM3WNNw8mPX8qLA-1
Received: by mail-il1-f197.google.com with SMTP id b8-20020a92c8480000b0290208fe58bd16so1428393ilq.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 08:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZDfl3PLCGmOghFWWUsOqniH0oIIVxbPL+1W1WosxqM=;
        b=Zjjo+lPBBKCe3ynmbRc8Z8cJGG1tgOEsrsc2M6VBRsnAuWD+EUKkucqzbIs9h/9zYt
         O2kK3FzrpBnxdx8nmWIIQ9HvAHsxInvp6RiyRAbd4CxrqvTKyVhLTeLUuR4DRY6esPI9
         Kz+DhLPOgSskBzwY+qJ4xHk5HPkywwIiDfZ2oqmlFKTRiJRiAw8RDSZcccdvjo+K6YvF
         4SJj8S9JJXHIOep4dIOOPfapYsmm0ChLrY0AQdnxsdgJs/zGAlsNP9ElGWEu157vSTCw
         QH7OYNghQy0PV2/trXa0iJd3AURXUNregFMNTrvnqQufa3cbN9bDc1D1vZNrJgKyhqxu
         3q5Q==
X-Gm-Message-State: AOAM532Uttz3Sm/lus7UG6mLhtvwil5QZpsFNOBoVj2wJoBpY8GMGXHr
        46c0zkmfDwGYHUoTi4xfRgA9qvBlR6m8+Vjise8JrbXCVJXZPnJ7WMn+F6miTNWHF//VJeCAc7/
        Kyj0dXK7RL8zYp3JdCChTLWkYFksD3N5Jt4PI
X-Received: by 2002:a92:1908:: with SMTP id 8mr201715ilz.149.1626278122102;
        Wed, 14 Jul 2021 08:55:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq/9PdcRT4UadTTjugjkcD/NoMGh4IQElbpW9MwZoFCLi4AqzpzZemCCD9pywV/M8sj2c+bMPpB3oCRfcCmRA=
X-Received: by 2002:a92:1908:: with SMTP id 8mr201703ilz.149.1626278121921;
 Wed, 14 Jul 2021 08:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210714140309.GA27799@redhat> <YO70Pf6051RbK7kl@smile.fi.intel.com>
In-Reply-To: <YO70Pf6051RbK7kl@smile.fi.intel.com>
From:   David Jeffery <djeffery@redhat.com>
Date:   Wed, 14 Jul 2021 11:55:10 -0400
Message-ID: <CA+-xHTEcJYXCwLdwOzvXQGVfUVr3Ytj9ABEN4psBts=iRxqg8A@mail.gmail.com>
Subject: Re: [PATCH] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Laurence Oberman <loberman@redhat.com>,
        Ewan Milne <emilne@redhat.com>, apanagio@redhat.com,
        torez@redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 10:27 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 14, 2021 at 10:03:09AM -0400, David Jeffery wrote:
>
> Thanks, I have few minor comments, after addressing them feel free to add
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> > When MSI is used by the ehci driver, it can cause interrupts to be lost which
>
> ehci -> EHCI everywhere?
>

Are you asking for a capitalization change in the text or asking what
all is affected by the bug?

> > diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> > index 36f5bf6a0752..2283205d4b40 100644
> > --- a/drivers/usb/host/ehci-hcd.c
> > +++ b/drivers/usb/host/ehci-hcd.c
> > @@ -704,14 +704,18 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
> >  {
> >       struct ehci_hcd         *ehci = hcd_to_ehci (hcd);
> >       u32                     status, masked_status, pcd_status = 0, cmd;
> > +     u32                     current_status;
>
> Perhaps
>
>         u32                     status, current_status, masked_status, pcd_status = 0;
>         u32                     cmd;
>
> ?
>

Is this a style preference?  I can change it and just did it in a way
to minimize line changes.

>
> >       int                     bh;
> >
> >       spin_lock(&ehci->lock);
> >
> > -     status = ehci_readl(ehci, &ehci->regs->status);
> > +     status = 0;
> >
> > +     current_status = ehci_readl(ehci, &ehci->regs->status);
> > +restart:
> > +     status |= current_status;
> >       /* e.g. cardbus physical eject */
> > -     if (status == ~(u32) 0) {
> > +     if (current_status == ~(u32) 0) {
> >               ehci_dbg (ehci, "device removed\n");
> >               goto dead;
> >       }
> > @@ -720,7 +724,7 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
> >        * We don't use STS_FLR, but some controllers don't like it to
> >        * remain on, so mask it out along with the other status bits.
> >        */
> > -     masked_status = status & (INTR_MASK | STS_FLR);
> > +     masked_status = current_status & (INTR_MASK | STS_FLR);
> >
> >       /* Shared IRQ? */
> >       if (!masked_status || unlikely(ehci->rh_state == EHCI_RH_HALTED)) {
> > @@ -730,6 +734,12 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
> >
> >       /* clear (just) interrupts */
> >       ehci_writel(ehci, masked_status, &ehci->regs->status);
> > +
> > +     /* for edge interrupts, don't race with an interrupt bit being raised */
>
> for -> For
>

I'll update it.

