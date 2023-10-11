Return-Path: <linux-usb+bounces-1442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CF7C4EF4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 11:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70BE21C20DBF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 09:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84D01D532;
	Wed, 11 Oct 2023 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NRa/rQtq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC041CFA3
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 09:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191D4C433C8;
	Wed, 11 Oct 2023 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697016642;
	bh=NyO8abUh2Vi/WVY+unx5tAjOOoXmwa0fY2qU742d+4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRa/rQtq9x/eYNLAap5K+dkI9FEMv54aetUfN9AftI9Ihycgnr0mA4P06q83TocjQ
	 QWFuMeyUye4lJB9o3nMkaExTTEzw9G9MXDiYvWDj1Lroi3G86WcC07NAzkTfI2DOa5
	 TWzgK66lnKqKnB8ajAss/4ZcQJ4zfhpj9Uc0SJoY=
Date: Wed, 11 Oct 2023 11:30:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Douglas Gilbert <dgilbert@interlog.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: device present in lsusb, disappears in lsusb -t
Message-ID: <2023101139-puma-fanfare-8a0e@gregkh>
References: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
 <2023091638-duration-barcode-73a3@gregkh>
 <11b1687f-3419-4037-845e-ef33d4e3871f@interlog.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11b1687f-3419-4037-845e-ef33d4e3871f@interlog.com>

On Thu, Oct 05, 2023 at 10:49:10PM -0400, Douglas Gilbert wrote:
> On 2023-09-16 07:16, Greg KH wrote:
> > On Fri, Sep 15, 2023 at 08:16:18PM -0400, Douglas Gilbert wrote:
> > > The device in question is this one:
> > >    Bus 005 Device 015: ID 0483:572b STMicroelectronics STEVAL-USBC2DP Type-C
> > > to DisplayPort adapter. It is a USB-C alternate mode device (so tbtadm does
> > > not
> > > report it).
> > > 
> > > That adapter is connected to a screen (and working) and to a USB-C port on
> > > a Lenovo TB3 dock [40AN] which in turn is connected to a Thinkpad X13 Gen3's
> > > USB-C port. The Thinkpad is running lk 6.6.0-rc1 with "lsusb (usbutils) 014".
> > > 
> > > The strange thing is that this device is nowhere to be found in the output
> > > of "lsusb -t". The lsusb manpage describes the '-t' option as: "Tells
> > > lsusb to dump the physical USB device hierarchy as a tree." So is 'physical'
> > > a weasel word in this context, or is there a bug in the '-t' option, or is
> > > there some other explanation?
> > 
> > A number of 'lsusb -t' issues were fixed in the 015 release of usbutils,
> > so maybe update?
> > 
> > that being said, the -t option is a totally different codepath in the
> > tool, and shows different things overall.  -t shows the drivers that are
> > bound to the different interfaces, which means that a single device will
> > show up multiple times in the -t option.
> > 
> > Here's the output of the two things on my local laptop, with just a few
> > USB devices in it:
> > 
> > $ lsusb
> > Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > Bus 003 Device 003: ID 27c6:609c Shenzhen Goodix Technology Co.,Ltd. Goodix USB2.0 MISC
> > Bus 003 Device 006: ID 0bda:5634 Realtek Semiconductor Corp. Laptop Camera
> > Bus 003 Device 004: ID 8087:0032 Intel Corp. AX210 Bluetooth
> > Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > 
> > $ lsusb -t
> > /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
> > /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
> >      |__ Port 7: Dev 6, If 0, Class=Video, Driver=uvcvideo, 480M
> >      |__ Port 7: Dev 6, If 1, Class=Video, Driver=uvcvideo, 480M
> >      |__ Port 9: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 12M
> >      |__ Port 10: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
> >      |__ Port 10: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 20000M/x2
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 480M
> > 
> > and then if you give the -v option as well you see a bit more:
> > 
> > $ lsusb -tv
> > /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
> >      ID 1d6b:0003 Linux Foundation 3.0 root hub
> > /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
> >      ID 1d6b:0002 Linux Foundation 2.0 root hub
> >      |__ Port 7: Dev 6, If 0, Class=Video, Driver=uvcvideo, 480M
> >          ID 0bda:5634 Realtek Semiconductor Corp.
> >      |__ Port 7: Dev 6, If 1, Class=Video, Driver=uvcvideo, 480M
> >          ID 0bda:5634 Realtek Semiconductor Corp.
> >      |__ Port 9: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 12M
> >          ID 27c6:609c Shenzhen Goodix Technology Co.,Ltd.
> >      |__ Port 10: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
> >          ID 8087:0032 Intel Corp. AX210 Bluetooth
> >      |__ Port 10: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
> >          ID 8087:0032 Intel Corp. AX210 Bluetooth
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 20000M/x2
> >      ID 1d6b:0003 Linux Foundation 3.0 root hub
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 480M
> >      ID 1d6b:0002 Linux Foundation 2.0 root hub
> > 
> > 
> > What are you seeing missing in your output?
> 
> lsusb-t.c says:
> 
>   Copyright (c) 2009 Greg Kroah-Hartman <gregkh@suse.de>
> 
> When I tried to contact the author by email off-list with a fair
> amount of data (e.g. a copy of /sys from my machine), he claimed
> that such an approach was "rude" in the sense that it should have
> been sent to this list. Personally I prefer to fix bugs via a
> direct email exchange, without the peanut gallery. After all, many
> of the bugs found fall into the "brown paper bag" variety.
> Plus I felt a bit uncomfortable about publishing the full
> contents of /sys from my laptop.

You don't have to post the full contents of /sys but note that private
emails do not scale well for open source development at all, which is
why it should be done in public for everyone to help.

And anyone working in open source is long used to "brown paper bag"
bugs, it's not an issue for anyone (or should not be, we are all human.)

> Here is a bit more information on this subject:
> 
> $ ls /sys/bus/usb/devices
> 1-0:1.0  3-7:1.1      5-2.1.1.2      5-2.5        6-2.3.4
> 2-0:1.0  3-7:1.2      5-2.1.1.2:1.0  5-2.5:1.0    6-2.3.4:1.0
> 3-0:1.0  4-0:1.0      5-2.1.1.2:1.1  6-0:1.0      usb1
> 3-3      5-0:1.0      5-2.1.1.2:1.2  6-2          usb2
> 3-3:1.0  5-1          5-2.1.1.2:1.3  6-2.1        usb3
> 3-4      5-2          5-2.3          6-2:1.0      usb4
> 3-4:1.0  5-2.1        5-2.3:1.0      6-2.1:1.0    usb5
> 3-4:1.1  5-2:1.0      5-2.3.4        6-2.1.2      usb6
> 3-4:1.2  5-2.1.1      5-2.3.4:1.0    6-2.1.2:1.0
> 3-7      5-2.1:1.0    5-2.3.4.3      6-2.3
> 3-7:1.0  5-2.1.1:1.0  5-2.3.4.3:2.0  6-2.3:1.0
> 
> And the missing device is 5-1 and looks like this:
> $ cd /sys/bus/usb/devices/5-1
> $ ls_name_value
> authorized : 1
> avoid_reset_quirk : 0
> bcdDevice : 0200
> bConfigurationValue : 1
> bDeviceClass : 11
> bDeviceProtocol : 00
> bDeviceSubClass : 00
> bmAttributes : c0
> bMaxPacketSize0 : 64
> bMaxPower : 0mA
> bNumConfigurations : 1
> bNumInterfaces :  0
> busnum : 5
> configuration :
> descriptors : <contains non-ASCII chars>
> dev : 189:526
> devnum : 15
> devpath : 1
> devspec : (null)
> idProduct : 572b
> idVendor : 0483
> ltm_capable : no
> manufacturer : STMicroelectronics
> maxchild : 0
> product : STEVAL-USBC2DP Type-C to DisplayPort adapter
> quirks : 0x0
> removable : unknown
> remove :
> rx_lanes : 1
> serial : 00000000002B
> speed : 12
> tx_lanes : 1
> uevent : MAJOR=189 MINOR=526 DEVNAME=bus/usb/005/015 DEVTYPE=usb_device
> DRIVER=usb PRODUCT=483/572b/200 TYPE=17/0/0 BUSNUM=005 DEVNUM=015
> urbnum : 14
> version :  2.01
> 
> That all looks correct.
> 
> The code in lsusb-t.c seems to assign a special meaning to "-1" devices
> and there is only one of those: "5-1". And the device associated with
> "5-1" is the one that does _not_ appear in the output of 'lsusb -t' but
> does appear in the output of 'lsusb'.

The code patch of the '-t' option in lsusb is totally separate and apart
from the "normal" portion of lsusb, as you note, it is a separate .c
file as well.  -t uses the sysfs representation of the USB devices,
while the other code path uses the 'libusb' representation of the USB
devices.  And those seem to differ here (as they do for everyone.)

So if someone wants to take the time to figure out which representation
is "more correct", that would be great.  I don't have the bandwidth to
do so for the next few weeks due to travel requirements on my end,
sorry.

thanks,

greg k-h

