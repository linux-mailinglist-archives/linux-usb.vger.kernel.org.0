Return-Path: <linux-usb+bounces-19538-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B0A16EEF
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 16:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0763F1888060
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 15:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3EC1E47AE;
	Mon, 20 Jan 2025 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cd2uqgMd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9ED188587;
	Mon, 20 Jan 2025 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737385364; cv=none; b=ia3qQTCBvg78/3LsSuY/SZA/DPemmth/bMfICoD71xlMxvIneygxWHuRE1Lo+OztQ+WDZEq9H8AUHEKCCX6xv8PrpGZg2cQ91eWrUKcLuh2TXcpIHoLSL5qRu/nRHivu64IX8LPzpMmLCG+DlEPTqLyVPlGEIa/Qz0/wxn63yVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737385364; c=relaxed/simple;
	bh=a1aUSj/QSLwPzl0cM/RFD3ogYP9qRhvddXPluYSzcCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3IDnbMT3TDgVaItoLAlKFMtNAk+J8UmdX0jiq85tAVymUhwek2wfX6r/m2L9T81AybH8ZsGb9P3Qk8KkBn5ouNQv1TiO8DhtoB+2NYy4+o8RW7z4JSe/Vb1dVUieL//9/v9XGDvIy5tE8U9W8EsK4Sekp04TnFOwk8xYU7j0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cd2uqgMd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737385363; x=1768921363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a1aUSj/QSLwPzl0cM/RFD3ogYP9qRhvddXPluYSzcCA=;
  b=cd2uqgMdqqUbsi4pTxxfO6GOoM70p5E4LeYead8WakKN8k+rEpY4gNAB
   3Y5E43IMpq/FSRd6REJg/w9XBGjvFs9Q8yQ4yDSzkVyofUq6W6Dg+h4m/
   N2nDLf57N24tT0UZaMG7Nm7czxluMjIalWx0ZE4JZyaPBPXe0cyZvJtcp
   ctPZnk4h+UEzxu06B4kLLteKeCzy9CcSICi9iUj94llTIMm9aOhe4OZdF
   QHmN0EQnDe/w1PaMWOfgwehZCPz7OU9vgR1OKzfSeqcdC1vFs91fRGC5o
   fXt+XX0oJaFPfpBZ2S5BIU6bFqT4VG21YdRdLYx4KjTgB4hAw2QmByM//
   g==;
X-CSE-ConnectionGUID: 9b3Rj5XaS6qwVaqU5Gifjw==
X-CSE-MsgGUID: ic78s9uVQP6HE+4n8fT/Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="25384401"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="25384401"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 07:02:42 -0800
X-CSE-ConnectionGUID: 1TtviDLhTu+SgbySrR+p+A==
X-CSE-MsgGUID: Sh/dUyHmTc6uRzF4AZPOwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="106664839"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 07:02:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tZtIT-00000003RUE-119i;
	Mon, 20 Jan 2025 17:02:37 +0200
Date: Mon, 20 Jan 2025 17:02:37 +0200
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
Message-ID: <Z45lja5InqAXs3CQ@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116231835.isbwmq5yz5issy3w@synopsys.com>
 <Z4pdZZhR6m1LB3yk@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4pdZZhR6m1LB3yk@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 17, 2025 at 03:38:46PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 16, 2025 at 11:18:45PM +0000, Thinh Nguyen wrote:
> > On Thu, Jan 16, 2025, Andy Shevchenko wrote:
> > > On some platforms (Intel-based and AFAIK ARM-based) the EPs in the gadget
> > > (USB Device Controller mode) may be reserved for some special means, such as
> > > tracing. This series extends DT schema and driver to avoid using those.
> > > Without this the USB gadget mode won't work properly (those devices that
> > > "luckily" allocated the reserved EPs).
> > > 
> > > Ferry already tested the privately sent PoC of this, but I ask him again to
> > > re-test this version which is slightly different.

...

> > I'm not entirely clear on the reason for this change yet.
> > 
> > How would this even work without dwc3 managing these endpoints (all the
> > init/teardown/fifo allocation/start/stop flow).
> 
> You perhaps know much better how it can be done, I have access to a limited
> documentation and in practice if those endpoints are not skipped any gadget
> that allocates them simply won't work, and IIRC the entire USB transfers are
> stuck.
> 
> > Can you provide more info on this hardware?
> 
> I am afraid I can't provide more, sorry. I can look for some specifics,
> but I'm not that guy who know anything about in-SoC tracing.

So, here is what I found:

---8<---

However the endpoints allocated for STM and EXI debug traffic cannot be re-allocated
if being used because the sideband flow control signals are hard wired to certain
endpoints:
• 1 High BW Bulk IN (IN#1) (RTIT)
• 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)

In device mode, since RTIT (EP#1) and EXI/RunControl (EP#8) uses External Buffer
Control (EBC) mode, these endpoints are to be mapped to EBC mode (to be done by
EXI target driver). Additionally TRB for RTIT and EXI are maintained in STM (System
Trace Module) unit and the EXI target driver will as well configure the TRB location for
EP #1 IN and EP#8 (IN and OUT). Since STM/PTI and EXI hardware blocks manage
these endpoints and interface to OTG3 controller through EBC interface, there is no
need to enable any events (such as XferComplete etc) for these end points.

Does it help you to understand the required quirk better?

-- 
With Best Regards,
Andy Shevchenko



