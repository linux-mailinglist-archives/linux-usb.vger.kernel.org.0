Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F8967EA66
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jan 2023 17:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjA0QHW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Jan 2023 11:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjA0QHV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Jan 2023 11:07:21 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id EBFA83AB3
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 08:07:19 -0800 (PST)
Received: (qmail 306570 invoked by uid 1000); 27 Jan 2023 11:07:18 -0500
Date:   Fri, 27 Jan 2023 11:07:18 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Troels Liebe Bentsen <troels@connectedcars.dk>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y9P2tvPkdwHrbPXd@rowland.harvard.edu>
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com>
 <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com>
 <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu>
 <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 27, 2023 at 03:12:11PM +0100, Troels Liebe Bentsen wrote:
> On Thu, 26 Jan 2023 at 17:17, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, Jan 26, 2023 at 02:59:35PM +0100, Troels Liebe Bentsen wrote:
> > > It might be a special use case, for our automated hardware testing station
> > > we know what goes into what port/hub so it would be nice to have an option
> > > to lower the timeout in general or per hub or per port.
> >
> > There already is such an option.  It's named "early_stop" and it's
> > described in Documentation/ABI/testing/sysfs-bus-usb.  You may not be
> > aware of it because it was added after the 6.1 version of the kernel was
> > released.
> 
> Thanks, is it something that has to be enabled when compiling the kernel?

No, it is always enabled.

> Using Ubuntu mainline 6.1.4 and it does not seem to have this file in the
> ports folder.

Probably because it is still quite new.

> > > Ahh, sorry I misunderstood but then it makes even less sense that the hub's
> > > descriptors file blocks when the device hangs or am I missing something.
> >
> > Reading the file blocks because it has to be mutually exclusive with
> > other parts of the kernel which can reallocate the buffers storing the
> > descriptors.  This mutual exclusion is provided by a per-device lock,
> > and for hubs this device lock is held while a child device is being
> > probed.
> >
> I guess the reasoning for also holding a lock for the hubs is that there is some
> accounting on the hub for the children. But the hub's descriptors file won't
> change because a child device got enumerated right?

That's true, and in principle a separate lock could be used.  But there 
never seemed to be any need for adding a second lock.  Until now.

> Also if I understand it correctly based on your second email both the parsed
> sysfs files(fx idProduct, idVendor, etc.) and the descriptors file won't change
> for the lifetime of the hub. It's just that the descriptors file is backed by
> buffers that need to be locked because they can be reallocated by the kernel.

The files that export data from the device descriptor (idProduct etc.) 
might change during a device's lifetime, but the buffer they read from 
won't get reallocated.

However, now that I look more closely I see that the buffers for the 
config descriptors won't get reallocated either!  Evidently this was 
changed back in 2014 by commit e50a322e5177 ("usb: Do not re-read 
descriptors for wired devices in usb_authorize_device()"), but nobody 
realized at the time that the locking for the descriptors sysfs could 
then be relaxed.

> Why not store the descriptors file the same way as the parsed sysfs files,
> etc. it seems fairly small and I guess it contains the same data that is found
> in the sysfs folder for the hub?

The buffer holding the device descriptor is fixed size, since all device 
descriptors are always 18 bytes long.  The configuration and interface 
descriptors are variable length, so their buffers have to be allocated 
on-the-fly.

> I don't know how much work it would be to try to avoid locking the hub or if
> it even makes sense. So maybe it would be better if we spent time trying to
> workaround this in userspace, fx. by getting libusb to open the descriptors
> file in non-blocking mode and falling back to reading the individual files in
> sysfs if we get an EAGAIN. Would there be anything wrong with that
> approach?

Now that I know the config descriptors won't get reallocated after all, 
I can remove the locking from the descriptors file entirely.  A patch to 
do this is below.  It ought to fix your problem.  Try it and see.

> Also in general thanks for the quick and detailed responses, it's a
> pleasure writing on this mailing list.

You're welcome.

Alan Stern



Index: usb-devel/drivers/usb/core/sysfs.c
===================================================================
--- usb-devel.orig/drivers/usb/core/sysfs.c
+++ usb-devel/drivers/usb/core/sysfs.c
@@ -869,11 +869,7 @@ read_descriptors(struct file *filp, stru
 	size_t srclen, n;
 	int cfgno;
 	void *src;
-	int retval;
 
-	retval = usb_lock_device_interruptible(udev);
-	if (retval < 0)
-		return -EINTR;
 	/* The binary attribute begins with the device descriptor.
 	 * Following that are the raw descriptor entries for all the
 	 * configurations (config plus subsidiary descriptors).
@@ -898,7 +894,6 @@ read_descriptors(struct file *filp, stru
 			off -= srclen;
 		}
 	}
-	usb_unlock_device(udev);
 	return count - nleft;
 }
 

