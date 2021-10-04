Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239B3421977
	for <lists+linux-usb@lfdr.de>; Mon,  4 Oct 2021 23:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbhJDVyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 17:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhJDVyC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 17:54:02 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8F1C061745
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 14:52:13 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so706988pjb.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Oct 2021 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xhPI1GzEPrNpNSw/1tWigqvp+WusDAVMoQ+R+vP0NiI=;
        b=I2O3YR6F8NgzSpc72E70hoGmIXfBDLHE+l3ULuV6VF4Hsv8oyduxyYzHAiyU3JP35f
         6xu3bL4kHXRkNJr/SJtzqG/dz5G0nv5j82VKqM06+7ejDMBP/oOcz87XfOsapSCKdJlS
         RX5lr9dEraqFJtSVsGg3zjdRlJ6KANf224yHVTcc6RTkTJwr9EVX99tyzHNIawonTu9A
         eP+LL4bWTcITJZQFYy6Y3/W2iKspglKdHpNm2jFrN7sK/JbloQUtmqymJma2AgM0U0iH
         a1CIFsBBUt5kZkP1AcYi28AGlY0WBp8fxdVeglsPNPLjesC19xf+KJsn8aN6qSeEsmem
         Bf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xhPI1GzEPrNpNSw/1tWigqvp+WusDAVMoQ+R+vP0NiI=;
        b=lmtSwjJkDTUhqd+EqPIqSRXV4lrQmfuroY/U0SHnqNvXfobNBXIwcQF6+QCzB7ri2g
         /+jzgwcM3umm+ZZTTpZOj7lpaueUJRgzb1JH40yruQGOuJzqcpcR6KhJJ+T2VUAayeD7
         zyrInoHJjLtwDKtRzW8MaglvT0RjqcPD7Ckue1CEKlsoo7c1oCHC/zDa3oHC1ll0xoGA
         CM47Pza/VnBmDYWNJ/+W3Db2HfVUAM/BcEW4WW4BywJsvE0CDbirJTcd1lIX+cv9QpHQ
         E+I50U5i1mzqCwz02xGJhGI9cDXf2kWVXGWZ+eF1zZw3NAHRt4516IVi/pRg8meCbXeH
         zUHQ==
X-Gm-Message-State: AOAM5333nqQmUD8sc6puxVP4lF+uYysIUstbbiauqzcde4xPLLSUSEkF
        r5NxkvqLYurFFlM63dMVifwTNGTjDXlVd3wkubMNHA==
X-Google-Smtp-Source: ABdhPJwGn0D4IAk4utn6CKrXvM0mObb6A2+T27So3whzbM3Ycq+u40j0P71EHB0ftwVynof+9y0Qk7HbgmSaSEReA88=
X-Received: by 2002:a17:90b:1e05:: with SMTP id pg5mr6761112pjb.173.1633384332495;
 Mon, 04 Oct 2021 14:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210929224823.556943-1-rajatja@google.com> <YVVLcvcjOzK6m0yK@kroah.com>
In-Reply-To: <YVVLcvcjOzK6m0yK@kroah.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Mon, 4 Oct 2021 14:51:36 -0700
Message-ID: <CACK8Z6EX__=cXn5zJnxwQbqR_BJ5tBetu+vLFQmQES6nWp5Arw@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: hub: Mark root hubs on removable devices, as removable.
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Chris Chiu <chris.chiu@canonical.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        levinale@google.com, bleung@google.com, rajatxjain@gmail.com,
        jsbarnes@google.com, pmalani@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Wed, Sep 29, 2021 at 10:30 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 29, 2021 at 03:48:22PM -0700, Rajat Jain wrote:
> > Currently all usb root hubs are always marked as DEVICE_REMOVABLE_UNKNOWN
> > unconditionally. Let us try to help the users to identify the removable
> > root hubs, by checking the device on which the root hub sits. If the base
> > (parent) device on which the root hub sits, is removable (e.g. on
> > thunderbolt docks), then the roothub is also marked as removable.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> >  drivers/usb/core/hub.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 86658a81d284..45d1c81b121d 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -2440,8 +2440,16 @@ static void set_usb_port_removable(struct usb_device *udev)
> >
> >       dev_set_removable(&udev->dev, DEVICE_REMOVABLE_UNKNOWN);
> >
> > -     if (!hdev)
> > +     if (!hdev) {
> > +             /*
> > +              * If the root hub sits on a removable device, mark the root hub
> > +              * removable as well. This helps with the USB root hubs sitting
> > +              * on the thunderbolt docks.
> > +              */
> > +             if (udev->dev.parent && dev_is_removable(udev->dev.parent))
> > +                     dev_set_removable(&udev->dev, DEVICE_REMOVABLE);
> >               return;
> > +     }
>
> How far "up the chain" are you going to go here?  What if the
> thunderbolt device is on a PCI device that can be removed?  What if that
> PCI device is on a PCI bus that can be removed?

PCI already takes care of that.

>
> Is a USB controller on a docking device really "removable"?
>
> The goal here is to say if this device itself is removable in the sense
> of "I can yank this out", and a roothub is not that type of device.
>
> What problem are you trying to solve with this series?

Essentially we're trying to collect some statistics (and perhaps
implement some policies) that require differentiating between internal
USB devices and external USB devices. Today, a root hub (whether
internal or external) is always shown up as "unknown". Since the
roothubs on a thunderbolt dock are removable from the system, IMHO it
is appropriate to indicate the same in sysfs.

Thanks,

Rajat

>
> thanks,
>
> greg k-h
