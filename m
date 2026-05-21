Return-Path: <linux-usb+bounces-37818-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD3yNuy4DmrBBgYAu9opvQ
	(envelope-from <linux-usb+bounces-37818-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:49:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6405A05AA
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A59A6302E0D2
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 07:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A46394797;
	Thu, 21 May 2026 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bATpnu04"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC00362137
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 07:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349450; cv=none; b=aTRrwcWJIhsDvrAivdAuq3uJlGPi1qQtIVs1RsKLD+8LisMU9yQmmqzMOopH5gyPpdcSw9RvF5DiDK860+bb1A6rloXhxJLGN74DudLFKn+x3Pf3QezmycK6fvqf7ckSUuUS+VcXtA1LMa0lX2RTgwDnXmvISLgCabXP7qu7p7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349450; c=relaxed/simple;
	bh=xlkMVMF/0GjqTldlC/Pq9fJEbzwnuJN1fTlwrLtq4Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxjjJgvOL0LZAs8wl/HKPaFr63XNVUgf9RopEE0dkCVqxIpFU905meH1m3VWEizHZZ3yj04RSUaq7aFF3Wkc4lrImmnhrvySAXH8m4i57/+iJGdWdscEcG1IiDzLnzk9goAap4xezWp9iPb27JlVBTCWQBEj7Ra4JbkhHmpyWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bATpnu04; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349448; x=1810885448;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xlkMVMF/0GjqTldlC/Pq9fJEbzwnuJN1fTlwrLtq4Fg=;
  b=bATpnu04jfb6IHx9K2zxqYnH8FJLv7u07iyZJGJMq1/bo9BpYw98Dptf
   MFDS4sSKIhSG6ufGHG+pdEJOXconwNIE+GoVkNI1Hok5WUnyDP/1swhqG
   XhZmMitPRl9QsP3NA6OsP11RQZ1Ht3SsjAvdqGKcduV0OSlMycjpxQ9aQ
   9OcJfB1D8bwnoraFoctMM0waBrRPgeC0ArRlRorF5eIIAuxTBZEskuH6Y
   A6h685RmfpGvkiiPjUtCO1RXZKHrn9lFi2/enML38IsAVzG70yAS3C4fB
   Ei08JVT185O6jz0ptgvpDHcXvBggJiHnFgGXt+WQDmGSVvzGfjRtwAEiC
   g==;
X-CSE-ConnectionGUID: WWkFhOBYTaawzltz4JEJQQ==
X-CSE-MsgGUID: UHzvfvJjTI6O9Pu7jsKDbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79411784"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79411784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:44:08 -0700
X-CSE-ConnectionGUID: m6G0ucjcQUW62KUMHYHrHg==
X-CSE-MsgGUID: VYh98qCUQRCh/rXcGFgZ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244752441"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.250.191]) ([10.94.250.191])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:44:07 -0700
Message-ID: <8d73cfd4-96c7-42d5-a5ff-fc47c53b5338@linux.intel.com>
Date: Thu, 21 May 2026 10:43:52 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] usb: xhci: allocate internal DCBAA mirror dynamically
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20260507083945.959370-1-niklas.neronin@linux.intel.com>
 <20260507083945.959370-4-niklas.neronin@linux.intel.com>
 <20260521000848.05cce0dd.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20260521000848.05cce0dd.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37818-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 2E6405A05AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21/05/2026 1.08, Michal Pecio wrote:
>>
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index ac915dacd886..1effc9f08678 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -1953,8 +1953,11 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed command ring");
>>  	xhci_cleanup_command_queue(xhci);
>>  
>> -	for (i = xhci->max_slots; i > 0; i--)
>> -		xhci_free_virt_devices_depth_first(xhci, i);
>> +	if (xhci->devs) {
>> +		for (i = xhci->max_slots; i > 0; i--)
>> +			xhci_free_virt_devices_depth_first(xhci, i);
>> +		kfree(xhci->devs);
>> +	}
>>  
>>  	dma_pool_destroy(xhci->segment_pool);
>>  	xhci->segment_pool = NULL;
>> @@ -2011,6 +2014,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>>  	xhci->rh_bw = NULL;
>>  	xhci->port_caps = NULL;
>>  	xhci->interrupters = NULL;
>> +	xhci->devs = NULL;
>>  
>>  	xhci->usb2_rhub.bus_state.bus_suspended = 0;
>>  	xhci->usb3_rhub.bus_state.bus_suspended = 0;
>> @@ -2417,6 +2421,12 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>>  
>>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
>>  
>> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating internal virtual device array");
> 
> I don't think this is useful in any way. One look at the code makes it
> clear that this is going to happen each time this function is called.

I'll remove the debug message.

> 
>> +	xhci->devs = kcalloc_node(xhci->max_slots + 1, sizeof(*xhci->devs), flags,
>> +				  dev_to_node(dev));
>> +	if (!xhci->devs)
>> +		goto fail;
>> +
>>  	xhci->dcbaa.ctx_array =
>>  		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), xhci->max_slots + 1),
>>  				   &dcbaa->dma, flags);
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index 9a471bd72265..151a759806f8 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -5460,7 +5460,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>>  	if (xhci->hci_version > 0x100)
>>  		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
>>  
>> -	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
>> +	xhci->max_slots = min(HCS_MAX_SLOTS(hcs_params1), MAX_HC_SLOTS);
> 
> HCSPARAMS1.MaxSlots is 8 bits wide, so it will never exceed 255.
> There is no need to add this check.

The 'MAX_HC_SLOTS' macro is intended to be user configurable, allowing
a custom upper bound to be set, similarly to max ports and max interrupts.

Given its niche purpose, its prior existence, and its alignment with
related HCSPARAMS1 max values, I chose to keep it.

Additionally, this check is only performed once during initialization,
so the overhead is negligible.

> 
> And the macro seems to porperly mask out excess bits picked up from
> other fields, so no worries about that either. And if it didn't, it
> should be fixed instead of (wrongly) assuming 255 slots.
> 
>>  	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
>>  	/* xhci-plat or xhci-pci might have set max_interrupters already */
>>  	if (!xhci->max_interrupters)
>> @@ -5533,8 +5533,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>>  	init_completion(&xhci->cmd_ring_stop_completion);
>>  	xhci_hcd_page_size(xhci);
>>  
>> -	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
>> -
>>  	/* Allocate xHCI data structures */
>>  	retval = xhci_mem_init(xhci, GFP_KERNEL);
>>  	if (retval)
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index b467b875eeba..f977c8e6a90a 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -33,8 +33,11 @@
>>  /* xHCI PCI Configuration Registers */
>>  #define XHCI_SBRN_OFFSET	(0x60)
>>  
>> -/* Max number of USB devices for any host controller - limit in section 6.1 */
>> -#define MAX_HC_SLOTS		256
>> +/*
>> + * Max number of Devices Slots. xHCI specification section 5.3.3
>> + * Valid values are in the range of 1 to 255.
>> + */
>> +#define MAX_HC_SLOTS		255
> 
> Then if there are no other uses, this constant can simply be removed.
> 
>>  /*
>>   * Max Number of Ports. xHCI specification section 5.3.3
>>   * Valid values are in the range of 1 to 255.
>> @@ -1552,7 +1555,7 @@ struct xhci_hcd {
>>  	/* these are not thread safe so use mutex */
>>  	struct mutex mutex;
>>  	/* Internal mirror of the HW's dcbaa */
>> -	struct xhci_virt_device	*devs[MAX_HC_SLOTS];
>> +	struct xhci_virt_device	**devs;
>>  	/* For keeping track of bandwidth domains per roothub. */
>>  	struct xhci_root_port_bw_info	*rh_bw;
>>  
>> -- 
>> 2.50.1
>>


