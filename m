Return-Path: <linux-usb+bounces-18933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49F9FF3A9
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 11:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7B363A2CA0
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 10:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56F947A73;
	Wed,  1 Jan 2025 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G23cNEI7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058BEBA33
	for <linux-usb@vger.kernel.org>; Wed,  1 Jan 2025 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735726779; cv=none; b=Sw1LMzI+Ud7iwqtNmkFiYBuNpKOYSxHuxLYhdyAmF26/SMe2IKkm2nXy3c5CXvtWk1KYaWAD7A/tXg52mw7EWDkxiX8vxa+11VzIp/VqAg9CxdT6bNyEgnRTxrn62+CGOERoC8oMFJ+103tDIKwlBgA2x2i291FvUSrxl3HUwy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735726779; c=relaxed/simple;
	bh=W9f98kYMOcylfFcPwc02PRbpoQQUodjm59OExSdKpL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMYTSxxciziHnywIBT+fTPL5shsG11vq5LCC/xcR3b+4uQrtAzD1vbebPO+msFPXvP8wIh/w7uDYIAM/gQ9d1weKPMy8VGbSTayAem120oS/fYBxCly/zbJUIFTCwgfNPgWpnDRZSHAyfJOkb2eB97bW3TB1p1jawuTnbjR1xgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G23cNEI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDC8C4CED1;
	Wed,  1 Jan 2025 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735726778;
	bh=W9f98kYMOcylfFcPwc02PRbpoQQUodjm59OExSdKpL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G23cNEI7x0kKFwG5iPnaCkXaFZQkBrQouzHtmnwJwFItLFVH+d4Y79szUmKHD66Pu
	 HCvktil6MZ/GwFyRQtM1biryHqzce2xH5iD2Y/stJkCiLIZREUJU+TXsNefYat0zLJ
	 mqTHlzFz2I0aaPDwccOobsJe8l7JfegXe/CD7LEw=
Date: Wed, 1 Jan 2025 11:18:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB and EOL LTS Kernel Advice
Message-ID: <2025010114-quicken-quickly-0411@gregkh>
References: <CAPphmgY-bj6KzdEgKMg3JXyaSHNn643Th8wBoJjApQUx1F1pUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPphmgY-bj6KzdEgKMg3JXyaSHNn643Th8wBoJjApQUx1F1pUQ@mail.gmail.com>

On Tue, Dec 31, 2024 at 09:59:45AM -0500, Jate Sujjavanich wrote:
> I have a device running the 4.19 LTS kernel which just went end of
> life. It has some USB signal integrity issues which result in "clear
> tt" loops until the bus can recover (if it can). This can result in
> system hangs including with lsusb.
> 
> Management would like for me to patch our Linux kernel to work around
> the problem thinking that a kernel fix is much less costly than
> deploying a hardware fix. There are some USB fixes in the upstream
> which might help. But I think I will be without community support.
> 
> What advice do you have?

Upgrade to a newer, and properly supported, kernel version.  4.19 is
already very old and obsolete and full of known security problems.  If
you stick to 4.19, you are on your own for all support and everything
else.

Good luck!

greg k-h

