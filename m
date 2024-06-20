Return-Path: <linux-usb+bounces-11467-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2490FCE4
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 08:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A601C2305C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 06:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCF0433C4;
	Thu, 20 Jun 2024 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0lziKlGz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37AE42AA6
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718865663; cv=none; b=N1rYn/RM2FpPFAz7xXQqgud/StkEAMIbBDVsNF2Y9SkDXSzeA941bauAVqWHfYJWcv0bhMCcPuomZl0FzF86Sq0u4POxS1arlLjARyRIzBCee8LIYydV9Qh/jGq3VxhUeRCz7/HEZhXFyrWCTVF0cNjPGTAAvDcQj4RG/SRZkM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718865663; c=relaxed/simple;
	bh=FeUBZf9rmqlFos9LnKRme1CtAqZej3ShCwZS2I897FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOLi46SSkTuffT4puj/juoREmDxiNyE4Bx+rGYBpwpNIGEbWgyIKD+nesItvVpk3LHOS0MEMalupoVK5/1lT1L3tyvNox6ywyk1swRPEDQ3hOVKzz+cluDzS9UD8cZP/gaJTwQbfuKQI5X3XcqSP6VMBKARB+Z+7xQLBoWMuGAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0lziKlGz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E408DC4AF07;
	Thu, 20 Jun 2024 06:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718865662;
	bh=FeUBZf9rmqlFos9LnKRme1CtAqZej3ShCwZS2I897FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0lziKlGzkDrDrWCNlnEYgmuM2EucXC11KAIPxjZuXRxIDzfG2GlZXtaEMx4S0eBgR
	 udsEAMc1HPbGWzPezdPYLb0Y5eplJend8VpfF+zOIxTLVbpEtiFfAEQPaBrABq4gON
	 44RC5rg6EhLZax27x7c/Zo7mhZ/G77VaH5L85LW0=
Date: Thu, 20 Jun 2024 08:40:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Giacinto Cifelli <gciofono@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb composition without class
Message-ID: <2024062010-facing-refining-c204@gregkh>
References: <CAKSBH7F7LhCykPdKYRi0DvLX5yYjKtbOZbEOKhDXfvrQJA-XKA@mail.gmail.com>
 <2024062016-robust-distance-ea98@gregkh>
 <CAKSBH7H=TEFtsQLr3=L-Eh9odeEej2j028G2RcbM0H=CTZWrQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKSBH7H=TEFtsQLr3=L-Eh9odeEej2j028G2RcbM0H=CTZWrQQ@mail.gmail.com>

On Thu, Jun 20, 2024 at 08:32:39AM +0200, Giacinto Cifelli wrote:
> On Thu, Jun 20, 2024 at 8:06 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Thu, Jun 20, 2024 at 07:58:13AM +0200, Giacinto Cifelli wrote:
> > > greetings,
> > >
> > > question:
> > >
> > > on a system (yocto), I have a usb composition that doesn't assign the
> > > class for the interfaces:
> > >     |__ Port 3: Dev 3, If 10, Class=, Driver=cdc_mbim, 480M
> > >     |__ Port 3: Dev 3, If 8, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 6, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 4, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 2, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 11, Class=, Driver=cdc_mbim, 480M
> > >     |__ Port 3: Dev 3, If 0, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 9, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 7, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 5, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 3, Class=, Driver=cdc_acm, 480M
> > >     |__ Port 3: Dev 3, If 1, Class=, Driver=cdc_acm, 480M
> > > Kernel: Linux version 6.1.35 (oe-user@oe-host) (x86_64-poky-linux-gcc
> > > (GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP
> > > PREEMPT_DYNAMIC Thu Jun 22 18:03:13 UTC 2023
> > >
> > > instead of (arch):
> > >     |__ Port 004: Dev 004, If 0, Class=Communications, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 1, Class=CDC Data, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 2, Class=Communications, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 3, Class=CDC Data, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 4, Class=Communications, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 5, Class=CDC Data, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 6, Class=Communications, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 7, Class=CDC Data, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 8, Class=Communications, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 9, Class=CDC Data, Driver=cdc_acm, 5000M
> > >     |__ Port 004: Dev 004, If 10, Class=Communications, Driver=cdc_mbim, 5000M
> > >     |__ Port 004: Dev 004, If 11, Class=CDC Data, Driver=cdc_mbim, 5000M
> > > Kernel: Linux 6.6.34-1-lts #1 SMP PREEMPT_DYNAMIC Sun, 16 Jun 2024
> > > 14:45:31 +0000 x86_64 GNU/Linux
> > >
> > > This lack of class creates too many /dev/ttyACMx ports, and
> > > ModemManager tries to access them all, perhaps also blocking the
> > > device, and the whole system doesn't work.
> > >
> > > For completeness, the device is:
> > >     Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
> > > which is supported without any customs in the cdc-acm and cdc_mbim drivers.
> > >
> > > I spotted only two options not compiled-in in the yocto .config
> > > (compared with the arch one), but I strongly doubt this is related:
> > >     CONFIG_USB_G_MULTI
> > >     CONFIG_USB_G_MULTI_CDC
> > >
> > > Would you know why the class is not assigned?
> >
> > This is just a userspace issue, right?
> 
> I think the class is assigned by the kernel/driver.
> 
> > Or are you saying that somehow
> > the same device plugged into two different systems works differently?
> 
> correct: the same device works differently in the two systems...  in
> the sense of the class not assigned.

It's not that it is not assigned, it's that something isn't figuring it
out properly.

Can you provide the output of 'lsusb -v -d 1e2d:0065' for both systems?

> The device boots in the same way, the difference is not in the device.

True, but this type of device has had a lot of quirks added to it for
the cdc_ether driver for other ones by this vendor, but not for this
specific device from what I can tell.  So perhaps we got it right in
newer kernels, but not older ones?

thanks,

greg k-h

