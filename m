Return-Path: <linux-usb+bounces-19821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6EAA20F34
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 17:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9723E3A4895
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 16:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05361CB9EA;
	Tue, 28 Jan 2025 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1KOQIju"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B11A23A2;
	Tue, 28 Jan 2025 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738083062; cv=none; b=IgqeG8gJQsOs2HGmmSm2JCGPdLfhBpv9tgZRLT7bAPNYGJ0HhSIzDWp4XoT1K/7EubCJ5XuElGPZorK4AA+QMmoits6HSeQKH5E72pxdDLYKU9CeKLHFygBxj6dL754RlwVnh1bUVUB7EBFHw68LEPWlc2SmsOznKrxP7X2Z4iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738083062; c=relaxed/simple;
	bh=Aan9fr1tdpl/w1qbzZhAh4nJ5CuKWrNcxaNMGIbPEys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3z+oGkbbfNSpgxjphZxhmT1JLNCrh2Q7Sch3Ti2yTNt3WUmAbZ8I1uyVkV4Fx9T3kHaiIjt5ra7FfEnHAYhf48oxTD2XoJCFUtUt6nbpjjDRAdr+Ld3IJGlf3bRlGkNKuYmuprpk4n9A9J42x9pZZO5SwoKJS8uVhs/B8w1egQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1KOQIju; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738083061; x=1769619061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Aan9fr1tdpl/w1qbzZhAh4nJ5CuKWrNcxaNMGIbPEys=;
  b=h1KOQIju/3fZf8cncRbTSaEYrZH5wStisMwGgJIv+j7itbHHzaOxNUYu
   2m7+hEVHwefKJIsDV/ckcdkhwR0SGdXxhVMrfO77CjotBMuKv00GDwaHz
   tU6TAO4yc9D4Dk+tz+WvicpO2EnltSCqohl3ZezfAqmI7HG8xXuAi7bp/
   NGv9NyQ323tKXvV0nelu55KrvvWwYcbkraytcWs9fpGqSVxiSlKzP1DyB
   MiAwLCVfhwtzBNbntc4XvS7MGyErIYg7YPKclaDNRUOU+Ymqf2/lATcFw
   HgHotmSJr8plQwcdoKXA7S8vFH0jO2OL5VXZKiY+EaoqlfV6ik1DncIV5
   g==;
X-CSE-ConnectionGUID: F7JdSpE/TnCL5RsouGpEjA==
X-CSE-MsgGUID: tUi2ewZrTZ6vP1StKZghnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38277623"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="38277623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 08:51:00 -0800
X-CSE-ConnectionGUID: MlQX91//S82s7U+6BW0vug==
X-CSE-MsgGUID: 0PKzmbaESf614QUbRieP0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="108601274"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 08:50:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tcone-000000067v1-2RyX;
	Tue, 28 Jan 2025 18:50:54 +0200
Date: Tue, 28 Jan 2025 18:50:54 +0200
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
Message-ID: <Z5kK7mkrcrPE43sw@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
 <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
 <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
 <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
 <Z5EbnXy-BRmgFpVh@smile.fi.intel.com>
 <20250128022134.3xuw263bet5akoa4@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128022134.3xuw263bet5akoa4@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 28, 2025 at 02:21:40AM +0000, Thinh Nguyen wrote:
> On Wed, Jan 22, 2025, Andy Shevchenko wrote:
> > On Tue, Jan 21, 2025 at 11:46:17PM +0000, Thinh Nguyen wrote:
> > > On Fri, Jan 17, 2025, Andy Shevchenko wrote:
> > > > On Thu, Jan 16, 2025 at 11:39:42PM +0000, Thinh Nguyen wrote:
> > > > > On Thu, Jan 16, 2025, Andy Shevchenko wrote:

...

> > > > > > + * Intel Merrifield uses these endpoints for tracing and they shouldn't be used
> > > > > > + * for normal transfers, we need to skip them.
> > > > > > + * • 1 High BW Bulk IN (IN#1) (RTIT)
> > > > > > + * • 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)
> > > > > 
> > > > > Please use regular bullet character and list the endpoint per line.
> > > > 
> > > > Which is...?
> > > > 
> > > > To my curiosity, what's wrong with the above?
> > > 
> > > Please use a character that we can find on the keyboard (- or * for
> > > example).
> > 
> > Hmm... We can find all characters on keyboard by using standard approach of
> > typing Unicode ones. I'm not sure why this is a problem. Linux kernel is UTF-8
> > ready project (from source tree point of view), at least I haven't found any
> > limitations in the documentation.
> > 
> > Note, this is _not_ a kernel-doc style to which you may refer when pointing out
> 
> I'm not requesting this out of any kernel-doc style. It's just a
> personal preference and consistency in dwc3. If it's not too difficult,
> please use "-".

As I said...

> But if you must insist, future lists would need to be
> consistent to this new unicode style. Then I would need to ask others to
> use the new Unicode one. Typically typing * doesn't automatically
> convert to • unless you edit using Word, and so I prefer something I and
> others can easily find on the keyboard.
> 
> > to the how lists should be represented.
> > 
> > But it's not big deal for me to change the • character.

...not a big deal to me, I will change as requested.

> > > And why would you want to list them like this:
> > > 
> > > 	* Endpoint A
> > > 	* Endpoint B + Endpoint C
> > 
> > Because:
> > 1) they are logically connected;
> > 2) the above is the exact citation from the specification and I would like to
> > keep it that way.
> > 
> > > As oppose to:
> > > 
> > > 	* Endpoint A
> > > 	* Endpoint B
> > > 	* Endpoint C
> 
> If you prefer to keep the snippet of your vendor specification intact,
> we can instead document this fully in the commit message and note the
> EBC feature. Remove these comments here.

I prefer to have a comment to explain magic numbers. I just want it to be
as closer as possible to the specification wording.

-- 
With Best Regards,
Andy Shevchenko



