Return-Path: <linux-usb+bounces-13374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022E950408
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 13:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4250A1C2243D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 11:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFBB1991C6;
	Tue, 13 Aug 2024 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1AY8Z3Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752E8442F
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 11:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723549641; cv=none; b=XvXCX3mgTlzAJXgFRYMT5RUngMfTY1lZbQ+Su2Mcmb/0tdbiOdBA/S72PtDtGnyXBubbbk83vZ4i4kFGznafNppwOW5qr954ZUw+x/f1KCxq2bSYcZNW1XY6+WNLFj9YqONE51XSOaVGlrUTTcvRkJLWlUxM+8+RdT11FXvFpBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723549641; c=relaxed/simple;
	bh=gXKDcmOuHi09tsAsjcsH2xHsQiBWEudqw/ZHT2UpPaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=i6qRQneqDYrDE4vlxUAUloL87rulGHKOAY1Oe1yyerzBhZKfEyg292K92xK1665WGwnC5tZkG0++ETyrcbk8y4UQoTW25UV0F9uwgpcLsNF1zrexAfahxMXKXJRs9kUIA4G5MPoiPfbloVvLq7BjEOXt8TVB4Scphlmia59dLRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1AY8Z3Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723549640; x=1755085640;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=gXKDcmOuHi09tsAsjcsH2xHsQiBWEudqw/ZHT2UpPaI=;
  b=d1AY8Z3ZnSRQ3QSoWlsC5FIflhU7psm0Ov/itgj+z4FdOJVt4QvWF1TP
   RRRpBIZRIV2174t26Z8vahsCcDjhg6lVA98UTdZmo42uKoO0hAlKy2+bX
   hBCSzqb6LxqDR0Y6RQ66biqU6dI92f71j7aFq4rG+Mx9dcXGROeaRwls9
   YU9OC8+xUcRZw8vdc1Y8MqXn+IL/q83KIaRCbfSiErtLEdDfN49m3j6Cp
   zek6J3v0RzmXR3io7FuZtQK5aED1XXuXyiz+aFSPbYnE2xJ6qpVDY60um
   epLKv5/u8ZnKKvljWwtQ2Kx3JfEN7lsVAo+C8FfbxLvCNMHOnnl2tClXf
   A==;
X-CSE-ConnectionGUID: tdkMW1dLShKCu6th0FM/6A==
X-CSE-MsgGUID: /ckqk2mbSxykAeQBRLAHKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21523322"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21523322"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:47:20 -0700
X-CSE-ConnectionGUID: pzeqEaNfS8KIcL8Asf465Q==
X-CSE-MsgGUID: jt82eWjKSnaQrcPEMqEoSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63037952"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 13 Aug 2024 04:47:18 -0700
Message-ID: <9f3d0886-51cb-4ec4-a060-ed0f52f7e656@linux.intel.com>
Date: Tue, 13 Aug 2024 14:49:22 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] USB xHCI driver NULL pointer dereference
To: Karel Balej <balejk@matfyz.cz>, linux-usb@vger.kernel.org
References: <D3CKQQAETH47.1MUO22RTCH2O3@matfyz.cz>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <D3CKQQAETH47.1MUO22RTCH2O3@matfyz.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.8.2024 1.11, Karel Balej wrote:
> Hello,
> 
> my machine crashed twice in the past week, the second time I have been
> able to recover the log output (including the stack trace run through
> scripts/decode_stacktrace.sh) which seems to suggest a bug in the xHCI
> driver:
> 
> 	[44193.556677] usb 2-1-port5: disabled by hub (EMI?), re-enabling...
> 	[44193.556692] usb 2-1.5: USB disconnect, device number 6
> 	[44193.558532] cdc_ncm 2-1.5:1.0 enp0s29u1u5: unregister 'cdc_ncm' usb-0000:00:1d.0-1.5, CDC NCM (NO ZLP)
> 	[44193.739545] usb 2-1.5: new high-speed USB device number 7 using ehci-pci
> 	[44193.819628] usb 2-1.5: New USB device found, idVendor=18d1, idProduct=d001, bcdDevice= 6.10
> 	[44193.819637] usb 2-1.5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> 	[44193.819641] usb 2-1.5: Product: Samsung Galaxy Core Prime VE LTE
> 	[44193.819644] usb 2-1.5: Manufacturer: Samsung
> 	[44193.819646] usb 2-1.5: SerialNumber: postmarketOS
> 	[44193.842472] cdc_ncm 2-1.5:1.0: MAC-Address: [...]
> 	[44193.842770] cdc_ncm 2-1.5:1.0 usb0: register 'cdc_ncm' at usb-0000:00:1d.0-1.5, CDC NCM (NO ZLP), [...]
> 	[44193.845829] cdc_ncm 2-1.5:1.0 enp0s29u1u5: renamed from usb0
> 	[46253.017991] perf: interrupt took too long (2506 > 2500), lowering kernel.perf_event_max_sample_rate to 79000
> 	[46709.344533] usb 3-1: new full-speed USB device number 3 using xhci_hcd
> 	[46709.458560] usb 3-1: device descriptor read/64, error -71
> 	[46709.679562] usb 3-1: device descriptor read/64, error -71
> 	[46709.895544] usb 3-1: new full-speed USB device number 4 using xhci_hcd
> 	[46710.009563] usb 3-1: device descriptor read/64, error -71
> 	[46710.231579] usb 3-1: device descriptor read/64, error -71
> 	[46710.333629] usb usb3-port1: attempt power cycle
> 	[46710.713538] usb 3-1: new full-speed USB device number 5 using xhci_hcd
> 	[46710.713699] usb 3-1: Device not responding to setup address.
> 	[46710.917684] usb 3-1: Device not responding to setup address.
> 	[46711.125536] usb 3-1: device not accepting address 5, error -71
> 	[46711.125594] BUG: kernel NULL pointer dereference, address: 0000000000000008
> 	[46711.125600] #PF: supervisor read access in kernel mode
> 	[46711.125603] #PF: error_code(0x0000) - not-present page
> 	[46711.125606] PGD 0 P4D 0
> 	[46711.125610] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
> 	[46711.125615] CPU: 1 PID: 25760 Comm: kworker/1:2 Not tainted 6.10.3_2 #1
> 	[46711.125620] Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./Z77-D3H, BIOS F18 08/21/2012
> 	[46711.125623] Workqueue: usb_hub_wq hub_event [usbcore]
> 	[46711.125668] RIP: 0010:xhci_reserve_bandwidth (drivers/usb/host/xhci.c:2392 drivers/usb/host/xhci.c:2758) xhci_hcd

Thanks for the report.

You have a unlucky setup here.
This could only happen when a full speed device fails enumeration while connected to a
Pantherpoint xHC.

Only Pantherpoint xHC (PCI_ID 0x1e31) does bandwidth calculation in software and
calls xhci_reserve_bandwidth(). In this case we unintentionally end up calling it
after a failed  address device attempt when usb core re-inits endpoint 0 before retry.
At this point the xhci side of the device isn't properly allocated or set up so
we hit a NULL pointer dereference.

I'll look into it more.

Thanks
Mathias

