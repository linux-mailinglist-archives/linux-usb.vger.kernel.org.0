Return-Path: <linux-usb+bounces-2143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5667D5B6C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 21:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1015928193D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 19:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B168A3CD0B;
	Tue, 24 Oct 2023 19:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2979127ED2
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 19:23:26 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 0BF6D10C3
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 12:23:23 -0700 (PDT)
Received: (qmail 469860 invoked by uid 1000); 24 Oct 2023 15:23:23 -0400
Date: Tue, 24 Oct 2023 15:23:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "Li, Meng" <Meng.Li@windriver.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  "usb-storage@lists.one-eyed-alien.net" <usb-storage@lists.one-eyed-alien.net>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: storage: add shutdown function for usb storage
 driver
Message-ID: <a6bb88cd-0b89-4eb1-b90d-8ad633b7a8f2@rowland.harvard.edu>
References: <20231023054111.2744872-1-Meng.Li@windriver.com>
 <33bd0779-bfe7-4c87-8fe6-ea8455df3b6b@rowland.harvard.edu>
 <PH0PR11MB51918DD50651DB6BE937BEA3F1DFA@PH0PR11MB5191.namprd11.prod.outlook.com>
 <3fe5b43c-a5aa-4c6a-8614-03a4d9dd53e2@rowland.harvard.edu>
 <2023102428-zit-quickness-9b73@gregkh>
 <5107f6ca-e972-4af1-a21d-6c95778969f3@rowland.harvard.edu>
 <2023102459-protector-frequency-1033@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023102459-protector-frequency-1033@gregkh>

On Tue, Oct 24, 2023 at 07:11:31PM +0200, gregkh@linuxfoundation.org wrote:
> On Tue, Oct 24, 2023 at 11:58:37AM -0400, Alan Stern wrote:
> > On Tue, Oct 24, 2023 at 05:45:40PM +0200, gregkh@linuxfoundation.org wrote:
> > > On Tue, Oct 24, 2023 at 11:35:19AM -0400, Alan Stern wrote:
> > > > Okay, that's a different matter.  In fact, I don't know what is supposed 
> > > > to happen during a clean reboot.
> > > 
> > > Define "clean" :)
> > 
> > In this case, I mean what happens when you give the "reboot" command.
> 
> That's a userspace binary/script/whatever that can do loads of different
> things not involving the kernel, so it all depends on the user's system
> as to what will happen here.
> 
> Many "good" userspace implementation of reboot will go and sync and
> unmount all mounted disks in the correct order, before the kernel is
> told to reboot.

Even if the filesystems are unmounted, the kernel will still probe the 
drive periodically (once every few seconds) if it claims to have 
removable media.  Failure of those probes won't hurt anything, but it is 
likely to generate an error message.  I don't know if that's what's 
happening in this case, though.

> All we can do in the kernel is act on the reboot system call.
> 
> So perhaps the original poster here can see why his userspace isn't
> correctly shutting down their storage devices?

Meng, can you do this?  Maybe you can fix the problem by adding a script 
to be executed by the "reboot" command.  If the script writes to the 
"remove" attribute file in the drive's sysfs directory, that will unbind 
usb-storage from the device.  It should give the same result as your 
patch, for clean reboots.  It won't help "reboot -f", though.

> > > > What happens with non-USB disk drives?  Or other removable devices?
> > > 
> > > It would have to come from "above" in the device tree, so does the PCI
> > > or platform bus say that they should be shut down and their child
> > > devices?
> > 
> > Well, the PCI layer invokes the HCD's ->shutdown callback.  But the 
> > usb-storage driver and usbcore don't know this has happened, so they 
> > start logging errors because they are suddenly unable to communicate 
> > with a USB drive.  Meng Li is unhappy about these error messages.
> > 
> > Adding a shutdown callback of sorts to usb-storage allows the driver to 
> > know that it shouldn't communicate with the drive any more, which 
> > prevents the error message from appearing.  That's what this patch does.  
> > 
> > But that's all it does.  Basically it creates a layering violation just 
> > to prevent some error messages from showing up in the system log during 
> > a shutdown or reboot.  The question is whether we want to do this at 
> > all, and if we do, shouldn't it be handled at the usbcore level rather 
> > than just within usb-storage?
> 
> We should do this within the usb core if we care about it, but why did
> the USB device suddenly go away before the USB storage driver was told
> about it?  That feels like something else is pulling the power on the
> device that is out-of-band here.

The device went away because the HCD shut down the host controller, 
thereby stopping all USB communication.  The usb-storage driver wasn't 
informed because this all happened inside the HCD's PCI ->shutdown 
callback.  HCD shutdown doesn't do anything to the USB bus -- in 
particular, it doesn't remove the root hub or anything else -- it just 
turns off the host controller.

Since USB class-device drivers don't have ->shutdown callbacks (there is 
no shutdown() method in struct usb_driver), they don't know what's going 
on while a shutdown or reboot is in progress.  All they see is a bunch 
of errors.

Alan Stern

