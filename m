Return-Path: <linux-usb+bounces-32425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E67D2EF09
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 10:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B64A53020686
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 09:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBCF357A41;
	Fri, 16 Jan 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL9DuZxM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E25313293
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556543; cv=none; b=ZQYltT5bVaB3saaTh6X9nsYBh4I9YMiR+vVqeD1F5IlEDib45IGqHU7ZxCYo31ODcn72xRxHCL2qJXhPdJZui2dA5TSKJDA8wPFMxD/vRUSrWtFHw5m5PihmPrZm2f5iA1TIPlH+uiSfZokzaN+skuU5pj0xDbaE0C2WQC3PG9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556543; c=relaxed/simple;
	bh=F1JGbhnXTCh8WsppYytEc04Kjpu6gQPNMm+53n0Vzlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2frctxg/j+Wxb8Jp7knYnlGqqvusqFFZa3DXgM+emTOYriygGiEA0hWMIp6DCyhDHHkYIz4KHvxa2XeKdWywB6GIXDfDq21qTlVMY6IfxO4dALu/n0ASxXPcw9BO1wKMBTtLW1YxBGe72XvW+XenmK5oX/bVbZPjVAyugFdZ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nL9DuZxM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768556542; x=1800092542;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F1JGbhnXTCh8WsppYytEc04Kjpu6gQPNMm+53n0Vzlo=;
  b=nL9DuZxMehBCZh/AvVmD/YhqptNsbur5Td1rLTVSZF96abDeyOF980eS
   EHqWN+XhprZEOBYmV1n3obUhrkKd2aX1kLtelWzvqRi25dKiesIOeB9jv
   vzLL4CTY96YA5CDdh4aW1v2R59qiD6+LqD0cdq8L5gq7m5VSkxt89RbeL
   4RdVISuK0g4we07p3vc6Q4Z8A3KhYBdoGv/ECYRVHfsImLSMNUVxqG3fE
   4MAXjwPnPBIdSosPSNEvayk6fIJ/7DgEhg8O2Lzl2SR86tzAawtL4CRT6
   +qaJowncuxjo212HmECQhrOZlrcL35RxcQPmHBEV71AHHbh4zOO0eiQnv
   Q==;
X-CSE-ConnectionGUID: 0TTQkm6CTumMwx/IPx+ZRw==
X-CSE-MsgGUID: ewganGz7RJqCiNqVKwgtYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81318369"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="81318369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:42:21 -0800
X-CSE-ConnectionGUID: nArW9w1TQ8O8ZxdgEuXS4Q==
X-CSE-MsgGUID: CzIA/xq/Svax3qjIl5IifA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205480759"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.142]) ([10.245.245.142])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:42:19 -0800
Message-ID: <6ca710b6-5abf-4d01-a27a-21c22e6cec87@linux.intel.com>
Date: Fri, 16 Jan 2026 11:42:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] usb:xhci:route device to secondary interrupters
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
 zhanjun@uniontech.com, kenny@panix.com
References: <E0F2AF44A50D04EB+20260116054611.4086487-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <E0F2AF44A50D04EB+20260116054611.4086487-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Thanks for the new revised version

On 1/16/26 07:46, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Some xHCI hosts expose multiple MSI/MSI-X vectors, but the driver
> currently routes all transfer completions through interrupter 0.
> This can lead to unnecessary contention on the primary event ring
> and IRQ vector.
> 
> Create a small set of secondary interrupters in xhci_mem_init().
> Cap the number in software (MAX_SECONDARY_INTRNUM, default 4).
> If any secondary allocation fails, roll back and keep using
> interrupter 0 only.
> 
> Unify primary and secondary handling on xhci->interrupters[].
> Use the same paths for enable/disable and teardown.
> Keep behavior consistent across run/stop/resume.
> 
> Route transfers per USB device (slot).
> Add vdev->interrupter in struct xhci_virt_device.
> Pick the default interrupter at device alloc time.
> Program TRB_INTR_TARGET() from vdev->interrupter->intr_num for
> bulk/ctrl/isoc/intr, so completions land on the selected event ring.
> 
> Route MSI/MSI-X IRQs to the right interrupter in xhci_msi_irq().
> Store the struct xhci_interrupter pointer in irq handler_data.
> Map vectors by index (0..N) to xhci->interrupters[].
> Keep STS_EINT handling restricted to interrupter 0.
> Spread MSI-X vectors with irq_set_affinity() and re-apply on resume.

Is spreading out the vectors somthing that we need to do manually,
and re-apply on resume?

I haven't looked into the affinity internals but would it be enough
to just add the PCI_IRQ_AFFINITY flag when calling  pci_alloc_irq_vectors()?

linux/interrupt-h also states that irq_set_affinity_hint() used here
is deprecated

Thanks
Mathias



