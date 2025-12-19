Return-Path: <linux-usb+bounces-31636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED7CCFE25
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 13:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1272D30223E1
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 12:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED0C329E65;
	Fri, 19 Dec 2025 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fU+CFVns"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2382F25FB;
	Fri, 19 Dec 2025 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766148544; cv=none; b=fL+3k+OIQAQ3l5D9cODzDGqPnOKaTlH18uJBrP7VyCDIYw2IhgJcZHys7T0cHD6ls4lKWygwJXcXT2hS8P+Sf9RPKVWDfA5WmtbIqSEzmFSkaljTr/C791Q+h9gzCiMtOGWK6LokfLOEVDZDjljY11MK9D13Bx8zlonz0tK7Kes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766148544; c=relaxed/simple;
	bh=vNoLmA6jXFHjaxRGMII6E8iSvRmtYfcJwVtOQJJhIqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzH6LCrG5mZgrkAQJtJs3A31GQUfXfRmOVeDHij3rVqLq3/4Hy1/YyoUrcZORULQUoPCSNCsk4QYY5+m/OUqCf/EIMZKeZrskO4HLFDbdkMcSSz3A2Qvns61aCsevgzLHr2KSqP6j4XWQfeS2RIym+zY5f3RKH855mvTANrPR7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fU+CFVns; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766148543; x=1797684543;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vNoLmA6jXFHjaxRGMII6E8iSvRmtYfcJwVtOQJJhIqU=;
  b=fU+CFVnsLbS+caBpMKdzP6RLT6pznHnDIqokqTQrCXGyZOo1n7aJwdsN
   DmoCzljYu5aoC3U2fS6HJH3SlHRv2KzB551sR7tGu4pCOBLkxBitc4sZk
   LQtJWbpbChEDNMs4J4Aim7xANOhzwTV8V7DHs2uPwoKrHHMsGoDBJSQrL
   kND4h1eKXrl0EPYMRzZREjQTkZzsxQfufWOG1RqKajObEtDibDaitVEv2
   B8uXrJPoO3zgPClVKkoaTKHc4TeQWGRC4Ue3yRVcO/UgTPCF0ABdu9cIG
   ZXJBUSNssvU70gLoDyx+IAsEUMFdN3ExEYCcDHaLl63jPy0fAdvcIKEzO
   w==;
X-CSE-ConnectionGUID: 2G4hAOHVTSCAKvxOsnFa0Q==
X-CSE-MsgGUID: n9O5K0K/SxOlOkGDfpj7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71739178"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71739178"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:49:03 -0800
X-CSE-ConnectionGUID: rzdh/xfCSyuKW723v+vgXw==
X-CSE-MsgGUID: 9XKaticPQtOjSNIWKK747w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="199108598"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.43]) ([10.245.245.43])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:49:00 -0800
Message-ID: <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
Date: Fri, 19 Dec 2025 14:48:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sarah Sharp <sarah.a.sharp@linux.intel.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/19/25 09:18, 胡连勤 wrote:
> From: Lianqin Hu <hulianqin@vivo.com>
> 
> Considering that in some extreme cases,
> when a digital headset is connected and a wake-up
> operation is performed,if the headset is plug out
> or the headset connection is abnormally disconnected at this time,
> segment_pool will be set to null, resulting in accessing a null pointer.
> 
> So, add null pointer checks to fix the problem.
> 
> Call trace:
>   dma_pool_alloc+0x3c/0x248
>   xhci_segment_alloc+0x9c/0x184
>   xhci_alloc_segments_for_ring+0xcc/0x1cc
>   xhci_ring_alloc+0xc4/0x1a8
>   xhci_endpoint_init+0x36c/0x4ac
>   xhci_add_endpoint+0x18c/0x2a4
>   usb_hcd_alloc_bandwidth+0x384/0x3e4
>   usb_set_interface+0x144/0x510
>   usb_reset_and_verify_device+0x248/0x5fc
>   usb_port_resume+0x580/0x700
>   usb_generic_driver_resume+0x24/0x5c
>   usb_resume_both+0x104/0x32c
>   usb_runtime_resume+0x18/0x28
>   __rpm_callback+0x94/0x3d4
>   rpm_resume+0x3f8/0x5fc
>   rpm_resume+0x1fc/0x5fc
> 
> Fixes: 0ebbab374223 ("USB: xhci: Ring allocation and initialization.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> 
>   drivers/usb/host/xhci-mem.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index c708bdd69f16..2ea5fb810a80 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -35,6 +35,9 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
>   	dma_addr_t	dma;
>   	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
>   
> +	if (!xhci->segment_pool)
> +		return NULL;
> +

The xhci->segment_pool is created in xhci_mem_init() and destroyed in xhci_mem_cleanup().
It should never be NULL when xhci driver tries to allocate a ring segment.

If you can trigger a null pointer dereference here, then please share a backtrace.
There is likely something else is wrong that needs to be fixed.

Thanks
Mathias




