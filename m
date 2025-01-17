Return-Path: <linux-usb+bounces-19495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C898CA151E2
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 15:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A648188CD5A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB5B155CBD;
	Fri, 17 Jan 2025 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKBhhlPf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD56D13B5A0;
	Fri, 17 Jan 2025 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737124390; cv=none; b=I2A5Z9y5TSHKGqERXyjR/pC3NZqOFJQZu6pPDz675wFTdeWn8tAMJl1H66lvd0CVn8D6ASyX6TSRYuffd+V/64ZHSZsmbtD0F63Oz+J0hXHMOgplNo1sBUgTBvID1gVfuxeiPb1QYML0ScpawGlz0mWKZbEbkDOELBq6OW3G7NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737124390; c=relaxed/simple;
	bh=EmjRfpIR557nVoIl9qf0+jW6Bn+YMQwUWz1zmTY5wG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFb1/EviV4IkPqU989oWMtcyWRSE6kEXVMGXY8/ecNaGy8IDd2vH5qwddvxqrcHQpkFhiVqyqcTO0XizZgNsj14iYUWpOR3IWP3eV99RMVbuwGk7mVCdZIvyMg08KGOdNM72kCKZHq9QoxxGsa+qfdjeaY3j7PbXUTFmcM8HePg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKBhhlPf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737124388; x=1768660388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EmjRfpIR557nVoIl9qf0+jW6Bn+YMQwUWz1zmTY5wG4=;
  b=AKBhhlPfMnIc3qRjhjjRPO59sCA9VnVv9iAXnivj3DrdeHtjQ6Fyi2xb
   phVcf1kc8M3Gf0e18DUzehzRj/i207fuWnRkz5H2UV/Vs5RzEcOCRTmis
   UZDFU/29T50GkEClJKDXkFSEyTuY5s8Y02n5W+J4UQ/jcaP+XziQoBlBQ
   RXzFfAyoWAoF7moybWL47DSdYey6MDDLttVUmFhNYk9DsNxA2f2p6M8vo
   k7sj7AZ5SvQlL5Z9z68Yp4FdfoQBd4w5FPj58j6W1fQV53Njs5c45HMcr
   2gwNf1Ff7/x0gqQkmpDFpUy5seNgnz0PqvxNB6jCEiBq9z6E0JMC5zRzm
   A==;
X-CSE-ConnectionGUID: 1TG4YEWmQhOd4VIFIJ12Cw==
X-CSE-MsgGUID: dReZB4UIRvWRfirq3z+m3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="62930996"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="62930996"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:33:06 -0800
X-CSE-ConnectionGUID: QtlGGdiwST6kRASTHSpxYQ==
X-CSE-MsgGUID: NXKlJglZSBySNTIx2bnGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110453087"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:33:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYnPD-000000025jl-1a4w;
	Fri, 17 Jan 2025 16:33:03 +0200
Date: Fri, 17 Jan 2025 16:33:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: hcd: Bump local buffer size in rh_string()
Message-ID: <Z4pqH9Pb2LYkID6i@smile.fi.intel.com>
References: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>
 <2025011714-catalyst-aide-418b@gregkh>
 <Z4peQ4AhE7JzuSFX@smile.fi.intel.com>
 <2025011718-absolute-cheesy-79b1@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025011718-absolute-cheesy-79b1@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 17, 2025 at 03:26:13PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 17, 2025 at 03:42:27PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 17, 2025 at 07:11:46AM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Jan 16, 2025 at 06:05:43PM +0200, Andy Shevchenko wrote:
> > > > GCC is not happy about the buffer size:
> > > > 
> > > > drivers/usb/core/hcd.c:441:48: error: ‘%s’ directive output may be truncated writing up to 64 bytes into a region of size between 35 and 99 [-Werror=format-truncation=]
> > > >   441 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
> > > >       |                                                ^~
> > > >   442 |                         init_utsname()->release, hcd->driver->description);
> > > >       |                         ~~~~~~~~~~~~~~~~~~~~~~~
> > > > 
> > > > Bump the size to get it enough for the possible strings.

...

> > > >  static unsigned
> > > >  rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
> > > >  {
> > > > -	char buf[100];
> > > > +	char buf[160];
> > > >  	char const *s;
> > > >  	static char const langids[4] = {4, USB_DT_STRING, 0x09, 0x04};
> > > 
> > > Worst case it's properly truncated so why do we need to worry about this
> > > "warning"?
> > 
> > With CONFIG_WERROR=y it's a compilation error. My goal is to have
> > i386_defconfig and x86_64_defconfig to be compiled with `make W=1`.
> 
> So you have to have W=1 enabled, right?

Yep!

> On my normal builds, with CONFIG_WERROR=y enabled, I do not see this.
> 
> > > And what compiler version is giving that, I don't see that
> > > here in my build testing.
> > 
> > `make W=1` (and be sure that CONFIG_WERROR=y).
> 
> Ah, ok, manual work here.
> 
> And I guess the error is right, ->sysname could be 64 and release can
> also be 64 bytes long, so it would be truncated.

Yeah... Should I update the commit message and issue v2?

-- 
With Best Regards,
Andy Shevchenko



