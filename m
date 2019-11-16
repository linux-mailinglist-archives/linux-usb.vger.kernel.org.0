Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A84FEB4A
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2019 09:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbfKPIs6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Nov 2019 03:48:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:57014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726166AbfKPIs6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 Nov 2019 03:48:58 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F38E20723;
        Sat, 16 Nov 2019 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573894137;
        bh=z5gwqn5EIYEk88tBrqlLKlVtlV83KIQstGhFdBihtQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GT4iVHhQuhYTPIXnTkE2QvmTJ3OLoZ4gPWb50cnIGIiz9fe6rmXCKoOHGTym/10dA
         EC7U9l5JE24wSl1k72l8QKNVYNldyYwIyxYxcL8cEnxVWf9UvEx/YuubMKQ3XGr8JA
         oLFzBBlTPtpGZuQ90I1Nh3olAnpzQdYG6jTXi6/w=
Date:   Sat, 16 Nov 2019 16:48:54 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Exporting USB device ids from the kernel
Message-ID: <20191116084854.GA384892@kroah.com>
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
 <CAAeHK+z6m8mXEH-L+W+8FxjasrMX6BGMEdTq_hgUYerp+_0kjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+z6m8mXEH-L+W+8FxjasrMX6BGMEdTq_hgUYerp+_0kjA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 15, 2019 at 05:10:26PM +0100, Andrey Konovalov wrote:
> On Fri, Nov 15, 2019 at 4:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, 15 Nov 2019, Andrey Konovalov wrote:
> >
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
> > There are so many different flags for those id structures, parsing and
> > understanding them must be quite difficult.
> >
> > > I'm thinking of making a proper patch that will add a debugfs entry
> > > like usb/drivers (and usb/hid_drivers?), that can be read to get
> > > USB/HID device ids for all loaded drivers. Would that be acceptable?
> > > Or should I use some other interface to do that?
> >
> > I can't think of a better way to get the information from a running
> > kernel.
> >
> > There is another possibility, though.  If the drivers are built as
> > modules, the information is already available to userspace tools via
> > depmod.  You could get it from the modules.dep.bin file.  This has the
> > advantage that it will work even for drivers that aren't currently
> > loaded.
> 
> This is the same thing Greg mentions above, right?

Yes.

> Would this work for drivers that are built into the kernel (as =y)?

No, sorry.  There has not been any need to export that information to
userspace as nothing has ever needed that.

The only reason we exported that at all was to allow modules to
auto-load to handle the device.

thanks,

greg k-h
