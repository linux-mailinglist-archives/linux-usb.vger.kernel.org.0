Return-Path: <linux-usb+bounces-10071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6D8BEAD4
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 19:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A11F286B0A
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 17:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10BC16C859;
	Tue,  7 May 2024 17:51:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 6E7897462
	for <linux-usb@vger.kernel.org>; Tue,  7 May 2024 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715104281; cv=none; b=cV3hDcaSB77kdCDUEV4r746WrOri5uBCDmIFI+YCI+UbrwmQBYC+SpA2J5aq7hQl8ru4rb7/j72L8x9mMDWx8nbLdxD9QpZqi9QNPSOUofxtBcp6M3ikq3MVioxxos4QcEu+CDJ8Gmf34k79fmmgiyLzFd0LIi9qjW8KQH3Qr9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715104281; c=relaxed/simple;
	bh=edgPr0j8HUBnCZ8UPCpgmdJJM4LR1cxD2wtXW4rxK34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCn2qKggxWbUKO2NxbhOHKQfH2WSWRFc/YajRZyre0CdcuF9VAl9VWxplJSyaZj8fIyuncer/PQAvXZRPAMAzT81IhEUQNSPeI6SGfTM+Mqeepum2y3G5VRbGi1CNcuZhH8LzaT/YNtXt+5z51/dM3qJ8ksAwluLBF2JfQ7TUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 932691 invoked by uid 1000); 7 May 2024 13:51:18 -0400
Date: Tue, 7 May 2024 13:51:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
Message-ID: <9a89ba8d-c406-4ff1-98f0-080c77390efe@rowland.harvard.edu>
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
 <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>
 <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu>
 <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>
 <8a8edaba-670b-47ad-a123-2077e2e0644d@rowland.harvard.edu>
 <CAHhAz+iywarnsNmt0mbuyPV+mNYQ+OwqoDMaymTGAEv6KBcLnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+iywarnsNmt0mbuyPV+mNYQ+OwqoDMaymTGAEv6KBcLnA@mail.gmail.com>

On Tue, May 07, 2024 at 10:08:13PM +0530, Muni Sekhar wrote:
> Now, I can verify USB device auto-suspend and auto-resume through the
> kernel log.
> 
> In my test system, I found three buses "Bus 001, 002, and 003" using
> the lsusb command.
> 
> The USB device I want to test is located on "Bus 002".
> 
> 
> # lsusb | grep "Bus 002" | wc
>       4      37     224
> 
> As per the output of the above command, there are 4 USB devices on
> "Bus 002" in my test system.
> 
> 
> # ls -l /sys/bus/usb/devices/2*
> lrwxrwxrwx 1 root root 0 Feb 14 14:48 /sys/bus/usb/devices/2-0:1.0 ->
> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-0:1.0
> lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1 ->
> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1
> lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.1 ->
> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1
> lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1:1.0 ->
> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0
> lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.1:1.0
> -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1/2-1.1:1.0
> lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.7 ->
> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.7
> lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.7:1.0
> -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.7/2-1.7:1.0
> 
> # ls -l /sys/bus/usb/devices/2* | wc
>       7      77     892
> 
> 
> The above command shows seven nodes in /sys/bus/usb/devices/2* directory.
> 
> The wakeup, control, and autosuspend_delay_ms attribute files are
> controlled via /sys/bus/usb/devices/.../power/, where "..." represents
> the device's ID.
> 
> I identified my test device in /sys/bus/usb/devices/.../power/ by
> iterating through all the directories, reading the idVendor attribute
> file, and then manipulating the power management attribute files.
> 
> Is there a way to manually map /sys/bus/usb/devices/.../power/ from
> the lsusb output? Can this mapping be done from a user space program
> as well? Do you have any reference examples for this? If so, could you
> share their GitHub location?

libusb already can do this for you.

However, if you want to do it by hand then you can match up devices 
based on the devnum attribute file in the devices sysfs directory.  For 
example, if you were trying to identify which device corresonds to the 
lsusb entry for device 003 on bus 002, you should look through all the 
directories in /sys/bus/usb/devices/2-* and see which one has "3" in its 
devnum file.

There's another way of doing it more directly, using the output from 
"lsusb -t".  For example, on my system:

$ lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/3p, 480M
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/8p, 480M
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/4p, 480M
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/3p, 480M
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/6p, 480M
        |__ Port 002: Dev 003, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
/:  Bus 005.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/15p, 480M
/:  Bus 007.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/6p, 5000M

Let's say we want to locate the Human Interface Device in sysfs.  
According to the listing, it is on port 002 below port 001 below bus 
004.  You reverse the numbers, put a '-' after the bus number, 
and separate the port numbers with a '.', which gives "4-1.2":

$ cat /sys/bus/usb/devices/4-1.2/product
Microsoft 5-Button Mouse with IntelliEye(TM)

Alan Stern

