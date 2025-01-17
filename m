Return-Path: <linux-usb+bounces-19493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C3A151C7
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 15:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 470AD16609A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0641E52D;
	Fri, 17 Jan 2025 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i/9pbSp3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3C78F34;
	Fri, 17 Jan 2025 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123977; cv=none; b=nxDvUAcWiAZUqa9xkQqE+yhptt0yFjNsB47n+LpfVVx/ZYQ1K0q3+XFIFb9Prenpr9oaczdBG+ECMJYd/EBHQiVr+qcIWfRss7HvUtcRbroIHeE623ZPr43I5W7bSKbTS36C2h3aRhqbEwOO1HeYvYgQNiMAtBUC+xv9DlI0TEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123977; c=relaxed/simple;
	bh=HeKOiZb96GQ/7eVrnSEtf8RoWdtiXr4Tmr1vkEEN2oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rorbi1skXxnB35jnl0ru8OtSUDk0UCNe5+gBmseHzXAzJaXVm66txg5JMmNS1kEJ9Au/MD1UGVF2/6mIw/guwFLwPEhdGl6snoqiWVFJnGOjSVy4IIeAiOnlSj1gunF0ZUThmZbCNdkhm7Hp86FSy4fipxzfeba5HQcP577LIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i/9pbSp3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47323C4CEDD;
	Fri, 17 Jan 2025 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737123976;
	bh=HeKOiZb96GQ/7eVrnSEtf8RoWdtiXr4Tmr1vkEEN2oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/9pbSp3wzv1RdUSR7hn9Gcbh4jEzCQ0ZRie0xiTJVJFuyl1BIXYNYZEjQwg9E/Xk
	 ZO8kWnZUvsVqI7TQRXPvva7Yos32IPX9lozEi3kfYAogbNiohlau2j8jL96MI6Wpd1
	 gTMfulA/wcsEcIR9UAGBsbHos7oJw/NI8Zc2WUmg=
Date: Fri, 17 Jan 2025 15:26:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: hcd: Bump local buffer size in rh_string()
Message-ID: <2025011718-absolute-cheesy-79b1@gregkh>
References: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>
 <2025011714-catalyst-aide-418b@gregkh>
 <Z4peQ4AhE7JzuSFX@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4peQ4AhE7JzuSFX@smile.fi.intel.com>

On Fri, Jan 17, 2025 at 03:42:27PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 07:11:46AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Jan 16, 2025 at 06:05:43PM +0200, Andy Shevchenko wrote:
> > > GCC is not happy about the buffer size:
> > > 
> > > drivers/usb/core/hcd.c:441:48: error: ‘%s’ directive output may be truncated writing up to 64 bytes into a region of size between 35 and 99 [-Werror=format-truncation=]
> > >   441 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
> > >       |                                                ^~
> > >   442 |                         init_utsname()->release, hcd->driver->description);
> > >       |                         ~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Bump the size to get it enough for the possible strings.
> 
> ...
> 
> > >  static unsigned
> > >  rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
> > >  {
> > > -	char buf[100];
> > > +	char buf[160];
> > >  	char const *s;
> > >  	static char const langids[4] = {4, USB_DT_STRING, 0x09, 0x04};
> > 
> > Worst case it's properly truncated so why do we need to worry about this
> > "warning"?
> 
> With CONFIG_WERROR=y it's a compilation error. My goal is to have
> i386_defconfig and x86_64_defconfig to be compiled with `make W=1`.

So you have to have W=1 enabled, right?  On my normal builds, with
CONFIG_WERROR=y enabled, I do not see this.

> > And what compiler version is giving that, I don't see that
> > here in my build testing.
> 
> `make W=1` (and be sure that CONFIG_WERROR=y).

Ah, ok, manual work here.

And I guess the error is right, ->sysname could be 64 and release can
also be 64 bytes long, so it would be truncated.

thanks,

greg k-h

