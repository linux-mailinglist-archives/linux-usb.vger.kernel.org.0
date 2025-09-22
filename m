Return-Path: <linux-usb+bounces-28471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB34B916F2
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 15:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41AC24E11DE
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 13:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BE630C355;
	Mon, 22 Sep 2025 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yez/0lay"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13862C8F0
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548392; cv=none; b=lgPF4TgLCr/68yImjZ0ZPKNp7xSLm0C4AtqBEIS65rsZ05oSftV4AU0TXRMtWkOaG1Ae0yZn4JtI+PYM7/Vd/h6lke3xIyMF5XfenqXxPE7uNdnNCbd9hf5ILQknK4dYmZAnDJYnhc3ADvP/XXq4Xr5yRyazUzNkUIjVpqjDygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548392; c=relaxed/simple;
	bh=Bmb3S8bqBLGJRq232X5V9cnxNcgHZi64+6fLTDKlRqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bC10wFpWYTT94UfpRkDFWde8zAS5XF2I9jFyp+GcBRo4vjUWWCHSRcY/0d7uw3JsDNm09HJ9X0ytACOxQFwGNVdd9wL5fwp8n7PF8bJK1Jb9vZ6/0/1xNPYrm2Gf6Tk5WSpn+/EZ9ywa9F3t1oFAT+obvpMX0yLSs84wYDidgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yez/0lay; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758548392; x=1790084392;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Bmb3S8bqBLGJRq232X5V9cnxNcgHZi64+6fLTDKlRqY=;
  b=Yez/0laybbkyh++Z9EvMaBnbEeBV4Jo0ChEsZDtPaeiAebOT8wGzhtyK
   Leq4Z9PqfFyTPnkG4lt327VwIriJQJbBhbAUTT/zNDuYOv2SA3/EHaTfV
   nTIOc8MsVmO7+qdGi+Kg08164eBUd2TXgRB3wOnJm2DyMLpjfC7iYn/Ih
   6LhJJOJLgW/dr4HmkEop0c38J0NQW7JgOA0enDNEAOXrjXo2Ily5f9rA3
   nlw2vfz10i45I8PvOK+3WVxLtPWzl1kAouzmRN1VD7IJbPcDWq44n0wdZ
   fe9qxwbO42hMWSFtvj74KKuH5N7cITYw2dloqsM6RTh8+JXURjlCLHxy9
   g==;
X-CSE-ConnectionGUID: 2xklBwJOSPiyq3faP++4Jg==
X-CSE-MsgGUID: lE9j2BKpRwO+ZOe3Nh1BdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60972140"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="60972140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 06:39:51 -0700
X-CSE-ConnectionGUID: +fC0weCKSNut8v1H8LAsqw==
X-CSE-MsgGUID: BdYRFOyQTEu9kw9eeCmt1g==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.161]) ([10.245.244.161])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 06:39:50 -0700
Message-ID: <a97c6aa9-b7fb-4a25-9c1c-97ec19a98aac@linux.intel.com>
Date: Mon, 22 Sep 2025 16:39:47 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: XHCI debug device is not detected after debug target enables it
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-usb@vger.kernel.org
References: <aNDBQ-xLHB3ETiPb@mail-itl>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <aNDBQ-xLHB3ETiPb@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.9.2025 6.23, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I have a setup where XHCI console is used to debug Xen on a laptop.
> There are two system involved:
> 1. SUT - an x86 laptop running Xen, and configured to expose
> console over XHCI debug capability
> 2. debugger - Raspberry Pi 4B to which the debug cable is connected and
> where the console can be accessed
> 
> The XHCI debug cable is a simple USB3 A-A cable, with D+, D- and Vbus
> pins cut. When SUT isn't configured to serve debug console (for
> example during boot while in firmware), debugger complains about
> connected device, like this:
> 
>      usb usb2-port2: config error
>      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
>      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
>      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
>      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
>      usb usb2-port2: attempt power cycle
>      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
>      usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
>      usb usb2-port2: unable to enumerate USB device
>      usb usb2-port2: config error
> 
> This is expected, as two USB hosts are connected together here. But once
> Xen starts and configures XHCI debug console, it's supposed to be
> detected as ttyUSB0. When it works, it looks like this:
> 
>      usb 2-2: new SuperSpeed USB device number 11 using xhci_hcd
>      usb 2-2: LPM exit latency is zeroed, disabling LPM.
>      usb 2-2: New USB device found, idVendor=1d6b, idProduct=0010, bcdDevice= 0.00
>      usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>      usb 2-2: Product: Debug console
>      usb 2-2: Manufacturer: Xen
>      usb 2-2: SerialNumber: 0
>      usb_debug 2-2:1.0: xhci_dbc converter detected
>      usb 2-2: xhci_dbc converter now attached to ttyUSB0
> 
> This worked fine with 5.15.92 (from Raspberry Pi fork) on debugger. It
> also works fine with RPi debugger replaced with another x86 box
> (regardless of the kernel version). But after updating RPi to 6.6.78
> (also RPi fork) it stopped working. Updating further to 6.12.48 (RPi) or
> even 6.16.7 (vanilla) didn't fixed it either. I didn't test vanilla
> 5.15, but I find it unlikely it worked only due to some RPi patch
> before.
> 
> When it's broken, SUT waits for the XHCI to enter "configured" state,
> IIUC in this loop:
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/drivers/char/xhci-dbc.c?ref_type=heads#L864
> 
> There are two options to fix it in this state:
> - unplugging the cable and plugging it back
> - _reading_ /sys/bus/usb/devices/usb2/2-0:1.0/usb2-port2/disable
> 
> In the latter case, kernel prints this (note the first line):
> 
>      xhci_hcd 0000:01:00.0: port 2-2 resume PLC timeout
>      usb 2-2: new SuperSpeed USB device number 11 using xhci_hcd
>      usb 2-2: LPM exit latency is zeroed, disabling LPM.
>      usb 2-2: New USB device found, idVendor=1d6b, idProduct=0010, bcdDevice= 0.00
>      usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>      usb 2-2: Product: Debug console
>      usb 2-2: Manufacturer: Xen
>      usb 2-2: SerialNumber: 0
>      usb_debug 2-2:1.0: xhci_dbc converter detected
>      usb 2-2: xhci_dbc converter now attached to ttyUSB0
> 
> I can 100% reliably reproduce the issue on warm reboot. On cold boot
> usually it works.
> 
> Any ideas?
> 

Best guess is that the Raspberry PI, debugger xHC is runtime suspended.

Reconnecting the cable, or reading the port "disable" sysfs entry causes the host
to resume, run, and detect the connected device.

The xHCI host is probably allowed to suspend after several failed enumeration attempts,
which is expected due to the connected device also being in host mode.

I think runtime pm support was enabled as default for most xHCI hosts around late 5.x,
early 6.x kernels, so that would fit.

Does preventing the roothub, and thus the host from runtime suspend help:

On the Raspberry Pi debugger:
echo on > /sys/bus/usb/devices/usb2/power/control

Thanks
Mathias

