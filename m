Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD8D10ED7D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 17:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbfLBQtV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 11:49:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:36744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727714AbfLBQtV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Dec 2019 11:49:21 -0500
Received: from localhost (unknown [84.241.196.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB31920833;
        Mon,  2 Dec 2019 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575305360;
        bh=bbXS2L56sxYEi/r3L0Ud7NVPRLlPvbVk45VKGHPpylo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KF7Bl5W1FTe7Xio5GpbeaWXG88Y7eCK9rdKls/vki7r46HK/7oWwt23kb0+QwAg/L
         nRUOJHg6Xj7MWKiSCc+2Sbtq/GwdE0VlJDp43tHmSeR/j+5dxmtHUcEgabWsC3OFcu
         k+yJVbxC9t9tDR2TQaI97M/Wy9Hvonpd6y1LYlQc=
Date:   Mon, 2 Dec 2019 17:49:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Exporting USB device ids from the kernel
Message-ID: <20191202164917.GA725459@kroah.com>
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
 <CAAeHK+z6m8mXEH-L+W+8FxjasrMX6BGMEdTq_hgUYerp+_0kjA@mail.gmail.com>
 <20191116084854.GA384892@kroah.com>
 <CAAeHK+xjUhR077goAHv=re78C6pzzSEBQxU+LZcOs0iCu2ZStg@mail.gmail.com>
 <20191118163958.GA595190@kroah.com>
 <CAAeHK+zWYAMJ5FQeTYNpCVH8Cnbyh11=0fqSh=oaEJLxNaXusQ@mail.gmail.com>
 <20191118175718.GA603730@kroah.com>
 <CAAeHK+yxShqFwKaR4fASbgZHVdBD9Y3GSSCFxzy5yO2NZTQGhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+yxShqFwKaR4fASbgZHVdBD9Y3GSSCFxzy5yO2NZTQGhg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 02, 2019 at 05:19:55PM +0100, Andrey Konovalov wrote:
> On Mon, Nov 18, 2019 at 6:57 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Nov 18, 2019 at 06:42:25PM +0100, Andrey Konovalov wrote:
> > > On Mon, Nov 18, 2019 at 5:40 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Mon, Nov 18, 2019 at 05:12:34PM +0100, Andrey Konovalov wrote:
> > > > > On Sat, Nov 16, 2019 at 9:49 AM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Nov 15, 2019 at 05:10:26PM +0100, Andrey Konovalov wrote:
> > > > > > > On Fri, Nov 15, 2019 at 4:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > > > >
> > > > > > > > On Fri, 15 Nov 2019, Andrey Konovalov wrote:
> > > > > > > >
> > > > > > > > > Hi Greg and Alan,
> > > > > > > > >
> > > > > > > > > For USB fuzzing it would be nice to be able to export usb_device_id
> > > > > > > > > structs from the kernel to facilitate the fuzzer with generating USB
> > > > > > > > > descriptors that match to actual drivers. The same is required for
> > > > > > > > > hid_device_id structs, since those are matched separately by the
> > > > > > > > > usbhid driver (are there other cases like this?).
> > > > > > > > >
> > > > > > > > > Currently I have a hacky patch [1] that walks all drivers for USB and
> > > > > > > > > HID buses and then prints all device ids for those drivers into the
> > > > > > > > > kernel log. Those are manually parsed and built into the fuzzer [2]
> > > > > > > > > and then used to generate USB descriptors [3].
> > > > > > > >
> > > > > > > > There are so many different flags for those id structures, parsing and
> > > > > > > > understanding them must be quite difficult.
> > > > > > > >
> > > > > > > > > I'm thinking of making a proper patch that will add a debugfs entry
> > > > > > > > > like usb/drivers (and usb/hid_drivers?), that can be read to get
> > > > > > > > > USB/HID device ids for all loaded drivers. Would that be acceptable?
> > > > > > > > > Or should I use some other interface to do that?
> > > > > > > >
> > > > > > > > I can't think of a better way to get the information from a running
> > > > > > > > kernel.
> > > > > > > >
> > > > > > > > There is another possibility, though.  If the drivers are built as
> > > > > > > > modules, the information is already available to userspace tools via
> > > > > > > > depmod.  You could get it from the modules.dep.bin file.  This has the
> > > > > > > > advantage that it will work even for drivers that aren't currently
> > > > > > > > loaded.
> > > > > > >
> > > > > > > This is the same thing Greg mentions above, right?
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > > Would this work for drivers that are built into the kernel (as =y)?
> > > > > >
> > > > > > No, sorry.  There has not been any need to export that information to
> > > > > > userspace as nothing has ever needed that.
> > > > > >
> > > > > > The only reason we exported that at all was to allow modules to
> > > > > > auto-load to handle the device.
> > > > >
> > > > > OK, I see. Ideally we would want to support both builtin drivers and
> > > > > modules. I'll then implement the approach with exporting the ids
> > > > > through debugfs. I'll send a patch once I have it.
> > > >
> > > > Note, this is part of the build/link process (see what
> > > > MODULE_DEVICE_TABLE() does), so I don't know if you will be able to do
> > > > it in debugfs very easily.
> > >
> > > Take a look at the patch I've linked [1]. It iterates all drivers on
> > > the USB bus via bus_for_each_drv and then iterates both builtin ids
> > > (in usb_device_id_dump_static) and the ones that come from modules (in
> > > usb_device_id_dump_dynamic) (at least that's how I understand the code
> > > that I've written :). The patch just does that in a weird place and
> > > prints ids to kernel log. It seems it should be easy to change it to
> > > do the same in a read() handler of a debugfs entry.
> > >
> > > [1] https://github.com/google/syzkaller/blob/master/tools/syz-usbgen/usb_ids.patch
> >
> > Iterating over all of that is a mess, why not stick with the stuff we
> > already are generating for modules to use?
> >
> > > > Why not put it in /sys/module/MODULE_NAME/ ?
> > >
> > > I can look into this, if that's what you prefer. In this case we'll
> > > need to iterate over all dirs in /sys/module to find the ones that
> > > export some USB ids. Seems less convenient than a single debugfs file
> > > approach, but would also work AFAIU.
> >
> > It could be done at build time, like the MODULE_DEVICE_TABLE() logic
> > works, and that way you get it for all bus types, not just USB.  And
> > this is a module issue really, right?  Yes, the mapping from module name
> > to driver name is not always the same, but it should be close.
> 
> I've tried to change MODULE_DEVICE_TABLE to always emit a device table
> regardless of whether a module is being compiled or not. This doesn't
> work just like that, because many modules use the same name for the
> device table, and I get linking errors. Is this the approach you had
> in mind? What would you suggest to do with name clash issue?

It's a static variable, why is there a name clash?  Don't make it global :)

> > Otherwise, something in the driver core would be good to do, again, that
> > way you get this for all busses/drivers.
> 
> Could you point me to some source files where this would go into?
> AFAIU with this we'll still need to implement a pretty printer for
> each device table type, right?

Probably yes, but note that all of the structures are defined in one
place.  Look in scripts/mod/ for some idea of how some of this is done.

Note, I have no idea if any of this is possible, I'm just suggesting
ways it might be done.

thanks,

greg k-h
