Return-Path: <linux-usb+bounces-19490-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5883AA15096
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979E7188483C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 13:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8741FF7D8;
	Fri, 17 Jan 2025 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMRhn5Of"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E41FAC59;
	Fri, 17 Jan 2025 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737120826; cv=none; b=FKh/Vke3eYHHcrEurUnaYWiSHaIhTwL3J4UhBzvzbQyoJgrY7WgcIsQZKlzglraPDveeVJSfBgLeFYGspdVEP1DL2l/oAKie14ynm2rjCqnmJFcHbtkkukEpXr8Eigz/4AWBHRih/BlOn/fMGysyrhkONVY55rljJRS/c7m/ocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737120826; c=relaxed/simple;
	bh=DXJlYmyR5GCUKMaQ/4GN5ovuTEYSzDjCLDxOraMcB10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2L+horLhQr8cw5KyKIdfl8pApJ8scrNMk/WPC0ty4UwtZSVnyc1IyN7JEn/l3KoayFaZXbXS6REvRgtgWe0/vRhSru5+L5RL1L/Ke3oXCOOW8qpateZpl9/nq8OICZJ6gZYp7Vxnd/z29J1EEK1bSDs9FhsE2PVLpLiG+uoWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMRhn5Of; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737120825; x=1768656825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DXJlYmyR5GCUKMaQ/4GN5ovuTEYSzDjCLDxOraMcB10=;
  b=fMRhn5OfIeXGAG5llnARXNcUi5PKwdr6DIh8YQNlDDvz5OC4ZvoNOI5L
   brJ+1EaaY01qaXvZMpLPVOai/EOK3TRD/A7IWPKsHS7uaYKetRPszbUFh
   xjNko0a6e/Ke9ZUfQPcNNfK3knxve/loRhAtn3BHwrHR9ecfUiDCpN1dN
   ZkwXOAV98dmvoQTByAx10KxCQPBZaBd0YaUsxeYAo30ID5BVcB208AZAl
   kyFjLUXCf6Pz9jrZGiCwxN5Gwyoki2gkeQbybaoZY4FhEDhQ9ofxANrCV
   WR4yewys/rlQwSjJaBcUNNHvHU7A1ZPQzTpsSYUfbHWUE6mAhqlHUGlzG
   w==;
X-CSE-ConnectionGUID: YdG2nogfTTCWfF/tE2kFXw==
X-CSE-MsgGUID: 3JznZye3T+CQDWBUpngcqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="60024217"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="60024217"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:33:42 -0800
X-CSE-ConnectionGUID: wE/LBCw3TVSEsncDsTVykQ==
X-CSE-MsgGUID: 4NF0DthWToi6Zoaw1nAxEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109869190"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:33:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYmTh-000000024dl-2OIH;
	Fri, 17 Jan 2025 15:33:37 +0200
Date: Fri, 17 Jan 2025 15:33:37 +0200
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
Message-ID: <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
 <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 16, 2025 at 11:39:42PM +0000, Thinh Nguyen wrote:
> On Thu, Jan 16, 2025, Andy Shevchenko wrote:

...

> > + * Intel Merrifield uses these endpoints for tracing and they shouldn't be used
> > + * for normal transfers, we need to skip them.
> > + * • 1 High BW Bulk IN (IN#1) (RTIT)
> > + * • 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)
> 
> Please use regular bullet character and list the endpoint per line.

Which is...?

To my curiosity, what's wrong with the above?

-- 
With Best Regards,
Andy Shevchenko



