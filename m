Return-Path: <linux-usb+bounces-10252-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6D8C46B7
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2024 20:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF2C61C21A28
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2024 18:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7542E3EE;
	Mon, 13 May 2024 18:09:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 5767015B3
	for <linux-usb@vger.kernel.org>; Mon, 13 May 2024 18:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715623775; cv=none; b=RjvFydGcin2iEqsSpUFk/NJXC0o50rZG9UoN3Rnw/9pcRUkoKibShKrUN2HSfTKVGbE5MIr2qzqB9xAUlfyqaC896KJqdElWF/3wgqzYKP2pJ2VnZD14UmTyoC7MyD0KVzR54GzuXym/HPKLz/KTBFqywBpHz6dJH6AJO7XlGbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715623775; c=relaxed/simple;
	bh=UKtoOVAKPLU3rKoaHXDE+egS7wDDpjZdTSFMkDzLwyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dm23zr9S/Vc88YurfLxbswuROGHK1u2R2iXebmZM13/uqU7ge1H61dDcpwvtvfiAQ23CwjcObwqChfmiHo/Qz1WobMp8uoSV7JtPC0rvb8t08oGNgavNm2TEv5lbeyfUwPzNfZVm/m6odR8Lcr3L6BoE3KX6JGJqlRtglum5N8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 149965 invoked by uid 1000); 13 May 2024 14:09:24 -0400
Date: Mon, 13 May 2024 14:09:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
Message-ID: <d1cf7350-10d3-4dd4-a93e-94aff2a5c913@rowland.harvard.edu>
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
 <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>
 <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu>
 <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>
 <CAHhAz+jWrJBgAkZ6XmyEMdR-BT0GUmew0RqBGVsrenOVo5vcaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+jWrJBgAkZ6XmyEMdR-BT0GUmew0RqBGVsrenOVo5vcaw@mail.gmail.com>

On Mon, May 13, 2024 at 11:14:44PM +0530, Muni Sekhar wrote:
> In the context of the Linux kernel and USB devices, what are the
> similarities and differences between usbfs and sysfs?

They are totally different.  usbfs gives you direct communication with 
the various USB devices on your system.  sysfs presents interfaces for 
monitoring and controlling your entire system (including information 
about how it manages its USB devices) but doesn't provide a way to 
communicate with the devices.

> Before invoking the ioctl() system call, we need to obtain a file
> descriptor by invoking the open() system call. How do we identify the
> device node in the usbfs interface?
> For example, can you please explain how to identify the device node
> location of a Human Interface Device(shown below in lsusb -t output)
> as the first argument in the open() system call.
> 
> $ lsusb -t
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/3p, 480M
>     |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/8p, 480M
> /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/4p, 480M
> /:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/3p, 480M
>     |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/6p, 480M
>         |__ Port 002: Dev 003, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
> /:  Bus 005.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/15p, 480M
> /:  Bus 007.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/6p, 5000M

The Human Interface Device is Device 003 on Bus 004.  Therefore the 
device node is /dev/bus/usb/004/003.

Alan Stern

