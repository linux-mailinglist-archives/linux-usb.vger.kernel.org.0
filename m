Return-Path: <linux-usb+bounces-33118-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QTCwBvhzhGn12wMAu9opvQ
	(envelope-from <linux-usb+bounces-33118-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 11:42:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF4F16CC
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 11:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C18F301981E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546BF3A7F40;
	Thu,  5 Feb 2026 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsynAu+6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A6631A565
	for <linux-usb@vger.kernel.org>; Thu,  5 Feb 2026 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288114; cv=none; b=r/C+Ck2WOrgrTh9G+nruyb+a2toFE1GpDtKO/7wITpHH7dVo5SgtbanG2aF9wFk9YMmFCfK0U54XFP/ZYi6n3AKoua/Gm1WnNFJo8s4M8t07Otf8LFgOb+7jTzXUnvhEsHiCGgs+Q/EigZINk2oPeRuixsdBirtI0Y0E3a96rWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288114; c=relaxed/simple;
	bh=fwa0F/yBHxLjc1Wq7eKcOukVqjbI7oK+e7dc8RD1THY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPHSj/NYmNlReRw/asc6Orqc8QEpkdvN/gv/JAol+xlcm5D1HFMA29TIdFV9rYOW0fajNteRia5XhQfgD74wh20+5/Hyz6A/wWi/dS5SaNqr2otdgr8O6mjc/cGBGYTiDlxy/i/QOogDy2hZIfFRgulpaSrwIvVrO1mJqrczzjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsynAu+6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770288115; x=1801824115;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fwa0F/yBHxLjc1Wq7eKcOukVqjbI7oK+e7dc8RD1THY=;
  b=YsynAu+65kHA4JSrDxa0Lp7XSxkDwhhrUrrIorzsAfC5+P+ruRR/E6WJ
   4XsQbW+iuqzdEUcgOZpBBEbDw4XuQO97S+jXgRJF0gxWYcmo7ofvNXmwf
   ebNvG9iV6QVWdADKgfjbmEZoiOdju7Lev6y2Yfz8BHJO9FN+TFtDFbBHO
   MGRVdsPfCrW1XHtEXKxysQXjFUx3Y+fWzpQO40CFBybqpZpCG9vaL+HOJ
   6NCgvhJLZ5MS/S1kPO64i3WRHuvbxgnMzpRtAtrq4fgoBA3Bi9JriId7B
   OwH80wu/o1q/wrFWfYbSlTdQogAoK7AX6arol55h1qLd7WLESvTHV+PMc
   w==;
X-CSE-ConnectionGUID: dbp8TCrwQuOK7htfCxRsNw==
X-CSE-MsgGUID: 9EmxI1BCTa+elLVrv4rEqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71382391"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71382391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:41:54 -0800
X-CSE-ConnectionGUID: EeK4InFzQfSVfqGqgC0JvA==
X-CSE-MsgGUID: H3UeHjKjRaGuS+4FZk241g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="214996941"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.250.130]) ([10.94.250.130])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:41:53 -0800
Message-ID: <833af9c0-8584-4eed-8382-ca0f4b0ba00d@linux.intel.com>
Date: Thu, 5 Feb 2026 12:41:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: xhci: add interrupter type
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org, raoxu@uniontech.com
References: <20260128131504.124322-1-niklas.neronin@linux.intel.com>
 <20260128131504.124322-3-niklas.neronin@linux.intel.com>
 <f9dbd6fa-5090-448f-bd33-cb6a04f12526@oss.qualcomm.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <f9dbd6fa-5090-448f-bd33-cb6a04f12526@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33118-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9ADF4F16CC
X-Rspamd-Action: no action



On 04/02/2026 3.17, Wesley Cheng wrote:
> 
> 
> On 1/28/2026 5:15 AM, Niklas Neronin wrote:
>> xhci-sideband creates a secondary interrupter without an associated IRQ.
>> Such interrupters are non-operational and cannot enabled or disabled.
>>
> 
> Is the wording here correct?  Every interrupter should have a physical interrupt line, however, it may not be owned by the processor running Linux. (ie offloaded to another DSP)
> 

In this case, the xhci driver allocates an xhci-sideband interrupter
structure but does not bind it to an IRQ or register an interrupt handler.
Event processing for this interrupter is performed by the sideband code via
polling of the event ring rather than through an interrupt.

From the xhci core driver's perspective, the interrupter structure exists,
but it requires no interrupt management. Beyond allocation and teardown,
the xhci core driver does not interact with it, which is why it is treated
as a "noop" interrupter.

>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index fcf8b486b0e0..c4e0c1cfb94e 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -314,6 +314,9 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
>>   {
>>       u32 iman;
>>   +    if (ir->type == INTR_NOOP)
>> +        return 0;
>> +
>>       if (!ir || !ir->ir_set)
>>           return -EINVAL;
>>   @@ -331,6 +334,9 @@ int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
>>   {
>>       u32 iman;
>>   +    if (ir->type == INTR_NOOP)
>> +        return 0;
>> +
> 
> In some of my previous discussions with Mathias, I think he mentioned there was a use case where Linux would handle interrupts for both the primary and secondary interrupters.  I didn't get much more info, but maybe it was for segmenting events occurring on different EPs.  However, I'm not sure where that control/trigger comes from, ie from the class driver level, or within xHCI.

In such a scenario, secondary interrupters would be associated with an IRQ
and handled similarly to the primary interrupter, using the same interrupt
handling paths in the xhci driver.

> 
> Just wondering if this is going to lay out the groundwork for that to be added, as in xhci_sideband_create_interrupter() we're just assuming that its a INTR_NOOP versus allowing it to be configured by the caller.
> 

All interrupters are stored in the 'xhci->interrupter[]' array, and this
change introduces a way to distinguish interrupters that are handled by
the xhci core from those that are not.

Thanks,
Niklas

