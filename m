Return-Path: <linux-usb+bounces-36420-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOtkJl3T6GklQQIAu9opvQ
	(envelope-from <linux-usb+bounces-36420-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 15:55:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE01446F91
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 15:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 825873040AA8
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 13:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DE02E6CA8;
	Wed, 22 Apr 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQ+sPPDr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25522325704
	for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865899; cv=none; b=etkgFRfndW7dX11BHWmtjQ9CaNPlx7mwIx0DmVsgZvywa0zBx1af8+br+TZY7SdBPl17ndIMHaDv4STQWbkwBuTlxPBQqT9VgDYzj+rY8zWoAfTSVMW6ahLaELq4Mm0FzURinOlq9sYvrsuWCnIRvRVcaXOS7SS9326rYeymItY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865899; c=relaxed/simple;
	bh=QUQWlon1ucVanxQzlf7IJ7uL6WjZFSq5pGmBQo0swmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBeE00nXho1LK1uS6u1dbkJqM33lQ9qQsJF/YlYDeu3TmjkaKOHE4vqEHeEX80GcBNCU4tdMTEzb0injEPrgEx5wWpWKJeP+UBCT+ZMINqVYPOAYawcnw4pUHX9HY7gRxHce5YfXN14Q8bsGdx/YXvuGHaiCPsP4NWrCkVOT5B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQ+sPPDr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776865897; x=1808401897;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QUQWlon1ucVanxQzlf7IJ7uL6WjZFSq5pGmBQo0swmw=;
  b=hQ+sPPDrG6jxldHCu56iIe4koJAQb5mZtWtROqs7/UQ736xxQ6qBvBlU
   jEg0x9gpm9UJTZL7ov3XooLq48iOoDPsKKkbcfEr8RvUbCU+BAlDGJYRF
   xGCp8CAlPgXBdJgREqXWnVHHUoWlOR+2/tps/m74LdJv+aAU6VMF/J94f
   YpM7Oj2plMM7pTT1hKmREeUPF+QIGoQ+TPUmeuHiY6rvHNXeGPryCdl94
   Ms4y1WITaofgQUbZDpRXSd31wU6zkwZT3GpH9qjhJcyYlJ2VHkXTQIeEQ
   3k0KB+f9Y3gJPa1nEMvA8+pYNhnat2MSJh8mf+ehUYDBNO9/sui59+M4h
   g==;
X-CSE-ConnectionGUID: MPHh0vGBQSaEMVK3ymPDNw==
X-CSE-MsgGUID: CaHaJMwLSNOhIU4ppLHhFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88120398"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="88120398"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 06:51:35 -0700
X-CSE-ConnectionGUID: Cr8Pd3RwQbmxbDc4Bn8L2Q==
X-CSE-MsgGUID: m1/dEciKQGaVgrz7r2fKKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="228022534"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.225]) ([10.245.245.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 06:51:33 -0700
Message-ID: <e06dcae8-5b8e-4e58-a0cc-1c67e5a08170@linux.intel.com>
Date: Wed, 22 Apr 2026 16:51:30 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: Michal Pecio <michal.pecio@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
 <54fd265d-4ae8-4573-b618-587af98176c9@rowland.harvard.edu>
 <20260422073054.0bd482ba.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260422073054.0bd482ba.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36420-lists,linux-usb=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,rowland.harvard.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 9AE01446F91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 08:30, Michal Pecio wrote:
> On Tue, 21 Apr 2026 22:11:41 -0400, Alan Stern wrote:
>> On Tue, Apr 07, 2026 at 11:24:01PM +0300, Mathias Nyman wrote:
>>> On 4/7/26 18:23, Alan Stern wrote:
>>>> It's been a while now, and nobody has objected to the proposed
>>>> plan for handling this issue, so I'm going to assume that
>>>> everyone is on board with the idea.
>>>
>>> Yes, I support this
>>>
>>> So basically usb core will call usb_clear_halt() after EPROTO URB
>>> completion handler finishes, and xhci-hcd needs to prevent
>>> bulk/interrupt endpoint from restarting after returning a EPROTO
>>> URB up until usb_reset_endpoint() is called
>>
>> Can you confirm that it's also possible for xhci-hcd to prevent
>> control endpoints from restarting when a transaction error (-EPROTO)
>> occurs?  Up until usb_reset_endpoint() or a new callback?
> 
> Doable. They halt like any other and it's SW's choice how to restart.

Yes, doable.

Would this be used in cases where all hope is lost and we want to reset the
device, canceling all pending control URBs before restarting the ring,
thus avoiding sending any extra URBs to the device just to wait for
them to fail or timeout?

In most cases I can think of it would make sense to keep the control endpoint
running. Just let the hcd move to the SETUP stage of the next control transfer
URB and continue.

For example EMF causing transaction error (-EPROTO) on active IN and OUT bulk
transfers. Two clear-halt requests are queued, one for each endpoint.
If first clear-halt request fails with -EPROTO  we still want to continue with
the next request.
Shouldn't be any toggle/seq-nr issues here on the control endpoint.

Most control transfer STALL (EPIPE) cases are protocol stalls, and we should
just continue running. Exception here might be a STALL response
to a clear-halt request. I assume (didn't check) device must support those.
So in that case we may want to reset the device.

There's also a risk that the control endpoint isn't started when it should.
For example class driver could potentially call usb_clear_halt() on the control
endpoint, synchronously waiting  for the clear-halt request to complete before
calling usb_reset_endpoint(). If endpoint restarts at usb_reset_endpoint() then
the clear-halt control transfer would time out.

Thanks
Mathias


