Return-Path: <linux-usb+bounces-34143-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIA3A96iqml6UwEAu9opvQ
	(envelope-from <linux-usb+bounces-34143-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 10:48:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C73621E338
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 10:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20BFC300CFD3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 09:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F7834A77D;
	Fri,  6 Mar 2026 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3Qjwi/P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996E1448E0
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 09:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772790451; cv=none; b=nAgsdhZ2rvPOO8lEl6tQZgVD02tkja2S3Yy/lTvUX/9t17czvg9uiiX0uKXnVyrE4IaWIJjgAE0agwl+D56Jw584aahznj2/XDOt+rcTpIbJBwcXmzPcQ4KABa9u49WIGkW6TN2773xcurkHkXEAmn03p9NIG4c3SHIWYPVaJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772790451; c=relaxed/simple;
	bh=YBkFaitqfqPTgrTFQgdTKpT04CwRiL9tlyoM7VSnOpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgL2/DMzkCwk+GYbIpNiaBjGW06cZ0P8TpyXxkL8tdIZVQCQNQIBIvT04+W5ieTEYCIE4EchLBKpZAzHg2yoh86BxjDIYYaj8s+7fhM3qQPCUWZiVqqWR9xXK27RxvpdFc4tcMAgdT+7LmX/aoab2cjeMlpsj5HDHKqyvMXU9Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3Qjwi/P; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772790450; x=1804326450;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YBkFaitqfqPTgrTFQgdTKpT04CwRiL9tlyoM7VSnOpg=;
  b=l3Qjwi/PA6lnWmvdJHs/mR4vtxSxkYT29dZP3msKQ4b0f9JmbX9cT8iR
   BrIa+DeEQ+IAxAaF4iIUnH+XU1LPxaBjS0HIhZSFalcS+/W6VEmsrErkh
   mOxF83aRn7gE2sYW/l6PglmGxWEqWbaAyyKK1D3ZvKOp+xTSz9TSRpKWN
   xKCfTlkxfTJiL+5uuqf2nrMiLABdVBlJpwaZwR5iybpBBTvU0nk3K2jx/
   AfgBR64ESUjnO+GJrrMgOIZCHQaNQPXFBDqjOMHQ8OdnHEBTKq+kQNmuA
   cl6P7aLkLRT9xHCRwr5v/wM2cZYL+JvdzKF6mRw8qFjJmguwfBkifCxKd
   Q==;
X-CSE-ConnectionGUID: LBam7u+ERCmLJxvWlMou4g==
X-CSE-MsgGUID: x6OxFHy4S/qAO3Eo6aCmZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73596854"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73596854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 01:47:29 -0800
X-CSE-ConnectionGUID: z1cATZwlRQ2PMPUGuT5GFA==
X-CSE-MsgGUID: eq959Zd5RIqS/3VCrp46ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223090851"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.250.130]) ([10.94.250.130])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 01:47:27 -0800
Message-ID: <f64abf52-6b9b-4eb3-b9de-a215cd7e2e82@linux.intel.com>
Date: Fri, 6 Mar 2026 11:47:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] usb: xhci: move initialization for lifetime
 objects
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com, Thinh.Nguyen@synopsys.com
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
 <20260305144824.3264408-7-niklas.neronin@linux.intel.com>
 <20260305231417.4415aa36.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20260305231417.4415aa36.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8C73621E338
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34143-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action



On 06/03/2026 0.14, Michal Pecio wrote:
> On Thu,  5 Mar 2026 15:48:18 +0100, Niklas Neronin wrote:
>> Initialize objects that exist for the lifetime of the driver only once,
>> rather than repeatedly. These objects do not require re-initialization
>> after events such as S4 (suspend-to-disk).
>>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
>> ---
>>  drivers/usb/host/xhci-mem.c |  1 -
>>  drivers/usb/host/xhci.c     | 15 ++++++++-------
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index 005b7bc1bfda..fae75969e49a 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -2001,7 +2001,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>>  	xhci->port_caps = NULL;
>>  	xhci->interrupters = NULL;
>>  
>> -	xhci->page_size = 0;
>>  	xhci->usb2_rhub.bus_state.bus_suspended = 0;
>>  	xhci->usb3_rhub.bus_state.bus_suspended = 0;
>>  }
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index d9519a9e9e17..338e93f39937 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -549,13 +549,6 @@ static int xhci_init(struct usb_hcd *hcd)
>>  	int retval;
>>  
>>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
>> -	spin_lock_init(&xhci->lock);
>> -
>> -	INIT_LIST_HEAD(&xhci->cmd_list);
> 
> Can we prove that this list is empty?
> 
> If there is any leftover garbage there, INIT_LIST_HEAD simply leaks it.
> Without it, the garbage stays on the list.

I assume you are referring to the resume path.
In this case xhci_cleanup_command_queue() is called before xhci_init().

xhci_resume()
├─xhci_mem_cleanup()
│  └─xhci_cleanup_command_queue()
└─xhci_init()

> 
>> -	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
>> -	init_completion(&xhci->cmd_ring_stop_completion);
>> -	xhci_hcd_page_size(xhci);
>> -	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
>>  
>>  	retval = xhci_mem_init(xhci, GFP_KERNEL);
>>  	if (retval)
>> @@ -5522,6 +5515,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>>  		dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
>>  	}
>>  
>> +	spin_lock_init(&xhci->lock);
>> +	INIT_LIST_HEAD(&xhci->cmd_list);
>> +	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
>> +	init_completion(&xhci->cmd_ring_stop_completion);
>> +	xhci_hcd_page_size(xhci);
>> +
>> +	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
>> +
>>  	xhci_dbg(xhci, "Calling HCD init\n");
>>  	/* Initialize HCD and host controller data structures. */
>>  	retval = xhci_init(hcd);
>> -- 
>> 2.50.1
>>


