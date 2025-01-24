Return-Path: <linux-usb+bounces-19698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08336A1B837
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 15:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF6D3ADA69
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 14:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831BB146A7A;
	Fri, 24 Jan 2025 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkICDLnz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69103C0B;
	Fri, 24 Jan 2025 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737730560; cv=none; b=Ce++7lXeMn4FwhYeYiAbj254VR24Yt3gLmqer/9aIUDo6mwObTpKNLNQf0bSXjtGsx9/QP0FOZiJ73SbDkQzD1cIIweAhkv/pLEm5cSq68Spe3Ehci8qfs7vNf9jM4nGUyoyTDg80wrXm9WUfU3MZ07ikAGVEG4ZFDKFjlyUtsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737730560; c=relaxed/simple;
	bh=eIFstfTr6DUAcbWZYk/a2amZZzuS8W3KIA/N9vfhlOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pB3qmGv3P/bJSXtpWLuk8Mg8ZUraydvdE6bMGJfZJs7kGukhMUh2xUg+PtJ2i2ZtvAkaHGIVvjnt1FMGCz+Yl2Quyd8o0JGv4Gx0uhkEHebO9OsVeew9rwczGUodX2PlbkwRzC6ckQAH2qzV4hzFqCohUQLVZdoiUYuMDg3MXuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkICDLnz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737730558; x=1769266558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eIFstfTr6DUAcbWZYk/a2amZZzuS8W3KIA/N9vfhlOI=;
  b=dkICDLnzS+1whGBGWl5yf71O3kGsjJZgH6msg/oGzdh0NiVNK/CrDjL/
   zOCqYnIRZxUKWTKkeOaOM1fyavyw6oMuBzJIv1/faj6wBpBveh0muuaxb
   glsbexwHp1DxgpPpfIV9/6kBa6auJWScWrtI/LvYbh5mOW3x2vGTwch/n
   AGZyO2JGnzsT7Vty/1pEkePIOW7q1qr+dK9coUBL+shmJcWJtbS0ur7Hf
   AtKoFY+gG+LWkQQsA0yVgM/wpN+bsHYv62tWAW9gKUsnvEZg7lVd5go14
   rSFo26zcNj1Ge3n1idL28P0xvGGeWeAY2oNhX+ptyw3jYXmcsWixMOQQM
   A==;
X-CSE-ConnectionGUID: 56XCAhLjSrKBDKDRo0AToA==
X-CSE-MsgGUID: HcmcBCMfSISEQq4iBqs6kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="55677212"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="55677212"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 06:55:57 -0800
X-CSE-ConnectionGUID: lpYGPPCiQY27z5+/R+CfOA==
X-CSE-MsgGUID: IHTVAX5oR7uS0lhe3PwXsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="112792640"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 06:55:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tbL68-00000004qQZ-0Mrj;
	Fri, 24 Jan 2025 16:55:52 +0200
Date: Fri, 24 Jan 2025 16:55:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add a property to reserve
 endpoints
Message-ID: <Z5Op98D94JzAZurB@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-2-andriy.shevchenko@linux.intel.com>
 <20250123220946.GA407034-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123220946.GA407034-robh@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 23, 2025 at 04:09:46PM -0600, Rob Herring wrote:
> On Thu, Jan 16, 2025 at 05:40:46PM +0200, Andy Shevchenko wrote:
> > Some of the endpoints may be reserved by hardware for different purposes,
> > e.g., tracing control and output. This is the case, for instance, on
> > Intel Merrifield and Moorefield platforms that reserve a few and USB driver
> > may not use them for the regular transfers. Add the respective bindings.

...

> > +  snps,reserved-endpoints:
> > +    description:
> > +      Reserve endpoints for other needs, e.g, for tracing control and output.
> > +      When set, the driver will avoid using them for the regular USB transfers.
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    maxItems: 30
> 
> Please make minItems explicit.

    minItems: 0
    maxItems: 30

Is this what you want to see here?

> > +    items:
> > +      minimum: 2
> > +      maximum: 31

-- 
With Best Regards,
Andy Shevchenko



