Return-Path: <linux-usb+bounces-17289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE809BFF63
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 08:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B331F224BB
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 07:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C621991D2;
	Thu,  7 Nov 2024 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSmzYDnD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA93C7F9;
	Thu,  7 Nov 2024 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965932; cv=none; b=aTkU0P0DcTN1Uxuvu+hB51VIBZa7Ok3lfRjVd3gBOnZWEeq5tfbEd19ltMM/BrLi70rbpGaK4WlKY2AZOsWEvToNegyimyb0dMNsyCY+PmWhbG0XDD+THgkI9Bsqz+7+mlNh98l9wLuDxudFOgw4LlWK5UTabLa0emThWf09reY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965932; c=relaxed/simple;
	bh=J0pFelGI6UXDknfUUyLJLhId2Fq5FdYWTBRv6hxyuyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpJVi1X2rR9+RbTYrmRtq1ffBLNUfEIrWd0t2yKjnYgPIB/QwMfzI9NQuwV39y9mlMUbDqBUUaTd9mnZche9xs22PpntXL0VdAqlo1MNHFMWAjhExQWjh/VivC/ZxsV+zuureQU1h5gnYm51QB1PZfptMtOKmQx9D6MInqQcLq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSmzYDnD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730965931; x=1762501931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J0pFelGI6UXDknfUUyLJLhId2Fq5FdYWTBRv6hxyuyo=;
  b=kSmzYDnDgO2iyCvMXWY1CX80Csa2S1PIuWJp+sv9+v1g4uUhl4gSk5rl
   dLKPFMZE8gQtc04T1WhigQt/hONlFuMUGxXlmyXJzbtDeOv+tUmAA25xe
   tTuaoL1mhosZQGAKRudh3R0P3eqcJ7/IRxJ8V8SY0ZPjJxp26Gxd0Pk9W
   8w5s5vFGg4bfATL4Uuss+YIBygpnFuH6s3K/AK4WGH62AtiIba65YmWCw
   Be2Bujv87Gt0u9+QV3+d6vJbRAQy+LOHAHFfY2i931sSk3jFzGK4QfJ4F
   OwvUvo/5CIhECcVZJu8zTvjBMmiW0GpW+yA76gx4GNJlTuYuCU6+yRYJc
   g==;
X-CSE-ConnectionGUID: xDdqm1lhSW2ZzfjBbZbVGQ==
X-CSE-MsgGUID: UITAr/W2SbiKt/t9iOM2Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30218228"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30218228"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:52:10 -0800
X-CSE-ConnectionGUID: piRu/EcCQ7iosVDkkHf0/w==
X-CSE-MsgGUID: oVn+CG2MR1WdLMqYPKOn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85764686"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:52:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8xJF-0000000CAxS-25XW;
	Thu, 07 Nov 2024 09:52:05 +0200
Date: Thu, 7 Nov 2024 09:52:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH v1 1/1] xhci: Don't use "proxy" headers
Message-ID: <ZyxxpTR-r6dsRTe6@smile.fi.intel.com>
References: <20240923153139.3701266-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923153139.3701266-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 06:31:31PM +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.

Mathias, any comments on this change?

-- 
With Best Regards,
Andy Shevchenko



