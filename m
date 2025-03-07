Return-Path: <linux-usb+bounces-21507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C109A56D70
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 17:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6615416C809
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 16:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE1423A9AE;
	Fri,  7 Mar 2025 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQx5qNL2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7731238D22
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364386; cv=none; b=AE/ijLDQyO1cyASbfFC8ntlppvpj71B6IWzdnL6/Tg5VMF3/uqjZd5D2gKUjCUIV5f8H3qtGUNnYngOBCMBK+rqeZNk0Zqo+fGni3+l5AEva19BrGsObgvgZjjsDGnyH3ye2eTrpHaLa2HX7Jshxw56cYKoNb1hYPyMTvUQIbxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364386; c=relaxed/simple;
	bh=qjCTbatshrL1vjxmrqhFyhVe7mf061U+CX4ZH3sX95U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8yjT7NrL32XxOtHjj8VKzA4xCJKdOwW1Vf19NbOA+W5qahCk13HD04m5sRpyp2HBwRqmq5ZbNkUTkwS01Viw/xa/CSBt9gETNHXdn3iJ7vtS0tKor3NAWa16R+8tNdWj5o1idKI7PSB8CnurWq6qgd91gXNhEOKtFnwsZq+KAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQx5qNL2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741364385; x=1772900385;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qjCTbatshrL1vjxmrqhFyhVe7mf061U+CX4ZH3sX95U=;
  b=FQx5qNL2Gb+L5ZUx0rL/JZj3UWT15WFF5Q8QR3LmRIEM8/5NE0WV20g0
   Vn4AndV1RWJm8wJFJ7nfaFQ6Mh3a7M1mFe8H6onTTyAgFpxmSCyohhdz3
   OG/W4dWnUJhb2P6B2cBaqnlTO0M5fR22iBV47hzZu959u/CRL9l2aRFkf
   /VdGhXww+UiHojA3mPtHqGYACYAGMibIL0GZTc7+90F2eECb/udGwlYM1
   IqTKZdHHRM4gfkFZWfuwerKE6iaQapQLSY/G0GPlLD+bBTLXasOE9JTs/
   n4WIE5nNb2CcF2YFAASaxOEPlexCWpUuqC2nD4KgcssOFy/zSs9lJldQH
   Q==;
X-CSE-ConnectionGUID: 25lzkcj8RPm/xN/q410Z/A==
X-CSE-MsgGUID: aHtG37rmStSLaCPfBNlyEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53807488"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53807488"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:19:44 -0800
X-CSE-ConnectionGUID: COvpiPaORt6TaDb8w6A4jA==
X-CSE-MsgGUID: D5/v7ySNSEiQhwiJsZjlxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119115428"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2025 08:19:40 -0800
Message-ID: <d12c09e6-79f6-4490-ae24-a5c8f30c94a8@linux.intel.com>
Date: Fri, 7 Mar 2025 18:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM] usb: xhci_bus_resume cause irq lost issue
To: liudingyuan <liudingyuan@huawei.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "greg@kroah.com" <greg@kroah.com>,
 "patchwork-bot@kernel.org" <patchwork-bot@kernel.org>,
 "mricon@kernel.org" <mricon@kernel.org>
Cc: "Fangjian (Jay)" <f.fangjian@huawei.com>,
 Kangfenglong <kangfenglong@huawei.com>, yangxingui <yangxingui@huawei.com>,
 "fengsheng (A)" <fengsheng5@huawei.com>,
 lingmingqiang <lingmingqiang@huawei.com>,
 liulongfang <liulongfang@huawei.com>,
 zhonghaoquan <zhonghaoquan@hisilicon.com>,
 "yanzhili (A)" <yanzhili7@huawei.com>, "huyihua (A)" <huyihua4@huawei.com>,
 "Zengtao (B)" <prime.zeng@hisilicon.com>,
 "shenjian (K)" <shenjian15@huawei.com>, liuyonglong
 <liuyonglong@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
References: <520cb5bb27b640e588f898ac60a52c0a@huawei.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <520cb5bb27b640e588f898ac60a52c0a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6.3.2025 16.29, liudingyuan wrote:
> 
> I compiled a new kernel based on the fix code you provided below and conducted some preliminary tests.> In the repeated unregister/register tests of the xHCI controller that previously caused issues,  both the driver and USB-related functionalities are now working normally.
> (Moreover, this fix code, in theory, should completely resolve the issues we encountered in our USB3-USB2 device-only scenario.)
> 
> Based on the logic mentioned in analysis, we currently may not have implemented a better solution to avoid disabling interrupts during the USB2 resume process. I would like to ask if we need to
> be concerned about the issue of interrupt loss caused by disabling interrupts in other scenarios where resume and enumeration processes or transfer operations might conflict?
> 
> For example, when a user inserts a device during the USB2/USB3 port resume, or when the USB3 controller is only connected to a USB3 devices, and the USB2 port enters this resume flow due to auto-suspend?
>   (However, it seems that the probability of these two scenarios is very low, as we have not yet been able to reproduce errors under these conditions.)
> 
> This fix indeed helps us avoid the current issue, so I would like to ask if it is possible to push this modification as a patch to the mainline code?
> If possible, we also plan to conduct a comprehensive test of USB functionality based on this modification to further validate it.
> 
> 
> Considering that the fix cannot completely avoid all possible scenarios where interrupts might be lost due to the hardware IE (Interrupt Enable) being turned off.
> I would like to ask whether the hardware design is reasonable in the following case:
> when a hardware edge-triggered interrupt is lost due to IE being disabled, and the subsequent interrupts cannot be triggered because the software didn't
> clear the EHB (Event Handler Busy) bit.
> 

I think we can avoid this situation by disabling the primary interrupter instead of all interrupts.
Meaning we would clear the 'Interrupt enable (IE)' bit:1  in  Interrupter Management Register (IMAN)
instead of the 'Interrupter Enable' (INTE) bit:2 in USBCMD register.

This way EHB and IP shouldn't be set at all, and thus not prevent future interrupts.

In practice this just means calling xhci_disable_interrupter() xhci_enable_interrupter()
instead of clearing and setting CMD_EIE bit.

I'll write a patch for this next week
Grateful if you could run the more comprehensive test before I queue it for
upstream (mainline)

Thanks
Mathias


