Return-Path: <linux-usb+bounces-32646-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNsLCQVvc2mnvgAAu9opvQ
	(envelope-from <linux-usb+bounces-32646-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 13:52:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E7E76042
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 13:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 483593047059
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 12:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF5D2749DC;
	Fri, 23 Jan 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmpoVErm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F3A1514F8
	for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769172710; cv=none; b=jIU/ER57O5gtKq9YLusBADSJQSp3cYSusy9nNLFdpQJiUyuc0HkUJsF+SiedlJs7I0zNCDiyzFgi0r9Q85leI4D6+SsBVkc3T7fdStEVCcpRYfhM9ggVBF+ui0wGvUMsjqWC8GqCnCp8Ovjl8NIt95Ns4hIKyUNR0vPqN2pdBIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769172710; c=relaxed/simple;
	bh=cUY0r/FNd1aopzfzMc7dHAsbHUbwXn/bYghX4YrzMp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RtJ+2dPaU6wrZge2PJcxgjODH81J1IC9KQ+YsE4PaqAOi2OKuyapbd4NHJwPPRdtR4KmxX/STuKGYTpERo5/a3571LQas6IU5TeD4+VJwMIt1sFwVpLzs1KaDxk/WO58wzWR4NZUFP5ZrMcbP3dsxDCM5pt/3044Tc6HQeCGynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmpoVErm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769172709; x=1800708709;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cUY0r/FNd1aopzfzMc7dHAsbHUbwXn/bYghX4YrzMp4=;
  b=MmpoVErmYGGs9cPWvKrz3X02y6FIvh8Kb3SXWBSxeYj69RboInh6l7vG
   1N+E6Oh2tt85emurNtx1qyUXlxj/w7p9JYoEUapoiRk4j5n8sNcghqAfp
   XL58x/hBSREnEDWBFKwUCyRJsexYbSdnUE70Rg9eY9NNPH08PKPlrQFS4
   CNQ9QCkeS2dxPvCInv7wyltB+AAV4tVKe5P46GU7dAoGiW5uYEOJnNsFg
   kuXE+wcxN1GkRoubZ0FQ44oUz0az5Am51t8CBkiEdjq7XST3IKPn0CRVV
   GJFkXn3AmrGRF+BgSFW5YKqnedUdBgZvks4CSCNkKxkLX/hQ/rQ5O0msZ
   w==;
X-CSE-ConnectionGUID: mdBwg5J7R8W/FsEVEL/4WQ==
X-CSE-MsgGUID: SMKHEduMRU2k6swpWKgV6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="57996465"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="57996465"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 04:51:48 -0800
X-CSE-ConnectionGUID: WWkZhy1fQJuhcM6yeRDnSA==
X-CSE-MsgGUID: OtLrmKrKTaSiuVJu92Cn4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207361414"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.81.104]) ([10.245.81.104])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 04:51:46 -0800
Message-ID: <2725a747-2070-4733-a69f-cb4422755e8f@linux.intel.com>
Date: Fri, 23 Jan 2026 14:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] usb:xhci:route device to secondary interrupters
To: raoxu <raoxu@uniontech.com>, mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org, kenny@panix.com, linux-usb@vger.kernel.org,
 michal.pecio@gmail.com, zhanjun@uniontech.com
References: <6b32133b-35ef-4ee5-89a8-5d4cd9e3ab68@linux.intel.com>
 <D1E5DA225382C9DF+20260122133529.3365410-1-raoxu@uniontech.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <D1E5DA225382C9DF+20260122133529.3365410-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,gmail.com,uniontech.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-32646-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 50E7E76042
X-Rspamd-Action: no action



On 22/01/2026 15.35, raoxu wrote:
> Hi Niklas,
> 
> Thanks for the detailed review and the concrete suggestions.
> 
> I'll go through each of your comments and rework the patch accordingly,
> including aligning secondary interrupter allocation/initialization with
> the primary path and tightening the IRQ handling loops and naming.
> 
> I also have an idea I'd like to discuss with you before sending patch v10.
> It's related to secondary event timing around S4 on some systems, and how
> to ensure we handle late events at the right boundary. I'll describe the
> approach in a follow-up and would appreciate your feedback.
> 
> Phenomenon:
> With v9 (routing devices to secondary interrupters), some machines show
> intermittent warnings during S4 such as:
>  xhci_hcd 0000:03:00.3: Event dma 0x00000000ffe3e810 for ep 2 status 13
>  not part of TD at 00000000ffe3ea20 - 00000000ffe3ea20
>  xhci_hcd 0000:00:14.0: Event TRB for slot 17 ep 1 with no TDs queued
> In our testing these messages do not impact device functionality.
> 
> Analysis:
> My hypothesis is that slot/endpoint teardown can complete (TD lists are
> removed and the endpoint/slot transitions are finished), while the
> secondary event ring still contains late transfer events for the same
> slot. When those events are processed after the software TD state has
> been reclaimed, xHCI reports completions that no longer match any queued
> TD, triggering the warnings.
> 
> Idea (xhci_drain_slot_secondary_events):
> The intent of xhci_drain_slot_secondary_events is to proactively consume
> and handle any remaining secondary-ring events for a given Slot ID at a
> well-defined boundary (e.g., right after a slot/endpoint-affecting
> command completion, before tearing down TD bookkeeping). It handles the
> secondary event ring so that late completions for that slot are handled
> while the slot context/TD tracking is still coherent, avoiding residual
> events being processed after teardown.
> 
> The example code is as follows, and it can also be submitted as another patch.

Hi Xu,

This looks like a good solution to me.

Thanks,
Niklas

> 
> @@ -1860,6 +1863,10 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
>         }
> 
>         cmd_type = TRB_FIELD_TO_TYPE(le32_to_cpu(cmd_trb->generic.field[3]));
> +
> +       /* Drain slot secondary events before command-specific teardown logic */
> +       xhci_drain_slot_secondary_events(xhci, cmd_trb);
> +
>         switch (cmd_type) {
>         case TRB_ENABLE_SLOT:
>                 xhci_handle_cmd_enable_slot(slot_id, cmd, cmd_comp_code);
> @@ -3138,6 +3145,72 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
>         return 0;
>  }
> 
> +/*
> + * Handle a slot's secondary event ring at command completion boundaries.
> + *
> + * With secondary interrupters, transfer events may lag behind command
> + * completions (handled on interrupter 0). Commands that stop/reset/disable
> + * endpoints/slots can reclaim TD state before those transfer events are
> + * processed, leading to "Spurious event dma" reports. Call this from
> + * handle_cmd_completion() before command-specific completion handling.
> + */
> +static void xhci_drain_slot_secondary_events(struct xhci_hcd *xhci,
> +               union xhci_trb *cmd_trb)
> +{
> +       u32 field3, cmd_type, slot_id;
> +       struct xhci_virt_device *vdev;
> +       struct xhci_interrupter *sec_ir;
> +       unsigned int intr;
> +
> +       /* No secondary routing -> nothing to do */
> +       if (!xhci->secondary_irqs_enabled)
> +               return;
> +
> +       field3   = le32_to_cpu(cmd_trb->generic.field[3]);
> +       cmd_type = TRB_FIELD_TO_TYPE(field3);
> +       slot_id  = TRB_TO_SLOT_ID(field3);
> +
> +       if (!slot_id)
> +               return;
> +
> +       /*
> +        * Drain only for commands that can stop/reset/disable endpoints/slots
> +        * and/or cause the driver to reclaim TD ownership.
> +        */
> +       switch (cmd_type) {
> +       case TRB_STOP_RING:
> +       case TRB_SET_DEQ:
> +       case TRB_RESET_EP:
> +       case TRB_RESET_DEV:
> +       case TRB_DISABLE_SLOT:
> +               break;
> +       case TRB_CONFIG_EP:
> +               /* Only needed for deconfigure (drop endpoints) */
> +               if (!(field3 & TRB_DC))
> +                       return;
> +               break;
> +       default:
> +               return;
> +       }
> +       intr = vdev->interrupter->intr_num;
> +       if (!intr)
> +               return; /* slot is on primary interrupter */
> +
> +       sec_ir = xhci->interrupters[intr];
> +       if (!sec_ir || !sec_ir->event_ring)
> +               return;
> +
> +       lockdep_assert_held(&xhci->lock);
> +
> +       /* Handle pending events normally to complete URB/TD bookkeeping. */
> +       xhci_handle_events(xhci, sec_ir, false);
> +}
> +


