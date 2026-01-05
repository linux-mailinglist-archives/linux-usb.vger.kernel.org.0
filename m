Return-Path: <linux-usb+bounces-31904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9001BCF28AC
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 09:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 921BD301E931
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B37D328256;
	Mon,  5 Jan 2026 08:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XppbX7Av"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9FD2BEFE4
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603150; cv=none; b=rg+zKNpGYcXYSkvTKjpYYELEOL+JnckRCaKGOBzb4KmpZ5coQJY0PG7x3szqJOpBOejDksQkO20vTvb7SRelHcSXlaTA4EO7bCgF/7wVsH4xpQQB3Fhzc5jpYEgxevc6ufa3z3s3vHzUQixRoBIPdlp+smGluS7AQF61GMH0C9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603150; c=relaxed/simple;
	bh=BO/fpJgeSJ55/uQE4IuVit6Q9wvc8ehz+NiX0vpAibA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONZqob2F4YcJKJlZOUwXlTMUO4KsqhFxVKgCx05O74qRiLoWbLizLGMyDGuK4vmIkfXIHw9xHuNWZQW+OhKiPxbb8O2YCbpReYnmN+JcwbFvjYJGle6QvBkZtwXfNjUcjccyRxYWPfefB37WsyjC9ryvZ05kDhCfNzHS0oWHdTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XppbX7Av; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D5AC116D0;
	Mon,  5 Jan 2026 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767603149;
	bh=BO/fpJgeSJ55/uQE4IuVit6Q9wvc8ehz+NiX0vpAibA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XppbX7Av+ktH9COwErnaPGam5mSz5pHX+DfAWIe6RV4Yg6HopWvPzSE8Ec1cR/1rj
	 dROIcQWt9wojG5BfuvdUBawInjkefAJQAsOBej/6BQc28Lb2c5lcUHVAcsuHi8Zbs6
	 kVBuNj+14i2bhl2Vnsi1ROKuXBymUVNly9g53wxg=
Date: Mon, 5 Jan 2026 09:52:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Marco Schuschnig <m.schuster91@googlemail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: usbip: Kernel oops when trying to bind devices from Windows
 client
Message-ID: <2026010550-chain-brisket-32e1@gregkh>
References: <CAEhB=Bt13wr1+cc1rfzwPxnEEuawMgTew=RJic2FsVb=Gccm+A@mail.gmail.com>
 <2026010533-swiftness-character-1cc3@gregkh>
 <CAEhB=Bs6zUWx=2igGEbf3mKDWbRu47St2yJ9zjsCX7v1o_qHXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEhB=Bs6zUWx=2igGEbf3mKDWbRu47St2yJ9zjsCX7v1o_qHXA@mail.gmail.com>

On Mon, Jan 05, 2026 at 09:38:58AM +0100, Marco Schuschnig wrote:
> Hi,
> 
> thanks for the answer. Sorry, I mistyped - it's 6.*12*.47, Raspberry
> Pi's latest official package which should be a Linux LTS version as
> well. Recompiling the kernel with a patch should be pretty
> straightforward, but I'll try if I can build, run and test with a
> current stable kernel for the Pi, not sure how far Raspberry Pi and
> then Debian diverge from upstream.

Ah, 6.12 is much more sane, that's good!  I'll let the usbip maintainers
respond now, they might be able to help out here.

thanks,

greg k-h

