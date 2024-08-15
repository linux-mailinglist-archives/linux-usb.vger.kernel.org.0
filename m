Return-Path: <linux-usb+bounces-13515-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD14952EDB
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 15:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2826A2858C0
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 13:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239C819DF9A;
	Thu, 15 Aug 2024 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3OumTHi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294791714A2
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723727619; cv=none; b=GonqK9ll3mj0pU2/gUEoMugZfFjIXOOHvx2WefMhV9C1hxDNvp3hMp3QTbnhxLt1H9bBYXXWZ0PsSlmMr0uNBZlUSFd5zw2N0GgCxKByrDtRqWiHbwI6N7hpefBUi2zs5l2elmUGtI2v1hj4B3TJZxUPVTJkJ5wjuX+VgC3P28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723727619; c=relaxed/simple;
	bh=RF7pxv1/Jo+n9yBNJdQCbrL2EKwdNKXfVcRALJcbqMg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Do24UkxU4MWtacE3EMG1Fj9HlKaN5iuz7ZiYDodc2QBfVNjBoAfzZAFbKX4TuV+m7cSgfm79NrcNSUE0g9ndSYsNFe8Ofp1jZG5t7g4e5YeLET/ON4YFcDyqkgXPMhWwPa8dSRZN2zuOC7gUtiWkurxZe6fwb8Iuys83uXxIpD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3OumTHi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723727618; x=1755263618;
  h=message-id:date:mime-version:subject:from:to:references:
   in-reply-to:content-transfer-encoding;
  bh=RF7pxv1/Jo+n9yBNJdQCbrL2EKwdNKXfVcRALJcbqMg=;
  b=Y3OumTHiYvTV6PxiTgZzZZ8un+atF1KYw0pyziu8AzHm+eogh+6nWulH
   gWJdPMVGM7mY4ws3T0OK5ik++qDykqnST2za2TJKHgQTrKvuGkOt/v5Xv
   VWOe7vZMzfgX1nHJ1Xz/OnoH7MJy6fel8OTS6zBCgfqW1DiaD4M+tRC68
   pcfrNyCejMIdWAgU55zC51Y+0mxE25JlnWlbFdZn87TTE2ltEHQQ/gEsH
   uYByXEq/ulMHH/dh6gbF/TJnmEUV0NOM5SXijp0nm4xMYoFBu5B2Vj7ko
   CwQ1/YzXZqmrYkmR2EiiVyY3h5P4qA35BpiOrF1xsqSjGwc4AHB+H5AWk
   w==;
X-CSE-ConnectionGUID: 5slO1vffTquoAdTTOW2c3w==
X-CSE-MsgGUID: iq/w7Jm0RJa6vDsfGh30hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33134923"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="33134923"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 06:08:31 -0700
X-CSE-ConnectionGUID: 6lH3zHexQly5+/N7rrMM4Q==
X-CSE-MsgGUID: NBrc+ywhRa2vceN5TmdDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="59909045"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa007.jf.intel.com with ESMTP; 15 Aug 2024 06:08:29 -0700
Message-ID: <b481b087-2c47-4168-b33f-3ced69662ee3@linux.intel.com>
Date: Thu, 15 Aug 2024 16:10:32 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] USB xHCI driver NULL pointer dereference
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: Karel Balej <balejk@matfyz.cz>, linux-usb@vger.kernel.org
References: <D3CKQQAETH47.1MUO22RTCH2O3@matfyz.cz>
 <9f3d0886-51cb-4ec4-a060-ed0f52f7e656@linux.intel.com>
 <bb8ca342-a975-4e87-ae8d-7c0d703a89af@linux.intel.com>
Content-Language: en-US
In-Reply-To: <bb8ca342-a975-4e87-ae8d-7c0d703a89af@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.8.2024 16.28, Mathias Nyman wrote:
> On 13.8.2024 14.49, Mathias Nyman wrote:
>> On 11.8.2024 1.11, Karel Balej wrote:
>>> Hello,
>>>
>>> my machine crashed twice in the past week, the second time I have been
>>> able to recover the log output (including the stack trace run through
>>> scripts/decode_stacktrace.sh) which seems to suggest a bug in the xHCI
>>> driver:
>
>>
>> You have a unlucky setup here.
>> This could only happen when a full speed device fails enumeration while connected to a
>> Pantherpoint xHC.
>>
>> Only Pantherpoint xHC (PCI_ID 0x1e31) does bandwidth calculation in software and
>> calls xhci_reserve_bandwidth(). In this case we unintentionally end up calling it
>> after a failed  address device attempt when usb core re-inits endpoint 0 before retry.
>> At this point the xhci side of the device isn't properly allocated or set up so
>> we hit a NULL pointer dereference.
>>
>> I'll look into it more.
> 
> The following code should resolve this issue, any chance you could try it out?

I was able to trigger this myself by forcing XHCI_SW_BW_CHECKING and faking failure on
address device command:

[  270.538134] usb 3-6: new full-speed USB device number 3 using xhci_hcd
[  270.670313] xhci_hcd 0000:00:14.0: Faking a Device not respoinding to setup address
[  270.886142] usb 3-6: device not accepting address 3, error -71
[  270.892091] BUG: kernel NULL pointer dereference, address: 0000000000000008
[  270.899034] #PF: supervisor read access in kernel mode
[  270.904150] #PF: error_code(0x0000) - not-present page
[  270.909267] PGD 0 P4D 0
[  270.911799] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[  270.916660] CPU: 3 UID: 0 PID: 301 Comm: kworker/3:2 Tainted: G        W          6.11.0-rc1+ #4291
[  270.925651] Tainted: [W]=WARN
[  270.928615] Workqueue: usb_hub_wq hub_event
[  270.932787] RIP: 0010:xhci_reserve_bandwidth+0x243/0x6d0 [xhci_hcd]

The codesnippet I suggested did fix the null pointer dereference.

I'll turn it into a proper patch

Thanks
Mathias


