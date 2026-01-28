Return-Path: <linux-usb+bounces-32885-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAXHHJkRemnH2AEAu9opvQ
	(envelope-from <linux-usb+bounces-32885-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 14:39:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98308A23B5
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 14:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 778C0300794A
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 13:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C15352F8D;
	Wed, 28 Jan 2026 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="OJdiO8p/"
X-Original-To: linux-usb@vger.kernel.org
Received: from l2mail1.panix.com (l2mail1.panix.com [166.84.1.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE77722541C
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607574; cv=none; b=pTqgK/4urisKmDabuFyDPa8qQUCbaDL9C4+5Cqz7Aa1OxA/5dB/F0ErkhrIkLYn0m/d9w4hgq84O+tkhyYWVZssADj+Ipk3KoSp7Imv4RU+7+4UwUrCcUPvkj5NZZ4GfJcmpbY4SUPlNpX5VJ3UN2zodJ6ngeymok3tDZS8PZg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607574; c=relaxed/simple;
	bh=MruptA1sJlpcscJGti6hPBNhrQObFvGzSp9oVldQWMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2WVX0jMdEc2esdi5SylAIYZEGleVFz8p0NnHiYnkcIN3wxArAevp2phywSsXivlOFiWDekdsxjg3luuLcKEIizGYO6RvIacoWg492dcI85oxmE4mA0pbEC/rr5SABcvilxBCM+7Lx73dKNjw4CrE1lF4enq2sxfd+ZpEbQSN7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=OJdiO8p/; arc=none smtp.client-ip=166.84.1.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (1024 bits) server-digest SHA256)
	(No client certificate requested)
	by l2mail1.panix.com (Postfix) with ESMTPS id 4f1NCg6jsLzDQM
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 08:19:27 -0500 (EST)
Received: from [10.50.4.47] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4f1NCX4gpsz4trj;
	Wed, 28 Jan 2026 08:19:20 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1769606361; bh=MruptA1sJlpcscJGti6hPBNhrQObFvGzSp9oVldQWMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OJdiO8p/zQr1otu/x22wYAc/xFpVRBLvO6VLnFXj8fQ5LkYSXCRT73gL7Tot/mFs4
	 4UyQ+ql083QZ8cIrQO8l9ERcownJ3Uj9iFsWQu/Cw7canpuAyWgOASonriOH9leLzZ
	 DSkMUlg/8LBn3BPDXqcw8glofJ06wMHzgsKQ34eA=
Message-ID: <892f837a-0784-4e6b-bec3-9d37397422a0@panix.com>
Date: Wed, 28 Jan 2026 05:19:20 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/2] usb: xhci: route device to secondary interrupters
To: raoxu <raoxu@uniontech.com>, mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 michal.pecio@gmail.com, niklas.neronin@linux.intel.com, zhanjun@uniontech.com
References: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[panix.com,none];
	R_DKIM_ALLOW(-0.20)[panix.com:s=panix];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[panix.com:+];
	TAGGED_FROM(0.00)[bounces-32885-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kenny@panix.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,panix.com:email,panix.com:dkim,panix.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 98308A23B5
X-Rspamd-Action: no action



On 1/26/26 18:34, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> This series is split into two steps: patch 1/2 refactors xHCI IRQ and
> interrupter handling to make multi-vector operation possible without
> changing behavior; patch 2/2 then enables a small capped set of secondary
> interrupters/vectors and routes transfer completions per device (slot) to
> reduce contention on interrupter 0.
> 
> This is not about increasing USB link throughput, but about avoiding a
> driver-imposed single hot spot. On hosts that already provide multiple
> MSI/MSI-X vectors and independent event rings, routing all completions
> through interrupter 0 creates unnecessary contention (serialized event
> handling/locks and coupled moderation), increasing CPU cost and tail
> latency under many active devices/endpoints. Using secondary interrupters
> simply matches the hardware's design, similar in spirit to merged
> xHCI-sideband work: exploit available parallel paths rather than
> funneling all events through one.
> 
> Xu Rao (2):
>    usb: xhci: refactor IRQ/interrupter plumbing for multi-vector support
>    usb: xhci: enable secondary interrupters and route transfers per slot
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Tested-By: Kenneth R. Crudup <kenny@panix.com>

> ---
> Changelog:
> v1 -> v2:
>    - Bind interrupters to endpoints at enable time instead of selecting
>      per transfer.
>    - Store the selected interrupter in struct xhci_virt_ep and program
>      TRB_INTR_TARGET() from the bound interrupter.
>    - Use a single IRQ handler for both primary and secondary vectors,
>      with STS_EINT handling restricted to interrupter 0.
>    - Keep a common dev_id for IRQ registration to match the existing
>      xhci_cleanup_msix() teardown constraints and avoid dev_id
>      lifetime issues.
>    - Clarify secondary interrupter teardown to avoid double-free or
>      use-after-free during xHCI removal.
> v2 -> v3:
>    - modify commit information
> v3 -> v4:
>    - Bind interrupters per USB device (slot) via struct xhci_virt_device,
>      program TRB_INTR_TARGET() from vdev->interrupter for bulk/ctrl/isoc.
>    - Drop xfer_interrupters and unify on xhci->interrupters[] for both
>      primary and secondary event rings and IRQ routing.
>    - Allocate secondary interrupters in xhci_mem_init; on any allocation
>      failure, rollback and continue with primary interrupter only.
>    - Cap secondary interrupter creation with MAX_SECONDARY_INTRNUM,
>      defaulting to 4.
>    - Route xhci_msi_irq by irq handler_data token (intr_num + 1) to keep
>      correct interrupter selection across resume/power_lost.
>    - Apply MSI-X affinity hints for secondary vectors.
> v4 -> v5:
>    - Fix min() signedness build error reported by 0day CI.
>    - Rebase onto v6.19-rc2.
> v5 -> v6:
>    - Route secondary MSI/MSI-X IRQs by storing struct xhci_interrupter in
>      irq handler_data, instead of using an (intr_num + 1) token mapping.
>    - Program Slot Context Interrupter Target (tt_info[31:22]) from
>      vdev->interrupter to keep slot default routing aligned with TRB
>      TRB_INTR_TARGET() selection.
> v6 -> v7:
>    - Add xhci_quiesce_interrupter() and use it for secondary
>      interrupters in xhci_stop() and the power_lost path of xhci_resume(),
>      ensuring IMAN.IP (RW1C) and ERDP.EHB are properly cleared.
> v7 -> v8:
>    - Sync secondary MSI/MSI-X vectors in xhci_msix_sync_irqs() with
>      synchronize_irq().
>    - Fix build errors by adding missing header includes for the IRQ helper APIs.
> v8 -> v9:
>    - Use PCI_IRQ_AFFINITY to let PCI core spread MSI/MSI-X vectors across CPUs.
>    - Route each MSI/MSI-X vector to its interrupter via per-vector irq_ctx dev_id.
>    - Fix modpost error: xhci_msix_set_handler_data undefined (0-day CI).
>      https://lore.kernel.org/oe-kbuild-all/202601171743.omq3DpnM-lkp@intel.com/
>    - Rebase onto v6.19-rc6.
> v9 -> v10:
>    - refactor IRQ/interrupter plumbing for multi-vector support.
>    - add xhci_handle_slot_secondary_events to handle secondary event ring.
> v10 -> v11:
>    - Fix build warnings:-Wsometimes-uninitialized.
>      Closes: https://lore.kernel.org/oe-kbuild-all/202601262208.UybEjc9X-lkp@intel.com/
> ---
>   drivers/usb/host/xhci-mem.c  |  48 +++++++++++
>   drivers/usb/host/xhci-pci.c  |  57 ++++++++++---
>   drivers/usb/host/xhci-ring.c | 156 +++++++++++++++++++++++++++++------
>   drivers/usb/host/xhci.c      |  37 ++++++---
>   drivers/usb/host/xhci.h      |  26 +++++-
>   5 files changed, 274 insertions(+), 50 deletions(-)
> ---
> 

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


