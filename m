Return-Path: <linux-usb+bounces-28111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E290B57B93
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A4D67B2F4D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 12:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582A82D63F6;
	Mon, 15 Sep 2025 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBuiGV8n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7C61D9346
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940307; cv=none; b=hOuAo5pDl8lByJLQOnODiVlITAqOHk9627oOWFqQH4NPcM4JboTTcjaQx3DrpCGEcQCzd786dZLbWapQZF1XxYOWT93v85wnjdsS6Rlsu635916wtBApLh67UElTlFmzHwG3iiQXLHjYL6L78UjauLCDi9HXJ+U8l2oBmZ5DOFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940307; c=relaxed/simple;
	bh=CNcS7/7KVZ/eFOLlqmMT175KvAeXxT5qq2/8+VICH8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMF3iSQVDbnwZG+MONLgqhZC5Yyk9llPZIDgUJilZ5IpXRIfX6kalKkO+ZF4bxpRYm1obSDKV6ve8Aq8A8L9F2xCkTtMwQGN4B7/wXF/laWG+v8UuFTz/qxHzfmd/2LiW4n+YOmUPsuemJGKEMXtt3WRgmOa20OnW43Smkf5O4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBuiGV8n; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757940306; x=1789476306;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CNcS7/7KVZ/eFOLlqmMT175KvAeXxT5qq2/8+VICH8s=;
  b=bBuiGV8nBI+nWce7X1ro5ma0R5IpnlMH5kUI4jrFnc3RS2p2qid6nx7u
   M11kvjzP9C5Oz6i1vqDq/g0d1DhXjl6Fvmv/pu08bLp+yD+QTwwWFjjz4
   6CTEOq7MMsZacPzgSVh8i/pt2pZHUptAzrhANmtuJM9cH6pfG+FJM0AQ6
   w4BAaXHQWfl05n/2mxNyTzac5x5mkhOt3n4joe1K3zi2+ew/iaLo83wUD
   k7PIxoW3MroXRIIH5DRbhhemJPXLfthoI7lEbvIUWwCjiwVxVPwn3FIF4
   5CqNG6ruQvbwWbimOr/hyDZraQkpcxAj1XbxI9BzwU48w/bvn3KkuA4Re
   A==;
X-CSE-ConnectionGUID: Atwzz7RgSsOWjS2xs6rkNw==
X-CSE-MsgGUID: +loBoOt8RICdep66xIDngg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="62820509"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="62820509"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:45:05 -0700
X-CSE-ConnectionGUID: YVFr2rSwSTirJSZeGsa3dA==
X-CSE-MsgGUID: 7MFTHE0XSUyeF0+kreyn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="174560566"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.255.79]) ([10.245.255.79])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:45:04 -0700
Message-ID: <f7816a29-6e9a-4edf-b9b7-5614d112f62b@linux.intel.com>
Date: Mon, 15 Sep 2025 15:45:01 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] usb: xhci: improve Endpoint Context register
 debugging
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
 <20250903170127.2190730-5-niklas.neronin@linux.intel.com>
 <20250909112017.707158a9.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250909112017.707158a9.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2025 12.20, Michal Pecio wrote:
>>  drivers/usb/host/xhci.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index 59ff84ba2d4a..2662356d048e 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -2580,9 +2580,9 @@ static inline const char *xhci_decode_ep_context(char *str, u32 info,
>>  	ret += sprintf(str + ret, "interval %d us max ESIT payload %d CErr %d ",
>>  			(1 << interval) * 125, esit, cerr);
>>  
>> -	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq %016llx ",
>> +	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq %016llx cycle %llu",
>>  			xhci_ep_type_string(ep_type), hid ? "HID" : "",
>> -			burst, maxp, deq);
>> +			burst, maxp, deq & TR_DEQ_PTR_MASK, deq & EP_CTX_CYCLE_MASK);
> 
> Does it really bother people who use debugfs that deq includes the
> cycle bit, which is exactly what anyone who know xHCI will expect?

Not only because of the cycle bit, but also for the other bits. All 64-bit
register are not exactly the same and clearly communicating what each value
represents is always preferable IMO. As demonstrated in the examples below,
bits 3:1 differ from one another.

Stream Context register, section 6.2.4.1.
 bit 0 - Dequeue Cycle State.
 bits 3:1 - Stream Context Type.
 bits 63:4 - TR Dequeue Pointer, is 16-byte aligned.

Endpoint Context register, section 6.2.3.
 bit 0 - Dequeue Cycle State.
 bits 3:1 - RsvdZ.
 bits 63:4 - TR Dequeue Pointer, is 16-byte aligned.

> This line is quite damn long already.

Is this really a problem for debugfs?
Should debugfs not be more verbose than debug messages? 
> Also, I am highly confident that you haven't even tested this patch.
> Try it and see what happens ;)

Nice catch, I'll add the missing space in v2. Thanks!

Best Regards,
Niklas 


