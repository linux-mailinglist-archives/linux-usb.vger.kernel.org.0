Return-Path: <linux-usb+bounces-28669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B3B9E05D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 10:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B2997AD5C5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C572701CB;
	Thu, 25 Sep 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eL2Z6n46"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36C26E716
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 08:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758788414; cv=none; b=Ub0GlxiUki3VaGCHNHOCby+VZp83GfBU8SEovr2pH5mgRelgm2uHH6EyJWQFffNpA+ojawr8+oPeaL8fQQNCIraLyQNhoFjPqYuxU/X8trHKur/GVm5ACgAT2zQm+EmnHp6cXbDK+GT/r5VDZh5J/rwqyyl9kvi32BNbRM5byIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758788414; c=relaxed/simple;
	bh=I8sgrx770GD244UNpUIpeFSLapFntgEnCkmwucarPns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWAwlyA+cjM+pyoMBT94Vp8uhrTOTMeaXgzuPU2aGDpSyqASL2EUjasR3tnjxosMoetc4ASFS9wKftr2f9sg9LGiL3fo3atQJ++x/25/+gdaMH267vBPBFFgqXjzV6jUJoSYd4rXxDPK3YXC/OiK7NhX1ZEG/E2Eg4wP4BIELK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eL2Z6n46; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E1BC4CEF0;
	Thu, 25 Sep 2025 08:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758788413;
	bh=I8sgrx770GD244UNpUIpeFSLapFntgEnCkmwucarPns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eL2Z6n46xd6axx+OTlS5fkH+yPOyoA+AQDfFdGtCRm8nUjpH3JBPnIXIHBpRlQ5GS
	 gpfCA91zcmr0DP+iYxF2F435Bb0fiJcu5aFovI2ctRYvjeEv+EUfTs4iexCggvbhoU
	 7rNUmDd8Iwmxk5zBBpotmlFhL9+ODFd7NkEgdAkw=
Date: Thu, 25 Sep 2025 10:20:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Ko, Kang Jun" <kang-jun.ko@hpe.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB: urb error log during reboot on devices with multiple serial
 consoles (Linux Kernel version 5.15.71)
Message-ID: <2025092503-chitchat-detection-283c@gregkh>
References: <MW5PR84MB20830480C70129C188178130BD16A@MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM>
 <2025091842-parkway-implode-0c85@gregkh>
 <MW5PR84MB2083421899199020C49FB35ABD1FA@MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR84MB2083421899199020C49FB35ABD1FA@MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM>

On Thu, Sep 25, 2025 at 01:29:57AM +0000, Ko, Kang Jun wrote:
> Hello,
> 
> Thank you for the kind response. I've tried updating the kernel version to 6.12.3
> and the same error message still exists during shutdown.
> 
> I understand this is not a bug or a functional issue and the kernel is correctly noting that the hardware is no longer reachable.
>  
> However, I would like to know if canceling the USB messages when the
> hardware has gone away so that the error message doesn't happen is
> something that is considered for future kernel versions.

The "problem" here is that the console does not seem to close the
backing tty device properly.  And that is required so that the usb
driver will shut down the submission of the urbs, which will prevent the
message you see from showing up.

The fact that a console works over a usb-serial device at all is a
wonderful hack.  It was me loosing a bet many years ago that even caused
that code to be written in the first place.  So if this even works is
amazing, a little bit of error messages when the device is yanked from
the system is a small price to pay for this feature :)

thanks,

greg k-h

