Return-Path: <linux-usb+bounces-4281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB189815A9A
	for <lists+linux-usb@lfdr.de>; Sat, 16 Dec 2023 18:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BBF91F23DBC
	for <lists+linux-usb@lfdr.de>; Sat, 16 Dec 2023 17:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD1430CE8;
	Sat, 16 Dec 2023 17:19:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 442561E481
	for <linux-usb@vger.kernel.org>; Sat, 16 Dec 2023 17:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 310951 invoked by uid 1000); 16 Dec 2023 12:19:15 -0500
Date: Sat, 16 Dec 2023 12:19:15 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Yinghua Yang Yang <yinghua.yang@motorolasolutions.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: misc: Add driver for Motorola Solutions security
 accessories
Message-ID: <adca3f73-0c94-4cdf-b5dd-a4abb394238f@rowland.harvard.edu>
References: <20231215211218.2313996-1-Yinghua.Yang@motorolasolutions.com>
 <26c70a69-f18f-4c82-a520-7943be0e1961@rowland.harvard.edu>
 <CAHhS5zZEutfQnxLEodS2QN37RN7GPyGz555=NjiqqmsXiY8bxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHhS5zZEutfQnxLEodS2QN37RN7GPyGz555=NjiqqmsXiY8bxA@mail.gmail.com>

Please use Reply-To-All so that your message goes to the mailing list as 
well as to me.

On Fri, Dec 15, 2023 at 05:17:02PM -0600, Yinghua Yang Yang wrote:
> I would prefer an easier way too. On a linux platform where udev is
> supported, a udev rule can be used to set the power/control flag. But on
> the platform I am using, the udev is not available and I don't have root
> access. Do you have any suggestions?

I can't really suggest anything without knowing more about your
userspace environment.  It's very unusual to be in a situation where
you are allowed to modify the kernel by adding a new driver but you
aren't allowed to modify the userspace by adding a new shell script!

Alan Stern

> On Fri, Dec 15, 2023 at 4:46 PM Alan Stern <stern@rowland.harvard.edu>
> wrote:
> 
> > On Fri, Dec 15, 2023 at 03:12:10PM -0600, Yinghua Yang wrote:
> > > New USB driver that sets power/control to autosuspend for Motorola
> > > Solutions security accessories. The new driver only changes the power
> > > control for specific USB devices, normal read/write/ioctl of the usb
> > > device uses the unmodified usbfs.
> > >
> > > The rationale for a vendor specific driver was to allow for autosuspend
> > > behavior on Linux installations that are battery powered and do not
> > > allow user modifications to udev settings (e.g. embedded Linux, Android,
> > > etc.). The idealistic generic approach that would allow any USB device
> > > that supports autosuspend to change the power control could not be found
> > > without a change to the USB standard or substantial change to the usbfs
> > > architecture.
> > >
> > > Signed-off-by: Yinghua Yang <Yinghua.Yang@motorolasolutions.com>
> > > ---
> >
> > It seems silly to write a kernel driver for this.  Isn't there any way
> > to handle it in userspace?  All you would need is a simple shell
> > script.
> >
> > Alan Stern
> >
> 
> -- 
> 
> 
> *For more information on how and why we collect your personal 
> information, please visit our Privacy Policy 
> <https://www.motorolasolutions.com/en_us/about/privacy-policy.html?elqTrackId=8980d888905940e39a2613a7a3dcb0a7&elqaid=2786&elqat=2#privacystatement>.*

