Return-Path: <linux-usb+bounces-20019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A33A25F37
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 16:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A15527A01B9
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 15:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E1720A5CB;
	Mon,  3 Feb 2025 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="igL6Rv8j"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21726209681
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597781; cv=none; b=R8eJIJ8/UMYoSKiRTqnniCkRD2mfKambDzY2y4D9M167wYDQkJYJoWo/l6aLRkyJMY+owlx/idwwa6REV2RxuAQsZJtg/btf1yYeSk5+G7/5XM5NJl3daeAHINKzq4z6X6ng/kF3PYCab5n1QPv2S3qLtoD3t2IR02myePZuSDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597781; c=relaxed/simple;
	bh=SASdZuOtCzZZTvdNxBT41lXMoyqdqq1mO/hCy1x/zJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmRjnfEauKZE74qA9rJ+tStzCyYgr17gXpjNCLqOX9gsA3hflZ5PSMH9ADuJ4qLJ0SOyS/z13vFO7pon4FNf5mhS9A1UYBlpSEJfPoPCFLTvojIOInp9cEXkywAqnmaQMbPUz+6U6ZbYYK1sKh9cUNzzu3Lp6PjyXPuw89GSIPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=igL6Rv8j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CADC4CED2;
	Mon,  3 Feb 2025 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738597780;
	bh=SASdZuOtCzZZTvdNxBT41lXMoyqdqq1mO/hCy1x/zJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igL6Rv8jPB0XEt+z97O+gsHwuu7XaRZh1sVCJ4pDaOo8bhHTd0hJfq/Eq9PVqNNii
	 1/FlXZ3fyBJZn+bkQGjdNPDhD99ZozIKEgZKtziwVK3r8w8LjjORa45NXYZprW+aZe
	 jV0YcnnevTUH/V95mvn5l/FTAdVBUrvpfAHrExFY=
Date: Mon, 3 Feb 2025 16:49:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: rtm@csail.mit.edu, USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: hub: Ignore non-compliant devices with too many
 configs or interfaces
Message-ID: <2025020320-dawdler-twine-ae02@gregkh>
References: <d86313f9-e77b-47a5-9a84-01d71493b15c@rowland.harvard.edu>
 <96145.1737573668@localhost>
 <c27f3bf4-63d8-4fb5-ac82-09e3cd19f61c@rowland.harvard.edu>
 <9368333d-fc47-4a86-8b76-d41f61029cba@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9368333d-fc47-4a86-8b76-d41f61029cba@rowland.harvard.edu>

On Mon, Feb 03, 2025 at 10:35:42AM -0500, Alan Stern wrote:
> On Wed, Jan 22, 2025 at 02:26:17PM -0500, Alan Stern wrote:
> > Robert Morris created a test program which can cause
> > usb_hub_to_struct_hub() to dereference a NULL or inappropriate
> > pointer:
> > 
> > Oops: general protection fault, probably for non-canonical address
> > 0xcccccccccccccccc: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
> > CPU: 7 UID: 0 PID: 117 Comm: kworker/7:1 Not tainted 6.13.0-rc3-00017-gf44d154d6e3d #14
> > Hardware name: FreeBSD BHYVE/BHYVE, BIOS 14.0 10/17/2021
> > Workqueue: usb_hub_wq hub_event
> > RIP: 0010:usb_hub_adjust_deviceremovable+0x78/0x110
> > ...
> > Call Trace:
> >  <TASK>
> >  ? die_addr+0x31/0x80
> >  ? exc_general_protection+0x1b4/0x3c0
> >  ? asm_exc_general_protection+0x26/0x30
> >  ? usb_hub_adjust_deviceremovable+0x78/0x110
> >  hub_probe+0x7c7/0xab0
> >  usb_probe_interface+0x14b/0x350
> >  really_probe+0xd0/0x2d0
> >  ? __pfx___device_attach_driver+0x10/0x10
> >  __driver_probe_device+0x6e/0x110
> >  driver_probe_device+0x1a/0x90
> >  __device_attach_driver+0x7e/0xc0
> >  bus_for_each_drv+0x7f/0xd0
> >  __device_attach+0xaa/0x1a0
> >  bus_probe_device+0x8b/0xa0
> >  device_add+0x62e/0x810
> >  usb_set_configuration+0x65d/0x990
> >  usb_generic_driver_probe+0x4b/0x70
> >  usb_probe_device+0x36/0xd0
> > 
> > The cause of this error is that the device has two interfaces, and the
> > hub driver binds to interface 1 instead of interface 0, which is where
> > usb_hub_to_struct_hub() looks.
> > 
> > We can prevent the problem from occurring by refusing to accept hub
> > devices that violate the USB spec by having more than one
> > configuration or interface.
> > 
> > Reported-and-tested-by: Robert Morris <rtm@csail.mit.edu>
> > Closes: https://lore.kernel.org/linux-usb/95564.1737394039@localhost/
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> > ---
> 
> Greg:
> 
> I originally didn't mark this patch for the -stable kernels because it 
> doesn't really fix a bug.  But on the other hand, it does protect 
> against a possible DOS attack from a malicious device, so perhaps it 
> does belong in the -stable kernels.
> 
> I'll leave the decision up to you.

We need to protect from malicious USB devices as we have a whole history
of that being an exploit vector for systems, with the most recent ones
happening just a few months ago, allowing anyone full access to a locked
Android device by just plugging in a device with some specially crafted
USB configuration headers.

So let's try our best here where we can.  Ideally the Android exploit
shouldn't have even attempted to read the bad headers at the driver
level, but this fix is at the hub level where I think all userspace
"don't bind a driver unless we know it is ok" seem to ignore, so it's a
good fix.

thanks,

greg k-h

