Return-Path: <linux-usb+bounces-19492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD87A150B2
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3A013A83F4
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 13:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E741FFC66;
	Fri, 17 Jan 2025 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYbSLqip"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7733B1EB39;
	Fri, 17 Jan 2025 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737121353; cv=none; b=ZI+UyaAprSHn0C+gEStv9ocH0nO1QNZkf/uDHp1zqJ7MG+/nXhZtv3LwVijQhm73kjg+8K4wf5Eu6EHriOEcww6gEj9Rx48N3uQilbGZjU6HsFnAQjks41KnzwqPGgFZdba4nXZMc5FBfC4ksw/iuPjcvgd7SZ4K5AMdDM2hG3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737121353; c=relaxed/simple;
	bh=NX0ryEuDSLFFqnKCSJqVRsCOz3AnmutlohnO3R/x+pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVDPi+qsREJL9NzUEGKYsvvFz6Xhr994THv0FIQ+nfQEEaVqwzQKMLnm1dr/90+l+JO6NZdtuxzMowppKRcjk0+N7lLkhE4lqOHZ9L8/ge/FbfPRTfwxQYrbbvS/rEb+a7tEwK9vN9BSLDsfx5lruukf45dSryhvi3zbOWn/mvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYbSLqip; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737121351; x=1768657351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NX0ryEuDSLFFqnKCSJqVRsCOz3AnmutlohnO3R/x+pY=;
  b=GYbSLqip1tTlt9exCIHRF1mnZypw6Qbqzy0LkCd5BVwYArBvjJRy8YqP
   EdV0DcQhoRhQxp6KuAYLE6maoWAYbxc3ZgdQfBSyMOFk3nVE087+BQGSJ
   hb5zBe467YdjTH0RIK02dtT7OvJzpy/txqOv/fmwNnNiWUXYJKAUa7Zl5
   rPVkLL4T6+dknzoxL30keoyhCGmw/+C0iXyw6gwESmx8SKFeV68cM/YCW
   lViOtV7xuiNg1yLGu2OGTmLE8HbCHmkGLalNtAHO0099FA+1m9t/yBiTj
   NAhTNc1DRiiXiLy42fPDp38BGR/9InHJjkAGcp2rZ1kx9ifNAIaRAgRle
   g==;
X-CSE-ConnectionGUID: DRvfxQAFTOqVrRYtCkikcA==
X-CSE-MsgGUID: C7CPPujFQsSE9w37fpZS2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36759936"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="36759936"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:42:31 -0800
X-CSE-ConnectionGUID: kYSPW4AGRuipnkhOc9oJ9g==
X-CSE-MsgGUID: 9HnwjYD+SCqp0OU5VjnK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106694849"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:42:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYmcF-000000024mq-2g0V;
	Fri, 17 Jan 2025 15:42:27 +0200
Date: Fri, 17 Jan 2025 15:42:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: hcd: Bump local buffer size in rh_string()
Message-ID: <Z4peQ4AhE7JzuSFX@smile.fi.intel.com>
References: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>
 <2025011714-catalyst-aide-418b@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025011714-catalyst-aide-418b@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 17, 2025 at 07:11:46AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Jan 16, 2025 at 06:05:43PM +0200, Andy Shevchenko wrote:
> > GCC is not happy about the buffer size:
> > 
> > drivers/usb/core/hcd.c:441:48: error: ‘%s’ directive output may be truncated writing up to 64 bytes into a region of size between 35 and 99 [-Werror=format-truncation=]
> >   441 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
> >       |                                                ^~
> >   442 |                         init_utsname()->release, hcd->driver->description);
> >       |                         ~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Bump the size to get it enough for the possible strings.

...

> >  static unsigned
> >  rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
> >  {
> > -	char buf[100];
> > +	char buf[160];
> >  	char const *s;
> >  	static char const langids[4] = {4, USB_DT_STRING, 0x09, 0x04};
> 
> Worst case it's properly truncated so why do we need to worry about this
> "warning"?

With CONFIG_WERROR=y it's a compilation error. My goal is to have
i386_defconfig and x86_64_defconfig to be compiled with `make W=1`.

> And what compiler version is giving that, I don't see that
> here in my build testing.

`make W=1` (and be sure that CONFIG_WERROR=y).

$ gcc --version
gcc (Debian 14.2.0-12) 14.2.0

(IIRC that had been started with any GCC from v13?)

-- 
With Best Regards,
Andy Shevchenko



