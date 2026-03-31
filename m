Return-Path: <linux-usb+bounces-35721-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNa7IJSVy2nMJAYAu9opvQ
	(envelope-from <linux-usb+bounces-35721-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 11:36:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F20783672A4
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 11:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 697253061CDC
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB323ED5C2;
	Tue, 31 Mar 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzn52lcR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3545E2F39CE
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949690; cv=none; b=n9hOYQZSx6pVze8PkyKPtg/Abe0N3e+4pmU9pyo4BGvTFW8Ckfll3ooQwV6t10uvxOIm/T4JiNATvsd8swS0HGtAegsFmNNgbvGpBQNI2w0HesdMio8SBCYjCSUHYRLWfEKKIaEUY1JWl6HnW1PM6Lb2AKVONWVjIcYYN7X6NYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949690; c=relaxed/simple;
	bh=KbTCs5So76ZizeyKxLB4RlVE1mTQEMoSp++3GGq69LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bn/x3VBmA2azdpddR8USGMbKhVDjHP0ZIXKBuPVMhclQCg/OmJ6v5lu9nXsxFiurJXiozo8su2DHQcHI6fOLxGMONQ0Vbf5uaFYj8lNHMrLsx2XTZUCsoKFdhBzKHxMgDGKdiftQ25geZD1/5B+4m1Vyeo6hWqoxxgowg6avTCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzn52lcR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774949690; x=1806485690;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KbTCs5So76ZizeyKxLB4RlVE1mTQEMoSp++3GGq69LI=;
  b=fzn52lcRxnXatVgFC/ATJxxDMpjF9A0Ay2u1HZCB4HBnJLHOqvpbm2C5
   Xn/IXI47g8bJJ7iQU9cSrZ9ufHU8kf3rOXtjRp6I/fNPedcEkfJlbC/ec
   UJziOWqfNlMuOn7SeLim2gp+qZ30KY2TGQfCSiH30Vp5H8cNyCz1VllHO
   hSPtahzI8M8K2nTc2XHWzP1SE+itAEIl0WUeprj30s5AhaZ8HkE1PsVN3
   Rp43cZPrF5HsrbsKkIUwYpGwzvUGAo4jTSU9566/Lnm5Rmlz2lpapFdoC
   +H4ELso0L8NvEsJT/+gZm/5SpW2sLywpxQdG5fkl+KAycKrxS0bsa+7RZ
   Q==;
X-CSE-ConnectionGUID: l8oDfMeRSb+PzT+H6V4qbA==
X-CSE-MsgGUID: ttK89UPsT26v0fVES4I4dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86256614"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86256614"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:34:49 -0700
X-CSE-ConnectionGUID: NLUHZyRpSXahO2iAGY4WIg==
X-CSE-MsgGUID: YhSHgKnEQAaED8oyMoVB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230787139"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.246.17.204]) ([10.246.17.204])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:34:47 -0700
Message-ID: <108b65c0-349b-4854-b703-f6951b53bc33@linux.intel.com>
Date: Tue, 31 Mar 2026 12:34:36 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] usb: xhci: factor out roothub bandwidth cleanup
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
 <20260327123441.806564-4-niklas.neronin@linux.intel.com>
 <20260330102910.0059972c.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20260330102910.0059972c.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35721-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: F20783672A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30/03/2026 11.29, Michal Pecio wrote:
>> +/* Cleanup roothub bandwidth data */
>> +static void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
>> +{
>> +	struct xhci_root_port_bw_info *rh_bw;
>> +	struct xhci_tt_bw_info *tt_info, *tt_next;
>> +	struct list_head *eps, *ep, *ep_next;
>> +
>> +	for (int i = 0; i < xhci->max_ports; i++) {
>> +		rh_bw = &xhci->rh_bw[i];
>> +
>> +		/* Clear and free all TT bandwidth entries */
>> +		list_for_each_entry_safe(tt_info, tt_next, &rh_bw->tts, tt_list) {
>> +			list_del(&tt_info->tt_list);
>> +			kfree(tt_info);
>> +		}
> 
> This loop is theoretically pointless, because each tt_info corresponds
> to a hub virtual device, and all this stuff should have been destroyed
> by xhci_free_virt_devices_depth_first() earlier.
> 
> If anything, it seems to paper over potential memory leaks in there.
> 
>> +
>> +		/* Clear per-interval endpoint lists */
>> +		for (int j = 0; j < XHCI_MAX_INTERVAL; j++) {
>> +			eps = &rh_bw->bw_table.interval_bw[j].endpoints;
>> +
>> +			list_for_each_safe(ep, ep_next, eps)
>> +				list_del_init(ep);
>> +		}
> 
> This loop used to run before xhci_free_virt_devices_depth_first(), but
> now it will run after. It seems that the endpoints here are virt_ep
> which also should be gone already, so this loop likely does nothing
> (empty list) or writes to virtual devices after free (somebody forgot
> to unlink some endpoints from the list).

In my testing, when xhci_rh_bw_cleanup() is called after
xhci_free_virt_devices_depth_first() in xhci_resume(), all related
resources have already been freed.
That said, I have chosen to keep the existing freeing in this patch set.
Removing it would introduce an additional behavioral change and a
potential regression point, which I prefer to avoid at this stage.

> 
> Do we trust xhci_free_virt_devices_depth_first() to work correctly?
> If yes then it seems this whole function is unnecessary.

I don't, mostly because it is recursive and complex. Which makes it
difficult to follow edge case issues (IMO).

> 
> If not, perhaps delete this monstrosity and write a simpler cleanup:

Planning to rework xhci_free_virt_devices_depth_first() in a later patch
set, which will then result in the removal of xhci_rh_bw_cleanup().

> 
> 1. for each slot_id
>   - disable debugfs
>   - free virt_device and child allocations but don't worry about tt_info
> 2. for each root hub port
>   - free all tt_info allocations but don't worry about eps or vdevs
> 
> And since this will be used by reset on resume:
> 
> 3. zero out DCBAA and xhci->devs
> 4. reinitialize xhci->rb_hw


