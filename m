Return-Path: <linux-usb+bounces-8722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C1894FF4
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 12:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C26321C22DAB
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 10:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A32D5B694;
	Tue,  2 Apr 2024 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYYD19lJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA305A4CB
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053295; cv=none; b=AbAeC63ekMU5yODZwLWAssToFT8dP1CPDRlYO11S/U/z0B+oeUbMqj13iyaWou2iUUI8W3QIC/0JjOl8d0yBT55bLc4g4w5KiTk26Bl0PGHdfjC44hO0HspSxAgoFRa6Z6wiIklLzrCBQ48Ri63jeNjerTufEVgjfs40Umfn2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053295; c=relaxed/simple;
	bh=378YvAmdMpGD4ZQNqC3NwZO20GwjD0l4dmHNTFwOyoY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=cRyjLJW1LTn7DuySUKv2c+wtE7sAvIfO9SVOLo/D57YE3FJ3IegERbquRR6CbGRXDlATdIeOgORHoBHHsuklLFhGUsC/tkH20ndZk0ojHIQ6cg01X4mOMBFeJcmG1rv0aOUgF3WP4jvRdtIJ+Mfqx7GAyDY/7OeCzT4WGqMGNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYYD19lJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712053295; x=1743589295;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=378YvAmdMpGD4ZQNqC3NwZO20GwjD0l4dmHNTFwOyoY=;
  b=hYYD19lJMLxFuHaEu4tlR1fpKcuhMmzRQnC0sQB2gxS70CtC2TEsStDg
   zIYJEsGlzXGEd6kBJgqhD7bxi2Km6Os0sApn5kWnr9E7k2+SdIpV/6Fy8
   j4jOsLsB4wKLBgJCNp5p1KAB2HVgYynAFxdc95ECaUWJPZEqoliohATrP
   CObcBjPAlpdhUiByolf6wjYcQLn270kQuu+JVQxlsTnrkGcXWo1ql0yK4
   PNHV95aEpIXuxeU57Fh9LBdB1FswT+V8EuDmBWDVS4A6/6Af0pfOwz3Yn
   KSe0S1tzA2FDLTGoUaI7xxqqXDoxwU9DKZYQAslZP1SjTAZoXLyuCAfB9
   w==;
X-CSE-ConnectionGUID: th244CVFQuq94smMchV7Dg==
X-CSE-MsgGUID: ogtobubfSTK4ZNJPzA3vYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24671012"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="24671012"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083289"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083289"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2024 03:21:32 -0700
Message-ID: <7726873f-940f-fe88-f065-2ef23edd3ab1@linux.intel.com>
Date: Tue, 2 Apr 2024 13:23:19 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Niklas Neronin <niklas.neronin@intel.com>
References: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
 <20240229141438.619372-3-mathias.nyman@linux.intel.com>
 <20240402005007.klv2ij727fkz7rpd@synopsys.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 2/9] xhci: replace real & fake port with pointer to root
 hub port
In-Reply-To: <20240402005007.klv2ij727fkz7rpd@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thinh

On 2.4.2024 3.50, Thinh Nguyen wrote:
> Hi Mathias,
> 
> We're getting a NULL pointer dereference bug for this patch. To
> reproduce this, just unload and reload the xhci driver while a device is
> connected. It may take a few times to hit the issue.
> 
> [ 1515.737623] BUG: kernel NULL pointer dereference, address: 000000000000000c
> [ 1515.737629] #PF: supervisor read access in kernel mode
> [ 1515.737631] #PF: error_code(0x0000) - not-present page
> [ 1515.737633] PGD 0 P4D 0
> [ 1515.737636] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [ 1515.737639] CPU: 1 PID: 2905 Comm: kworker/1:0 Not tainted 6.9.0-rc2-snps-detached-HEAD-g5bab5dc780c9 #8
> [ 1515.737642] Hardware name: System manufacturer System Product Name/PRIME Q370M-C, BIOS 2605 10/16/2019
> [ 1515.737643] Workqueue: usb_hub_wq hub_event
> [ 1515.737648] RIP: 0010:trace_event_raw_event_xhci_log_free_virt_dev+0x64/0xb7 [xhci_hcd]
> [ 1515.737667] Code: 85 c0 74 59 48 89 58 08 48 8b 53 18 48 89 e7 48 8b 52 10 48 89 50 18 48 8b 53 10 48 8b 52 10 48 89 50 10 48 8b 93 90 11 00 00 <8b> 52 0c 89 50 20 48 8b 93 90 11 00 00 8b 52 08 89 50 24 8b 93 b0
> [ 1515.737669] RSP: 0018:ffffac30c0bdbce8 EFLAGS: 00010086
> [ 1515.737671] RAX: ffff99e0003309b8 RBX: ffff99e040fb4000 RCX: ffff99e0003309b4
> [ 1515.737673] RDX: 0000000000000000 RSI: 0000000000000616 RDI: ffffac30c0bdbce8
> [ 1515.737729] RBP: ffff99e007b58a20 R08: 0000000000000002 R09: 0000000000000010
> [ 1515.737731] R10: 000000014d33cf30 R11: 0000000000000020 R12: 0000000000000001
> [ 1515.737733] R13: ffff99e008c9a294 R14: ffff99e008c9a258 R15: ffff99e004ca5000
> [ 1515.737734] FS:  0000000000000000(0000) GS:ffff99e35bc40000(0000) knlGS:0000000000000000
> [ 1515.737736] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1515.737738] CR2: 000000000000000c CR3: 00000001024d6004 CR4: 00000000003706f0
> [ 1515.737740] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 1515.737741] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 1515.737743] Call Trace:
> [ 1515.737746]  <TASK>
> [ 1515.737748]  ? __die_body+0x1a/0x5c
> [ 1515.737751]  ? page_fault_oops+0x2ea/0x380
> [ 1515.737806]  ? sched_clock+0x10/0x23
> [ 1515.737808]  ? trace_clock_local+0x10/0x23
> [ 1515.737812]  ? exc_page_fault+0xfe/0x11e
> [ 1515.737815]  ? asm_exc_page_fault+0x26/0x30
> [ 1515.737818]  ? trace_event_raw_event_xhci_log_free_virt_dev+0x64/0xb7 [xhci_hcd]
> [ 1515.737832]  ? trace_event_raw_event_xhci_log_free_virt_dev+0x39/0xb7 [xhci_hcd]
> [ 1515.737844]  xhci_free_virt_device+0x76/0x1d8 [xhci_hcd]
> [ 1515.737856]  xhci_free_dev+0x111/0x12f [xhci_hcd]
> [ 1515.737867]  hub_event+0xca6/0x137e

Thanks for the report, and for debugging this.
I was able to reproduce it myself using your steps.

This triggers if xhci tracing is enabled and usb device is freed before it's addressed
as vdev->rhub_port is only set during addressing.

> 
> 
> To capture the tracepoints and avoid the NULL pointer, I made this
> change:
> 

I think we could skip printing the hcd_portnum and hw_portnum during
xhci_free_virt_dev() tracing. I haven't really found them useful.

It would make sense to print the slot_id instead.

how about this:

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 1740000d54c2..5762564b9d73 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -172,8 +172,7 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
                 __field(void *, vdev)
                 __field(unsigned long long, out_ctx)
                 __field(unsigned long long, in_ctx)
-               __field(int, hcd_portnum)
-               __field(int, hw_portnum)
+               __field(int, slot_id)
                 __field(u16, current_mel)
  
         ),
@@ -181,13 +180,12 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
                 __entry->vdev = vdev;
                 __entry->in_ctx = (unsigned long long) vdev->in_ctx->dma;
                 __entry->out_ctx = (unsigned long long) vdev->out_ctx->dma;
-               __entry->hcd_portnum = (int) vdev->rhub_port->hcd_portnum;
-               __entry->hw_portnum = (int) vdev->rhub_port->hw_portnum;
+               __entry->slot_id = (int) vdev->slot_id;
                 __entry->current_mel = (u16) vdev->current_mel;
                 ),
-       TP_printk("vdev %p ctx %llx | %llx hcd_portnum %d hw_portnum %d current_mel %d",
-               __entry->vdev, __entry->in_ctx, __entry->out_ctx,
-               __entry->hcd_portnum, __entry->hw_portnum, __entry->current_mel
+       TP_printk("vdev %p slot %d ctx %llx | %llx current_mel %d",
+               __entry->vdev, __entry->slot_id, __entry->in_ctx,
+               __entry->out_ctx, __entry->current_mel
         )
  );

It works for me

Thanks
Mathias


