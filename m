Return-Path: <linux-usb+bounces-1507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C4A7C6E77
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 14:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE511C210D9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 12:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3E5266C9;
	Thu, 12 Oct 2023 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aybDAsBQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BA725114
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 12:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D526C433C7;
	Thu, 12 Oct 2023 12:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697115037;
	bh=uvK4i4CIQykjFUF0bhDXHGMzDBGZ91kmwUHdULAWuqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aybDAsBQfg7UUB1ba1RfVa2VkxlIjZ6g8YsJXuqiLurVFtG2ei14CWKryaTzHnZby
	 s0Xn55JzI3I2BbWnQqjzkr8fYeOKDNrzvuj0c88HDsHN/PCXTXf1gf4HzRiy3FClYG
	 0RJu8DvmlLlxEzZw3qSkGIWUW+gGSrP9cbl4mHjw=
Date: Thu, 12 Oct 2023 14:50:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Douglas Gilbert <dgilbert@interlog.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: device present in lsusb, disappears in lsusb -t
Message-ID: <2023101203-marine-chatter-692e@gregkh>
References: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
 <2023091638-duration-barcode-73a3@gregkh>
 <11b1687f-3419-4037-845e-ef33d4e3871f@interlog.com>
 <2023101139-puma-fanfare-8a0e@gregkh>
 <299d927f-7044-4d48-b6cd-c05bdb0e7fcc@rowland.harvard.edu>
 <0c2a2a23-28dd-4c83-b7af-d5421501e411@interlog.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c2a2a23-28dd-4c83-b7af-d5421501e411@interlog.com>

On Wed, Oct 11, 2023 at 02:51:28PM -0400, Douglas Gilbert wrote:
> On 2023-10-11 11:00, Alan Stern wrote:
> > On Wed, Oct 11, 2023 at 11:30:39AM +0200, Greg KH wrote:
> > > On Thu, Oct 05, 2023 at 10:49:10PM -0400, Douglas Gilbert wrote:
> > > > The code in lsusb-t.c seems to assign a special meaning to "-1" devices
> > > > and there is only one of those: "5-1". And the device associated with
> > > > "5-1" is the one that does _not_ appear in the output of 'lsusb -t' but
> > > > does appear in the output of 'lsusb'.
> > > 
> > > The code patch of the '-t' option in lsusb is totally separate and apart
> > > from the "normal" portion of lsusb, as you note, it is a separate .c
> > > file as well.  -t uses the sysfs representation of the USB devices,
> > > while the other code path uses the 'libusb' representation of the USB
> > > devices.  And those seem to differ here (as they do for everyone.)
> > > 
> > > So if someone wants to take the time to figure out which representation
> > > is "more correct", that would be great.  I don't have the bandwidth to
> > > do so for the next few weeks due to travel requirements on my end,
> > > sorry.
> > 
> > Doug, I've looked through the source code in lsusb-t.c (usbutils 015)
> > and I didn't notice any place where it treats device names containing
> > "-1" specially.  Can you point it out?
> > 
> > Also, if I suggested some debugging additions to the source file, would
> > you be able to build them and test the result?
> 
> Hi Alan,
> Attached is a patch that adds support for a '-S <sysroot>' option to lsusb from
> usbutils found in GKH's github account. It only works when the '-t' option is
> given to show USB devices in a tree like representation. Without the '-t' option
> lsusb uses the enumeration services in libusb. The 'lsusb' invocation does find
> the device at /tmp/sys/bus/usb/devices/5-1 which is a "product : STEVAL-USBC2DP
> Type-C to DisplayPort adapter" made by ST Micro.
> 
> Also attached is a pruned representation of /sys and /dev from my machine which
> is a Thinkpad X13 G3 with a Lenovo TB3 dock [40AN] connected via USB-C. The
> "missing" adapter is connected to that dock. However that indirect
> connection
> is probably _not_ significant since if I move that dongle to the other USB-C
> receptacle on the X13G3 (it has two), the same seen/not_seen issue is
> reproduced. And with the direct connect the adapter moves to
> /sys/bus/usb/devices/3-5 . So that debunks my theory that the "1" in the "5-1"
> is somehow significant.
> 
> The attached files differ from those I sent to GKH in one important respect.
> I sent Greg my _whole_ sysfs, around 55,000 nodes and that would have included
> serial numbers of my machine, my storage devices, MAC addresses, etc. In
> the tarball attached below only about 5000 nodes are present after some
> pruning with my clone_pseudo_fs utility (in my github account).

I've pushed all of the remaining pending changes for usbutils to the
repo, and added a few of my own that makes the 'lsusb -t' output a bit
more sane (sorted order, proper digit field width, etc.)

Can you try the latest version in github (or on kernel.org, they are
mirrors) and show the output there?

thanks,

greg k-h

