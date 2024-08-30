Return-Path: <linux-usb+bounces-14389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0C96642C
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 438DB1F236A2
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FD91B2514;
	Fri, 30 Aug 2024 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="fKL964jT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CdNVyWRy"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328581B251C
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725028035; cv=none; b=JZ7ik8CbKFs/6lsH3P72yj4q3PNITJg2xzZC2vYINyeKkZLwNx/YVeTVcyjjK0vZNnD/7ItJ+q/RQncXn1iai27ckudwf4Bl158J1MzdhFe0J4G1Cx36/Djq5rdCVujgayOb3ypJ7JfNOE4Z/M7ylABidh1Oc4Q2O6aSkRJk+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725028035; c=relaxed/simple;
	bh=jtknZka+QXGkklUHaPShbhtlVNs1B1wpT3Zxd31RFzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRJbqLFDFj/Ng0+Wm/sD4i4HsEANZLeiGtrc811Osjxwp7CAGu/+OJkwbIUiuhAwMaOC7SbMvAnRTl9wstTwSvcg4M3zLxLo2kv+saNvvoVeWlVM1lZqCkIcGf4wgErbIEGBrW44bGbw1h2wjfuQZkZUSTiizv2vHlESEfzMFAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=fKL964jT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CdNVyWRy; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4759D11400F3;
	Fri, 30 Aug 2024 10:27:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 30 Aug 2024 10:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1725028032;
	 x=1725114432; bh=I2BPMp3IcCZWrRbqDsdoaFVAgeBOwGChD8OgMNvDzKw=; b=
	fKL964jTfoJUP224AYZI+au3U7JwYLiX+PS8NC6cY+Zi21YHZ/RR8ZQfTERZo/Sp
	xmqyV8wvaDAYgF9CGUdcgBcCJ0FJChpGmoN2dtRGFa1xhXc6ygvsb5CAGTyeN7UE
	tVjwsrhEnBlysv0mTmaNNBQWPj6wT0ZzUDJ1AOdJEadRFKlBkLEDLl1nrXCFmuqp
	NiR1RqbttvgAKkYHrTzAER34seqDGCb8hG50BFII3YWMM1aWEp0LoBzwoZGACo4y
	zo4upS6RPDgoeia2pKFsgRCR1epNdQhgySs1z3ozfFlay+flhyIuAIAqH2mwgKGK
	hxMh1ck/SopKQX65GUXjxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725028032; x=
	1725114432; bh=I2BPMp3IcCZWrRbqDsdoaFVAgeBOwGChD8OgMNvDzKw=; b=C
	dNVyWRy86Xrj8/ddbWM+5eD45x1k6P5fbAgPmiuUQHsgYGyIBgW3IQpVXZOCBrw8
	Wg2r7WvNFLEbGSqdVxVJe0s8MBan7kqyeODQcvs5NrwnXNPj79s643lnaHkJ8wRn
	RTERy4q6xQ5inqkRZfNXL4Um6H0jHI1a76W+2lYjSvfZ2eoQ4e6F+qo+SF/LI59D
	WehPZH5UbDg3kIxy/lKs3OfirLrMAjK9z98Zua6Mb9awikTeqHQu6gJa2JU+VI2c
	8/sNPipkk4FgbyO0NYibgdiM4lDhDoV2jc3fVldKAtqstEbwsPHBfyR75uj+D/Rc
	yI/GUlZzBVGXBmOLz2ovQ==
X-ME-Sender: <xms:v9bRZk7enJowxiTF04kOS-QxkQY8yww9yT5qC0sbee2ng7fx2rP3ug>
    <xme:v9bRZl7XYqB46FAWFu6q-Ol1uDF5x-NZgIFsouP6ElkR0XHobOC1q0QB-NqJDrJsa
    OnKQ8Ng_Yq9XQ>
X-ME-Received: <xmr:v9bRZjd_nB23aGod1yTmA1r4QQ4zCeLYXlxoDrE3ZinHtZ4-IHfeb0K3Z6oqGF6iphGDa74nVhNojEHEtaaOIkgLFJuUmnmX1PEDZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddu
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeefueegveehieetffejvdevtefhheekffelfeevheeuvdfggfduvdfh
    jeejleejgeenucffohhmrghinhepvghmuhdrihgurdgruhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdp
    nhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvgihrg
    hlsegvhigrlhdrvghmuhdrihgurdgruhdprhgtphhtthhopehlihhnuhigqdhushgssehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wNbRZpIAhXN2LBEkP9O6TQNMnfuBOsEIbQx-CePYXtW3ppC1j4_GBA>
    <xmx:wNbRZoIuAA0mIKPG3DFFcR5yztalI3DR5WLJ0ol1AamWTZo52FsSxw>
    <xmx:wNbRZqw1m88Oo0bfhSy2keYtjQP8TVUqrSbkxdxyIb_1NVim0aA0UA>
    <xmx:wNbRZsLze-ycHMBSXE0bQKWZTFDU9NZQ0hYSWjq5WOHvtw1rCLya4g>
    <xmx:wNbRZtF4W4YnEe5AEAQqC3chauEk-3XjEkOYfycUTcNNJn-JytXzXNIT>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 10:27:11 -0400 (EDT)
Date: Fri, 30 Aug 2024 16:27:08 +0200
From: Greg KH <greg@kroah.com>
To: Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc: linux-usb@vger.kernel.org
Subject: Re: Understanding 'lsusb -t'
Message-ID: <2024083013-rentable-matador-050b@gregkh>
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
 <2024083057-charger-lustrous-d434@gregkh>
 <f700f792-929a-45e6-bdfe-8600b92e97d7@eyal.emu.id.au>
 <4e3c79f0-9f06-4da2-b479-1300d4890786@eyal.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e3c79f0-9f06-4da2-b479-1300d4890786@eyal.emu.id.au>

On Fri, Aug 30, 2024 at 11:43:39PM +1000, Eyal Lebedinsky wrote:
> On 30/8/24 11:41 pm, Eyal Lebedinsky wrote:
> > On 30/8/24 10:32 pm, Greg KH wrote:
> > > On Fri, Aug 30, 2024 at 10:14:20PM +1000, Eyal Lebedinsky wrote:
> > > > I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.
> > > > 
> > > > I note this output:
> > > > 
> > > > $ lsusb -tv
> > > > /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
> > > >      ID 1d6b:0002 Linux Foundation 2.0 root hub
> > > > [trimmed]
> > > >      |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
> > > > [trimmed]
> > > >      |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
> > > > [trimmed]
> > > >      |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
> > > >          ID 2109:2817 VIA Labs, Inc.
> > > > /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
> > > > [trimmed]
> > > >      |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
> > > >          ID 2109:0817 VIA Labs, Inc.
> > > > 
> > > > I removed some content that is not relevant to my question.
> > > > 
> > > > Note the Bus 001.Port 006 and Bus 002.Port 006 entries.
> > > > 
> > > > I verified that both are for the same (one) device. They do not show when I disconnect it.
> > > > The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
> > > > Nothing is plugged into any of the four ports.
> > > > 
> > > > Is this correct? Why does this device show twice in the list?
> > > 
> > > That's odd, as the same device shouldn't be on multiple busses.  Busses
> > > are a "root port" on the system (i.e. a new PCI controller device), so
> > > are you sure you just don't have multiple devices with the same
> > > device/vendor id?
> > 
> > The hub is on an extension cable, and I just unplug it the hub.
> > 
> > > What is the diff between running the command before and after removing a
> > > single device?
> > 
> > $ lsusb -tv >lsusb-all.log
> > $ lsusb -tv >lsusb-less.log
> > $ diff -u lsusb-all.log lsusb-less.log
> > --- lsusb-all.log       2024-08-30 23:39:09.782062079 +1000
> > +++ lsusb-less.log      2024-08-30 23:39:22.608987407 +1000
> > @@ -48,8 +48,6 @@
> >               ID 0c45:7401 Microdia TEMPer Temperature Sensor
> >           |__ Port 004: Dev 018, If 1, Class=Human Interface Device, Driver=[none], 1.5M
> >               ID 0c45:7401 Microdia TEMPer Temperature Sensor
> > -    |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
> > -        ID 2109:2817 VIA Labs, Inc.
> >   /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
> >       ID 1d6b:0003 Linux Foundation 3.0 root hub
> >       |__ Port 004: Dev 002, If 0, Class=Hub, Driver=hub/4p, 5000M
> > @@ -58,5 +56,3 @@
> >               ID 0bda:0411 Realtek Semiconductor Corp. Hub
> >       |__ Port 005: Dev 003, If 0, Class=Hub, Driver=hub/4p, 5000M
> >           ID 05e3:0612 Genesys Logic, Inc. Hub
> > -    |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
> > -        ID 2109:0817 VIA Labs, Inc.
> 
> Also, here these the log messages when I reconnect the hub:
> 
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: Product: USB2.0 Hub
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: Manufacturer: VIA Labs, Inc.
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 1-6:1.0: USB hub found
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 1-6:1.0: 4 ports detected
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: new SuperSpeed USB device number 7 using xhci_hcd
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: New USB device found, idVendor=2109, idProduct=0817, bcdDevice= 0.50
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: Product: USB3.0 Hub
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: Manufacturer: VIA Labs, Inc.
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 2-6:1.0: USB hub found
> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 2-6:1.0: 4 ports detected

Extension cables are very wierd, and you are right, this is two
different hubs on two ports.  Is this a thunderbolt device somehow?

Anyway, as long as everything is working properly, all should be good.

What happens when you plug a device into this cable at the other end,
does it show up twice?  Or just once?

thanks,

greg k-h

