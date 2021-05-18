Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369243878EC
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 14:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349242AbhERMhV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 08:37:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48117 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349240AbhERMhS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 May 2021 08:37:18 -0400
Received: from mail-lj1-f197.google.com ([209.85.208.197])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1liyx5-0002c6-FX
        for linux-usb@vger.kernel.org; Tue, 18 May 2021 12:35:59 +0000
Received: by mail-lj1-f197.google.com with SMTP id i27-20020a2ea37b0000b02900f2c58a2986so4428678ljn.15
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 05:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tx9LU5o9jAhb+IFA4JJT+cH3DFIRGJA++2PvkEKicgc=;
        b=RvJMBk8048T8E9xS6y/I0bOudPohfC407EnTnjXV6zczCdxkVtP1E69CV/pHegL3E3
         zq/cfZVpDQSzCGoGscv7G7zQqHiAXOBSBuiek76nm7oi+q1YKUNE0nDZZKqHz08e1SFm
         RwK+xANT10Dq4Hr03UnQsfEkw4pasGMZ42XS1xShg1izq3+dJsn72jsLX7E1hXPkkcK+
         LUt7cZvrGpxRcjUhkJSSS1/7p9xX63pUnreWoY5cvghV0o1ouNLAPcqf1DWEFj8gkjCE
         SQ12bSUmeNhp0Ehr8K1sb+n1f6NHunlb/HkaG8Cb+zA3ot2lMIHS6yi8X4/FhgQe4gJe
         4ARg==
X-Gm-Message-State: AOAM533yN6dMHJiYjyONBiMom1i54D62Ac0pZXSjVktNwzBs9VUu0xQ/
        D5U2zitZJf0N1ltH/spb0rcKa3oQCZVE7anGdO5eBl1tvY1/SHAWCp7Dzel28Byw0B3a+fIMkH6
        b2vRqt/n3JRuiWmOXTR32bc3gfNxbm4rGP7BcdXkguw/DL+rWktpFzg==
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr3932589ljc.116.1621341358976;
        Tue, 18 May 2021 05:35:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybFNsPf0Do0WDz9v8JDWpUkpj6ScfvlBCFO6JixzRfpYuTdjiLENvOk6Er/8rzNY+u/3WjWPm0zCTgII+Ml2E=
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr3932572ljc.116.1621341358636;
 Tue, 18 May 2021 05:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210518111640.243559-1-kai.heng.feng@canonical.com> <f5d2e440-e777-7ef1-db4b-0f50a8a5f6e1@linux.intel.com>
In-Reply-To: <f5d2e440-e777-7ef1-db4b-0f50a8a5f6e1@linux.intel.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Tue, 18 May 2021 20:35:45 +0800
Message-ID: <CAAd53p6MS=nZ=rK3kEe4TpBO99cvBkbntcTJpNs2cxw1CjThtg@mail.gmail.com>
Subject: Re: [PATCH] xhci: State explicitly when the controller is inaccessible
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 18, 2021 at 8:19 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 18.5.2021 14.16, Kai-Heng Feng wrote:
> > Sometimes the dmesg says "Controller not ready at resume" because CNR is
> > flagged. But what actually happens is that the whole USBSTS becomes
> > inaccessible, and the reason could be disabled PCI I/O space or faulty
> > firmware/hardware.
> >
> > So state the reason explicitly to make the message more clear.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/usb/host/xhci.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index ca9385d22f68..0e6fbe1f4fcc 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -1117,8 +1117,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
> >               retval = xhci_handshake(&xhci->op_regs->status,
> >                                       STS_CNR, 0, 10 * 1000 * 1000);
> >               if (retval) {
> > -                     xhci_warn(xhci, "Controller not ready at resume %d\n",
> > -                               retval);
> > +                     xhci_warn(xhci, "Controller is %s at resume %d\n",
> > +                               retval == -ENODEV ? "inaccessible" :
> > +                               "not ready", retval);
>
> Old way did print out retval, and was greppable.
> Not sure this is an improvement

That's true. Maybe it's just me, but I can't directly mapped the value
to -ENODEV at first glance.
But in essence this is just a cosmetic change.

Kai-Heng

>
> -Mathias
