Return-Path: <linux-usb+bounces-19643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F240DA19739
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 18:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D22443A1E2F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 17:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56D621517F;
	Wed, 22 Jan 2025 17:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSzbxr7/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4661369B4;
	Wed, 22 Jan 2025 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737565934; cv=none; b=fDrkDHVFCBd/dHrHyfSludwoXFTj7uIqNoKjTUPETjSnOpK6BlieTL1+/PgOpRKC2/vpMRx5xOo0LY6SBQOsdnw8kgvr1/Es0PKkya/rpubCIsH7rTIKk71ZMfjThAVuXzy2Pk4ZUwPQoi6iV7GPg0awPhZ9kie6J9jeDYiGmPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737565934; c=relaxed/simple;
	bh=eXFKH4bdJssGgfpxP5WpTsqxJDnOT2+vyYYs2mYdcgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB3mr+6gJL8SJXeecjg2W4PFMomxR9kXizT/hEwH4V1HkzcJcwk7DqQ50y1raP+p8jwaHHhrdOX8b8P4O6TaJ7ZJCiL1mhkXZNKJ92wSTtCZReA+4IV87H7YgyQu26d1CTCxDghY3MR4OGrktCep95K+2mE5AxhS+sNZ+TOO3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSzbxr7/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737565933; x=1769101933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eXFKH4bdJssGgfpxP5WpTsqxJDnOT2+vyYYs2mYdcgY=;
  b=iSzbxr7/sBZNsfIUo/yV3cOHHeNcyJn9kL5oEJAedM89LOIB6+VKSXrd
   tnEbXq9/0lYg7iARdAfqzmVYViaTUJVvrs2ncROOHW+UE7X74xVdtWYRX
   eW127pkdgQbtVtgEiKjQHalBDKhtkMtpJoLdzixXfMH7Y2GRs4LHH52Ke
   GJ7/5AdIhtZ6L2hK3vAoyOQPyn2UxY//O/BhI3eOIRvAQV5RTEI9d9lJq
   DTeaSjJ6w3BicABg/EEznCgezjccgxGsnUQmVLkB76qF/dbBCZd2qI3SX
   R+tXyae9PLoatKuYwj+uYnzrlMb+J92XZ4rcYKKF/z0znaVTyWGAU6O1Q
   Q==;
X-CSE-ConnectionGUID: 7OO38RmwTUi86P2b4TJROQ==
X-CSE-MsgGUID: V0lXtPveTV+S/YnC7Gp9sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37242895"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37242895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:12:11 -0800
X-CSE-ConnectionGUID: PfgvjKc4SiaLnutwl0G2Ew==
X-CSE-MsgGUID: B89saev+To6b8WVp5jIHxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="112227523"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:12:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1taeGs-000000049DJ-0G0K;
	Wed, 22 Jan 2025 19:12:06 +0200
Date: Wed, 22 Jan 2025 19:12:05 +0200
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
Message-ID: <Z5Em5bvAwu8QgRo8@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
 <20250116233507.sifqs5u3rixoz4lw@synopsys.com>
 <Z4pb5CTS5n5wtJ7d@smile.fi.intel.com>
 <20250122014347.fc3ntfkl7cismjxd@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122014347.fc3ntfkl7cismjxd@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 22, 2025 at 01:44:02AM +0000, Thinh Nguyen wrote:
> On Fri, Jan 17, 2025, Andy Shevchenko wrote:
> > On Thu, Jan 16, 2025 at 11:35:19PM +0000, Thinh Nguyen wrote:
> > > On Thu, Jan 16, 2025, Andy Shevchenko wrote:

...

> > > >  	for (epnum = 0; epnum < total; epnum++) {
> > > > -		int			ret;
> > > > +		for (num = 0; num < count; num++) {
> > > > +			if (epnum == eps[num])
> > > > +				break;
> > > > +		}
> > > > +		if (num < count)
> > > > +			continue;
> > > 
> > > You can probably rewrite this logic better.
> > 
> > Any suggestions?
> > 
> > Thanks for the review!
> 
> From the first look, is the list sorted? If so, you don't need another
> for-loop.

Even if it's sorted it's not 1:1 mapped by indices. I do not understand how we
can avoid the second loop. The only possibility is indeed to sort the list and
sparse it in accordance to the endpoint numbers, but if we are going this way,
it's much easier to switch to bitmap and the respective bitops.

> Also, we loop over the number of endpoints throughout the driver, but
> you only skip it here during init. Please double check for invalid
> accessing of endpoints in other places.
> 
> Perhaps set the dwc->eps[reserved_ep] to ERR_PTR(-EINVAL) or something
> when you parse the reserved endpoints so you can skip them in your loop.

Note, this is only for UDC, in USB host these are okay to be used.
Does your suggestion imply that?

-- 
With Best Regards,
Andy Shevchenko



