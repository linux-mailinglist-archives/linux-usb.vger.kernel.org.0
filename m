Return-Path: <linux-usb+bounces-19491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5257EA150A6
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 938263A875A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 13:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79F31FFC66;
	Fri, 17 Jan 2025 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjwxEpsx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D731FFC4D;
	Fri, 17 Jan 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737121133; cv=none; b=RTKQYekRan5VpPe/RjeYl7d/EMcNhqRSTpR57CLXONz3B+KiYU4671czp3+L2cmg9kMHYb+ROnHA4rXqikIdh2XUXLieU3ayoduwCQh7GPT1Z9ZwjBXVMka80b6CUSQnIplRlTxB9M+kI9Gflzw5lPvj3Vf0a/RzcHc3PSsFJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737121133; c=relaxed/simple;
	bh=jZu+rOMqAniF32F5eyCALjZstDTS2Qrec5VkPQcMxyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+iR0u2d6CP4qVLWSiB8dBs8m2Q4GIKnNVsDKSwXgrsPBO9aDz/UErhVNfgGJGawBN13K8/CTXBkRqlXHzkRu+R+E5bey8GtixXxqHMKcCIV/EeI3lvsk1xg225FZdMsXKZdwSBtvfS+9XStE+TkUwvRZSoSGcSKnVYTrHmDpts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjwxEpsx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737121132; x=1768657132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jZu+rOMqAniF32F5eyCALjZstDTS2Qrec5VkPQcMxyA=;
  b=DjwxEpsxlWQcmd6Hdk/QVA8Z9HKDrRlDHmYHV2rjul7Xgj0AE7mVQAJO
   fWDvhA4X1pzU5a0QQi5hVHnWFcT2QeyyDdCo9unfKyVzry+F8GpQ8Hs5K
   QuhP0Ve2aM0iuhDkAKILDm3m4ugKOQznfiiyXXYkYg5BVC1W1fAFIOsoB
   XBxnJdpWOnOJthasYd3mi//2DpapXW62OyIJUA+C7TKkm4bptViRVQcVJ
   mFbd7bK4jk7NCLEenCWBLYM4Eo+Ixfguf7FRekOrAYVpWUlNKxY9VKlTF
   05TVI/6b9d1OVN1+uLHv1QXRjZVa+e0VRcNZyWao7QCcnp7MZlxz85cXA
   g==;
X-CSE-ConnectionGUID: cbr2gDbBRleWKKv5cR9rVQ==
X-CSE-MsgGUID: rqPjIk7VQbSou48A6iMfbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48215544"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48215544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:38:51 -0800
X-CSE-ConnectionGUID: SHbABSWySIW64toJG76Arw==
X-CSE-MsgGUID: gEHVnZBNRQSN5JVFNAFYbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="106364205"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:38:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYmYg-000000024jJ-0wPm;
	Fri, 17 Jan 2025 15:38:46 +0200
Date: Fri, 17 Jan 2025 15:38:45 +0200
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
Subject: Re: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
Message-ID: <Z4pdZZhR6m1LB3yk@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116231835.isbwmq5yz5issy3w@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116231835.isbwmq5yz5issy3w@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 16, 2025 at 11:18:45PM +0000, Thinh Nguyen wrote:
> On Thu, Jan 16, 2025, Andy Shevchenko wrote:
> > On some platforms (Intel-based and AFAIK ARM-based) the EPs in the gadget
> > (USB Device Controller mode) may be reserved for some special means, such as
> > tracing. This series extends DT schema and driver to avoid using those.
> > Without this the USB gadget mode won't work properly (those devices that
> > "luckily" allocated the reserved EPs).
> > 
> > Ferry already tested the privately sent PoC of this, but I ask him again to
> > re-test this version which is slightly different.

...

> I'm not entirely clear on the reason for this change yet.
> 
> How would this even work without dwc3 managing these endpoints (all the
> init/teardown/fifo allocation/start/stop flow).

You perhaps know much better how it can be done, I have access to a limited
documentation and in practice if those endpoints are not skipped any gadget
that allocates them simply won't work, and IIRC the entire USB transfers are
stuck.

> Can you provide more info on this hardware?

I am afraid I can't provide more, sorry. I can look for some specifics,
but I'm not that guy who know anything about in-SoC tracing.

-- 
With Best Regards,
Andy Shevchenko



