Return-Path: <linux-usb+bounces-28267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80991B83B0F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 628B64E0EC9
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448AF2FBE03;
	Thu, 18 Sep 2025 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xc1YEQie"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A5E2F9D9E
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758186563; cv=none; b=Ic+gsMdexMnkBv38Fl6OLN9RTulq4QJz+4dTzKYQLehsMXkSSQxFWaOPi9gBsrD5JhJe7P+7fUd7cpt7nZL0fvDA1YLx/hvmp8qGSVfji4/q1bNikl6UuMkt1tDFx4TyBUTTF7noNnp/ho4b8lZeE/MK0Fv2cF/r7B1qckARJfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758186563; c=relaxed/simple;
	bh=5K9c/5ZczGEOuQLInPMZ1Aq/LV8kFkUlEMDqDbcOIwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jL5yTzdFnpurGNQ2WtSev22FNCqatTKsYDejMrisF8p0V5dsoR8q/cqhMhPOlRgrtiWIrqCOjYFNRFQBnU6YYotGPIYhsaLutTMA7WpupXavhphRdHlilDaXbpF1ut5cT9SHpyqReGnxRg5iLVfGKQOnWkBQDy0wfpitKXoU1S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xc1YEQie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A53C4CEE7;
	Thu, 18 Sep 2025 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758186563;
	bh=5K9c/5ZczGEOuQLInPMZ1Aq/LV8kFkUlEMDqDbcOIwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xc1YEQieFIT7KLyxlzsvORSS69z6woVkOlBEpjj5LjHvFwQCzY26GyYI2t2opQyW/
	 ugie4K4g4rWu/YA3dTxJC5xIet6sARgxDA1COV0ClvDE480U+yOScuoXTucO99FRd5
	 BiuDgbg+GwzVZrD3uKWsSozQx3Hw4JxtYYR1ggtI=
Date: Thu, 18 Sep 2025 11:09:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Ko, Kang Jun" <kang-jun.ko@hpe.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB: urb error log during reboot on devices with multiple serial
 consoles (Linux Kernel version 5.15.71)
Message-ID: <2025091842-parkway-implode-0c85@gregkh>
References: <MW5PR84MB20830480C70129C188178130BD16A@MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR84MB20830480C70129C188178130BD16A@MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM>

On Thu, Sep 18, 2025 at 08:39:11AM +0000, Ko, Kang Jun wrote:
> Hello,
> 
> I am reporting an USB related issue on the Linux Kernel version 5.15.71

Please note that that kernel is _VERY_ old and out of date and not
supported by anyone as it was released over 3 years ago.  There have
been over 19000 changes made to the 5.15.y branch since then.

Please try updating and see if the issue persists with the latest 5.15.y
release.

But, as you write:

> Below is an error message that is seen in my dmesg log when my network switch goes into reboot. 
> 
> /****** Reboot log ******/
> ...
> Reboot reason: Reboot requested by user
> reboot: Restarting system
> ftdi_sio ttyUSB0: usb_serial_generic_write_start - error submitting urb: -19
> ...
> /****** Reboot log ******/
> 
> Summary:
> Our network switch has two serial consoles attached to the system (one connected to the processor, one connected to FTDI chip).
> When the switch goes into reboot, I can see (from the console connected to the processor) the above error message.
> There is no functional problem in rebooting the switch but I would like to know if the error message is something intended by the Linux Kernel.
> 
> Reproduction steps:
> Attach two serial consoles to the system and reboot.
> 
> Additional notes:
> The serial drivers do not have a designated "shutdown" method so the driver is still present when the kernel goes through the device_shutdown method within the kernel_restart_prepare() function. The ftdi_sio serial driver continues to submit URB messages to the console when the console is already removed from the system, which results in the error message.
> 
> Conclusion:
> Although this is not a functional issue and is not observed on systems with one serial console attached, this error message can be seen 100% on reboot on devices with multiple consoles. I would like to know if this error log is intended by design or if it is something that was not considered because there is no functional issue.

This really isn't a bug, and you should be able to just ignore it, the
kernel is correctly noting that it could not submit the USB message
because the hardware has gone away and you did not close the console
before that happened.

But again, PLEASE update your kernel, it is very old and full of known
security issues that have been resolved already.

thanks,

greg k-h

