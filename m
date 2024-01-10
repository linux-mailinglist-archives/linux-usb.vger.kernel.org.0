Return-Path: <linux-usb+bounces-4922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E2829CE4
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 15:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38461F215E9
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 14:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E120A4BA80;
	Wed, 10 Jan 2024 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ko/a2VRC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE764B5D7
	for <linux-usb@vger.kernel.org>; Wed, 10 Jan 2024 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704898495; x=1736434495;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=wjhBD+C49rVm4fmEdO8VgVQbWagWDrvBSGYGUs5z/g8=;
  b=ko/a2VRCiL7ettD9T++E9z/OPsHqyIUaQr7XChnnPtHCJG2YARM3ZhM1
   eLdnP8iTLleedvFPK/uileyQDduEkgknvi6uUGUpVG32PMDDRPVsTWHga
   bf4qOky7kBEYqJ2J4SKk5xtSWy8PY/BriG9PJmy2DbPCBX/j1Rhd4eXWE
   kPGgjiAybEDIm/7j1lVC9MCsIy4hPQfuRKU7ElSl/Jy221VSR0i4MgGeF
   RWtISIYJriqJJOdPF7SIQwV5shPUyPGXGoWiqa8M1guJ6aqjZwqNHmChW
   cMCYa+xC1T+JJTxCrqIQ+Is8aP31fUnwIrg1TsSiim0RpCZPM8WYIhsol
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5290212"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5290212"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 06:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="731873304"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="731873304"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 06:54:51 -0800
Message-ID: <9c923227-f139-aad4-1040-40c2636c4dac@linux.intel.com>
Date: Wed, 10 Jan 2024 16:56:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [bug report] xhci: add support to allocate several interrupters
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
References: <e9771296-586d-456a-ac24-a82de79bb2e6@moroto.mountain>
 <1392587e-3ff2-4068-0df6-b09734a96164@linux.intel.com>
 <1fbc12eb-f912-e7aa-966d-3f7115ccf532@linux.intel.com>
In-Reply-To: <1fbc12eb-f912-e7aa-966d-3f7115ccf532@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.1.2024 16.54, Mathias Nyman wrote:
> On 10.1.2024 16.03, Mathias Nyman wrote:
>> Hi
>>
>> On 10.1.2024 15.15, Dan Carpenter wrote:
>>> Hello Mathias Nyman,
>>>
>>> The patch c99b38c41234: "xhci: add support to allocate several
>>> interrupters" from Jan 2, 2024 (linux-next), leads to the following
>>> Smatch static checker warning:
>>>
> 
> Patches for both cases you reported are not in my for-usb-linus branch:

are _now_ in my for-usb_linus branch

> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=for-usb-linus
> 
> Once 6.8-rc1 is out I'll rebase on top of it and send them to the list.
> 
> Thanks
> Mathias


