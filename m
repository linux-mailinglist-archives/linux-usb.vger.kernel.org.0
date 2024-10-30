Return-Path: <linux-usb+bounces-16851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D93FD9B5DCB
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 09:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1721C1C20B09
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 08:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA5C1E0E1C;
	Wed, 30 Oct 2024 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1pwSpyk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7AE1E0E05
	for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 08:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730276822; cv=none; b=dkoKKU+6OmM+UgzPMEkjkPztvDDvztdlzV+BGA8PNRAWSq/ae90Z0G+VGzBbfbWClw5qn2Uu4YSIoo1vMDmjW9KkZtZvU7LV3gcUfkof0cMvUu7/EX1c6I47/Qkw7NxCXRU4u/7Fc9Kmdmka1yhaiPA9yIb10XzWhzekzqPHiAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730276822; c=relaxed/simple;
	bh=K19VYOm/H1DT4B0evQ+cwtwmEk6yVi/bHIa1epBQk6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpqMGFkr2Tk0Ir2BoxeONUXfXUkdVW9IkwTnmtURN137K+w0KacAHAAQTPPr0roPJvX6y4ZmyMR93AiSNczhtQk+FDEUNNrOKinD2GGrcgJSKoR5ZQWqJPAwH30tlQUkbPOickCdjsu0OUhjyiYHgTE48S0ex4CzchF/wiA91ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1pwSpyk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730276820; x=1761812820;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=K19VYOm/H1DT4B0evQ+cwtwmEk6yVi/bHIa1epBQk6c=;
  b=X1pwSpyk4NTHuA+Sy2jFD3FDKN0QWqLI1kxLmZ/JIAEkFmIRd9Y6pNtl
   EBs5BV2p26GYSbs6Wtugc4d4OHVtxLB6t1mWiqrAhQJQvDny416pWOwq+
   +R73rkeJpLCctbVr/X17bWqHDcIWvcCloI65c1TLA4icmDrW3BwKP07Rf
   xJIvNVPqC1kgNimaZRfQcHIcOIKSrPwW376Vp80bOZj4B0Y0z+9UB0V0E
   rIyZ2vEgHNL7PLQKWhwMwLbQbOVBLSj+OFrjnrczbG7ZlgCFt9ZMBAfBG
   ne982Y6i0qPVJMvmg8QFnSkbR3D2z34xm1+dhb9lTM2s8/u8zpRbSXy2J
   Q==;
X-CSE-ConnectionGUID: Yb3wc9ylS/GLr/fUWQlh0g==
X-CSE-MsgGUID: MLZ1SiXDSZyni4BuWIISFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30177536"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="30177536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 01:26:59 -0700
X-CSE-ConnectionGUID: a2uHkfkqRC2DXldnvl+Gzw==
X-CSE-MsgGUID: DW9twJFFTNKosEOBCWJ8mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="86843061"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2024 01:26:58 -0700
Message-ID: <35fdb2a4-8514-4b4d-9332-127d6ed07908@linux.intel.com>
Date: Wed, 30 Oct 2024 10:29:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, "Neronin, Niklas" <niklas.neronin@intel.com>
References: <20241025121806.628e32c0@foxbook>
 <20241028083351.655d54cf@foxbook>
 <f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
 <20241029092800.32eccf3b@foxbook>
 <7c2abdd1-c209-4616-9d18-be5fc99fc527@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <7c2abdd1-c209-4616-9d18-be5fc99fc527@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.10.2024 11.16, Mathias Nyman wrote:
> On 29.10.2024 10.28, Michał Pecio wrote:
>>
>> By the way, I think this race is already possible today, without my
>> patches. There is no testing for SET_DEQ_PENDING in xhci_urb_dequeue()
>> and no testing in handle_cmd_stop_ep(). If this happens in the middle
>> of a Set TR Deq chain on a streams endpoint, nothing seems to stop the
>> Stop EP handler from attempting invalidation under SET_DEQ_PENDING.
>>
>> Maybe invalidate_cancelled_tds() should bail out if SET_DEQ_PENDING
>> and later Set Deq completion handler should unconditionally call the
>> invalidate/giveback combo before it exits.
>>
> 
> I think you are on to something.
> If we add invalidate/givaback to Set TR deq completion handler, allowing
> it to possible queue new Set TR Deq commands, then we can bail out in
> xhci_urb_dequeue() if SET_DEQ_PENDING is set.
> 
> xhci_urb_dequeue() would not queue a extra stop endpoint command, only
> set td->cancel_status to TD_DIRTY dirty, and Set TR Deq handler would
> not ring the doorbell unnecessary.
> 
> Sounds like a plan to ne.

I wrote a testseries for this.

1st patch avoids stopping endpoint in urb cancel if Set TR Deq is pending
2nd patch handles Set TR Deq command ctx error due to running ep.
3rd patch tracks doorbell ring with a flag. It's for now only used to prevent
     infinite stop ep retries. Flag is not properly cleared in other cases.

Series can be found in my tree in a fix_stop_ep_race branch:

https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_stop_ep_race
git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_stop_ep_race branch

Do these help in your NEC host case?

I'll see if I can set up some system to trigger this myself

Thanks
Mathias


