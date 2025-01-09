Return-Path: <linux-usb+bounces-19160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE1A0725D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 11:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4A1318883F1
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 10:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAC5215786;
	Thu,  9 Jan 2025 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7uPyV6W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B30201020;
	Thu,  9 Jan 2025 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417049; cv=none; b=hVgtQoTBchg/5cdu7jtqfiAD7Q/gsO2aIE2x3AhWWvIv/LeZmfeqGhTJAWc9JUboivrcntlfrJP/2+Eq4fIvkLmc15E5Vuh74eyUolF06jVjnl4TryBhWEu5axVCb/9sbRJLaKS+esuw2o0R3LR9oeMTjMutoIR0+dDcvsnRmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417049; c=relaxed/simple;
	bh=J0WAdkHGxdmkeyVlguVeBoFAZDtuSpc6c6lenN9MOZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INrt4FHtTKzoqkwfxwiQ5ETLeKJEtFgrQpqyRMZx7U+0cSnZbNyFs/ul8oipllK3ko+pf+Xk9GOCvp6GvLAGJSt+F9o5zis50nS4VuN2dN0I2huTfEwxyVmS2UhAGGPJspagUeLpL5EJ70TOFqie0ABs/0pCdr3IakTYQ2UPhmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7uPyV6W; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736417048; x=1767953048;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J0WAdkHGxdmkeyVlguVeBoFAZDtuSpc6c6lenN9MOZE=;
  b=Y7uPyV6W33Aaaj5RV5w/Cb2HR5w6pe7BKksojVVfHsYltstWtsYVAnuf
   5x7xF12NtAPun0yFQXXxGooYfVzpKeJJnILatzLn0VB9P4xV63/nS0EJy
   lrOricjLv1JGE9XREquJ86kUKl40nUPtCNtWk+HSbXzjk5UVlJLnq5R6Q
   kYcM7bvHixRJMHTrHdZUpsEkizgt1z1cWqjsdt7dSSSp/xCQyeMDsbb0A
   oOdKCUjKwfieUU6+zSImMMengbsHOqEKytNpqpy9ScwYNNBGx9BGX8ZTb
   lEg8OCIbPGGKQuJg6L6353ESSCnHWhnNpPJhQv5I5G7JAcFiE5CtsrRJ2
   A==;
X-CSE-ConnectionGUID: CqRCAyLpRNSic1ux6BSqpg==
X-CSE-MsgGUID: wBT+KBpuSNWjDO4gFlcmnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54088286"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="54088286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 02:04:06 -0800
X-CSE-ConnectionGUID: PWJz2EvHRAW+q6qBg0fttA==
X-CSE-MsgGUID: jl8qy/TvSNWW3VEFSHaZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108466228"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 09 Jan 2025 02:04:02 -0800
Message-ID: <1f8f3630-e96a-4929-b95f-46002c8d0143@linux.intel.com>
Date: Thu, 9 Jan 2025 12:04:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: host: xhci-plat: Assign shared_hcd->rsrc_start
To: WangYuli <wangyuli@uniontech.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 niklas.neronin@linux.intel.com, quic_wcheng@quicinc.com,
 andriy.shevchenko@linux.intel.com, michal.pecio@gmail.com,
 guanwentao@uniontech.com, zhanjun@uniontech.com, bigeasy@linutronix.de,
 balbi@ti.com, hkallweit1@gmail.com, Xu Rao <raoxu@uniontech.com>
References: <7ECE325975663D2D+20250104155111.100597-1-wangyuli@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <7ECE325975663D2D+20250104155111.100597-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4.1.2025 17.51, WangYuli wrote:
> When inserting a USB device, examining hcd->rsrc_start can be
> helpful in identifying which hcd is mounted, as the physical
> address represented here is typically unique.
> 
> The following code snippet demonstrates this:
>    struct usb_hcd *hcd = bus_to_hcd(udev->bus);
>    unsigned long long usb_hcd_addr = (unsigned long long)hcd->rsrc_start;
> 
> However, this approach has limitations now. For USB hosts with an
> MMIO interface, the effectiveness of this method is restricted to
> USB 2.0.
> 
> Becase commit 3429e91a661e ("usb: host: xhci: add platform driver
> support") assigned res->start to hcd->rsrc_start. But
> shared_hcd->rsrc_start remains unassigned, which is also necessary
> in certain scenarios.

Could you expand on those scenarios?

Is it possible those could be solved with something like:

unsigned long long usb_hcd_addr;
struct usb_hcd *hcd = bus_to_hcd(udev->bus);

if (!usb_hcd_is_primary_hcd(hcd))
	hcd = hcd->primary_hcd;
usb_hcd_addr = (unsigned long long)hcd->rsrc_start;

That should work for all hcds.

Thanks
Mathias


