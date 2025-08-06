Return-Path: <linux-usb+bounces-26522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC969B1C1E0
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 10:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E71E47A65E4
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 08:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C07221265;
	Wed,  6 Aug 2025 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2QrsJMr5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F9E220F3E
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467898; cv=none; b=DbrPSa5vothpK4Sfyg/rLhWzib3GpiEMHIcv+h3D4Qi+f/fjQ2FMNQnZGlhjgy1sm7fSa4LgvRfJpeoDSu3h7tLIi44yvKaMtcuOmto1euFsrkvzQuqQFlgm2mkuupIyFFCy0/gGGrDSmxt2K8NRohgvdADaXWwe5YLhgY8LbnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467898; c=relaxed/simple;
	bh=RFXtDHvnXWHB+UETe09VoHNGOPD57YqAq0i9EIWMYbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ze2PK7BbQDoesAAc8zm+4IUzhv9Lu1Bhchc5MVV6lTmpyyFYqJAhpR4oZcyZ3vNR99LaYPoR79ZsQZz/TmysM9xbUMV5wDqNy53Iukve2UdxOeFHyh9rG2PFwwCpG5XoALEim4bORpPVR9wN7nkrCSqshhbvNLSbya0S+zGMM+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2QrsJMr5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21151C4CEF6;
	Wed,  6 Aug 2025 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754467895;
	bh=RFXtDHvnXWHB+UETe09VoHNGOPD57YqAq0i9EIWMYbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2QrsJMr5vqAkF9K8uLPFv9lwHY2p3O+FJgGIYrcBMeLA+EyZg/eEzra1u1YIVeau4
	 Xf/PAPxb4P+3ip3HctVLOFOkj01ZHJkKgTagCwXDqcGuwJdIXbfN9xY+Gaj8KNdvvB
	 j1ELp6Zb7FPZOusCKUirpY0UiBMM7r4fV6uAZAl4=
Date: Wed, 6 Aug 2025 09:11:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ulrich Stoehlker <ustoehlker@yahoo.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: pl2303 converter - unknown device type
Message-ID: <2025080629-stapling-equinox-9cc4@gregkh>
References: <585146173.2802367.1754377623142.ref@mail.yahoo.com>
 <585146173.2802367.1754377623142@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <585146173.2802367.1754377623142@mail.yahoo.com>

On Tue, Aug 05, 2025 at 07:07:03AM +0000, Ulrich Stoehlker wrote:
> Dear all,
> 
> I have a Multi-Channel-Analyzer (MCA) interfaced via usb.
> This device cannot be used on more recent kernels.
> I get the following error message:
> 
> [663822.490455] usb 1-3: new high-speed USB device number 17 using xhci_hcd
> [663822.616495] usb 1-3: New USB device found, idVendor=0557, idProduct=2008, bcdDevice= 0.01
> [663822.616501] usb 1-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [663822.682309] usbcore: registered new interface driver usbserial_generic
> [663822.682326] usbserial: USB Serial support registered for generic
> [663822.686383] usbcore: registered new interface driver pl2303
> [663822.686402] usbserial: USB Serial support registered for pl2303
> [663822.686423] pl2303 1-3:1.0: pl2303 converter detected
> [663822.686431] pl2303 1-3:1.0: unknown device type, please report to linux-usb@vger.kernel.org
> 
> Linux host1 6.8.0-64-generic #67~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue Jun 24 15:19:46 UTC 2 x86_64 x86_64 x86_64 GNU/Linux

6.8.0 is over a year old.  Can you try a more modern kernel release?

> But it works with older kernels:
> Linux host2 5.10.103-v7+ #1529 SMP Tue Mar 8 12:21:37 GMT 2022 armv7l GNU/Linux
> 
> Would it be possible to correct this problem!?

Can you provide the output of 'lsusb -v' with this device plugged in?
But again, please try a newer kernel version, 6.8.0 is very very old and
obsolete and not supported at all by the kernel community.

thanks,

greg k-h

