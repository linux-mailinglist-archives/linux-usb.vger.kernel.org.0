Return-Path: <linux-usb+bounces-19822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F220DA20F42
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 17:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398633A222F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 16:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832511BDA91;
	Tue, 28 Jan 2025 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpsxJROw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EE627452;
	Tue, 28 Jan 2025 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738083335; cv=none; b=YBlhmRG2TWZMoxqNn45ZMIeouzRsiuoFs4VK4/Q3DOs6Lr1apibHJrBBVoSFvktsQH4ZPjb+62uB6HbIWWqyHFQ24Mb+rEnA5G+jjFeGBOdeyuZFz9dFfpSZD0qGMdyWqT+di/2bgOadEoo1ezsSz/WmGxKW75nggnxR5Wwdy1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738083335; c=relaxed/simple;
	bh=JSnBUdPwoZTDwzjkjzbUqIRN8vSu1vxUkBa7U7XV2CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGuaSOWBVoYvPkJ7LxlWddf6l2EQNhxWa+peImclV/Ftmj6EzgcACwzSgNKmh2v+a+PVy8ZHZwF9aOFJYMFP6QzzUSq0vRglQLhjNAt4XIbx6nze8UsTox5COjz6Rzb+L1sKeiryFwd9FwFS+UTn8n8vB12uEdPtR/hEhib83AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpsxJROw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738083334; x=1769619334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JSnBUdPwoZTDwzjkjzbUqIRN8vSu1vxUkBa7U7XV2CQ=;
  b=YpsxJROwaXBu1a8hn1Gj8hxz0nqpeleuyYEllhHOTze4ICNWKgO2KkXS
   MZOTmLfBp05REv7hFGRqck8ruSU2rmT0tOMAogAkY5pcxe6x1fzxzUJTp
   16o1bJBls8/sP2clibfn6atA60LWUuJVMS0Y8w66bchaUW4uQZZcim/8h
   k8q2kU+O7GzN1xLcrNm8ueubRBAUQ0VJfuRL6I8s23onLONlOAHiHfFzV
   VBZerIGXd9zmSwl0KdfqtqLKrxEMcH8dzcQ2+aY1DsE8Sw6FNZHrnROZ7
   fZ/YkkN8dGt9L782wkHReV0waPukWuHG67bHBVgyU4TDwxndReTrHSWma
   Q==;
X-CSE-ConnectionGUID: eae5Aj3jT5mRZWIEH6wumw==
X-CSE-MsgGUID: Wmfan+m8SpS9uiJEVRt8fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49164612"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="49164612"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 08:55:33 -0800
X-CSE-ConnectionGUID: lyGgcRtSSX67/LLMdJMUeg==
X-CSE-MsgGUID: Hvh79aeHTdWFAkhFvf65CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="113787900"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 08:55:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tcos4-000000067zM-0Kj1;
	Tue, 28 Jan 2025 18:55:28 +0200
Date: Tue, 28 Jan 2025 18:55:27 +0200
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
Message-ID: <Z5kL_w0yqUHMRDzQ@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
 <20250116233507.sifqs5u3rixoz4lw@synopsys.com>
 <Z4pb5CTS5n5wtJ7d@smile.fi.intel.com>
 <20250122014347.fc3ntfkl7cismjxd@synopsys.com>
 <Z5Em5bvAwu8QgRo8@smile.fi.intel.com>
 <20250128023943.spxp7sv354iusrkt@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128023943.spxp7sv354iusrkt@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 28, 2025 at 02:39:50AM +0000, Thinh Nguyen wrote:
> On Wed, Jan 22, 2025, Andy Shevchenko wrote:
> > On Wed, Jan 22, 2025 at 01:44:02AM +0000, Thinh Nguyen wrote:
> > > On Fri, Jan 17, 2025, Andy Shevchenko wrote:
> > > > On Thu, Jan 16, 2025 at 11:35:19PM +0000, Thinh Nguyen wrote:
> > > > > On Thu, Jan 16, 2025, Andy Shevchenko wrote:

...

> > > > > >  	for (epnum = 0; epnum < total; epnum++) {
> > > > > > -		int			ret;
> > > > > > +		for (num = 0; num < count; num++) {
> > > > > > +			if (epnum == eps[num])
> > > > > > +				break;
> > > > > > +		}
> > > > > > +		if (num < count)
> > > > > > +			continue;
> > > > > 
> > > > > You can probably rewrite this logic better.
> > > > 
> > > > Any suggestions?
> > > > 
> > > > Thanks for the review!
> > > 
> > > From the first look, is the list sorted? If so, you don't need another
> > > for-loop.
> > 
> > Even if it's sorted it's not 1:1 mapped by indices. I do not understand how we
> > can avoid the second loop. The only possibility is indeed to sort the list and
> > sparse it in accordance to the endpoint numbers, but if we are going this way,
> > it's much easier to switch to bitmap and the respective bitops.
> 
> If it's sorted, it can be something like this. Just a quick logic and not tested:
> 
> num = 0
> for (epnum = 0; epnum < total; epnum++) {
> 	if (num < count && epnum == eps[num]) {
> 		num++;
> 		continue;
> 	}
> 
> 	...
> }

Ah, okay, I have got the idea. Let me try to mock up something working
out of it.

> > > Also, we loop over the number of endpoints throughout the driver, but
> > > you only skip it here during init. Please double check for invalid
> > > accessing of endpoints in other places.
> > > 
> > > Perhaps set the dwc->eps[reserved_ep] to ERR_PTR(-EINVAL) or something
> > > when you parse the reserved endpoints so you can skip them in your loop.
> > 
> > Note, this is only for UDC, in USB host these are okay to be used.
> > Does your suggestion imply that?
> 
> No. We track the total num_eps in dwc->num_eps. Then we do for-loop to
> dwc->eps[i] and access the endpoint. Often we check if the endpoint is
> NULL before accessing dwc->eps[i]. However, we don't do it everywhere.
> So I ask for you to review to make sure that this change doesn't break
> elsewhere where we may try to access dwc->eps[i] to an uninit endpoint
> (Note I see at least 1 place e.g. dwc3_gadget_clear_tx_fifos that may
> break)

I see, so having my code as is also requiring to check all users of
the eps array in the _gadget part_ of the driver to see if they won't
crash due to NULL pointer dereference. Is it what you want?
If so, definitely I will revisit that.

-- 
With Best Regards,
Andy Shevchenko



