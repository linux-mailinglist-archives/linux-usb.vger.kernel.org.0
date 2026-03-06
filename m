Return-Path: <linux-usb+bounces-34147-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNVLJq+qqmnjVAEAu9opvQ
	(envelope-from <linux-usb+bounces-34147-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 11:21:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B7621E994
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 11:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7BE5302AC3B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 10:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9CE35BDA5;
	Fri,  6 Mar 2026 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wczs+xXZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5B377ED5
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792218; cv=none; b=RHtFWa7vm1NSj5yqevdegyydbSb6/d7H1k8i24tMNYF51BaBswcdYLNT756xnOTQKHCgN0oNzeERqXKeibWpXLA1oAnrahOmME7mfoHuJ2MAY8opppbE1fvQBThCvBigKZiCZJAEtUVRbxNJi43bkbe8oCPDfE3IuFSEpgqv7qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792218; c=relaxed/simple;
	bh=ur/W0iIMeuXijbomJ06PizoY46UF2Mwncq+9ogm88+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2ncMb/LlX3m/ntwHWFLoBR332Nk1Nkyj1miclNNzbnQwaaG4pH3ZdSMIRWPBzshbcSyGiLX98/DKn6xvP39yZEHXSIsrXmLDGXtVOoa4/wPu+pvMfl3W6uMZW7LPipb4Su/LXZfq7xjvtRJBSDMYMdMiQMa0fblu5UC0df2rVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wczs+xXZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772792217; x=1804328217;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ur/W0iIMeuXijbomJ06PizoY46UF2Mwncq+9ogm88+8=;
  b=Wczs+xXZWQhDIdqHpVaPY8wT2P4JVLxeCw/X0X1Oow5csxzkqNjrRVR1
   AWSwUqtZpRhmGVut6NKFvU2fPqn38Au6aQPfrZkshWXiDAQGuIXiDpiS+
   XkVxyaJ+sznwCDYSYoM9kTGNdD6VCx9zbIAnLozO36K4nnsVsRQgHkuMZ
   PyWZ7pcrYVeGCU9DH8M+t6iSwSuOTfbHywTYIgP8tuWiv/yYfztN0nZp4
   mCpJ4zUKa2Yhok0LP4x4maF/EAW4GbNC8U9y6Nid4FAyOho+ajd6D2lwu
   y2FZibJL7K1TbJVXHS/dT2kvUVffpKdS05T6wrC08n1K5d6jo7StIrRb5
   w==;
X-CSE-ConnectionGUID: P37RITTlTcm21D/k3hsOhA==
X-CSE-MsgGUID: Yhol6h1cTaaJNYtGoHlKhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91287459"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91287459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 02:16:57 -0800
X-CSE-ConnectionGUID: 4RD+atzUT2ebuI4uftsh5g==
X-CSE-MsgGUID: qFEC9d/RToO33T5YTUABDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="249443551"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.250.130]) ([10.94.250.130])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 02:16:55 -0800
Message-ID: <3fe5589c-2f0e-430f-8206-4d67f5a1a650@linux.intel.com>
Date: Fri, 6 Mar 2026 12:16:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/12] usb: xhci: optimize resuming from S4
 (suspend-to-RAM)
To: raoxu <raoxu@uniontech.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com
References: <20260305144824.3264408-10-niklas.neronin@linux.intel.com>
 <1E638E645F8271BF+20260306065246.2393516-1-raoxu@uniontech.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <1E638E645F8271BF+20260306065246.2393516-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 13B7621E994
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34147-lists,linux-usb=lfdr.de];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action



On 06/03/2026 8.52, raoxu wrote:
> On 2026-03-05 14:48 Niklas Neronin wrote:
> 
>> -	if (power_lost) {
>> +	if (reset_registers) {
>>  		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
>>  				!(xhci_all_ports_seen_u0(xhci))) {
>>  			timer_delete_sync(&xhci->comp_mode_recovery_timer);
>> @@ -1165,28 +1168,27 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>>  		if (retval)
>>  			return retval;
>>
>> -		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
>> -		writel(STS_EINT, &xhci->op_regs->status);
>> -		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
>> +		/* Clear data which is re-initilized during runtime */
>> +		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
>> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
> 
> If the driver is moving toward multiple operational
> interrupters, the current reset logic seems to only
> reset interrupter 0 explicitly. Should the secondary
> operational interrupters be reset here as well? If so,
> that would likely require additional
> xhci_for_each_ring_seg() handling and may make the
> resume/reset path more complex.

Yes, I tried to keep my patches as strictly preparatory work for secondary
interrupters. Since this patch set does not actually add support for
secondary interrupters, I also did not introduce any interrupter‑loop logic.

That said, once secondary interrupters are added, something along these lines
will be required:

	for (int i = 0; i < xhci->max_interrupters; i++) {
		if (!xhci->interrupters[i])
			continue;
		
		xhci_for_each_ring_seg(xhci->interrupters[i]->event_ring->first_seg, seg)
			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
	}

> 
>> +
>> +		for (int i = xhci->max_ports; i > 0; i--)
>> +			xhci_free_virt_devices_depth_first(xhci, i);
>> +
>> +		xhci->cmd_ring_reserved_trbs = 0;
>> +		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
>> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
>>
>> -		xhci_dbg(xhci, "cleaning up memory\n");
>> -		xhci_mem_cleanup(xhci);
>>  		xhci_debugfs_exit(xhci);
>> -		xhci_dbg(xhci, "xhci_stop completed - status = %x\n",
>> -			    readl(&xhci->op_regs->status));
>>
> 
> xhci_mem_cleanup() also clears software-side runtime
> state, not just rings. Without equivalent cleanup,
> state such as the command queue, cmd_timer, cmd_list,
> and TT-related list state may remain across
> reset-resume, which could lead to unexpected issues on
> some hardware.

Good point, I'll clear them all in v2.

Best Regards,
Niklas

> 
> Thanks,
> 
> Xu Rao


