Return-Path: <linux-usb+bounces-37337-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FkgG7UzA2oA1gEAu9opvQ
	(envelope-from <linux-usb+bounces-37337-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 16:05:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C65F521F12
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 16:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F192C304D172
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C933A71AA;
	Tue, 12 May 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZixUqq7R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892ED3A59AD
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594502; cv=none; b=Vd9MzCEPjSQM89MDuQPhEMhynqqxeX9KjBnfCFHXNupVLEplWKAQUz1GpV4XXCGAwSE0O+8xwl8GL272lnTEwG1qjgBRDpb+sHsleGx8VYIo+viHzxRcOkD8i+yukHJffcnvuZG4/HzkXZFdOdAO8VFnIa7KN6FwAd5fcLtabSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594502; c=relaxed/simple;
	bh=YJcZqzcZioGDd6oNQJk6R3fdx1ohECUjfKesgeMv1Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sm5kbw3t7OMrzomi0ydUqzdTvv3nitr8/M0xTj5DZfPzbaiKtJOpkTBlBqPTmP3GZ3DJ4Iw5rCNmQr9Nl7UoG9KCm4Uzdwzc4CXbfUUkuHX7Cs2/2OGZpsIbGAcKXCb6v6yo7nsZkdkSmKosgZ1BT2DXOcZuEnXuU7cwKGrag2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZixUqq7R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778594502; x=1810130502;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YJcZqzcZioGDd6oNQJk6R3fdx1ohECUjfKesgeMv1Cc=;
  b=ZixUqq7RnYBKZWMA9s9//E6L4kb6AJ1kg/BdGAsDVF4vbTzfdo5UzZNd
   GEDJlISD8uMH5j349mLvIByl48ASSGCLSS0x29E3/Q+nn9Tq09zIJ26bq
   zn8k6yhpkN8OjOq6pryATECILVy1mjI8u5rd63EwnQS7I/uWMH3hI9aJL
   4Tw4/olLUZSUDrsU4zSid2+lD2u3N+1gyR07jtGDeZMdsscw6D/ocOHq0
   ku1DBXDBpHd814OSgV4UA8FFxBLT5rOa/P4N/FPr48aC6Vy7Zk36Rpqqt
   E3P47ThB62CcLn9u2ftbYnJI11KpX718Wg61klh89H+AC1GEBXtL94Mdc
   w==;
X-CSE-ConnectionGUID: CGauNIcbQMSy7JmEBkfraQ==
X-CSE-MsgGUID: nf6670UkQumqNgW+0ZaluQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78649494"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="78649494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 07:01:41 -0700
X-CSE-ConnectionGUID: g3QtO69kTremNCHv5BfHHg==
X-CSE-MsgGUID: Xnaoz2YHQfKpzdNUhvK3Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239599485"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.165]) ([10.245.245.165])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 07:01:40 -0700
Message-ID: <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
Date: Tue, 12 May 2026 17:01:37 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>,
 Martin Alderson <martinalderson@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com>
 <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com>
 <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com>
 <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260512120334.4eef3d0b.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0C65F521F12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-37337-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Action: no action

On 5/12/26 13:03, Michal Pecio wrote:
> On Sun, 10 May 2026 17:29:26 +0100, Martin Alderson wrote:
>> 1. The timing is during suspend in every single failure I have logs
>> for. I went back through 7 weeks of persistent journals and pulled the
>> context around every "HC died" event. All 9 failures show the same
>> sequence:
>>
>>    xhci_hcd 0000:0f:00.0: xHCI host not responding to stop endpoint command
>>    xhci_hcd 0000:0f:00.0: xHCI host controller not responding, assume dead
>>    xhci_hcd 0000:0f:00.0: HC died; cleaning up
>>    PM: suspend devices took 5.5--6.1 seconds      <-- elevated
>>    amdgpu 0000:03:00.0: MODE1 reset
>>    ACPI: PM: Preparing to enter system sleep state S3
>>
>> So it's reliably during suspend, before S3 entry, and the elevated
>> "suspend devices took" matches the 5s xHCI stop-endpoint timeout. A
>> clean suspend on the same boot takes ~0.46s.
> 
> The S3 state probably doesn't matter, chances are that it would also
> happen with s2idle or hibernation.
> 
> Could you enable dynamic debug before every suspend (or permanently
> on every boot) and collect a dmesg log of this happening again?
> And maybe also a snapshot of debugfs directory after resume but before
> unbinding xhci_hcd. These may contain clues what triggered it.

It's possible there is a race between queuing a command and suspend.
It looks like nothing is preventing a new command from being queued while
suspend stops the host from running, thus causing commands to timeout.

Suspend isn't checking if there are pending commands, or if command timer
is running either.

I wrote some debugging code, can be found in my debug_hc_died_cmdring_race branch:
git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git debug_hc_died_cmdring_race
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=debug_hc_died_cmdring_race

If it prints
   "Can't queue command, xHC not accessible (stopped?)"
or
   "Suspending and stopping xHC with pending command(s)!!!"
Then we have a queue_command - suspend race.

Code below for reference
Mathias

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e47e644b296e..50ce4a4a7fe3 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4353,6 +4353,7 @@ static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
  			 u32 field3, u32 field4, bool command_must_succeed)
  {
  	int reserved_trbs = xhci->cmd_ring_reserved_trbs;
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
  	int ret;
  
  	if ((xhci->xhc_state & XHCI_STATE_DYING) ||
@@ -4362,6 +4363,14 @@ static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
  		return -ESHUTDOWN;
  	}
  
+	if (!HCD_HW_ACCESSIBLE(hcd)) {
+		xhci_err(xhci, "Can't queue command, xHC not accessible (stopped?)\n");
+		xhci_err(xhci, "called by %pS from %pS\n",
+			 __builtin_return_address(0),
+			 __builtin_return_address(1));
+		return -ESHUTDOWN;
+	}
+
  	if (!command_must_succeed)
  		reserved_trbs++;
  
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a54f5b57f205..04279fbbe1dd 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -949,6 +949,34 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
  	return false;
  }
  
+static void xhci_dump_ring(struct xhci_hcd *xhci, struct xhci_ring *ring)
+{
+	struct xhci_segment	*seg;
+	union xhci_trb		*trb;
+	dma_addr_t		dma;
+	char			str[XHCI_MSG_MAX];
+	int			i, j;
+
+	seg = ring->first_seg;
+	dma =  xhci_trb_virt_to_dma(ring->deq_seg, ring->dequeue);
+
+        xhci_err(xhci, "Dequeue: %pad\n", &dma);
+
+	for (i = 0; i < ring->num_segs; i++) {
+		for (j = 0; j < TRBS_PER_SEGMENT; j++) {
+			trb = &seg->trbs[j];
+			dma = seg->dma + j * sizeof(*trb);
+			xhci_err(xhci, "%pad: %s\n", &dma,
+				 xhci_decode_trb(str, XHCI_MSG_MAX,
+						 le32_to_cpu(trb->generic.field[0]),
+						 le32_to_cpu(trb->generic.field[1]),
+						 le32_to_cpu(trb->generic.field[2]),
+						 le32_to_cpu(trb->generic.field[3])));
+		}
+		seg = seg->next;
+	}
+}
+
  /*
   * Stop HC (not bus-specific)
   *
@@ -999,6 +1027,12 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
  	/* step 1: stop endpoint */
  	/* skipped assuming that port suspend has done */
  
+	/* Check if command ring is empty */
+	if (!list_empty(&xhci->cmd_list)) {
+		xhci_err(xhci, "Suspending and stopping xHC with pending command(s)!!!\n");
+		xhci_dump_ring(xhci, xhci->cmd_ring);
+	}
+
  	/* step 2: clear Run/Stop bit */
  	command = readl(&xhci->op_regs->command);
  	command &= ~CMD_RUN;

