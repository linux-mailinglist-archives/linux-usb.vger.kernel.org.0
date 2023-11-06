Return-Path: <linux-usb+bounces-2591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5382A7E28F1
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 16:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A1672814FC
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 15:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07C028E0E;
	Mon,  6 Nov 2023 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7228E07
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 15:44:40 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 05F07118
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 07:44:37 -0800 (PST)
Received: (qmail 951586 invoked by uid 1000); 6 Nov 2023 10:44:37 -0500
Date: Mon, 6 Nov 2023 10:44:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Fabian Melzow <fabian.melzow@gmail.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <897511a8-1f79-4a01-910e-3efb21a71840@rowland.harvard.edu>
References: <2023110540-unseemly-mobilize-9e82@gregkh>
 <20231105134909.6c3f28d1@ping>
 <2023110534-fester-schematic-818a@gregkh>
 <20231105143051.2b28c316@ping>
 <76fc65db-4efe-4da7-a13f-d7a451f836fa@rowland.harvard.edu>
 <20231105163300.3b8df5ad@ping>
 <7738cb40-9ef1-4e8e-8888-b8faadb7ba8a@rowland.harvard.edu>
 <20231105210616.79fea846@ping>
 <61fb4593-c24d-4891-8d44-e2ef819af57d@rowland.harvard.edu>
 <20231106080024.197ffdd2@ping>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106080024.197ffdd2@ping>

On Mon, Nov 06, 2023 at 08:00:24AM +0100, Fabian Melzow wrote:
> Am Sun, 5 Nov 2023 21:10:47 -0500
> schrieb Alan Stern <stern@rowland.harvard.edu>:
> 
> > On Sun, Nov 05, 2023 at 09:06:16PM +0100, Fabian Melzow wrote:
> > > Am Sun, 5 Nov 2023 14:16:18 -0500
> > > schrieb Alan Stern <stern@rowland.harvard.edu>:
> > >   
> > > > Have you tried plugging the device into a system running a
> > > > different OS (Windows or MacOS-X)?  Or even a different Linux
> > > > system?  
> > > 
> > > Yes, I also made a short test with the lsusb of an old Debian 11
> > > Live-DVD. I got these devices for testing from the Amazon Vine
> > > program and after the third Monday-Hardware WLAN-device with the
> > > same problem I thought I should report this problem, to maybe help
> > > real users.  
> > 
> > A test with Windows might be more informative, if you can manage to
> > do one.  Perhaps the Windows driver knows how to configure the device
> > to run at higher speed.
> >
> > Also, curiously enough, when I did a web search for reports of
> > problems with this chip, the vast majority of messages were about it
> > not working with Linux at all because Debian/Ubuntu did not include
> > sufficiently up-to-date drivers.  People had to download driver
> > source code from a github project and build and install it for
> > themselves in order to get the device to function.  They didn't
> > mention what speed it used on the USB bus.
> 
> The Linux rtw88 driver is maintained by Realtek and, if my searching is
> right, first appeared in Linux 5.18, so it's a newer one. I could
> trigger an Oops, which I also reported yesterday. According to
> the Debian backport https://github.com/lwfinger/rtw88 some versions of
> the chipset are still unsupported. 
> 
> The rwt8822bu driver has also a non-USB version rwt8822b, so the chip
> for the USB support can also be separate from the main chip, but until
> now don't want to destroy one of the plastic cases.

The driver that many people have been using is the one in 
https://github.com/cilynx/rtl88x2bu.  The driver module is named 
88x2bu.ko; it is a replacement for the rtw88_8822bu driver.

Apparently this has not been merged into the standard Linux kernel 
because Realtek's vendor drivers are not acceptable to the kernel's 
network maintainers.  You might be able to get more information about 
this if you ask on a WLAN mailing list rather than a USB mailing list.

Alan Stern

