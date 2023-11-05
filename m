Return-Path: <linux-usb+bounces-2555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478017E1602
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 20:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBE0CB20DC0
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 19:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490EE11735;
	Sun,  5 Nov 2023 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA0D20EA
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 19:16:21 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 05AA8DD
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 11:16:18 -0800 (PST)
Received: (qmail 924746 invoked by uid 1000); 5 Nov 2023 14:16:18 -0500
Date: Sun, 5 Nov 2023 14:16:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Fabian Melzow <fabian.melzow@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <7738cb40-9ef1-4e8e-8888-b8faadb7ba8a@rowland.harvard.edu>
References: <20231105130215.2b669c8b@ping>
 <2023110540-unseemly-mobilize-9e82@gregkh>
 <20231105134909.6c3f28d1@ping>
 <2023110534-fester-schematic-818a@gregkh>
 <20231105143051.2b28c316@ping>
 <76fc65db-4efe-4da7-a13f-d7a451f836fa@rowland.harvard.edu>
 <20231105163300.3b8df5ad@ping>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105163300.3b8df5ad@ping>

On Sun, Nov 05, 2023 at 04:33:00PM +0100, Fabian Melzow wrote:
> Am Sun, 5 Nov 2023 09:56:06 -0500
> schrieb Alan Stern <stern@rowland.harvard.edu>:
> 
> > On Sun, Nov 05, 2023 at 02:30:51PM +0100, Fabian Melzow wrote:
> > > Am Sun, 5 Nov 2023 14:11:02 +0100
> > > schrieb Greg KH <gregkh@linuxfoundation.org>:
> > >   
> > > > On Sun, Nov 05, 2023 at 01:49:09PM +0100, Fabian Melzow wrote:  
> > > > > Am Sun, 5 Nov 2023 13:20:38 +0100
> > > > > schrieb Greg KH <gregkh@linuxfoundation.org>:
> > > > >     
> > > > > > On Sun, Nov 05, 2023 at 01:02:15PM +0100, Fabian Melzow
> > > > > > wrote:    
> > > > > > > These devices should report 5 Gbps for USB 3.0 in the Binary
> > > > > > > Object Store Descriptor, but don't do so.      
> > > > > > 
> > > > > > Why do you think these should report 5 Gbps?  If the device
> > > > > > descriptor does not show it, there's nothing that we can do
> > > > > > about it in the operating system, sorry.    
> > > > > 
> > > > > Thanks. I don't look at the USB specification for USB >2.0,
> > > > > which was long times ago and then only for a user space program
> > > > > and thought that it at least theoretically could be possible to
> > > > > set the device speed at some kind of initialization.    
> > > > 
> > > > There might be some vendor-specific way of doing this, and then
> > > > the device resets itself, but other than that, no, descriptors
> > > > are a static description of the device's capabilities.  
> > > 
> > > When this static description is also used by the host controller to
> > > set the device speed, then these WLAN devices are limited to 480
> > > Mbps. If  
> > 
> > The speed is not set by the host controller; it is set by the device.
> > 
> > If the device is capable of running at a higher speed than 480 Mbps
> > then it should do so.  Have you checked the actual connection speed,
> > as reported in the "speed" file in the device's sysfs directory or in
> > the output from "lsusb -t"?
> 
> $ lsusb -t (only relevant output)
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/14p, 480M
>     |__ Port 004: Dev 003, If 0, Class=Vendor Specific Class, Driver=rtw_8822bu, 480M
> > 
> > How do you know that the device's USB hardware supports more than 480 
> > Mbps?  And even if the hardware does, maybe the firmware doesn't.
> > 
> > (Note: Just because the device's WLAN interface can run at 780 Mbps, 
> > it does not follow that the USB interface can run that fast.)
> 
> These USB WLAN sticks are sold as "USB 3.0", and also have a blue
> USB-3.0-A-plug. I don't really know the speed, but 480 Mbps is reported
> by "lsusb -t" or in the descriptor. I did not open these devices, but
> have assumed that they only use a single chip to handle everything,
> WLAN and USB.

Have you tried plugging the device into a system running a different OS 
(Windows or MacOS-X)?  Or even a different Linux system?

Alan Stern

