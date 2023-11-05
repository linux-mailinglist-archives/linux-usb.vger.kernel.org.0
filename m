Return-Path: <linux-usb+bounces-2551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4E7E13F9
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 15:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68CC1C208CE
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 14:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158FDDDCF;
	Sun,  5 Nov 2023 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F8568F
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 14:56:11 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 32284CA
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 06:56:08 -0800 (PST)
Received: (qmail 919382 invoked by uid 1000); 5 Nov 2023 09:56:06 -0500
Date: Sun, 5 Nov 2023 09:56:06 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Fabian Melzow <fabian.melzow@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <76fc65db-4efe-4da7-a13f-d7a451f836fa@rowland.harvard.edu>
References: <20231105130215.2b669c8b@ping>
 <2023110540-unseemly-mobilize-9e82@gregkh>
 <20231105134909.6c3f28d1@ping>
 <2023110534-fester-schematic-818a@gregkh>
 <20231105143051.2b28c316@ping>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105143051.2b28c316@ping>

On Sun, Nov 05, 2023 at 02:30:51PM +0100, Fabian Melzow wrote:
> Am Sun, 5 Nov 2023 14:11:02 +0100
> schrieb Greg KH <gregkh@linuxfoundation.org>:
> 
> > On Sun, Nov 05, 2023 at 01:49:09PM +0100, Fabian Melzow wrote:
> > > Am Sun, 5 Nov 2023 13:20:38 +0100
> > > schrieb Greg KH <gregkh@linuxfoundation.org>:
> > >   
> > > > On Sun, Nov 05, 2023 at 01:02:15PM +0100, Fabian Melzow wrote:  
> > > > > These devices should report 5 Gbps for USB 3.0 in the Binary
> > > > > Object Store Descriptor, but don't do so.    
> > > > 
> > > > Why do you think these should report 5 Gbps?  If the device
> > > > descriptor does not show it, there's nothing that we can do about
> > > > it in the operating system, sorry.  
> > > 
> > > Thanks. I don't look at the USB specification for USB >2.0, which
> > > was long times ago and then only for a user space program and
> > > thought that it at least theoretically could be possible to set the
> > > device speed at some kind of initialization.  
> > 
> > There might be some vendor-specific way of doing this, and then the
> > device resets itself, but other than that, no, descriptors are a
> > static description of the device's capabilities.
> 
> When this static description is also used by the host controller to set
> the device speed, then these WLAN devices are limited to 480 Mbps. If

The speed is not set by the host controller; it is set by the device.

If the device is capable of running at a higher speed than 480 Mbps then 
it should do so.  Have you checked the actual connection speed, as 
reported in the "speed" file in the device's sysfs directory or in the 
output from "lsusb -t"?

> these descriptor are more a information for programmers, even if some
> descriptors are uses to configure the device, but the hardware supports
> more then 480 Mbps, as which in this case, then these devices are not
> limited, but provide wrong information.

How do you know that the device's USB hardware supports more than 480 
Mbps?  And even if the hardware does, maybe the firmware doesn't.

(Note: Just because the device's WLAN interface can run at 780 Mbps, 
it does not follow that the USB interface can run that fast.)

> > > > What exactly is the hardware problem?  What is not working
> > > > "properly" for them?  
> > > 
> > > All 0bda:b812 USB-WLAN-devices seems to only operate at 480 Mbps,
> > > but have a WLAN-chip which supports 780 Mbps at maximum.  
> > 
> > Are you sure that those devices really can run at 480 Mbps?  Perhaps
> > the chip can support higher, but the firmware on the device, and the
> > other stuff in the device does not?
> 
> The used WLAN chipset should support more then 480 Mbps in hardware,
> but I don't known whether the host controller limits the speed based on
> the wrong descriptor of the device.

The speed is not determined by the device's descriptors; it is 
negotiated at the hardware level between the device and the upstream hub 
when the USB port is reset, which happens shortly after the device is 
plugged in, as part of initialization.

Another thing to watch out for: Even a 10-Gbps-capable device will be 
forced to run at a measly 480 Mbps if it is connected via a USB-2 cable 
rather than a USB-3 cable.

Alan Stern

