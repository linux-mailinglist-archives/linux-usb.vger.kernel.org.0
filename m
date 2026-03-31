Return-Path: <linux-usb+bounces-35722-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDgrJ52Vy2nMJAYAu9opvQ
	(envelope-from <linux-usb+bounces-35722-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 11:36:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E33672B3
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 11:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B53730645A2
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 09:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087D13ED5A5;
	Tue, 31 Mar 2026 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7yknpZS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E74D3D903C
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949702; cv=none; b=Kq6RmeAk5bp2di0bFep0WFx8cPKdNsG6NV0q8wzEPktI73quQkFRIApQUHP9W/ZlBQJ0Yuzkj2Y694d7wo9jnQvcZCweZzeueCqj8iJ7IOFNbzNzeSdSXYrQT3mJhjHeQBlUMfWaxDcxSED55swdOGnJ7z1/O92Iu9vym64t1J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949702; c=relaxed/simple;
	bh=8r/DW34xD/2FIBSGIXH1ZCt+aaKHjr/pzERfbPrat6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwx2CymD4T4J9Z+vFbxgs0r9ex1bVA33kks4D/CEc4vpFJ1VjpDZumaNJgTf+83oATDlOrXL7fsAgit8kfK51AR517UAogqA21nLEMNSb5OtZSduQ44FbcNfMW2pjUZMgYZfRAyRerbTGckS1oG2idskdTtngHyofil2ZQfCCiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7yknpZS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774949701; x=1806485701;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8r/DW34xD/2FIBSGIXH1ZCt+aaKHjr/pzERfbPrat6s=;
  b=Y7yknpZSyIPjpHFeBGYp0J/z9GJWrv0KjZka50TDWUJ/tNwz5j3Bxabc
   CPHi4RQRwCNztQu80RKNOrTJKigacg4YY5geqV1tzbauKb2HILLTf1DVv
   X7bvJVnsEeITyXnAcIJCLoarAKkXmtI0nn2RizAf/W5s7jSr+xYQdbcFx
   R2UvOcNbQlM4K6PKd5j0jgCkeRyFzNoHkKrd3+MTf4kKXIP1dG86qb+Kk
   R6Fy1ajBtp7dTLQakaApTl4TYGPksrftSbtcDjMPSpBl6fsd/u0mDsmWl
   JGqF41aBKMxysQ3pc3O5PwzQBG9R5GjtyDLvBIvfJPLDTh1Szw+Dsj077
   A==;
X-CSE-ConnectionGUID: MTvCNWrDSamtHDXKbWIxrw==
X-CSE-MsgGUID: Cx2jHKpTRripZEkangQ+oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="74989721"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="74989721"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:35:00 -0700
X-CSE-ConnectionGUID: TvBkbvOxQDG+O6a3f+8NTA==
X-CSE-MsgGUID: VUyQBnO2Suy1/HdTVWKEDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226290919"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.5]) ([10.245.244.5])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:34:58 -0700
Message-ID: <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
Date: Tue, 31 Mar 2026 12:34:54 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35722-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,suse.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,harvard.edu:email]
X-Rspamd-Queue-Id: 143E33672B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 17:17, stern@rowland.harvard.edu wrote:
> On Mon, Mar 30, 2026 at 03:51:46PM +0300, Mathias Nyman wrote:
>> Ideally xhci driver would return the URB with EPIPE after STALL, and not continue
>> processing URBs before a clear halt is sent, or a new URB is enqueued.
>> USB core would hold off submitting URBs to xhci, buffering URBs enqueued for this
>> STALLED endpoint until class driver urb->complete() finishes for that EPIPE URB.
>>
>> Usb core could flag this endpoint as "halt_pending" before adding the EPIPE URB to
>> the bh workqueue. Then after urb->complete() work is called and core is sure class
>> driver  is aware of the EPIPE, then core would clear the flag and flush the buffered
>> URBs to the host controller drivers, restarting the ring
> 
> This is not practical; it would result in a big slowdown for large bulk
> transfers.  Doing this would mean the core could not send an URB to the
> HCD until all the previous URBs for that endpoint had completed and the
> interrupt handler had run, which would add significant latency to
> transfers.

The URB submit buffering in core would only take place if endpoint is halted
with EPIPE/EPROTO.

Additional latency should be limited to the time between interrupt handler
returns a URB with EPIPE/EPROTO, and the bh workqueue finishing urb->complete()
for that URB

URBs would normally be sent to HCD directly.

Yes, this might end up being quite complex, need to make sure it solves more
issues than it creates.

Usb core is aware of the halted endpoint before the class driver due to the bh
workqueue giveback. To me it would make sense to make core responsible for babysitting
the class driver urb submission for the time it withholds this information.

Whole reason for this is to prevent new URB submission from HCD restarting an endpoint
after HCD gave back a halted URB, and HCD assuming core/class drivers are aware of
the halt when the new URB is submitted.

Other option is that usb core would just refuse class driver from submitting URBs
during this time. usb_submit_urb() would return with an error, but I think this might
impact existing class drivers more.

> 
> Exactly what should happen to URBs coming after one that completes with
> -EPIPE is not immediately obvious.  If the HCD did try to send them to
> the device right away then they would also be stalled, which is
> obviously non-productive.  The only guarantee the kernel makes
> about this situation is that the endpoint queue won't restart
> until all completed or unlinked URBs have been given back (likewise for
> -EPROTO errors).

My take is that endpoint should stop processing URBs, existing pending URBs
should be retired by class/core, new URBs should restart the endpoint but new URBs
are only permitted _after_ submitter is aware of the halt.

A class driver testing USB specification should be able to resubmit a stalled URB
(EPIPE) and expect it to complete with EPIPE again until it clears the halt.

> 
> The only safe course available to class drivers is to unlink all the
> pending URBs.  In theory the core could do this for all drivers
> automatically, but at present it doesn't.
> 
>> Class driver urb->complete() would most likely retire/cancel the pending URBs, both the
>> earlier queued 'tainted' URBs, and the most recent 'buffered' URBs in usb core.
>> Class driver should clear the halt, but is free to do whatever it wants.
>> It could choose to send a new URB without clearing the halt,
>> have it processed, trigger STALL again, and get URB returned with EPIPE status.
>>
>> I don't think most class/usb device drivers really handle stall that well.
>> Above might be wishful thinking.
> 
> Indeed.  We can make life a little easier for drivers, but clearing the
> endpoint halt is up to them.
> 
>>> Currently you have the xhci driver to "retire" the halted URBs. However,
>>> you also noted that class/core may attempt to retire the pending URBs.
>>> Who's expected to handle the retirement here?
>>
>> Maybe we should let core retire the pending URBS, and only fix the xhci driver
>> 'automatic endpoint restart after stall' part after that core change is done.
>>
>> Should cause less regression.
>>
>>>
>>> On a separate note, will you plan to implement the clear-halt for EPROTO
>>> in xhci?
>>
>> I don't think this should be part of xhci driver. Decision to send control requests
>> to the device should be done by core or class drivers.
> 
> Here's a troubling consequence for people to consider: Suppose an
> endpoint queue stops with -EPROTO or -EPIPE, and before the class driver
> gets around to calling usb_clear_halt(), it is unbound.  What happens
> the next time a driver binds to the device and tries to use the
> endpoint?

The disable/enable interface and set config calls during unbind/bind should,
if I remember correctly flush pending URBs and drop and re-add the endpoint,
clearing the xhci side halt and reset toggle.

> 
> In particular: What does xhci-hcd do if an URB is submitted for an
> endpoint whose queue is currently stopped?  Does it reject the
> submission with some sort of error code, or does it go ahead and add the
> URB to the end of the non-advancing queue?  If the latter is true, how
> will a newly bound driver ever discover that the queue is stopped?

xhci-hcd will queue the new URB  and restart the ring, if device side endpoint
remains halted due to uncleared halt then transfer stalls and URB is returned
with EPIPE.

Thanks
Mathias

