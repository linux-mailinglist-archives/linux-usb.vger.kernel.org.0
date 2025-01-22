Return-Path: <linux-usb+bounces-19642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA90A19677
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 17:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC958188E2D1
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 16:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BE7215050;
	Wed, 22 Jan 2025 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dB9Z7su6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1921E167DB7;
	Wed, 22 Jan 2025 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563259; cv=none; b=K+EygRxgk6Z5scM2/FQj+WYQ+i1XDPgjDSWvdgl9yVNYpwhnR+8MXjryhviFGJEMNiLtBKVTgKVp0YEqVlds22kl8moKSbqxTnrxPh3HCJR2KwrSjiLLziG8xhY3weJdvF209Y0A510D7wNMJK6eHhYt3J3WMwiqKA7Q3ExFpuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563259; c=relaxed/simple;
	bh=hPnA/N9Wb+zVIh14EcaRytOE4A7cUTGHhq/Q7LTA0QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIQ51Fd42VOAjmdl9Qoqia3PkvBf1HgXcOlKHa53ZT4Mzs+urSg7770oL1PFL8NSkbun7/mxDMeGlmf8JC0ztAmRy4XoGXr7IUexSlTwRyOe/AWt4u2QaGgf+95GEMEo5lEpDdIcHCGIgdx+XDnIbExZubVaYZNokfNUjT0Hnqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dB9Z7su6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737563258; x=1769099258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hPnA/N9Wb+zVIh14EcaRytOE4A7cUTGHhq/Q7LTA0QQ=;
  b=dB9Z7su6Z5UR/Zj2D7wX4pCjRxUak/xSUHiRKPIQv9RTTWOEmeUPlJWO
   41Jvke1kp7h2vuetxAt5JH/BjZHW3SqQROsWZdWQzWU/YuTP4WQbvyQlX
   XwtMiRhLWfhWLHb0bK2jUR+x5ZjnCQ+1SFbyy44SUXY6Zq58+B4aNQXXB
   HqgB75LG7g59joLne+bbR7tqfFV9khs46/1D3eZ8V66yurmuir0SLvrqB
   jZpGwBz8KUMh/uHgOV7lIgQX8hxdHa8c08B4SNBSxd2LHZ1n1xtXmNOou
   h98rFpG8ze6OCdZRoK/t4PoHiADtooQNpud6s9YSwSEW6ReQrBxfpR1cQ
   g==;
X-CSE-ConnectionGUID: KoZ1AmbJRjCwfTl2L8KuHg==
X-CSE-MsgGUID: 138gE/bcS+yW2GwBXduurw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37729447"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37729447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:27:37 -0800
X-CSE-ConnectionGUID: rh4fWJP/TJyt/m+8jDrnZg==
X-CSE-MsgGUID: MJyFj+xZQAKqD4jXWy5d/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107789395"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:27:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tadZi-000000048Yc-1fVP;
	Wed, 22 Jan 2025 18:27:30 +0200
Date: Wed, 22 Jan 2025 18:27:30 +0200
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
Message-ID: <Z5EccvQh3IsOSDSa@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116231835.isbwmq5yz5issy3w@synopsys.com>
 <Z4pdZZhR6m1LB3yk@smile.fi.intel.com>
 <Z45lja5InqAXs3CQ@smile.fi.intel.com>
 <20250121234313.2xiixrqru5m35dyp@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121234313.2xiixrqru5m35dyp@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 21, 2025 at 11:43:21PM +0000, Thinh Nguyen wrote:
> On Mon, Jan 20, 2025, Andy Shevchenko wrote:
> > On Fri, Jan 17, 2025 at 03:38:46PM +0200, Andy Shevchenko wrote:
> > > On Thu, Jan 16, 2025 at 11:18:45PM +0000, Thinh Nguyen wrote:
> > > > On Thu, Jan 16, 2025, Andy Shevchenko wrote:

...

> > > > I'm not entirely clear on the reason for this change yet.
> > > > 
> > > > How would this even work without dwc3 managing these endpoints (all the
> > > > init/teardown/fifo allocation/start/stop flow).
> > > 
> > > You perhaps know much better how it can be done, I have access to a limited
> > > documentation and in practice if those endpoints are not skipped any gadget
> > > that allocates them simply won't work, and IIRC the entire USB transfers are
> > > stuck.
> > > 
> > > > Can you provide more info on this hardware?
> > > 
> > > I am afraid I can't provide more, sorry. I can look for some specifics,
> > > but I'm not that guy who know anything about in-SoC tracing.
> > 
> > So, here is what I found:
> > 
> > ---8<---
> > 
> > However the endpoints allocated for STM and EXI debug traffic cannot be re-allocated
> > if being used because the sideband flow control signals are hard wired to certain
> > endpoints:
> > • 1 High BW Bulk IN (IN#1) (RTIT)
> > • 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)
> > 
> > In device mode, since RTIT (EP#1) and EXI/RunControl (EP#8) uses External Buffer
> > Control (EBC) mode, these endpoints are to be mapped to EBC mode (to be done by
> > EXI target driver). Additionally TRB for RTIT and EXI are maintained in STM (System
> > Trace Module) unit and the EXI target driver will as well configure the TRB location for
> > EP #1 IN and EP#8 (IN and OUT). Since STM/PTI and EXI hardware blocks manage
> > these endpoints and interface to OTG3 controller through EBC interface, there is no
> > need to enable any events (such as XferComplete etc) for these end points.
> > 
> > ---8<---
> > 
> > Does it help you to understand the required quirk better?
> 
> Thanks for looking up the info. This makes more sense now. So these
> endpoints use EBC. Can you also provide this info to the commit?

Sure, since I published it already it makes no difference if it appears in the
Git log (from the publicity point of view).

-- 
With Best Regards,
Andy Shevchenko



