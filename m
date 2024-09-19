Return-Path: <linux-usb+bounces-15244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ABB97C98D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 14:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C3A41F243E2
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 12:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E597E19AD8D;
	Thu, 19 Sep 2024 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S078Sdpt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FED19D08C
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726750382; cv=none; b=S+vF7Xojnhdo5JvrPm+/pQBcY+Lw8TctqHnvwnJ/7pF9XC1j8zuigh0GFy0TGPqhs0XyzKVHs7mIniTMTt2Ortn/4bzkRXC+38smu+Om9GKOULJPWsr63CbWqCJo1sQWrjivKr2jNHUmYyfHV9lGbmhspQt3cp5kYxDvPD6SOA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726750382; c=relaxed/simple;
	bh=Mf3pefzGUAWAc/sUj2Gsaf/ptQNmoyfhxcs6dEi8p70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3NmX/a+zlvnEaSq6Kw4dC+b9LYYZrhWoqcCU2IBIUGiOiUvJMHGEypjMQTfPS8I8+0cmDXbGo/H2nC5XaMB8JYDMdelb0iVE+cxXmXGpgzs4jWa5V6j4m4veRmcB46uhfkoUodJpClc03bds54I5tDmDAJqcWXP9zUs5t0+qdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S078Sdpt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726750381; x=1758286381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mf3pefzGUAWAc/sUj2Gsaf/ptQNmoyfhxcs6dEi8p70=;
  b=S078SdptJ03bdc9414c7nx6w+jQ7JW+EVnGOtcCoCozyWI11rmZnmwHl
   t4Evmn57ULZPriGUsnzKVXX1YC67xjlmB2Bf+kdi7anzb/Rte9EXdtHz0
   UhwJpJNbs1fy9TdCjveeW72BZ99mGnW5NIs1wyX3CwulcXDCw8cFkIPzf
   p2YiIXpFHF+AUS74lO6YDfFstalfS4M9N1lVmgr65Vb82XjRVpkT3/DTX
   30X/RKeU1gHyybWFw3IP5U8ZMEzuqOe5uHHHicJZe9TY3ep8GmjnxDpbE
   y8HjR60KB9xMmsO/iDg7H/MCy8CFCbwiFJxZLnktc7jImY1xtsaAWiHma
   A==;
X-CSE-ConnectionGUID: N+T3XSMzToiIpqsDd9SBrw==
X-CSE-MsgGUID: L/nDZwAvQCCiIeY/IzN8aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43226430"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="43226430"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 05:53:00 -0700
X-CSE-ConnectionGUID: LDZeXBs+QLGhru/FuHC+gA==
X-CSE-MsgGUID: cpR+mQ7SR/y0A2HEB6O3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="70048703"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa008.fm.intel.com with SMTP; 19 Sep 2024 05:52:57 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 19 Sep 2024 15:52:56 +0300
Date: Thu, 19 Sep 2024 15:52:56 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 5/8] usb: typec: cros_ec_ucsi: Add trace events
Message-ID: <ZuweqBOt_53n3HPA@kuha.fi.intel.com>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-6-ukaszb@chromium.org>
 <ZuGcw9y0hIiuIXvK@kuha.fi.intel.com>
 <CALwA+NbY1qbV_01NcOSN=C=9hiE3UV3aYvrKzaGKm95Q2EQ8EA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+NbY1qbV_01NcOSN=C=9hiE3UV3aYvrKzaGKm95Q2EQ8EA@mail.gmail.com>

Hi Łukasz,

> > This does not look cros_ec specific. Could you check if this could be
> > made part of the ucsi core tracepoints?
> >
> 
> Good point. I will look into it.
> 
> > I can also look into this more carefully, and throw ideas if you like.
> > Let me know.
> >
> 
> I would definitely like to hear your ideas on the topic :).

This information is more or less the same that you would like to get
from that netlink interface, right? If that's the case, then is there
some reason why you want to get the same information from two
different interfaces? Sorry if I'm missing something obvious.

thanks,

-- 
heikki

