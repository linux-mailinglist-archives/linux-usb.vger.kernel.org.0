Return-Path: <linux-usb+bounces-11472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC79100F2
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 11:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD276B22D5A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 09:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FF11A4F3B;
	Thu, 20 Jun 2024 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K8feQFXx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E831A3BD1
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718877537; cv=none; b=MhfuLTisVuDfEF0XgVRs97WMH9sV3PFTwDwnTe+r33LZByWP/aS9j0WzeVfA7Ae2XSUDlkmOlPfGN1EWwAFp1oMp5lGMFb0GrgCLgEUbB0N8Ff8HKF3pY5xrkidMR40+6rakxB9QJ5jaQFVWGZh5sa8z1NFYjCwvNE64kGx6Z+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718877537; c=relaxed/simple;
	bh=inUsfJy55EfpeYiukNnr9486Xs3WOByfwdBHCKVV6bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZhlpqa3OUgxes4yNb3iPWS6H4Q/XKsE0PRYdE4ql4CjFjZzK5xBswZdndLBBL8fHzB7DK7PHk13ZSwI/0qTaiQP0s+gKJmABSLbbPlFIkSayesBNt7eTVcaY3gcnvkhpPQrbjXPM6gQ2KJYVEejpGC05fchefQ6heyEBn4H9PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K8feQFXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75360C2BD10;
	Thu, 20 Jun 2024 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718877536;
	bh=inUsfJy55EfpeYiukNnr9486Xs3WOByfwdBHCKVV6bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8feQFXxGV6Xq01dXpxu6rVs7Xn7o9+2jJnppCpXGvaX1VqEWOu7HToCJMLXLx1xc
	 unTaM5RPMzyDO8l7FFNOt8st7Kt35uEZFax7ApgUTAm/HqcoUCoeAJB4QZrFrDpQCo
	 SJHVEl53Kk4fmANnfHXZ5vBOhw9c6fpwpWkuuIu0=
Date: Thu, 20 Jun 2024 11:58:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Giacinto Cifelli <gciofono@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb composition without class
Message-ID: <2024062042-sandal-unending-44cd@gregkh>
References: <CAKSBH7F7LhCykPdKYRi0DvLX5yYjKtbOZbEOKhDXfvrQJA-XKA@mail.gmail.com>
 <2024062016-robust-distance-ea98@gregkh>
 <CAKSBH7H=TEFtsQLr3=L-Eh9odeEej2j028G2RcbM0H=CTZWrQQ@mail.gmail.com>
 <2024062010-facing-refining-c204@gregkh>
 <CAKSBH7HeKuP7gA7hk-RFFdnQpaSAOF46JRnQeqFgcA1deG3D6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKSBH7HeKuP7gA7hk-RFFdnQpaSAOF46JRnQeqFgcA1deG3D6w@mail.gmail.com>

On Thu, Jun 20, 2024 at 11:25:43AM +0200, Giacinto Cifelli wrote:
> On Thu, Jun 20, 2024 at 8:41 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > On Thu, Jun 20, 2024 at 07:58:13AM +0200, Giacinto Cifelli wrote:
> > > > > greetings,
> > > > >
> > > > > question:
> > > > >
> > > > > on a system (yocto), I have a usb composition that doesn't assign the
> > > > > class for the interfaces:
> > > > >     |__ Port 3: Dev 3, If 10, Class=, Driver=cdc_mbim, 480M
> > > > >     |__ Port 3: Dev 3, If 8, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 6, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 4, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 2, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 11, Class=, Driver=cdc_mbim, 480M
> > > > >     |__ Port 3: Dev 3, If 0, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 9, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 7, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 5, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 3, Class=, Driver=cdc_acm, 480M
> > > > >     |__ Port 3: Dev 3, If 1, Class=, Driver=cdc_acm, 480M
> > > > > Kernel: Linux version 6.1.35 (oe-user@oe-host) (x86_64-poky-linux-gcc
> > > > > (GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP
> > > > > PREEMPT_DYNAMIC Thu Jun 22 18:03:13 UTC 2023
> > > > >
> > > > > instead of (arch):
> > > > >     |__ Port 004: Dev 004, If 0, Class=Communications, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 1, Class=CDC Data, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 2, Class=Communications, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 3, Class=CDC Data, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 4, Class=Communications, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 5, Class=CDC Data, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 6, Class=Communications, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 7, Class=CDC Data, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 8, Class=Communications, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 9, Class=CDC Data, Driver=cdc_acm, 5000M
> > > > >     |__ Port 004: Dev 004, If 10, Class=Communications, Driver=cdc_mbim, 5000M
> > > > >     |__ Port 004: Dev 004, If 11, Class=CDC Data, Driver=cdc_mbim, 5000M
> > > > > Kernel: Linux 6.6.34-1-lts #1 SMP PREEMPT_DYNAMIC Sun, 16 Jun 2024
> > > > > 14:45:31 +0000 x86_64 GNU/Linux
> > > > >
> > > > > This lack of class creates too many /dev/ttyACMx ports, and
> > > > > ModemManager tries to access them all, perhaps also blocking the
> > > > > device, and the whole system doesn't work.
> > > > >
> > > > > For completeness, the device is:
> > > > >     Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
> > > > > which is supported without any customs in the cdc-acm and cdc_mbim drivers.
> > > > >
> > > > > I spotted only two options not compiled-in in the yocto .config
> > > > > (compared with the arch one), but I strongly doubt this is related:
> > > > >     CONFIG_USB_G_MULTI
> > > > >     CONFIG_USB_G_MULTI_CDC
> > > > >
> > > > > Would you know why the class is not assigned?
> > > >
> > > > This is just a userspace issue, right?
> > >
> > > I think the class is assigned by the kernel/driver.
> > >
> > > > Or are you saying that somehow
> > > > the same device plugged into two different systems works differently?
> > >
> > > correct: the same device works differently in the two systems...  in
> > > the sense of the class not assigned.
> >
> > It's not that it is not assigned, it's that something isn't figuring it
> > out properly.
> >
> > Can you provide the output of 'lsusb -v -d 1e2d:0065' for both systems?
> 
> they seem ok with -v, I don't understand it.

Nope, there are major differences, let's look at the start:

-yocto:
+arch:

-Bus 001 Device 003: ID 1e2d:0065 Cinterion LTE Modem
+Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem

Ok, this means that for your yocto system you probably do NOT have an
updated hw.ids package installed for lsusb to use to figure out a lot of
different things in text form.  Things like:

   bLength                18
   bDescriptorType         1
-  bcdUSB               2.00
-  bDeviceClass          239
-  bDeviceSubClass         2
-  bDeviceProtocol         1
-  bMaxPacketSize0        64
-  idVendor           0x1e2d
-  idProduct          0x0065
+  bcdUSB               3.10
+  bDeviceClass          239 Miscellaneous Device
+  bDeviceSubClass         2 [unknown]
+  bDeviceProtocol         1 Interface Association
+  bMaxPacketSize0         9
+  idVendor           0x1e2d Gemalto M2M GmbH
+  idProduct          0x0065 LTE Modem


Class protocol defintions and the like.

But what's MOST important here is that right away, you see that on your
yocto device you are running at a 2.0 USB speed, not a 3.1 speed, right?

Perhaps that's the problem here?  The device looks quite different for
when it is in a 3.1 supported system, with different configurations
possible, and a different length entirely:

   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
-    wTotalLength       0x01a9
+    wTotalLength       0x0215

Are you _SURE_ this is the same device?  I would suggest getting your
yocto system updated and running at full USB 3 speeds and see if that
fixes the issues here.

hope this helps,

greg k-h

