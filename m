Return-Path: <linux-usb+bounces-35724-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ6qFFyby2lBJgYAu9opvQ
	(envelope-from <linux-usb+bounces-35724-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 12:01:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22D3677FE
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 12:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85143305FC67
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 09:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36343ED128;
	Tue, 31 Mar 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLljn8VL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463CD397E68
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951197; cv=none; b=uc9yN9sqV9C3Q2L76PPk9uxuaWqABd+fqmBfMJqYI98AuG9UkhYnnQm1iGViL0jFbUBVWCn/ZDdFdUw9+YuofaBFgm2BMMGc/ZTCanawuIPf33N2FBx/NVo+iTywh78zCF5qGug0mdllckCzHNvEliPmveZpmdPeQrQQZtD3svg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951197; c=relaxed/simple;
	bh=Hf9f8Y0SBt3rEFDK2CsfOFvLH3A6YM0DgnM5Ye21Xhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMxcQdmD59fUKGeNVHp95YlCMeDFvXGe1/yMaAVTzOBGfyheAylv8SAyM+Dls04LxFeNv/lmK13l8Ta+9Q11qNp1YYm90HnVHAgX0DGS/p99MCkiqTh0cHT7sSMWuJDjDwtyCLC01ClFaN22wOF/NDy9ww6W75+zPgXlkKRfr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLljn8VL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774951196; x=1806487196;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Hf9f8Y0SBt3rEFDK2CsfOFvLH3A6YM0DgnM5Ye21Xhg=;
  b=BLljn8VLMPHCiRCjh4Hj3EkoMAHQMosSopU5YyTC86zqRVOLoSU60GPa
   qotRnPGDhrS2dfeFw4x5FkXqtkS/ZK3zDskI56jWQHLHnkucAduhLVzgI
   1PxCxUXqToHQ8TGxbb4Iw/bLMXE10lCxV1MvkHHns1u7ydcqTYqPqLS3u
   MjlzQqfT+metRUFW22KGtQwRtNwMMdee2Uu33EwMB1vGfqPPfSr3pjKpp
   vStN5YlrFZc7TasGqf+bvaaVtH+pwCcTyWnyngt+qMWPdZ7FGcgsI/pKA
   pCpXbXMgOi11/TnXQkomhtiBmoj4Qkd7s9WU0h0v8VkMXZ9iV+9P224+L
   w==;
X-CSE-ConnectionGUID: KNpEv1X3QqWA9hAgamlvmA==
X-CSE-MsgGUID: z/Kd4IJdRT220iAVuxqQvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86653429"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86653429"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:59:55 -0700
X-CSE-ConnectionGUID: 0OsOLPnMRO2IIbkE1e/q7A==
X-CSE-MsgGUID: n3KeklPlQ7iTXvfoEpfCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230390315"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.246.17.204]) ([10.246.17.204])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:59:53 -0700
Message-ID: <b3a945bf-65e9-4a8e-9a88-341bc59f6c8d@linux.intel.com>
Date: Tue, 31 Mar 2026 12:59:50 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] usb: xhci: optimize resuming from S4
 (suspend-to-disk)
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
 <20260327123441.806564-10-niklas.neronin@linux.intel.com>
 <20260330114510.2b1e5f05.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20260330114510.2b1e5f05.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35724-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: CB22D3677FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 12.45, Michal Pecio wrote:
> 
>>  
>> -		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
>> -		temp = readl(&xhci->op_regs->status);
>> -		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
>> -		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
>> +		cancel_delayed_work_sync(&xhci->cmd_timer);
>> +
>> +		/* Delete all remaining commands */
>> +		xhci_cleanup_command_queue(xhci);
> 
> Considering that xhci_suspend() clears the command ring anyway, it
> could probably do this too so we don't need to. 

It makes more sense to have all clearing in one place, instead of spread
out over suspend and resume. This will be addressed in the next patch set,
i.e. remove clearing from suspend (if possible).

> 
> BTW, debugfs/port_bandwidth interface queues commands and I'm not sure
> if it's synchronized in any way with power management. IOW, it might be 
> possible that command are pending at suspend, but I'm not sure.
> 
>> +
>> +		/* Clear data which is re-initilized during runtime */
>> +		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
>> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
>> +
>> +		for (int i = xhci->max_slots; i > 0; i--)
>> +			xhci_free_virt_devices_depth_first(xhci, i);
> 
> This loop is a bit ugly, it could be a function in xhci-mem.

Will be addressed in xhci_free_virt_devices_depth_first() rework.

> 
>> +
>> +		xhci_rh_bw_cleanup(xhci);
>> +
>> +		xhci->cmd_ring_reserved_trbs = 0;
>> +		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
>> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
> 
> This looks like a bug because it nukes link TRBs. I know that
> xhci_init() will fix this up (unless somebody changes that without
> updating here), but it looks confusing.
I would like to remove xhci_clear_command_ring() eventually,
instead have:

   xhci_ring_reset()
   ...
   xhci_set_cmd_ring_deq()

or

   xhci_ring_clear()
   ...
   xhci_ring_init()
   xhci_set_cmd_ring_deq()

Then xhci_ring_*() functions can be used for all rings,
and now it is clear that the CRP is set.

Thanks,
Niklas


