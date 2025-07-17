Return-Path: <linux-usb+bounces-25913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE05B08FA6
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 16:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3019DA62E82
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 14:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBAC2F7CE6;
	Thu, 17 Jul 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IO16J8TI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9C18FC86
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752763117; cv=none; b=EtGNeYTZI29LKfSXiLY4f5M8dHJjxzLlPadfdzlcz2/2NtlASLvXXysGr5KroQVNJnD+qAUIP25Bu1mJkcY4jik55+yk/Ogyx0yBtA3rG15Ck9T2MT84IWXcyoNY5fYH6kx2UsHkcaOJQrYpp0ZA4rO+80Uhkfhgxb8YDQ95qkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752763117; c=relaxed/simple;
	bh=Xa2l5QsJ4dBERvdF3QSrlpupHapOyejG5leQMJu5pgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlluEH4ib1gl0ULJg+D+/0mZH4/M6FdAXMXyeBE9JcF4r8Y5rQPMjkGC+alsw/uQp9f7sX91WEQ+Ue1OmjXjLrCi1GwiGEz2Zx9Qp7vCFR1euXJbQ+7bF9c/bagVBHRIFtdspwtDYASxmEv9R6w5fnl4Z2EftRPfaBzrPx1F82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IO16J8TI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CF6C4CEE3;
	Thu, 17 Jul 2025 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752763116;
	bh=Xa2l5QsJ4dBERvdF3QSrlpupHapOyejG5leQMJu5pgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IO16J8TIFmZoBsFBHxz5+F3/JIe5Gbg+0+UvZpDyiXetLOaxmuX48H1dP20Ce5tI1
	 4zCgqPXOJTFQ5kzU4ahmGMJdBvY0Z+X3mhBZJBMb2zdSPQO+tRHE8S+W6FLHgq5RT9
	 kXXFfe7pFPktCq0EW8OISI2BHBPJOyvZp+l4CiNo=
Date: Thu, 17 Jul 2025 16:38:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Bigonville <bigon@bigon.be>
Cc: linux-usb@vger.kernel.org
Subject: Re: Hikmicro Mini2 V2: unable to enumerate USB device
Message-ID: <2025071756-improve-compactor-207f@gregkh>
References: <c05a76cc-ac27-4f64-a4a7-5a1e0fd349d9@bigon.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c05a76cc-ac27-4f64-a4a7-5a1e0fd349d9@bigon.be>

On Thu, Jul 17, 2025 at 02:06:13PM +0200, Laurent Bigonville wrote:
> Hello,
> 
> I just bought an Hikmicro Mini2 V2 USB thermal camera and the device is not
> recognized
> 
> [   64.039667] usb 3-2: new high-speed USB device number 11 using xhci_hcd
> [   64.245840] usb 3-2: New USB device found, idVendor=2bdf, idProduct=0106,
> bcdDevice= 4.09
> [   64.245857] usb 3-2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [   64.245862] usb 3-2: Product: Thermal Imager
> [   64.245865] usb 3-2: Manufacturer: Hikmicro
> [   64.245868] usb 3-2: SerialNumber: XXXXXXXX
> [   65.817499] usb 3-2: USB disconnect, device number 11
> [   66.162197] usb 3-2: new high-speed USB device number 12 using xhci_hcd
> [   66.344529] usb 3-2: device descriptor read/64, error -71
> [   66.629395] usb 3-2: device descriptor read/64, error -71
> [   66.922427] usb 3-2: new high-speed USB device number 13 using xhci_hcd
> [   67.104880] usb 3-2: device descriptor read/64, error -71
> [   67.390254] usb 3-2: device descriptor read/64, error -71
> [   67.493238] usb usb3-port2: attempt power cycle
> [   68.151973] usb 3-2: new high-speed USB device number 14 using xhci_hcd
> [   68.152150] usb 3-2: Device not responding to setup address.
> [   68.354479] usb 3-2: Device not responding to setup address.
> [   68.560631] usb 3-2: device not accepting address 14, error -71
> [   68.747321] usb 3-2: new high-speed USB device number 15 using xhci_hcd
> [   68.747422] usb 3-2: Device not responding to setup address.
> [   68.950227] usb 3-2: Device not responding to setup address.
> [   69.152505] usb 3-2: device not accepting address 15, error -71
> [   69.152593] usb usb3-port2: unable to enumerate USB device
> 
> The device is not listed in lsusb after this
> 
> It's not clear whether the camera is a UVC one, but the device should still
> appear, right?
> 
> An idea what to do?

What kernel version is this?  The device really doesn't like to be read
from, does it work in any other machine?  Plugged into a different
port/hub?

thanks,

greg k-h

