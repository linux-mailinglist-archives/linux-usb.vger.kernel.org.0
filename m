Return-Path: <linux-usb+bounces-32914-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OsgNV24e2k0IAIAu9opvQ
	(envelope-from <linux-usb+bounces-32914-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 20:43:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E9B4107
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 20:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49FA73002D20
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 19:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F533271EB;
	Thu, 29 Jan 2026 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwrR5LLe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC58D2D8796
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 19:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715799; cv=none; b=rSwVLF3FwhUalMMaxYYgD7m5UE04ZhXz4Wgwjsm6Sod5YxbeNCH5MOM189VY0ubmnZpueTghtwobN+DwNTFJwocrWmggPkds/8RcK/o2VEZbgpdiOgeDiKWYXRzx8PK9+uG1ufriMosPsVDo5NJss+Yxco/Sp7VVb024IPpOW1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715799; c=relaxed/simple;
	bh=bkzeVnFgQp0oYJiIAx4Xv8zsNX5Dod8IOeYP4cJ73cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHkcg3p4T0l4hmKeZFMVcJ3wAaBWq+AwBh4Lv8IjCNUlbe/WNQsVeh6Aj7Vtm17r6eZl8Eyf3kAT17akziZQczcQYOt5pH/7EGQxpbf1YjRH+YlQIlmCfMAF2Tg6M6x8gmGRkyna4+PKWWfu/QbF9BP63ssL88kOfSHsm0GYp2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwrR5LLe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769715798; x=1801251798;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bkzeVnFgQp0oYJiIAx4Xv8zsNX5Dod8IOeYP4cJ73cg=;
  b=WwrR5LLeSV7HHli0qdkZmoLR0c8RiJcrVlXixCpSX5Jz6ujDq7fRvSMP
   8DuAk70n7k/i1jBE+SroUmHYDbO2EZw+TS6WmEJAf43JrSEuheUgnj6Ep
   ExwYVAiSlnVwFe5EvYe49Zkx+hax5GVTQ6dtmdeW2wIYICUFd+DB4CET0
   A6sRG5xwKlMVrojxheoljV8G7HIlLOd2oqOYcZP02utPg/vDxmCGCq0mw
   aAL9DYASKw7wmVnhT7Qaordk/tTS0idrQQXM7ekiRY65Dnw7DF5hN38AM
   4Pyr8IOz0WfJvogVcqMuI4i6KA4fCUV/GF5CObQR7vjofkfCnD4kHhWoM
   w==;
X-CSE-ConnectionGUID: 0oVK4XyHR2WQe/T1CKjGDQ==
X-CSE-MsgGUID: mKoiVN3VR2WIxHpmgtT1Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74593493"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="74593493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 11:43:18 -0800
X-CSE-ConnectionGUID: OWThwot1QFGGVdTWICYA/g==
X-CSE-MsgGUID: YfzLHbOMTbmKP7E4pDl4Ig==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.206]) ([10.245.245.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 11:43:15 -0800
Message-ID: <5de1da4b-d8aa-4180-a269-79fd544c2e8c@linux.intel.com>
Date: Thu, 29 Jan 2026 21:43:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and
 route transfers per slot
To: Michal Pecio <michal.pecio@gmail.com>, raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, kenny@panix.com, linux-usb@vger.kernel.org,
 niklas.neronin@linux.intel.com, zhanjun@uniontech.com
References: <2026012754-ferocity-operator-e3b2@gregkh>
 <ED3E9F8EEA089A35+20260128080939.1145420-1-raoxu@uniontech.com>
 <20260129152222.79c1252b.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260129152222.79c1252b.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,uniontech.com];
	TAGGED_FROM(0.00)[bounces-32914-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 191E9B4107
X-Rspamd-Action: no action

On 1/29/26 16:22, Michal Pecio wrote:
> On Wed, 28 Jan 2026 16:09:39 +0800, raoxu wrote:
>> By "hot spot" I do not mean a CPU cache problem. I mean a
>> software-side serialization point: all devices share a single event
>> ring and a single IRQ handler which processes completions under the
>> global xhci->lock. That centralizes the work into one place
>> regardless of cache locality.
>> [...]
>> Even if USB link latency is high, the IRQ/event path is still a
>> CPU-side serialization point: all completions land in one event ring
>> and are drained by one handler under xhci->lock. Under mixed
>> workloads (e.g. isoc video plus periodic audio/bulk), events from
>> unrelated devices can queue behind the same lock/handler and increase
>> jitter/tail latency, even if the bus is not saturated.
> 
> But this patch doesn't address such contetion. It's still one big lock
> per xHCI chip and a few CPUs take turns to do all work sequentially.
> 
> I find Greg's counterargument convincing. This change seems to only
> harm xhci_hcd performance, and if your bottleneck truly were in this
> driver, it's hard to imagine how anything could improve.

We would need more fine-grained xhci locking, and dynamically on-demand
created and removed secondary interrupters to get any real performance
benefit here.

I'm have another, virtualization and VTIO related interest in seeing this
working.
Having a per-device interrupter is one step forward in implementing
xHCI section 8 virtualization, allowing xHIC to pass a usb device over from
VM host to a VM guest

> 
> I suspect it's somewhere else, and considering the results you report,
> quite likely in URB completion handlers. They used to be called from
> this IRQ handler, but nowadays it's delegated to USB core.
> 
> Core uses BH workqueues. AFAIU this means completions run later on the
> same CPU which handled the IRQ. So if you spread IRQs, you also spread
> completions. It's easy to see how this could increase throughput or
> remedy latency spikes caused by sluggish class drivers, because unlike
> this IRQ, completions can usually run in parallel on multiple CPUs.

Sounds plausible. Let me see if I understood this correctly.

When xhci only has one interrupt it will process all transfer events from
all  devices in the interrupt handler in one go, with xhci->lock held for
a fairly long time.
During this processing the interrupt handler calls usb core to queue all
URB completions on the system_bh_wq (BH workqueue) on that same CPU.

This workqueue only stars processing URBs in softirq context, which
is _after_ completing xhci interrupt handler.

With several interrupts on different CPUs there will be fewer events to
handle per interrupt handler in one go with xhci->lock held.
There will also be several BH workqueues, one per CPU? which can start
earlier and have fewer URB completions per workqueue.

As a downside we will have several CPUs spinning in interupt context,
waiting for their turn to get the xhci->lock and handle the interrupt.

So we get a bit shorter URB completion latency traded for hogging more
overall system resources

> 
> If that's the real problem here then no xHCI driver surgery should be
> necessary to work around it, only updating the core.

Could be worth trying to reduce xHCI interrupt moderation interval.
A xHC interrupter can't trigger a new interrupr until 40 microseconds has
passed since previous interrupt completed (EHB bit cleared).
This might cause some tranfer event build up and thus latency.

Xu Rao, can I ask you you run the same test as before with only primary
interrupter with interrupt moderation the change below?

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..9a2a4d17ed68 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -573,7 +573,7 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
  	xhci = hcd_to_xhci(hcd);
  
  	/* imod_interval is the interrupt moderation value in nanoseconds. */
-	xhci->imod_interval = 40000;
+	xhci->imod_interval = 10000;
  
  	retval = xhci_gen_setup(hcd, xhci_pci_quirks);
  	if (retval)

> 
>> the upstream xhci-sideband work has already exercised and validated
>> the core multi-interrupter/event-ring plumbing in the driver. So
>> using additional interrupters is a proven in-tree mechanism, not an
>> experimental path unique to this series.
> 
> I'm afraid the only driver functionality exercised by xhci-sideband is
> allocation and freeing of extra event rings. Handling those rings in SW
> and solving race conditions is new, as is having no way to tell which
> order some events were generated in when things go wrong.

Agree, commands like 'stop endpoint' would trigger a transfer event on one cpu
and the command completion on another. PATCH V12 2/2 attempts to resolve
this by handling transfer events on the other interrupter before handling
specific command completions. This will get complicated and messy,
especially if we implement more fine-grained xhci locking.

The reward is too small compared to the risk of turning USB (more) unreliable.

Maybe we could add support for several interrupters but just use the
primary one as default.
Brave developers and testers could enable more interrupters via Kconfig,
debugfs, sysfs, or some other way.

Thanks
Mathias

