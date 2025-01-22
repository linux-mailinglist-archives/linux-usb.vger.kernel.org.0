Return-Path: <linux-usb+bounces-19641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A63EBA19671
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 17:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12983A3527
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 16:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477B921481F;
	Wed, 22 Jan 2025 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GylwyTX8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350221422E;
	Wed, 22 Jan 2025 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563090; cv=none; b=drL5iafB+OnUAXgUuRzSVyqxWQgL+w3J2U2rJfVIcmWeX5n+2wSlcjdBuYs9bx2kZl4ZdHU9taXMZLqu1iyFExxa068uXkXXmp531lFPVVgMp1sUKkJJ9tChCxTF00s2PJvcRVkag1clYVHubMcBMuPtvcl+XitRtjU+Aj7D0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563090; c=relaxed/simple;
	bh=B6Jx6IDdIZWnHvTzbaKBymPW/3+Q4IfFaDjMNaKYMrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkoDKxihBSbs0qHl41/3jcM8mztEAyeC/fXPjQd1diJm2TybwXIKTn7MZJKBWuqGepEGvetsBz0CinLaKw/jYybh87FJq9pz1WIK3Kyhd65q+KhKLI8klZGt+PZ+cX9TAxv4c7D68nehOMzNKKs/i44653iwOhvCJU7vLQHy3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GylwyTX8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737563089; x=1769099089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B6Jx6IDdIZWnHvTzbaKBymPW/3+Q4IfFaDjMNaKYMrQ=;
  b=GylwyTX81ngzOxBPNsPfYfAkmsC6p3b+k5HK456SHN43SYda8cb12zL3
   OKx+rKXj5IM3LvfZBBllvKVi2MuFX67FAfJHOA7/e5oL12a6Lj40nLOhN
   IdRPSQdKjFTiqpVM4j9G+hDKYtw6NGOrytXGyWQgszD/PCxUb0TTmB3iU
   R+8/98ZyCTnmd5zHrXz15NTG/lTnGyMd8kDnITpo6trm6FbUuHrU52jUp
   +KjYtRr30fppvhoDsEHeqp7as/qsLyNYPIJbMLJYpnlPCePj5nU0U4A00
   N+9xut5sQr0IcWnSOJMAy3UKOw0TJzmkPvVoOXARELJtvJnZuE5vjWosE
   w==;
X-CSE-ConnectionGUID: neyKLQtHTLWkHI/IO5i0Nw==
X-CSE-MsgGUID: KNNqT0o9TxG3Nm8K5VOhqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38179606"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="38179606"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:24:48 -0800
X-CSE-ConnectionGUID: KO3zCVj4Sk2pcQneoUaUNw==
X-CSE-MsgGUID: 1aTf38LWSDewLgnvIwODaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111214817"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:24:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tadX1-000000048W0-1RVU;
	Wed, 22 Jan 2025 18:24:43 +0200
Date: Wed, 22 Jan 2025 18:24:43 +0200
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
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Message-ID: <Z5Eby8UKqxZDpQj8@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
 <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
 <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
 <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
 <20250121235149.tgouwgtm2wgrqrax@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121235149.tgouwgtm2wgrqrax@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 21, 2025 at 11:51:51PM +0000, Thinh Nguyen wrote:
> On Tue, Jan 21, 2025, Thinh Nguyen wrote:

...

> Also, please fix the $subject and replace "endpoints ep[18]{in,out}" to
> just "reserved endpoints".

Sure.

Thank you for the review.

-- 
With Best Regards,
Andy Shevchenko



