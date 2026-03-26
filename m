Return-Path: <linux-usb+bounces-35503-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGOFIv4axWnr6QQAu9opvQ
	(envelope-from <linux-usb+bounces-35503-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 12:39:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B049A334A00
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 12:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF67A30367AE
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660573BE623;
	Thu, 26 Mar 2026 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUz9GKeP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE4834D394
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524322; cv=none; b=RidCEZmnMzPB8W29l42uROjjgu7kJGKJdFDeUX/oMWQvP0mRK0sCuHi4mnHh77vWja3DqpNhuWwK/QNe2BW7JeQP9f1LFvLrgMxWAwbEXE/cy1zsFNCzaSu0554JGZkOQUvDusVWEJsSFyMP0dggqa0rSfLI/FWm38tm/Xf7YY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524322; c=relaxed/simple;
	bh=QBSRtqUaxUbuRxORlre39f9p1OQPQaGrDv8X8Y15Aj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNRoICeNg7aYHFI1Zlr0yoQESKggmvIiJ1WLv3JYgWp6Ht2A9h1b/J0PqfjkSfNGjtlKOAKG8UoleSGNTmIkivGbdBbrIm4gcedvuHxl5ZOimKRF/4C6K5TnlNOOF31DCGGg3mziDPCsBFZA4Bx1eHnJSFM8m4Nz3H50ikbShWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUz9GKeP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774524320; x=1806060320;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QBSRtqUaxUbuRxORlre39f9p1OQPQaGrDv8X8Y15Aj4=;
  b=jUz9GKePNgTDVsN11cqE+8lWMFA4Sm+str1qS/hob0uMSgUE0y6SiPJq
   oHhRovQWbIsXZ4Fq6u8nUf/Lbr9ON3Wkgd2y4KyqBtwQEq4xioq+nzU0t
   LSd6U0zSDCUWWzgHlyEsIcYfPCMXbvqDjNPGkihIrPOVpCRXyIZdTzddh
   +s6qdMhSpp4Bva8gQ1lu9dJ57j0LkToVcrlhPBlasxCnlV6NJKiiJ1JRp
   /5CXDDsdQrDaAfTXudL8O8MwBI8Mw2QjGgt/I2Ca7uEhOe5NanP3N0gqp
   ptGJ7QJVYnMtC4RI49O4i9Z9VpFqwHFvfBVKTGbU52GTEQ8r/Ncq7MDiO
   Q==;
X-CSE-ConnectionGUID: dlbC2l1DTZWd/AqJYAWdQQ==
X-CSE-MsgGUID: og5kMlToQkKLS2rrDe0j3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75467286"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75467286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 04:25:19 -0700
X-CSE-ConnectionGUID: HN5Dmq+rSd2rhna7Yac2gQ==
X-CSE-MsgGUID: omI8j/LSRLyhbBnzM7MH4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="262889085"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.254]) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 04:25:17 -0700
Message-ID: <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
Date: Thu, 26 Mar 2026 13:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260326011910.t7ijezht7g7ttrec@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35503-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,rowland.harvard.edu,gmail.com,suse.com,linux.intel.com];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: B049A334A00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 03:19, Thinh Nguyen wrote:
> On Wed, Mar 25, 2026, Mathias Nyman wrote:
>> On 3/25/26 03:52, Thinh Nguyen wrote:
>>> On Mon, Mar 23, 2026, Mathias Nyman wrote:
>>>> Avoid automatically restarting bulk or interrupt transfers after a
>>>> URB is given back due to stall or error.
>>>>
>>>> Introduce a 'TD_TAINTED' state for pending TDs queued on a endpoint when
>>>> it halted. The actual TD the endpoint halted on is marked TD_HALTED,
>>>> and its URB is given back with proper EPROTO or EPIPE error code.
>>>>
>>>> Don't automatically restart an endpoint if the next queued TD after
>>>> the TD_HALTED one is marked tainted.
>>>
>>> Sounds good for -EPROTO, but will a clear-halt ring the corresponding
>>> the endpoint's doorbell for STALL endpoint?
>>>
>>
>> With this change xhci would not restart the stalled endpoint after a clear-halt
>> request. The first usb_enqueue() call after clear-halt would start it.
>>
>> Could make sense to restart the endpoint after a clear-halt, and just add a small
>> debug message if the next queued URB is marked 'tainted'.
>>
> 
> The -EPROTO should be handled differently than -EPIPE. A STALL endpoint
> is part of a normal usb flow. Should the class driver submit a new URB
> while the endpoint is STALL, we would always expect a STALL error
> response after the endpoint is restarted. That's not the case with
> -EPROTO where the data may be corrupted and/or the host and device are
> out of sync. We should not continue until the class driver do some
> recovery. IMHO, we can keep the handling of -EPIPE how it was before.
> Let the xHC tell whether the STALL error still persists instead of
> managing it by the xhci driver.
> 
I agree that that we should restart the endpoint if class/core enqueues a new
URB _after_ xhci gave back an URB with EPIPE after endpoint STALL.

But I don't think we should restart the ring to continue processing URBs that
were queued before the endpoint stalled. This would prevent the class/core
from even attempting to retire the pending URBs, something USB2.0 spec,
'5.8.5 Bulk Transfer Data Sequences' requires:

"If a halt condition is detected on a bulk pipe due to transmission errors or
  a STALL handshake being returned from the endpoint, all pending IRPs are
  retired.  Removal of the halt condition is achieved via software intervention
  through a separate control pipe."

Thanks
Mathias

