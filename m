Return-Path: <linux-usb+bounces-19640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D03A19669
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 17:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8EBB168EF6
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 16:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5D7215057;
	Wed, 22 Jan 2025 16:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQEhsnk/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E65212D84;
	Wed, 22 Jan 2025 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563044; cv=none; b=SB0P1Vy5XAQsThT0vIp2gqhYyexpprGLGKk1kqzLVeMvXekqHn3rqFT7tvfaHTJ6yFC9bJpQQw71qcFp+f2Eli7tYXEq7QxT68NVnEIq3XwMQHgg6I0GNasGy7rd4SE6x6LkV9Jx75Iwyb45TYxf3aqJcjH7s14tTbwkoep7oDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563044; c=relaxed/simple;
	bh=fwt5oT5Y8QgZRUd1lnPC4GWL3eMUTEEXbR17gFncewA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htKtqMNjS7T5qz0O5lIrhYwxrQ9bj/ZqGT9ihuVikM1Oool+crkyMxQFm6fXbeTeuMdJP/2ubfsLa3z2w5EZ75Rr7Gv0x6R9UyzWLQleB/EuXahZ/w/gdkK5s5TXa/JR0JmakDd2LnZXfnl4WmMGyVo/vpgaK4++Yphma0onHhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQEhsnk/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737563043; x=1769099043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fwt5oT5Y8QgZRUd1lnPC4GWL3eMUTEEXbR17gFncewA=;
  b=KQEhsnk/lWBvYEn3EkJzQfbtpIz9VfyLyE0klvjimAv3aae3Ow418LKJ
   ZeY0OLr35ppfYt5TZGshTPf/PisgtAHBSQ69tVpJApdpQzsAnIaX0MyAG
   Glin2wnPB/RyW/vXN7VR7FDrrT2T33TNq+pOGRaNz5GzaLHURL+aEsFv7
   qxvCQzLtoMaPTw3uHDU3dPCYujuX5AzsRwSNVCYIxoCMG0UfWcMDgSiCH
   ixTJ6ya9GOZjyjCJrO4bVwjDqwkgoqrYwgp54Kt2OpsS5FV7o88JphHLG
   UOU9xv5qNVN+4/mvl6OSPOOUwENIikOyKxjdIbx9qzUDKqgQIWVhf9Vzt
   g==;
X-CSE-ConnectionGUID: 7VwdFOI5Sc+kU2eXthosog==
X-CSE-MsgGUID: cyLVJIXkSi24eeZ8KHVzQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49424364"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49424364"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:24:03 -0800
X-CSE-ConnectionGUID: gL1Ev5D9TZmYQuS/pu5PgA==
X-CSE-MsgGUID: tKTL8cEET9etTp5y8yMPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107720414"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:24:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tadWI-000000048VN-0GAy;
	Wed, 22 Jan 2025 18:23:58 +0200
Date: Wed, 22 Jan 2025 18:23:57 +0200
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
Message-ID: <Z5EbnXy-BRmgFpVh@smile.fi.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
 <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
 <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
 <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 21, 2025 at 11:46:17PM +0000, Thinh Nguyen wrote:
> On Fri, Jan 17, 2025, Andy Shevchenko wrote:
> > On Thu, Jan 16, 2025 at 11:39:42PM +0000, Thinh Nguyen wrote:
> > > On Thu, Jan 16, 2025, Andy Shevchenko wrote:

...

> > > > + * Intel Merrifield uses these endpoints for tracing and they shouldn't be used
> > > > + * for normal transfers, we need to skip them.
> > > > + * • 1 High BW Bulk IN (IN#1) (RTIT)
> > > > + * • 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)
> > > 
> > > Please use regular bullet character and list the endpoint per line.
> > 
> > Which is...?
> > 
> > To my curiosity, what's wrong with the above?
> 
> Please use a character that we can find on the keyboard (- or * for
> example).

Hmm... We can find all characters on keyboard by using standard approach of
typing Unicode ones. I'm not sure why this is a problem. Linux kernel is UTF-8
ready project (from source tree point of view), at least I haven't found any
limitations in the documentation.

Note, this is _not_ a kernel-doc style to which you may refer when pointing out
to the how lists should be represented.

But it's not big deal for me to change the • character.

> And why would you want to list them like this:
> 
> 	* Endpoint A
> 	* Endpoint B + Endpoint C

Because:
1) they are logically connected;
2) the above is the exact citation from the specification and I would like to
keep it that way.

> As oppose to:
> 
> 	* Endpoint A
> 	* Endpoint B
> 	* Endpoint C

-- 
With Best Regards,
Andy Shevchenko



