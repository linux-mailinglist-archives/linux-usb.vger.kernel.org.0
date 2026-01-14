Return-Path: <linux-usb+bounces-32338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60014D20004
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 16:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18891307C5FA
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 15:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0667435E551;
	Wed, 14 Jan 2026 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtJll8n/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0627EFFA;
	Wed, 14 Jan 2026 15:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405977; cv=none; b=ICdxkKADmKojOY+lCe14+vIRIVjSbihGMK2Oscxmxp5XLnB32+tjaWlv7TJF4xxu7mmMD7g2xlR8P9P9DQqiqlYXKF7i3pqv6rCsoJousWi5KCiTAsjgPbmR5taeUXuuBTCOWcF1fCrtVoH5b5dRgw94m2t4G5nFbVerqVnr87o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405977; c=relaxed/simple;
	bh=RN3yiLBRsmN33Aynyxt3sOAD5ndZL8sfjD2eNGBmKCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rK7prqSKgReXmhOHNX3u/AQkhuUv+VuNJ7Y4WgOR+SwHP8RNKOZxNnsKsD2hKuA4Lr2sWuGohVtnnRkE1gdEjRleHXM6YYaCiyT1qXSX4CZbm9/Il92XIaDi+sEh3bQuNnZlT7IOA7xuQwdLZZqgfYNEOdyQmuOh/sOBHHGofjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtJll8n/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768405975; x=1799941975;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RN3yiLBRsmN33Aynyxt3sOAD5ndZL8sfjD2eNGBmKCw=;
  b=WtJll8n/oFY/mLodPHJ+Bx/fgVWDu+AS9YnV/BYrmvfv4uFJveON4P/c
   kyYEbtnyEHaIxOVdz5Jz47vyLnXzX5HhqKgnRMw6IUnADyysC9iKIRxuN
   8FF8FUXFrFqa8mIKZ6tBpENKjyqfnvgENA8X3AMjkT0BTZEfoPIfH5aDi
   CuBVADv462YLUf2p6ClDSHM/4flJSE6PtJatZPFLP4T0reFndqr94IAPH
   yzpPKFF1wa0xe7BUqoNCMzydSx+dcYuYqT12ABhkr7xz2x5H6fLn5aCjV
   LRFpNGYWKAZQuBQTgLnGpeNwVnHczAbWn7RHaotMttJcPLIx2iva00PPE
   w==;
X-CSE-ConnectionGUID: qGy7V+ZcSvOy+xh7LPHQAg==
X-CSE-MsgGUID: ReRYsKLhTTujVRQW/h7h7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80355563"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="80355563"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 07:52:55 -0800
X-CSE-ConnectionGUID: f2F+6Ic9Qvm58AQjZjp2bQ==
X-CSE-MsgGUID: ohYr14WBRXuvG3kGVeFdHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204602956"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.117]) ([10.245.244.117])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 07:52:53 -0800
Message-ID: <8eb8ac0c-755e-4056-912d-16fc7baddb20@intel.com>
Date: Wed, 14 Jan 2026 17:52:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiBDb25zdWx0YXRpb24gb24gdGhlIGlz?=
 =?UTF-8?Q?sue_of_digital_headphones_freezing?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217B105B059A7730C4F6EC8D2B9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f2c03c5d-d667-4398-9267-77d7f6aaf6b3@linux.intel.com>
 <TYUPR06MB62174179E2B4210E229872A0D287A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <TYUPR06MB6217745344E7E2EF5DAC6746D284A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <b1e908f2-8dfa-4d1e-8059-5e421145d154@linux.intel.com>
 <TYUPR06MB62171A3584A2769CBC752322D282A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <TYUPR06MB6217EA2FBB3CE957C0478C53D28FA@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <TYUPR06MB6217EA2FBB3CE957C0478C53D28FA@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/14/26 12:27, 胡连勤 wrote:
> Hi  Mathias:
> 
>>> Ok, looks like we don't call xhci_sideband_notify_ep_ring_free() in all places we should.
>>>
>>> That being said, to solve this crash we need to make xhci_sideband_remove_endpoint() work
>>> in cases where device is being reset or disconnected, and endpoint is being dropped.
>>>
>>> Looks like xhci_initialize_ring_info(ep->ring) was added to xhci_sideband_remove_endpoint()
>>> in v8 of the original patch series due to a comment about leaving the endpoint in a messy state.
>>>
>>> https://lore.kernel.org/linux-usb/20231011002146.1821-1-quic_wcheng@quicinc.com/> >
>>> Calling  xhci_initialize_ring_info() does not really clean up anything, it just sets the
>>> software dequeue and enqueue pointers to the beginning of the ring. The xHC hardware
>>> dequeue pointer is still untouched, and the whole ring buffer is still uncleared.
>>>
>>> I think we can drop xhci_initialize_ring_info() call completely here.
>>> The class driver still needs to set up and reinit the endpoint properly if it wants to continue
>>> using it after it is removed from sideband usage.
>>>
>>> We do want to make sure endpoint is stopped when removing it, but take into account that endpoint
>>> might be stopped, disabled or already dropped by then.
>>>
>>> Does the code below solve your crash?
>>>
>>> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
>>> index a85f62a73313..2bd77255032b 100644
>>> --- a/drivers/usb/host/xhci-sideband.c
>>> +++ b/drivers/usb/host/xhci-sideband.c
>>> @@ -210,7 +210,6 @@ xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
>>>    		return -ENODEV;
>>>
>>>    	__xhci_sideband_remove_endpoint(sb, ep);
>>> -	xhci_initialize_ring_info(ep->ring);
>>>
>>>    	return 0;
>>>    }
>>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>>> index a148a1280126..4161c8c7721d 100644
>>> --- a/drivers/usb/host/xhci.c
>>> +++ b/drivers/usb/host/xhci.c
>>> @@ -2891,16 +2891,25 @@ int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int
>>>    			    gfp_t gfp_flags)
>>>    {
>>>    	struct xhci_command *command;
>>> +	struct xhci_ep_ctx *ep_ctx;
>>>    	unsigned long flags;
>>> -	int ret;
>>> +	int ret = -ENODEV;
>>>
>>>    	command = xhci_alloc_command(xhci, true, gfp_flags);
>>>    	if (!command)
>>>    		return -ENOMEM;
>>>
>>>    	spin_lock_irqsave(&xhci->lock, flags);
>>> -	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
>>> -				       ep->ep_index, suspend);
>>> +
>>> +	/* make sure endpoint exists and is running before stopping it */
>>> +	if (ep->ring) {
>>> +		ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep->ep_index);
>>> +		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING)
>>> +			ret = xhci_queue_stop_endpoint(xhci, command,
>>> +						       ep->vdev->slot_id,
>>> +						       ep->ep_index, suspend);
>>> +	}
>>> +
>>>    	if (ret < 0) {
>>>    		spin_unlock_irqrestore(&xhci->lock, flags);
>>>    		goto out
>>
>> This patch looks like good.
>> I believe this can solve the crash problem I'm currently experiencing.
>> I'll do a stress test and see.
> 
> After merging the above patch, the load test results are as follows:
> 1. The digital headset was connected to a  phone , and a total of three rounds of sleep and wake-up stress tests were conducted,
>       with 3,000 sleep and wake-up cycles in each round.
> 2. No system crashes occurred.
> 

Thanks for testing this,
I'll turn it into a proper patch, add Reported-by and Tested-by tags, and send it forward

Thanks
Mathias


