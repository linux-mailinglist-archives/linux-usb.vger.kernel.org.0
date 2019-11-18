Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D37C3100AEC
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 18:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRR5b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 12:57:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:42728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbfKRR5b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 12:57:31 -0500
Received: from localhost (unknown [89.205.134.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8F8F2186D;
        Mon, 18 Nov 2019 17:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574099850;
        bh=XkHAlox4kehWnRxAGnsg6LXDeZ7eL4GqECtLKSurfz8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bH5oK+7uvKwYf18WjttXFpK5QxdXCj7vvzVHsH9Ck0wwfSMXwmteGQFYemaDJxyY9
         0BpaDja9Tsc93P+LfZiAZOFOFThgicUTZTibO5oDYvcm6gGA0u0MSUpDfaMlWJK+mY
         kGK2n8thBxF+xXQsby45gPSp7BVaTZx96qo9oUIc=
Date:   Mon, 18 Nov 2019 18:57:18 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Exporting USB device ids from the kernel
Message-ID: <20191118175718.GA603730@kroah.com>
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
 <CAAeHK+z6m8mXEH-L+W+8FxjasrMX6BGMEdTq_hgUYerp+_0kjA@mail.gmail.com>
 <20191116084854.GA384892@kroah.com>
 <CAAeHK+xjUhR077goAHv=re78C6pzzSEBQxU+LZcOs0iCu2ZStg@mail.gmail.com>
 <20191118163958.GA595190@kroah.com>
 <CAAeHK+zWYAMJ5FQeTYNpCVH8Cnbyh11=0fqSh=oaEJLxNaXusQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+zWYAMJ5FQeTYNpCVH8Cnbyh11=0fqSh=oaEJLxNaXusQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 06:42:25PM +0100, Andrey Konovalov wrote:
> On Mon, Nov 18, 2019 at 5:40 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Nov 18, 2019 at 05:12:34PM +0100, Andrey Konovalov wrote:
> > > On Sat, Nov 16, 2019 at 9:49 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Nov 15, 2019 at 05:10:26PM +0100, Andrey Konovalov wrote:
> > > > > On Fri, Nov 15, 2019 at 4:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > >
> > > > > > On Fri, 15 Nov 2019, Andrey Konovalov wrote:
> > > > > >
> > > > > > > Hi Greg and Alan,
> > > > > > >
> > > > > > > For USB fuzzing it would be nice to be able to export usb_device_id
> > > > > > > structs from the kernel to facilitate the fuzzer with generating USB
> > > > > > > descriptors that match to actual drivers. The same is required for
> > > > > > > hid_device_id structs, since those are matched separately by the
> > > > > > > usbhid driver (are there other cases like this?).
> > > > > > >
> > > > > > > Currently I have a hacky patch [1] that walks all drivers for USB and
> > > > > > > HID buses and then prints all device ids for those drivers into the
> > > > > > > kernel log. Those are manually parsed and built into the fuzzer [2]
> > > > > > > and then used to generate USB descriptors [3].
> > > > > >
> > > > > > There are so many different flags for those id structures, parsing and
> > > > > > understanding them must be quite difficult.
> > > > > >
> > > > > > > I'm thinking of making a proper patch that will add a debugfs entry
> > > > > > > like usb/drivers (and usb/hid_drivers?), that can be read to get
> > > > > > > USB/HID device ids for all loaded drivers. Would that be acceptable?
> > > > > > > Or should I use some other interface to do that?
> > > > > >
> > > > > > I can't think of a better way to get the information from a running
> > > > > > kernel.
> > > > > >
> > > > > > There is another possibility, though.  If the drivers are built as
> > > > > > modules, the information is already available to userspace tools via
> > > > > > depmod.  You could get it from the modules.dep.bin file.  This has the
> > > > > > advantage that it will work even for drivers that aren't currently
> > > > > > loaded.
> > > > >
> > > > > This is the same thing Greg mentions above, right?
> > > >
> > > > Yes.
> > > >
> > > > > Would this work for drivers that are built into the kernel (as =y)?
> > > >
> > > > No, sorry.  There has not been any need to export that information to
> > > > userspace as nothing has ever needed that.
> > > >
> > > > The only reason we exported that at all was to allow modules to
> > > > auto-load to handle the device.
> > >
> > > OK, I see. Ideally we would want to support both builtin drivers and
> > > modules. I'll then implement the approach with exporting the ids
> > > through debugfs. I'll send a patch once I have it.
> >
> > Note, this is part of the build/link process (see what
> > MODULE_DEVICE_TABLE() does), so I don't know if you will be able to do
> > it in debugfs very easily.
> 
> Take a look at the patch I've linked [1]. It iterates all drivers on
> the USB bus via bus_for_each_drv and then iterates both builtin ids
> (in usb_device_id_dump_static) and the ones that come from modules (in
> usb_device_id_dump_dynamic) (at least that's how I understand the code
> that I've written :). The patch just does that in a weird place and
> prints ids to kernel log. It seems it should be easy to change it to
> do the same in a read() handler of a debugfs entry.
> 
> [1] https://github.com/google/syzkaller/blob/master/tools/syz-usbgen/usb_ids.patch

Iterating over all of that is a mess, why not stick with the stuff we
already are generating for modules to use?

> > Why not put it in /sys/module/MODULE_NAME/ ?
> 
> I can look into this, if that's what you prefer. In this case we'll
> need to iterate over all dirs in /sys/module to find the ones that
> export some USB ids. Seems less convenient than a single debugfs file
> approach, but would also work AFAIU.

It could be done at build time, like the MODULE_DEVICE_TABLE() logic
works, and that way you get it for all bus types, not just USB.  And
this is a module issue really, right?  Yes, the mapping from module name
to driver name is not always the same, but it should be close.

Otherwise, something in the driver core would be good to do, again, that
way you get this for all busses/drivers.

thanks,

greg k-h
