Return-Path: <linux-usb+bounces-27095-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B71DAB2FD49
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 16:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03907177B3A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 14:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3909A1DED47;
	Thu, 21 Aug 2025 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WH4fRECY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45EF1D8E01
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787221; cv=none; b=X0g5gcIj2BFYm6lmX5qNNaGg0kyEPCexTWzTpA/mND82+zwnV9jh79UgbjvSduJsC+SNPOj2Zxd+sjJ1sFmx7qVtwag88pw5UbTMcCIdqrPd1Vf+hd3CMUrLUDZiHtb0I/q7DW5RzRklrUqFQuX+FQSiP4mttIPrwVQs4gfeH4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787221; c=relaxed/simple;
	bh=BDLMXAmQmv7UAqh33ZwIEuph0lcHuvCY+d+p55jjiZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXejy2Kq7mef8UQRRtyhR8SaA4RwfWEHcYthyx2jf/3L5zL9zzFtAn8ew8DylTwJVWTfHFA/L88YubUfKC/9nGTOznn7LC46Icp5qvv2H+KLfy4TOM4Dhv1fxr3V5Mld8tAKdSfpUHs2N5fRAA3Ni/ypF+O47zb7t9WRhoZIf2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WH4fRECY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755787220; x=1787323220;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BDLMXAmQmv7UAqh33ZwIEuph0lcHuvCY+d+p55jjiZ0=;
  b=WH4fRECYkk8K+z90KFAd5fLRGUnUizd6KmvqElfvyirKkKkJz/xV18H3
   ysOrSxH/gYxeg1Agvbg3QY6UKLTkl4u9o72AH6ITF9wqWbz5FQQcesqgP
   igaevyPnA+Py+Zq3yRb4GISuJae2WyEaNEOEO+WJ7XqLCT3I5cIaZ5uNN
   T+4DtVCE8UXVKuUdtZCbb7Su6H4ThtMRehaNtqmgDqY6iZeHIRx18HUpE
   xjCvhim1Zzlhf4elc2NXRmTKvJh22UXpMkcMexLuf6yV9gOl3PVFBotw8
   IGguz1ZT5MAO5muIU69C4NgmyzzUXHwCQq0s4UvZsF/h8AiMm8kmedcGE
   A==;
X-CSE-ConnectionGUID: l4hdyKcARba1kuqjb1zGqQ==
X-CSE-MsgGUID: VtWDcglnQQCzExAYTUZjIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61721570"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61721570"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 07:40:19 -0700
X-CSE-ConnectionGUID: mKcc6sQeT7G6vJOrmWQuMg==
X-CSE-MsgGUID: ZdAsYvxoT+ahDAIRuOYTug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172842444"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2025 07:40:18 -0700
Message-ID: <3146edf0-440d-4ee0-a7e5-251c7c9fc1cc@linux.intel.com>
Date: Thu, 21 Aug 2025 17:40:16 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Plugging USB-C adapter into one port results in `Failed to set U2
 timeout to 0x3f,error code -110`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 Kai-Heng Feng <kaihengf@nvidia.com>
References: <e6fa9169-fff7-4e44-90a4-e0efe4e176fd@molgen.mpg.de>
 <97d9420f-1a7f-433c-bdd7-b7bab6c45f00@linux.intel.com>
 <ff53c471-eeee-44e3-b50c-49212227927a@molgen.mpg.de>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ff53c471-eeee-44e3-b50c-49212227927a@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

>> Could you try running with the following kernel parameters set:
>> "usbcore.quirks=2109:0817:k"
>> to prevent Link Power Management (LPM) for the external hubs
> 
> With this set, I am unable to reproduce this.

good, that narrow this down to LPM

> 
>> "usbcore.autosuspend=-1"
>> to prevent runtime suspend of all usb devices
>>
>> Does adding either one, or both help?
> 
> I only tried the first one. Is that enough?

Yes, this is enough thanks, your trace file shows the USB link goes to "error Inactive" state
shortly after enabling link power management.

> I uploaded everything to the Linux Kernel Bugzilla [1].
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=220460
> 
I'll add more details to the bug

Thanks
Mathias

