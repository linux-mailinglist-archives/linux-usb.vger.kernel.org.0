Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A654816E98
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 03:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfEHBSB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 21:18:01 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45830 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbfEHBSA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 21:18:00 -0400
Received: by mail-qk1-f193.google.com with SMTP id j1so5532460qkk.12
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2019 18:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O+01/fhDqtai1N/X2yLycMXv1SIs+oDpJCrUUWcrjMA=;
        b=FjutGs8Upc4X6Ku/pI/PhsHhXsb8sSJIphZ2Bg6gKbUsba2yYhZiL0CQ1dmLmyiNMY
         1DoyzoBrbX/9wIuVbbJxqDoh6T5/SjSLneERnFf2MvvZ4dEnh5JkyfUIml41Djky5/16
         mUowZUTgIE3HBR+V4Tj+h5zLTs801GBy08Ld8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O+01/fhDqtai1N/X2yLycMXv1SIs+oDpJCrUUWcrjMA=;
        b=nDJgcQnntz/ydnSS4RfIXA6zPDuutArhNQFu+kiOP2J73QArPYRrDdbU1Y1l2ul13v
         j3k5RQbTTT3uJLyEFBrBWVSTUvwsWxKRnDcyeEQ9/auxRQIqrtvtcJMUFBDtomj5m6WG
         JD+rnMATentQ8JX22CTiq4u3SmqmfMHsJifyeufAvcb01QxbT0/mMjoCj12698T5sPvV
         gn7wLd5lD+AtHh8K6Dx4U1lKUcCR4iN5FFzlLgvGDJIfv1XKHhi3SNLR/rIaUeo7QXU6
         WwghDbztSt9fsfKqV7JcQ1BAn3jRvqx4L8OO4YZwQFeHi8qvNfszv+zctdn4bV5t8wEc
         n4ew==
X-Gm-Message-State: APjAAAUrekyalPPSjGx/0+7NJYUEBIAqhyo3YqmSA5NcBFS48upA6eni
        sSxWqcgEtJjwKX92cd8Jn0EHhZJ0aOcyE+eyIaMJtw==
X-Google-Smtp-Source: APXvYqxL08Ax+gOyBauc0IC54ns9XncT6heXSua50dh6BBwY1PpGYWMo0JAbDc87rrA5Nn7hmelfVODRA0RtyuYUK6Y=
X-Received: by 2002:a37:2e05:: with SMTP id u5mr6103515qkh.124.1557278279873;
 Tue, 07 May 2019 18:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190502045631.229386-1-drinkcat@chromium.org> <6844539f-3d5e-e3ff-b498-390cdc731880@linux.intel.com>
In-Reply-To: <6844539f-3d5e-e3ff-b498-390cdc731880@linux.intel.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 8 May 2019 10:17:48 +0900
Message-ID: <CANMq1KArM_sttW0-hq9sS4gVfWnZbHevfJ+YEg0YQ3ML_Okygg@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: xhci: Make it possible to not have a secondary
 HCD (3.0)
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        chunfeng.yun@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 6, 2019 at 10:19 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 2.5.2019 7.56, Nicolas Boichat wrote:
> > Some XHCI controllers may not have any USB 3.0 port, in this case, it
> > is not useful to create add hcd->shared_hcd, which has 2 main
> > downsides:
> >   - A useless USB 3.0 root hub is created.
> >   - A warning is thrown on boot:
> > hub 2-0:1.0: config failed, hub doesn't have any ports! (err -19)
> >
> > The change is mostly about checking if hcd->shared_hcd is NULL before
> > accessing it. The one special case is in xhci_run, where we need to
> > call xhci_run_finished immediately, if there is no secondary hcd.
>
> To me it looks like this creates an controller starting issue for
> xHC hardware that have both usb2 and usb3 ports.
>
> When we have usb3 ports xhci->shared_hcd is not set yet when xhci_run is called
> the first time. We will end up starting the xHC before properly setting up the secondary hcd.
>
> See further down for details

Thanks Mathias and Chunfeng, I need to test this on platforms that
actually support USB 3.0 (both PCI and MTK), as you both highlighted,
there might be issues.

I'll do that a spin a v2. It might take a while though (this is not a
very critical issue).


> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >
> > This is a respin of https://lore.kernel.org/patchwork/patch/863993/,
> > hopefully addressing the comments there. Note that I dropped the change
> > in xhci-plat.c, as I do not have a device to test it, but made a
> > similar change in xhci-mtk.c, in the next patch.
> >
> > (the @apm.com addresses seem to bounce, so I added some
> > @amperecomputing.com instead, if somebody there can track back the
> > original issue, I'm happy to provide a patch for xhci-plat.c as well)
> >
> > drivers/usb/host/xhci-hub.c |  7 ++++--
> >   drivers/usb/host/xhci.c     | 45 +++++++++++++++++++++++++++----------
> >   2 files changed, 38 insertions(+), 14 deletions(-)
> >
>
> ...
>
> > @@ -698,6 +703,10 @@ int xhci_run(struct usb_hcd *hcd)
> >
> >       xhci_debugfs_init(xhci);
> >
> > +     /* There is no secondary HCD, start the host controller immediately. */
> > +     if (!xhci->shared_hcd)
> > +             return xhci_run_finished(xhci);
> > +
>
> PCI xHC controllers with both usb2 and usb3 ports will be started before usb3 parts are properly set up.
>
> xhci_pci_probe()
>    usb_hcd_pci_probe()
>      usb_add_hcd()
>        hcd->driver->start(hcd)  // .start = xhci_run
>          xhci_run()
>            if (!xhci->shared_hcd)  // TRUE as xhci->shared_hcd is not yet set,
>             return xhci_run_finished(xhci)  // starting controller too early here
>    xhci->shared_hcd = usb_create_shared_hcd()   // now xhci->shared_hcd is set.
>
> -Mathias
