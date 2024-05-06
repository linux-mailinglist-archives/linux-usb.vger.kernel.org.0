Return-Path: <linux-usb+bounces-10052-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C28BD052
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 16:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B7A1F21D6C
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 14:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F3E13D51B;
	Mon,  6 May 2024 14:29:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id CF8DD13D88D
	for <linux-usb@vger.kernel.org>; Mon,  6 May 2024 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005794; cv=none; b=fgbZvB8SE1FtG3R756qdAdAG0zlU1ooKxpgNClrLYo9711YKXhsjWMk83cXxq/nC2xhLD+QzWHT8J5ERR+DtYXXs8BXOozA/Q/paXLP6Cdcur6pL8+iyBmebHSd57AP0eYFkI6znngYh61IUdWaNoYCcTj4bb7FlZspP+/xZ/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005794; c=relaxed/simple;
	bh=wmbpmySQC9kNyYc4x+Sp1f80TaiYqugJLEeKNEbZKAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bATq5LIHY/+Hl9cRMmXXaJmfthCfaAin1bSFup7EB67tgdRRztfZgA0KMx/9Yr/SX1sErMBWrGE7RW8gSZy75Xi626SdNC3ddsaO8gqpHLsfPTyxh02ZlwC5uo9M2J4F1R1kXH0SvGULluCLJ64VyPZJjF+SCWgxXXAHLOsn4yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 877289 invoked by uid 1000); 6 May 2024 10:29:44 -0400
Date: Mon, 6 May 2024 10:29:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
Message-ID: <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>

On Mon, May 06, 2024 at 04:44:30PM +0530, Muni Sekhar wrote:
> Dear Linux USB Subsystem Community,
> 
> I hope this email finds you well. We are currently working on a USB
> device driver in the Linux kernel space, which supports the
> suspend/resume functionality for a USB device using the struct
> usb_driver's .suspend and .resume callbacks.
> 
> 
> In our driver code, we perform a check to determine if the device has
> remote wakeup capability. If the device supports remote wakeup, we
> enable the device's autosuspend mode by setting the struct
> usb_device->dev.power.autosuspend_delay parameter and then calling
> usb_enable_autosuspend().
> 
> 
> Similarly, to resume the suspended device, we expose an API to user
> space via IOCTL. In this process, we set struct
> usb_device->dev.power.autosuspend_delay to -1 and then call
> usb_disable_autosuspend().
> 
> 
> While we have successfully converted most of the USB device driver
> functionality from kernel space to user space using libusb, we are now
> seeking guidance on how to implement USB device suspend/resume in user
> space. Specifically, we would like to know if libusb provides support
> for achieving the suspend/resume functionality mentioned above.
> Additionally, any insights or suggestions on how to accomplish this
> task would be greatly appreciated.

Your question is about libusb, right?  So you'll get better answers if 
you post it on the libusb mailing list rather than the linux-usb mailing 
list.

Alan Stern

> It's worth mentioning that our USB device driver also supports
> Bulk\Coontrol I/O transfers and other functionalities.
> 
> 
> Thank you in advance for any assistance you can provide. I look
> forward to your valuable inputs and recommendations.
> 
> 
> -- 
> Thanks,
> Sekhar
> 

