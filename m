Return-Path: <linux-usb+bounces-38239-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD/zEOpnHWrqaAkAu9opvQ
	(envelope-from <linux-usb+bounces-38239-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 13:07:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0661E132
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 13:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05924301A167
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 11:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B37F3932F0;
	Mon,  1 Jun 2026 11:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQokd8Qi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FCE389455;
	Mon,  1 Jun 2026 11:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311843; cv=none; b=hcsRsW3ZrBs2aZE+vglAcz3+/iNfeZxXOLc4kWg3yvKB7XRuP5/EDplzFdeheRyraeELIPWIQl1jpXGzOz1dnyIIzatYPFBSsBTzlsd8nrrh2rFhMDzxLNsCtquUuCsYr0FpkDPBimuWeDUlOwhVw3kZrpsXvDousqjjsE8ZITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311843; c=relaxed/simple;
	bh=tmiR0oN6/bzAys+vj750g9X5bCxXVszAgy3ldL0rLxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWQuZLaW6DtdAb9PEh0nS6tugUYAgrTB8f40q0xOlt8BT6qeeZF4Gup3gz6PcEcCdodc0zzl6etJG9pNeqg4WXhSGFnY3vOFn30kbwHUjHJscrGpsuHon9VmicnmmGCgeIay+t5sfs9tP/MEGfL5mOk7f3IqDeFqbmBDozvju3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQokd8Qi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780311843; x=1811847843;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tmiR0oN6/bzAys+vj750g9X5bCxXVszAgy3ldL0rLxo=;
  b=GQokd8Qi/iwpwTR6grQ2zDvtDCsTyL6+VKdFaF1lk+kf42FPUy0wFsM/
   O/KxQv/iBAU0eejym4WpVQ8ChmwYKvvs0PRUgpX8BLv0VcDJmxoQOmICu
   dkHhtL2kBmDSO4UAxtNNzkt+HNuXtnxTZ/ixDDHTsQwdwzts6zanIGZ0T
   Tr+AjCVz/5ETrhqBRqGkXjxHv2Ef9zpqP7t0AFFfSWqeXJgg04Tt+t6iq
   Chq3sHlB09qy4yW58uKZeLNhfLVyV9D6oLwsuBl3y7XsBLaP7tDrkiLSB
   hLVdlTpT2AF8jccuo3hxgBy139WUX//oO77T+bHkF8tRdqdbsS6EF6KDN
   A==;
X-CSE-ConnectionGUID: 71yDpxcfRIi2UyTctCT5zQ==
X-CSE-MsgGUID: cFPNxOzqQ3+6Qf2oz4CPqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81252180"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81252180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:04:03 -0700
X-CSE-ConnectionGUID: I7kZR5eWRhW3QSRMs8U6Dw==
X-CSE-MsgGUID: CbhgnUFoTnyPbP0UTO5Kuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="242498819"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.110]) ([10.245.245.110])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:04:01 -0700
Message-ID: <e99ae325-5ebd-4121-9223-57862487dc0e@linux.intel.com>
Date: Mon, 1 Jun 2026 14:03:58 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Simplify xhci_quiesce()
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529110510.64115fce.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260529110510.64115fce.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38239-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 4AC0661E132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 12:05, Michal Pecio wrote:
> The function reads USBCMD, clears some bits and writes it back.
> Its treatment of the Run bit is weird: the bit is usually written
> as 0, as we would expect, but it may also be written as 1 if both
> its current value and USBSTS.HCHalted are observed as 1.
> 
> Per xHCI 5.4.2, HCHalted is 0 whenever Run is 1, so the above can
> only happen due to buggy HW or SW, e.g. concurrent xhci_quiesce()
> and xhci_start() execution.
> 
> It's unclear why we should treat such cases specially and write
> the bit as 1. The logic comes from original PoC implementation
> and has never been explained. Just write 0 every time, which
> looks like the safer choice when the intent is to stop the xHC.
> 
> We could get in trouble if clearing Run causes some very broken
> xHC to start running after it was halted, but no such case has
> been documented. It seems the logic was just poorly thought out.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> Hi Mathias,
> 
> I'm not aware of this causing any problem. But I wasted a few minutes
> trying to understand the point of this code, until I was forced to
> conclude that it doesn't seem to have any point whatsoever.
> 
> Maybe getting rid of it will save somebody else another few minutes.
> The removal seems harmless.

Thanks, adding this patch

-Mathias



