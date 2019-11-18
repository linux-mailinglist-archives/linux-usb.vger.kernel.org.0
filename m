Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35ACC1008EF
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 17:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfKRQMr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 11:12:47 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33956 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfKRQMq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 11:12:46 -0500
Received: by mail-pg1-f195.google.com with SMTP id z188so9869796pgb.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 08:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A0u0Ton8CaM+A7C4wCTCx/2ZztYL062eKXVkaP4L0oo=;
        b=jh20GjsSq7mecFgOk52GI0EwY/o42YOONvOVhfvU0gdVZBfuwaScDK/tbVAltB87Ti
         LmAm8N9mBDQP2PK8aenAMPu4dqE+eYGUxLIYDnqQ5r3UA9AZXsmIzROUYVfVdSUSrNqh
         ceSFNNk57dA/qXr9ZR0sQWPoNJYW5c+zmzKQ6sM2EpmvBbpuH3h4ez0F/agF+kYK7UYa
         21ol8+jWCrjt6sDy0EJAH9WiKh9JKTQeRvrL0XWtuWjsCbjCgGrtkWmrEv2bYvkr/bVh
         do3PZdBy1grZEaF8SbS1uBZEq3qio54rVNfMXccyYsLMZnVJR7WgKLFDVdAemP5pNPFz
         xrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A0u0Ton8CaM+A7C4wCTCx/2ZztYL062eKXVkaP4L0oo=;
        b=hqeIO1qZebjmqIhnOplTbGJxwAOujk3Emwwk5U1zhrrRe7nPz74eZoJrv5qVEX97KX
         3bCYtgT8dJ/in/ImO39B22G6ZKYloAYC5BNGq4qMu0wWFFlCTBLOlmYfrOZbP6bwJnxR
         Iv7KG5cS5GgTlB2XeVyKsDOjLNs44YIkvZu6JDVswgp9i+NpRtKVyof1ygxZZwIH3Auy
         zzepfDdr8g1hq3InD5muodnITfu+WAH4SbSHCGzng7FPKz+r3EBGRzdJEY8V3nRHtB/l
         aOuJ+Z2FoNL2+Xt+clzmDeI7R5WDIEDCFyz+YOk9mCou2jL1Jk6CcrNBq7kWZQYCk12V
         KoSg==
X-Gm-Message-State: APjAAAXBnbKHwaAzzCjEszwwFfWGUV7ijcJadRUCMmLfY+YBdjeNN2BV
        LOVUQ26FECWjy0fGO0oy0Jxs89flenQ0N+v8fNSCAg==
X-Google-Smtp-Source: APXvYqw9xp3z7rfyr7YDgbUWxsGQO26TPFHBnyzGsfxiLzmoqkEF+vF3VWKgg9Y1RWQogQ0lpTl2KWC70EoOZhTvFEU=
X-Received: by 2002:a63:c804:: with SMTP id z4mr72612pgg.440.1574093565883;
 Mon, 18 Nov 2019 08:12:45 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
 <CAAeHK+z6m8mXEH-L+W+8FxjasrMX6BGMEdTq_hgUYerp+_0kjA@mail.gmail.com> <20191116084854.GA384892@kroah.com>
In-Reply-To: <20191116084854.GA384892@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 18 Nov 2019 17:12:34 +0100
Message-ID: <CAAeHK+xjUhR077goAHv=re78C6pzzSEBQxU+LZcOs0iCu2ZStg@mail.gmail.com>
Subject: Re: Exporting USB device ids from the kernel
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 16, 2019 at 9:49 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Nov 15, 2019 at 05:10:26PM +0100, Andrey Konovalov wrote:
> > On Fri, Nov 15, 2019 at 4:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Fri, 15 Nov 2019, Andrey Konovalov wrote:
> > >
> > > > Hi Greg and Alan,
> > > >
> > > > For USB fuzzing it would be nice to be able to export usb_device_id
> > > > structs from the kernel to facilitate the fuzzer with generating USB
> > > > descriptors that match to actual drivers. The same is required for
> > > > hid_device_id structs, since those are matched separately by the
> > > > usbhid driver (are there other cases like this?).
> > > >
> > > > Currently I have a hacky patch [1] that walks all drivers for USB and
> > > > HID buses and then prints all device ids for those drivers into the
> > > > kernel log. Those are manually parsed and built into the fuzzer [2]
> > > > and then used to generate USB descriptors [3].
> > >
> > > There are so many different flags for those id structures, parsing and
> > > understanding them must be quite difficult.
> > >
> > > > I'm thinking of making a proper patch that will add a debugfs entry
> > > > like usb/drivers (and usb/hid_drivers?), that can be read to get
> > > > USB/HID device ids for all loaded drivers. Would that be acceptable?
> > > > Or should I use some other interface to do that?
> > >
> > > I can't think of a better way to get the information from a running
> > > kernel.
> > >
> > > There is another possibility, though.  If the drivers are built as
> > > modules, the information is already available to userspace tools via
> > > depmod.  You could get it from the modules.dep.bin file.  This has the
> > > advantage that it will work even for drivers that aren't currently
> > > loaded.
> >
> > This is the same thing Greg mentions above, right?
>
> Yes.
>
> > Would this work for drivers that are built into the kernel (as =y)?
>
> No, sorry.  There has not been any need to export that information to
> userspace as nothing has ever needed that.
>
> The only reason we exported that at all was to allow modules to
> auto-load to handle the device.

OK, I see. Ideally we would want to support both builtin drivers and
modules. I'll then implement the approach with exporting the ids
through debugfs. I'll send a patch once I have it.

Thanks!
