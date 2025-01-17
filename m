Return-Path: <linux-usb+bounces-19489-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF9A15092
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 502FF188B983
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 13:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2234C1FF7BE;
	Fri, 17 Jan 2025 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCD/FxpJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA8C1FAC59;
	Fri, 17 Jan 2025 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737120748; cv=none; b=Fay+h92KOmRp+gLhVI70J7De4Xzogt8AjLilAPaX08OCkpBT8hqhBpC0aWLsBDVl3/Rq2Owspi7A4ZAZ55JpbQRVp/aB8UZAFDV9mT+hMkO0Ke34t/fglfkS02f0zlgbcBkuzXpbzYE3Iej7Cx+PfsZ5oCrBRdq+IxaFsVjT3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737120748; c=relaxed/simple;
	bh=5dE65PivVkJpnuf6QH3J5aotbJvV6DTN/TNoDicZG7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHDzcI6NQ8/AjLZTs0opjXr4KAKn9cfDi7fIyaFgnSOfBE4dcaMSjSck+gFV/XigwDIlja2fQp9ETKXmW/gZdkqlXm3nzECcAWBVomF7KAbcSqoensxxEGmYj8wt3BGrtjZhOY3EJVeWQjqbDbCWK8CT1YXbdmXrq+WKdxWO7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCD/FxpJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737120747; x=1768656747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5dE65PivVkJpnuf6QH3J5aotbJvV6DTN/TNoDicZG7s=;
  b=kCD/FxpJvWd5Thcp3K4/tew9slaSuONiGZdNBtW4QkDTNRg9jQGJo7HD
   1xpcfGu4P/NV7+V+L/GTdVjvCB/QUWPV6IKXz/dNGXLz0b1mTPX+nu3Lf
   2kFFbUfG3QnXtEkZnRTvfe5f1YP1N3U4IAywfDwSiP/bd9i4Mm2Nagy4g
   o4vUVcY/Hld2/nPg/vZjKqPkwG4z9GXQAPCGTga6tFgQJzd6Lgb8tdRJo
   iEwOvSJ1oOmFBXp4tmeBNBfKFY74NvBTq2fAqMlI7obYrKJovS7ceU2nh
   ixnrRAZDrvic9VG3t0hHokkl6hT2a5ytjQ/EP5UUHAjIba5H1qX6J1BNC
   A==;
X-CSE-ConnectionGUID: /Td14s/AQ46LvYBmP/we1A==
X-CSE-MsgGUID: uerWyPcHSE2a4CMA3tBqRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48214807"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48214807"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:32:26 -0800
X-CSE-ConnectionGUID: QCuAczD5Sc6BbvS4vz7lYQ==
X-CSE-MsgGUID: WuyCBBu8Tm2/xgvCNPmnWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105660113"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:32:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYmST-000000024cA-1bF3;
	Fri, 17 Jan 2025 15:32:21 +0200
Date: Fri, 17 Jan 2025 15:32:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Message-ID: <Z4pb5CTS5n5wtJ7d@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
 <20250116233507.sifqs5u3rixoz4lw@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116233507.sifqs5u3rixoz4lw@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 16, 2025 at 11:35:19PM +0000, Thinh Nguyen wrote:
> On Thu, Jan 16, 2025, Andy Shevchenko wrote:

...

> >  	for (epnum = 0; epnum < total; epnum++) {
> > -		int			ret;
> > +		for (num = 0; num < count; num++) {
> > +			if (epnum == eps[num])
> > +				break;
> > +		}
> > +		if (num < count)
> > +			continue;
> 
> You can probably rewrite this logic better.

Any suggestions?

Thanks for the review!

-- 
With Best Regards,
Andy Shevchenko



