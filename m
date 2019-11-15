Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87622FE13F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 16:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfKOPaY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 10:30:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:42556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727412AbfKOPaY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Nov 2019 10:30:24 -0500
Received: from localhost (61-220-246-157.HINET-IP.hinet.net [61.220.246.157])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FF0220732;
        Fri, 15 Nov 2019 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573831822;
        bh=K5jiyPTCjJTL8hxbumQHzQ6gLNMXoffwmnOMpTO9sps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qQVnU23Z0bFPQOhjqvRRn8E/lNJiuZcxcekzLJ+HQJOQOnsxU9Rw30juuyRoKr1dN
         L+7gXWeH1cVJl23yUrmKQ1ahMNGZZvEJcvaCLl3pOlF4rlAM4qDeyp+9UZVaXnmZvS
         i/NKdGskzaw8Bfh4GF9gSC7F/SXuNL4fOd5AOcNs=
Date:   Fri, 15 Nov 2019 23:30:19 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Exporting USB device ids from the kernel
Message-ID: <20191115153019.GA378493@kroah.com>
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <20191115150633.GA374386@kroah.com>
 <CAAeHK+zdZdDT=3nNaz3E3HoUVq+sUA5hKEpOTXu7faitJ6RCGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+zdZdDT=3nNaz3E3HoUVq+sUA5hKEpOTXu7faitJ6RCGw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 15, 2019 at 04:13:58PM +0100, Andrey Konovalov wrote:
> On Fri, Nov 15, 2019 at 4:06 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Nov 15, 2019 at 03:25:38PM +0100, Andrey Konovalov wrote:
> > > Hi Greg and Alan,
> > >
> > > For USB fuzzing it would be nice to be able to export usb_device_id
> > > structs from the kernel to facilitate the fuzzer with generating USB
> > > descriptors that match to actual drivers. The same is required for
> > > hid_device_id structs, since those are matched separately by the
> > > usbhid driver (are there other cases like this?).
> > >
> > > Currently I have a hacky patch [1] that walks all drivers for USB and
> > > HID buses and then prints all device ids for those drivers into the
> > > kernel log. Those are manually parsed and built into the fuzzer [2]
> > > and then used to generate USB descriptors [3].
> >
> > The kernel will spit out all device ids of all USB devices when found if
> > you have CONFIG_USB_ANNOUNCE_NEW_DEVICES enabled, if you want to parse
> > the log.
> >
> > Otherwise, just walk usbfs or sysfs and get the ids there.  If you use
> > libusb you can do this with just a few lines of code, or worst case,
> > just implement the same thing on your own (like lsusb used to do).
> > Heck, just copy what lsusb does, or again worst case, parse the output
> > of it.
> >
> > There's also 'lsusb.py' as part of usbutils that shows how to do this
> > from within python in userspace, and if you really want it, we also
> > export the whole raw usb descriptor is in sysfs as well, if you want to
> > not trust how the kernel parses it.
> >
> > hope this helps,
> 
> Either I misunderstand you or you misunderstood me. I don't want to
> see IDs of devices that are connected. I want to see all of the IDs
> for all of the devices that might be connected and bound to some
> driver at some point in the future. Essentially I want to all IDs that
> are passed to MODULE_DEVICE_TABLE(usb, ...) and
> MODULE_DEVICE_TABLE(hid, ...). Is it possible to obtain those via
> usbfs/sysfs?

Ah, no, that information is not directly there in sysfs, sorry.

But it is in the modules themselves, look at the output of 'modinfo' at
the "alias:" lines for "usb:" entries.

That is what modprobe uses to find out what module to load when a USB
device is reported by the system.  Same thing goes for any type of
device bus.

hope this helps,

greg k-h
