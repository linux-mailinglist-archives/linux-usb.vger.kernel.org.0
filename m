Return-Path: <linux-usb+bounces-19496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17565A15213
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 15:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B7E169798
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E02517FAC2;
	Fri, 17 Jan 2025 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zd5cZfLA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074DB146013;
	Fri, 17 Jan 2025 14:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125198; cv=none; b=dUvxdsx/8ititYP7SyfBeJe+H3WUPbIpH4tNih7GcG/grBrtFXyKAMBFzTml2GIlth2+QuJWFFZVamaUoFYeyOg8q0i73TYRobQJKOmHrUgFoCpkV4iKKfGkrMsERkiUEmPbGh4Q7+uFQU26HPWDme1vFtyoVg2UOXYTmc9RW90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125198; c=relaxed/simple;
	bh=1Y66zP1J/z0u6+uDLH5GE6n5cVBqrQHH3mWORHAYgLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4bqV5MKwEs9o2xoqAoZXALytoRniHNi/AIc4hT0O8G/OKkoBZyiI0kBYL4XDja3Cs3q68GTSguFe9xmfC9/N8j4sqPWv2c9TIV6X1g9SKU5/xElVKz6n+lgNDYusslNy/wmR1xSBEgsuCcMahgNac19r6U40PgJd9QUAapQBl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zd5cZfLA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2F4C4CEDD;
	Fri, 17 Jan 2025 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737125197;
	bh=1Y66zP1J/z0u6+uDLH5GE6n5cVBqrQHH3mWORHAYgLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zd5cZfLA2981nkuetYYVD16vRCdeAiHaUC5lLccvwJyGK59ExwE7Jx4jJHNUy0xho
	 hlNn/l8EbAUkFqJNEB1Uo6u54vUClPDWVp+7Wkz6Tyx1s5xs+Jj+m/WPXjDe3MQJrd
	 9q3FQEATp/6WQrVMFoaKLZYXsUvUMp/T1SfcaD7M=
Date: Fri, 17 Jan 2025 15:46:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: hcd: Bump local buffer size in rh_string()
Message-ID: <2025011725-feminine-clover-faf7@gregkh>
References: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>
 <2025011714-catalyst-aide-418b@gregkh>
 <Z4peQ4AhE7JzuSFX@smile.fi.intel.com>
 <2025011718-absolute-cheesy-79b1@gregkh>
 <Z4pqH9Pb2LYkID6i@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4pqH9Pb2LYkID6i@smile.fi.intel.com>

On Fri, Jan 17, 2025 at 04:33:03PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 03:26:13PM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Jan 17, 2025 at 03:42:27PM +0200, Andy Shevchenko wrote:
> > > On Fri, Jan 17, 2025 at 07:11:46AM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Jan 16, 2025 at 06:05:43PM +0200, Andy Shevchenko wrote:
> > > > > GCC is not happy about the buffer size:
> > > > > 
> > > > > drivers/usb/core/hcd.c:441:48: error: ‘%s’ directive output may be truncated writing up to 64 bytes into a region of size between 35 and 99 [-Werror=format-truncation=]
> > > > >   441 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
> > > > >       |                                                ^~
> > > > >   442 |                         init_utsname()->release, hcd->driver->description);
> > > > >       |                         ~~~~~~~~~~~~~~~~~~~~~~~
> > > > > 
> > > > > Bump the size to get it enough for the possible strings.
> 
> ...
> 
> > > > >  static unsigned
> > > > >  rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
> > > > >  {
> > > > > -	char buf[100];
> > > > > +	char buf[160];
> > > > >  	char const *s;
> > > > >  	static char const langids[4] = {4, USB_DT_STRING, 0x09, 0x04};
> > > > 
> > > > Worst case it's properly truncated so why do we need to worry about this
> > > > "warning"?
> > > 
> > > With CONFIG_WERROR=y it's a compilation error. My goal is to have
> > > i386_defconfig and x86_64_defconfig to be compiled with `make W=1`.
> > 
> > So you have to have W=1 enabled, right?
> 
> Yep!
> 
> > On my normal builds, with CONFIG_WERROR=y enabled, I do not see this.
> > 
> > > > And what compiler version is giving that, I don't see that
> > > > here in my build testing.
> > > 
> > > `make W=1` (and be sure that CONFIG_WERROR=y).
> > 
> > Ah, ok, manual work here.
> > 
> > And I guess the error is right, ->sysname could be 64 and release can
> > also be 64 bytes long, so it would be truncated.
> 
> Yeah... Should I update the commit message and issue v2?

No need, I've already take this as-is.

