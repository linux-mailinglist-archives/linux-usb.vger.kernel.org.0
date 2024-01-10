Return-Path: <linux-usb+bounces-4918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEDB829BF3
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 15:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496DF286790
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 14:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E7C495E0;
	Wed, 10 Jan 2024 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIwVb1YX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D04B5A6
	for <linux-usb@vger.kernel.org>; Wed, 10 Jan 2024 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704895301; x=1736431301;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=jVw8sz1TJbk8FBScLvv4WC7fgfaXXXxM0FDJngQI3fg=;
  b=WIwVb1YX8cByFHiZj/gar4CclXreXBb3A7knxpB3GIkXseLkXrEc1vzs
   vI70C5YUgfKeg9YRlN25z7iH9pTZR4+zCMxyOAHq2536SZwQ7i7yvw4Ni
   WXpSeYSdzgn6Yc5xqLFh1TG/RpL/CokFtcxvhlX/zmz7vJRqIuUnU4dLr
   V2YYNWl/kXjFGyuOpaM+OCdl5Pls3pOyzTBnlLqjF5V3/OjF6biOTAOcd
   qcCQpZvq7NHvJrISgQZlhEYK6nnXYpJebAnkRkaFY+gSJwHOUELhkQlcd
   n+MsLPvKEt7uK7J2mYpGd25UHnie5jedXfE8Myf0g/Brdz/nNwS7099T7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5885626"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5885626"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 06:01:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="905546416"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="905546416"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2024 06:01:39 -0800
Message-ID: <1392587e-3ff2-4068-0df6-b09734a96164@linux.intel.com>
Date: Wed, 10 Jan 2024 16:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
References: <e9771296-586d-456a-ac24-a82de79bb2e6@moroto.mountain>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [bug report] xhci: add support to allocate several interrupters
In-Reply-To: <e9771296-586d-456a-ac24-a82de79bb2e6@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 10.1.2024 15.15, Dan Carpenter wrote:
> Hello Mathias Nyman,
> 
> The patch c99b38c41234: "xhci: add support to allocate several
> interrupters" from Jan 2, 2024 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/usb/host/xhci-mem.c:2331 xhci_add_interrupter()
> 	warn: array off by one? 'xhci->interrupters[intr_num]'
> 
> drivers/usb/host/xhci-mem.c
>      2318 static int
>      2319 xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
>      2320                      unsigned int intr_num)
>      2321 {
>      2322         u64 erst_base;
>      2323         u32 erst_size;
>      2324
>      2325         if (intr_num > xhci->max_interrupters) {
>                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This check predates your commit.

Yes, this is incorrect.
Should be intr_num >= xhci->max_interrupters.

> 
> 
>      2326                 xhci_warn(xhci, "Can't add interrupter %d, max interrupters %d\n",
>      2327                           intr_num, xhci->max_interrupters);
>      2328                 return -EINVAL;
>      2329         }
>      2330
> --> 2331         if (xhci->interrupters[intr_num]) {
>                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> But, yeah, it's an off by one.  This is allocated in xhci_mem_init().
> 
> 
>      2332                 xhci_warn(xhci, "Interrupter %d\n already set up", intr_num);
>      2333                 return -EINVAL;
>      2334         }
>      2335
>      2336         xhci->interrupters[intr_num] = ir;
>      2337         ir->intr_num = intr_num;
>      2338         ir->ir_set = &xhci->run_regs->ir_set[intr_num];
> 
> However, potentially there was already a bug here?  Normally "max" type
> names are inclusive and "number" or "count" type names are the count.
> So maybe > xhci->max_interrupters was correct and we should allocated 1
> more element.  But the code is kind of mixed with regards to whether
> it's a max or a count and I can't be sure one way or the other.

There was a bug, intr_num is basically an array index.
Luckily this doesn't cause any real word harm (yet) as xhci_add_interrupter()
is currently always called with a intr_num value smaller than xhci->max_interrupters.

git grep -B 3 "xhci_add_interrupter(x"
xhci-mem.c-     /* Find available secondary interrupter, interrupter 0 is reserved for primary */
xhci-mem.c-     for (i = 1; i < xhci->max_interrupters; i++) {
xhci-mem.c-             if (xhci->interrupters[i] == NULL) {
xhci-mem.c:                     err = xhci_add_interrupter(xhci, ir, i);
--
xhci-mem.c-     if (!ir)
xhci-mem.c-             goto fail;
xhci-mem.c-
xhci-mem.c:     if (xhci_add_interrupter(xhci, ir, 0))

Thanks
Mathias

