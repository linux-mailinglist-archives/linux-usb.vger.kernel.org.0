Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF6AFE238
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 17:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfKOQE4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 11:04:56 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45411 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfKOQE4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 11:04:56 -0500
Received: by mail-pf1-f194.google.com with SMTP id z4so6867611pfn.12
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 08:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7X39iuEEQRrxmI92P6s/GZH+4m80M8T5MHJlVSsI2c0=;
        b=NmQ62U/efOi5Q+dGSGypGgXSwYq6cnrWAaEs9nIbFk2vRbt3pyz/afmdpaQ2OVhi6L
         /Yogtu7bgKnRf6QlsiV70LJ1KDdshJwCON5o+gaT5g3dGyEU/H0+TYCYCRmEJHAJfWxm
         3hs9K5Xv6oLdtgoSGv2Myn8RIjV6ZLyzgmJNAMuk0iaBCKjxxBbaRZMYU+yX4zgtRRf8
         BlyqNOlIIri7H+HVBnvNuarGVuOp5LRxwUB6cnvJ7wWprLaRVRWKtVqzsCTx7QKE2lsF
         yFWfAFsH+gG/nfSlpRcNkejToxHBXRGIQk8GvGiaM23DLAWcNTCS6to1HJVLdlubIUaU
         eX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7X39iuEEQRrxmI92P6s/GZH+4m80M8T5MHJlVSsI2c0=;
        b=R4ZkNROU7EYEJU4v+RllVccTcoN7dGgYPGBxwBwTrD/Bf5xNbL7pdWVzxBxSrQx4WI
         LSz/wajNj0h//7c/nz3/uEMuGCjWouZYny4gErVrUo8qGrdvxZfjexQrxXjmQrS9HC0h
         VFDvgTxpv9zPxlsRHWZI9v+9jGnkyTNcqhBkRf+H3axemrSp1Zmj73gTAnFd4/u7iV2+
         H4poSecNUxVcn+NbCo9vMFZyKiRrLGMZ+VzQFEY3ot2DOW66ZK7TGvA2mdq9WtA7Ldb2
         BO2fCiXo/zo7sLxarfddHYfvyqeDZSRisFAk9B8BuwqTnCTQFS5rytL41t2xlk5Mrd3i
         tU3Q==
X-Gm-Message-State: APjAAAUvDN3KA1HFkGYGhMl/ccsWR583Fn4yVcjyuScGUjqZg1Yb5MnI
        mYFwOK8XDjvfo3GuylMFfwIIUInkDpHS67h5UNKsxA==
X-Google-Smtp-Source: APXvYqxE2W1uh+8VQ0IpBde7gToivOOn6cWl/jwI7WZIQR7Ezapoj5oZW8kYImmebuDLiqOFmmkF2/gtuDR31Kmnbe4=
X-Received: by 2002:a63:c804:: with SMTP id z4mr17391908pgg.440.1573833894883;
 Fri, 15 Nov 2019 08:04:54 -0800 (PST)
MIME-Version: 1.0
References: <92f5a2a1ba986f149aecec02d6ffe110d11dcdfd.1573824989.git.andreyknvl@google.com>
 <Pine.LNX.4.44L0.1911151036310.1527-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1911151036310.1527-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 15 Nov 2019 17:04:42 +0100
Message-ID: <CAAeHK+y6mStjFJ-S0eN5qhBmik87ZMtnteRQVmjVbNRWRjLQUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] usb: gadget: add raw-gadget interface
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 15, 2019 at 4:38 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 15 Nov 2019, Andrey Konovalov wrote:
>
> > USB Raw Gadget is a kernel module that provides a userspace interface for
> > the USB Gadget subsystem. Essentially it allows to emulate USB devices
> > from userspace. Enabled with CONFIG_USB_RAW_GADGET. Raw Gadget is
> > currently a strictly debugging feature and shouldn't be used in
> > production.
> >
> > Raw Gadget is similar to GadgetFS, but provides a more low-level and
> > direct access to the USB Gadget layer for the userspace. The key
> > differences are:
> >
> > 1. Every USB request is passed to the userspace to get a response, while
> >    GadgetFS responds to some USB requests internally based on the provided
> >    descriptors. However note, that the UDC driver might respond to some
> >    requests on its own and never forward them to the Gadget layer.
> >
> > 2. GadgetFS performs some sanity checks on the provided USB descriptors,
> >    while Raw Gadget allows you to provide arbitrary data as responses to
> >    USB requests.
> >
> > 3. Raw Gadget provides a way to select a UDC device/driver to bind to,
> >    while GadgetFS currently binds to the first available UDC.
> >
> > 4. Raw Gadget uses predictable endpoint names (handles) across different
> >    UDCs (as long as UDCs have enough endpoints of each required transfer
> >    type).
> >
> > 5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
>
> ...
>
> > --- /dev/null
> > +++ b/Documentation/usb/raw-gadget.rst
>
> > +Userspace interface
> > +~~~~~~~~~~~~~~~~~~~
> > +
> > +To create a Raw Gadget instance open /sys/kernel/debug/usb/raw-gadget
> > +(debugfs should be enabled and mounted). Multiple raw-gadget instances
>
> Looks like the documentation hasn't kept up with the more recent
> changes to the driver.

Right, will fix in v3, thanks!

>
> > --- /dev/null
> > +++ b/drivers/usb/gadget/legacy/raw.c
> > @@ -0,0 +1,1057 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * USB Raw Gadget driver.
> > + * See Documentation/usb/raw-gadget.rst for more details.
> > + *
> > + * Andrey Konovalov <andreyknvl@gmail.com>
> > + */
> > +
> > +#define pr_fmt(fmt) "raw: %s: " fmt, __func__
>
> This macro isn't used anywhere now.

It's used internally by pr_debug(). I didn't remove all of the
debugging messages, I've left the ones that are printed in cases or
errors, since ftrace might not always help to distinguish between some
of those.
