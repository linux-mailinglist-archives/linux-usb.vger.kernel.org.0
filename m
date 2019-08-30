Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91C93A2B74
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 02:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfH3Ab0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 20:31:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36243 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfH3AbZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Aug 2019 20:31:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id y19so5195605wrd.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2019 17:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nqVBtRpO+C34MJ3QBA0R3d2xfVyeSGDdtsHStA79oBo=;
        b=FKUQnmmHNd64TY9Z4TWGpqhu8DKRLwMj+j4KVEJJ1LCul+OVFjmYDQd5u27EwJIEdE
         mYuc8FcbpMTFlSqmCJXCmcFX957NNcq+f7vl8h5J6rxWdTdvAnc/43IyCKckfm+2CYxr
         RGsykS0tU/ryhA9yLHu/21KqN9kpJCpNt7dVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqVBtRpO+C34MJ3QBA0R3d2xfVyeSGDdtsHStA79oBo=;
        b=fgQThOw6KXbTUVdMhHsxUByPHD11zHqDVL+eWa9hntJY4uHmL1eAyiZ0lDlIia58eW
         BIIwZVK7xXwUaaiP+Zi1p5b4WPd7QlQ/lxi/LxqcVqJv5NCzfewI1amF/cZIbHlq8olX
         VxchHBQI15aMq2ukVlh55SvQJ4NHzRkpm+2+Go1CTtFc17EAoaaT0hHOsjHOoMr0NTjY
         WvQ5+VqXfI3MmKQ/vkUWSaudR/QZPyh2F4jtDrAHiCpO+6BpYoljP0Q59ko/6U/b7N51
         dDDpzvEvKmaoziqUqfvZCbL6n40YWFvNTUTIpHPAfPLTsc8xojB/tYj1zHw2a912RPAq
         jGxg==
X-Gm-Message-State: APjAAAWLvwRcQ+7jFYHRyoYn1OnizhOgyeM44Y5F7pwTD0YWyvbTn90Z
        uU9kbbE0GeB+UTXcDiJMD36pUkqPpP7Me2ga4F1aOQ==
X-Google-Smtp-Source: APXvYqytDer697ynDb+egbAEl3Iy3Dakztwz7cV3aFq9qfe44u+4m1DvFX64eZKh59r3he/QuM+JgoqviFJCcFLQ4rI=
X-Received: by 2002:adf:facc:: with SMTP id a12mr14730139wrs.205.1567125083532;
 Thu, 29 Aug 2019 17:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAODwPW-+c6Ty_gqEFEaE0YhtutMR2tFnhEFOQre81uyM3mfMVA@mail.gmail.com>
 <Pine.LNX.4.44L0.1908291038050.1306-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908291038050.1306-100000@iolanthe.rowland.org>
From:   Julius Werner <jwerner@chromium.org>
Date:   Thu, 29 Aug 2019 17:31:12 -0700
Message-ID: <CAODwPW8gTZ_2WEc9n=WJ2PEmQk2anTQYfwQ-898+kOq6wsjnZw@mail.gmail.com>
Subject: Re: [PATCH] usb: storage: Add ums-cros-aoa driver
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Julius Werner <jwerner@chromium.org>,
        Dan Williams <dcbw@redhat.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> USB drivers only bind to interfaces, are you saying that your device has
> multiple interfaces on it?

Yes, I have a case where the device has two interfaces which both have
interface class 0xff (although they do differ in subclass and
protocol). I only want the usb-storage driver to bind to one of them
(if it binds to the other it will eventually cause a timeout error
that resets the whole device).

I tried doing a userspace mode switch and using
/sys/bus/usb/drivers/usb-storage/new_id to bind the device now, which
*almost* works, but I can't prevent it from binding to both
interfaces. Unfortunately new_id can only take an interface class, not
a subclass or protocol.

> In fact, there already is a way to do this in the kernel: write to the
> sysfs "bind" file.  The difficulty is that you can't force a driver to
> bind to an interface if it doesn't believe it is compatible with the
> interface.  And if the driver believes it is compatible, it will
> automatically attempt to bind with all such interfaces regardless of
> their path.
>
> Perhaps what you need is a usb_device_id flag to indicate that the
> entry should never be used for automatic matches -- only for matches
> made by the user via the "bind" file.  Greg KH would probably be
> willing to accept a new USB_DEVICE_ID_MATCH_NO_AUTO flag, which
> could be included in your unusual_devs.h entries.

This is an interesting idea, but I don't quite see how it can work as
you described? When I write to 'bind', the driver core calls
driver_match_device(), which ends up calling usb_device_match()
(right?), which is the same path that it would call for automatic
matching. It still ends up in usb_match_one_id(), and if I check for
the NO_AUTO flag there it would abort just as if it was an auto-match
attempt. I see no way to pass the information that this is an
explicit, user-requested "bind" rather than an automatic match across
the bus->match() callback into the USB code. (I could change the
signature of the match() callback, but that would require changing
code for all device busses in Linux, which I assume is something we
wouldn't want to do? I could also add a flag to struct device to
communicate "this is currently trying to match for a user-initiated
bind", but that seems hacky and not really the right place to put
that.)

I could instead add a new sysfs node 'force_bind' to the driver core,
that would work like 'bind' except for skipping the
driver_match_device() call entirely and forcing a probe(). Do you
think that would be acceptable? Or is that too big of a hammer to make
available for all drivers in Linux? Maybe if I do the same thing but
only for usb drivers, or even only for the usb-storage driver
specifically, would that be acceptable?

If none of this works, I could also extend the new_id interface to
allow subclass/protocol matches instead. I don't like that as much
because it doesn't allow me to control the devpath of the device I'm
matching, but I think it would be enough for my use case (I can't make
the usb-storage driver bind all AOA devices at all times, but at the
times where I do want to use it for my one device, I don't expect any
other AOA devices to be connected). The problem with this is that the
order of arguments for new ID is already set in stone (vendor,
product, interface class, refVendor, refProduct), and I don't think I
can use the refVendor/refProduct for my case so I can't just append
more numbers behind that. I could maybe instead change it so that it
also accepts a key-value style line (like "idVendor=abcd
idProduct=efgh bInterfaceSubClass=ff"), while still being
backwards-compatible to the old format if you only give it numbers?
What do you think?

Thanks for your advice!
