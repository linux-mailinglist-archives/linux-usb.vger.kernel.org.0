Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E00C3C8862
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 18:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhGNQNc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 12:13:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21628 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232086AbhGNQNb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 12:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626279039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LuP8+/oQfm8FRCQEl73jko6Wl4FaC7GOlrntI6I6ktQ=;
        b=KTjDFEV4xEp996oe2J6TfluNoqLiClMxZzRf3D9QGXnaFYmZD3BxmiJmBSd0Boy5hKF8JJ
        w+3jD4m+zOumK+IuRsDk2r1cXKPcmaSyrHKay/WYRH9u2aMGgUvrewin2nADTgVdsAqRa5
        dtsQ2HFK/F5nnRXohjMXq4NWgeCXIr4=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-5ET1M1_3OcyJN3xsUullzg-1; Wed, 14 Jul 2021 12:10:38 -0400
X-MC-Unique: 5ET1M1_3OcyJN3xsUullzg-1
Received: by mail-il1-f198.google.com with SMTP id h17-20020a056e021d91b02902004a17fb0aso1428806ila.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 09:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LuP8+/oQfm8FRCQEl73jko6Wl4FaC7GOlrntI6I6ktQ=;
        b=lW177GQd7QJmOAevVnmchcOklBJFbA9C8eRmLg/1flLTqiy8n1jxYDsH+2GJTU3WRW
         eXB+EF7IH9EIGycStU1HsUgstKH2kBXIVlgM9R9si4gVW3PfNpmm6ax9gudN7MA+Zqns
         G/cBLez56wTCBLrpNnx/hYrVqE6xVNKdRtIpDrYmRiZeqQ2v0F2l5qVFzTkD09oUEBdV
         RaoNUUaZOFPXlBMXcdu5bmROK6xFgi8m1zepds7dTr6nHeLAsUMkS+eq2FpiyM/Dok5N
         sx2KfhBqhmolR/76RttCt/IelvlGUl4hRhyfopymVrP0iAhKvP6mvMqIZiubtUjDKYc/
         Zc3Q==
X-Gm-Message-State: AOAM533AuR2lyYWvuXr9e9Q+Uy9DLwCIKjRw0MrykBD7GHsA+Ve+1A8B
        FZy2abHDiVka6DxteXQLhwxpjz5C/MpGnLV8unnNP9vYsz+JLSnkWlSkFzq8+uSCcHwzB38ER3J
        5KCplhKpBuZsLubZ34FPwlKSWwTHBku/H5rPl
X-Received: by 2002:a92:c7a6:: with SMTP id f6mr7144269ilk.20.1626279037922;
        Wed, 14 Jul 2021 09:10:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn8cvMoilxvNm4xoRrxsEkRABoeYKwxFy0x+ITeIdDTIF/T6MHbiOXjX/RPi2zv5YBNQNdzmHMoFuxVgBrqUw=
X-Received: by 2002:a92:c7a6:: with SMTP id f6mr7144256ilk.20.1626279037765;
 Wed, 14 Jul 2021 09:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210714140309.GA27799@redhat> <20210714142923.GA380727@rowland.harvard.edu>
In-Reply-To: <20210714142923.GA380727@rowland.harvard.edu>
From:   David Jeffery <djeffery@redhat.com>
Date:   Wed, 14 Jul 2021 12:10:26 -0400
Message-ID: <CA+-xHTGb73f_nCHg=D0qyFp2v-UaCpyisdbWvoUKTaVB077Zeg@mail.gmail.com>
Subject: Re: [PATCH] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Laurence Oberman <loberman@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ewan Milne <emilne@redhat.com>, apanagio@redhat.com,
        torez@redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 10:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Jul 14, 2021 at 10:03:09AM -0400, David Jeffery wrote:

> >
> > diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> > index 36f5bf6a0752..2283205d4b40 100644
> > --- a/drivers/usb/host/ehci-hcd.c
> > +++ b/drivers/usb/host/ehci-hcd.c
> > @@ -704,14 +704,18 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
> >  {
> >       struct ehci_hcd         *ehci = hcd_to_ehci (hcd);
> >       u32                     status, masked_status, pcd_status = 0, cmd;
> > +     u32                     current_status;
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
>
> Mild stylistic quibble: I generally prefer to have a blank line before a
> /* ... */ comment.  And it doesn't seem reasonable to have a blank line
> between "status = 0" and the current_status assignment, since those are
> similar once-only things before the beginning of the "restart" loop.
> Also, I would move the "status |= current_status" line after the test
> for device removed, since that test doesn't use status.
>
> But obviously none of these things affect the patch's correntness.

I'll update it with requested changes and resend it.

>
> You can choose to submit a new version of the patch with those stylistic
> changes, or if you prefer, just stick with this version.  Either way,
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
> Does this issue affect any other PCI-based host controller drivers?
>
> Alan Stern
>

Possibly.  The uhci driver should have the same issue if hardware
exists with it and has MSI for it.  I suspect the ohci driver has a
similar issue, but I'm not familiar enough with its interfaces and
specification to say for sure.

David Jeffery

