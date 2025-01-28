Return-Path: <linux-usb+bounces-19823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14FA20F4A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 17:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E732F188A294
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 16:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494861C32FF;
	Tue, 28 Jan 2025 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nooR/Cc8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B512904;
	Tue, 28 Jan 2025 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738083450; cv=none; b=tWrIN81PyLYvFIN06oMvAbmSkvkq/W9HS8KakUaYPTuFQcA6fVo23hzONBViOYkH8hJHnVayIVT7aoa4Zrz9p+ME6n/0+bcF6OW92xIfvC+DgoPUh4TpaVCkOSWEY3jamvmqkJn0O5ChSm71takeKAV1Ah7yoHQQnYk1EJNQ27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738083450; c=relaxed/simple;
	bh=ozY3QyLOS8El11j9pFD7qjcx/fpadRr+ykyYXLaoS00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW1lxrA/ZyEKT187v9vbnJ6rG8xPORqakRNA51xmfgDF5uaYvFCvfCEIlo5E+i8svDcXuHmtng12Js3k3Z/GIG63tu6piYFT/+Tyg8XwDPzLVyeIyXqxVKS7Idkq32SNDxPo3/GJq3AnGzrrUfn21srzmVwS8KYa5HzyTkPBb+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nooR/Cc8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738083450; x=1769619450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ozY3QyLOS8El11j9pFD7qjcx/fpadRr+ykyYXLaoS00=;
  b=nooR/Cc8075CApFulJ5552jl6q8nGUYuQFTtbscme3K10f5UX9wc4inY
   PmHCbv4zbQ65XZMWWE4R/S9asSjRpXaseKm7Tahx3CAjMQsGFW+yxEeHo
   /k3m9HUOYzVq7K4WqFVM9S0PGa12b8hRKax8o7K66ekKwzcDHgCabmYZv
   SxhMSNE7HzknwDOevMK5HjecsPDPr4eelvD0sCyhHOVlw/AFwMKd7q1vj
   LgF/yO/bXzKBbZfy0s8nxMZLy8ALpio5CqnvURg3vx+AWiuRp1zWeicoD
   J1tpyU36iXDJbIA60Md1JNSrOTVo36GlgilmGtX8riqDz++Ehf+w2GbaD
   g==;
X-CSE-ConnectionGUID: W9wgN6GTQvyY59LYmEIDbw==
X-CSE-MsgGUID: X6YIRntlQqyTC9YUBq2mGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38717719"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="38717719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 08:57:29 -0800
X-CSE-ConnectionGUID: ECjLstAeRP2VZoFZlkiK7A==
X-CSE-MsgGUID: GzUSOYdmSY++wQGj8ZWHKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139655705"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 08:57:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tcotv-0000000681G-4BAg;
	Tue, 28 Jan 2025 18:57:23 +0200
Date: Tue, 28 Jan 2025 18:57:23 +0200
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
Message-ID: <Z5kMc5-UA2jSiTaI@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116231835.isbwmq5yz5issy3w@synopsys.com>
 <Z4pdZZhR6m1LB3yk@smile.fi.intel.com>
 <Z45lja5InqAXs3CQ@smile.fi.intel.com>
 <20250121234313.2xiixrqru5m35dyp@synopsys.com>
 <Z5EccvQh3IsOSDSa@smile.fi.intel.com>
 <20250128022520.6w2dovsb4rjh3qwh@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128022520.6w2dovsb4rjh3qwh@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 28, 2025 at 02:25:21AM +0000, Thinh Nguyen wrote:
> On Wed, Jan 22, 2025, Andy Shevchenko wrote:
> > On Tue, Jan 21, 2025 at 11:43:21PM +0000, Thinh Nguyen wrote:
> > > On Mon, Jan 20, 2025, Andy Shevchenko wrote:
> > > > On Fri, Jan 17, 2025 at 03:38:46PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Jan 16, 2025 at 11:18:45PM +0000, Thinh Nguyen wrote:
> > > > > > On Thu, Jan 16, 2025, Andy Shevchenko wrote:

...

> > > > > > I'm not entirely clear on the reason for this change yet.
> > > > > > 
> > > > > > How would this even work without dwc3 managing these endpoints (all the
> > > > > > init/teardown/fifo allocation/start/stop flow).
> > > > > 
> > > > > You perhaps know much better how it can be done, I have access to a limited
> > > > > documentation and in practice if those endpoints are not skipped any gadget
> > > > > that allocates them simply won't work, and IIRC the entire USB transfers are
> > > > > stuck.
> > > > > 
> > > > > > Can you provide more info on this hardware?
> > > > > 
> > > > > I am afraid I can't provide more, sorry. I can look for some specifics,
> > > > > but I'm not that guy who know anything about in-SoC tracing.
> > > > 
> > > > So, here is what I found:
> > > > 
> > > > ---8<---
> > > > 
> > > > However the endpoints allocated for STM and EXI debug traffic cannot be re-allocated
> > > > if being used because the sideband flow control signals are hard wired to certain
> > > > endpoints:
> > > > • 1 High BW Bulk IN (IN#1) (RTIT)
> > > > • 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)
> > > > 
> > > > In device mode, since RTIT (EP#1) and EXI/RunControl (EP#8) uses External Buffer
> > > > Control (EBC) mode, these endpoints are to be mapped to EBC mode (to be done by
> > > > EXI target driver). Additionally TRB for RTIT and EXI are maintained in STM (System
> > > > Trace Module) unit and the EXI target driver will as well configure the TRB location for
> > > > EP #1 IN and EP#8 (IN and OUT). Since STM/PTI and EXI hardware blocks manage
> > > > these endpoints and interface to OTG3 controller through EBC interface, there is no
> > > > need to enable any events (such as XferComplete etc) for these end points.
> > > > 
> > > > ---8<---
> > > > 
> > > > Does it help you to understand the required quirk better?
> > > 
> > > Thanks for looking up the info. This makes more sense now. So these
> > > endpoints use EBC. Can you also provide this info to the commit?
> > 
> > Sure, since I published it already it makes no difference if it appears in the
> > Git log (from the publicity point of view).
> 
> It's more difficult to find this outside of git log, especially to a
> link version of a git change that's not applied.

I'm not objecting this, what I am telling is that information went public in
this thread, so expanding a commit message in the next version of the series
to include additional information is fine with me. I'll do that.

-- 
With Best Regards,
Andy Shevchenko



