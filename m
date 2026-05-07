Return-Path: <linux-usb+bounces-37079-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPtlAuWB/GkcQwAAu9opvQ
	(envelope-from <linux-usb+bounces-37079-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 14:13:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 785304E80A9
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 14:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA46A30205E6
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 12:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C223EE1FD;
	Thu,  7 May 2026 12:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5ZJsj42"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496612C859;
	Thu,  7 May 2026 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155981; cv=none; b=L8xlPc1hhA7aO7gPQRtyC7lfXUWtJ5kdERBGbhS5LBede5gEN4KOOk1U5rLsSmEfNC0mqk8hmbLCpcKl4kAbQ8/6b0pVqqVnFpuXpkT4KRP3FAn72ROPBvu8//J+MbSwdPyf3cENi2PNA+YyGuoDgW2YEmN9Rz5MviTs+bKGobo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155981; c=relaxed/simple;
	bh=7vUNc7jwlwz7uwJi9ii69NSBLDl8pZkd+Xo1x3Pz9yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVw4y6ajmFVEHXCjOYrzBQTtkXqbIICe6rF2u1CBkho7YE+DRAqUo20kwuR+PCEZSlrkQI1gmib18j224etkrvTfMa6+g57yKuP88rxPcZ5bTI1f7DkH9zlUaGjWoxlOHcHSTH3duQVoBcAGS6BJWcAqV2XVZioEuhht1TBncXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5ZJsj42; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778155978; x=1809691978;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7vUNc7jwlwz7uwJi9ii69NSBLDl8pZkd+Xo1x3Pz9yY=;
  b=O5ZJsj42Kvgj/Q2muK7+lOLRRiP4BkKQkv2fw/TaRzgLVswSX255gVq4
   B8Blwv7W0ZC/ar6lkWGuTILtTmk+3gD51VvURU9Cu9DRj7OIKCrrEnGdN
   HGxocgWwlSMkDtRjwt+BykRlrUvB9T0KkcIGTqHwwnmsKqrhcCbE2/awU
   2AgYskPKtUSygmVoX9N5VJTepSMxN7syR7uxh+WtVnzm7hJYocpV5CACN
   02BL73vvzk0rPeilo0Uz2mDBBsqHY+M+h1CWj8i2PBN5n3S1jv8ONsU2A
   ImhRgouM3YpNuTDS0JaaWa9MNH704Y1Jw/M3t+LgdXPuPN3CTS/AEPws8
   A==;
X-CSE-ConnectionGUID: 2vZLa97yQ3a6iTSzzJ4IQQ==
X-CSE-MsgGUID: //oiC73xSsaWKRAzK5pQ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79039123"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79039123"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 05:12:51 -0700
X-CSE-ConnectionGUID: YBV0sL3XSAaIoQUbbZAxog==
X-CSE-MsgGUID: y4v0OTj5SRGAiqky889sig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236362458"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.122]) ([10.245.245.122])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 05:12:49 -0700
Message-ID: <4aa0d528-c911-4537-aa38-6c5b4f9eec75@linux.intel.com>
Date: Thu, 7 May 2026 15:12:46 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: xhci: fix isoc silent reschedule creating stream
 gap on CFC controllers
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 Michal Pecio <michal.pecio@gmail.com>, nick83ola <nick83ola@gmail.com>,
 niklas.neronin@linux.intel.com
References: <CA+Df+jdFEGGZyceFH_5LRSQjwGa1WCtd79DK1Lywvdw+pkX6fw@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CA+Df+jdFEGGZyceFH_5LRSQjwGa1WCtd79DK1Lywvdw+pkX6fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 785304E80A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,intel.com,gmail.com,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-37079-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Action: no action

On 5/6/26 22:55, Dylan Robinson wrote:
> On 5/5/26 16:32, Mathias Nyman wrote:
>> Agreed, setting start_frame to start_frame_id + 1 would only make sense for the very first URB, otherwise we create glitches.
>>
>> Looks like the whole start_frame_id calculation is incorrect.
> 
> I'd also like to call attention to the fact that index in
> xhci_get_isoc_frame_id() refers to the isoc packet index within the
> URB, not the position of the transfer in the overall stream. A driver
> could (although probably shouldn't) submit multiple URBs, each
> describing less than a microframe's worth of transfers, so index == 0
> does not guarantee that the computation is for a frame-aligned
> transfer.

ep->next_frame_id should be used for frame ID calculation after
the first URB is enqueued and endpoint running.

Need to makse sure it's correct, and in microframe units, and rounded to
to the correct frame for the TRB Frame ID field.

> 
> Additionally, urb->start_frame is initially computed in
> xhci_queue_isoc_tx_prepare(), and in the current implementation it is
> validated, and potentially modified again in xhci_get_isoc_frame_id().
> It is worth considering that xhci_queue_isoc_tx_prepare() computes a
> start frame close to the current IST, and if the system is preempted
> before xhci_queue_isoc_tx() runs and calls xhci_get_isoc_frame_id(),
> that start frame may already fall outside the valid scheduling window.

Hmm, looks like we are doing way too much checking here.
All the above are done with spin_lock_irqsave() held, meaning there
shouldn't be any delay by preemptions or interrupts.

re-reading the MFINDEX (microframe index) register for every TD in this
URB looks like a waste of time.
xhci_queue_isoc_tx_prepare() should read MFINDEX once, then:

a) If first URB (no ep->next_frame_id value) then calculate a proper
    start frame ID, and check last TD of urb still fits the widow

b) if ep->next_frame_id is set, then check if first TD of this URB
    can make it in time, also check last TD of urb is within window.
    I think all other register reads and checks in xhci_get_isoc_frame_id()
    can be skipped.
   (I'm confident that the non-preemtable loop queuing TRBs
    does a cycle faster than shortest isoc interval (125us)

Can I ask you to test some additional patches if I write them?
I don't have a good setup with frame sensitive usb devices to test this

Thanks
Mathias


