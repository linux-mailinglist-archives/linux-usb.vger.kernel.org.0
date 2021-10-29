Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D45C43FC9A
	for <lists+linux-usb@lfdr.de>; Fri, 29 Oct 2021 14:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhJ2Mta (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Oct 2021 08:49:30 -0400
Received: from mga05.intel.com ([192.55.52.43]:17126 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231616AbhJ2Mt3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Oct 2021 08:49:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="316855289"
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; 
   d="scan'208";a="316855289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 05:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; 
   d="scan'208";a="636684880"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2021 05:46:59 -0700
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Pavan Kondeti <pkondeti@codeaurora.org>,
        youling 257 <youling257@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20211008092547.3996295-5-mathias.nyman@linux.intel.com>
 <20211022105913.7671-1-youling257@gmail.com>
 <CAOzgRdY8+Wm-Ane==RQTvEe4aKa40+h1VF9JSg8WQsm-XH0ZCw@mail.gmail.com>
 <8c3cd8f7-0bd1-0ec4-2f58-6122ae7ef270@linux.intel.com>
 <CAOzgRdb2MK5mVonatO7t9DcXwtK=MbDwdWreR+6dpqvEv7R0Fw@mail.gmail.com>
 <7f21f732-3f88-baba-38de-e94d9d6e993d@linux.intel.com>
 <20211026104910.GA21371@codeaurora.org>
 <64b2d3ef-7470-ddc4-0af5-5cbd889d8092@linux.intel.com>
 <20211028080302.GA14180@hu-pkondeti-hyd.qualcomm.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 4/5] xhci: Fix command ring pointer corruption while
 aborting a command
Message-ID: <e96e2a96-00c4-6e6b-fc5a-e4a881325dc0@linux.intel.com>
Date:   Fri, 29 Oct 2021 15:48:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211028080302.GA14180@hu-pkondeti-hyd.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Thanks Mathias for the detailed explanation. Agree that your patch is good
> enough for the current situation. May be a TODO comment here would help. 
> 

Changed the patch to write the _next_ command instead of the current to CRCR.

Pavan, youling 257, I'd appreciate if you could give this one more patch a try.
Your cases are hard to reprodudce with my setup.

And if it works can I add your "Tested-by:" tags to it?

Thanks, 
-Mathias

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 311597bba80e..eaa49aef2935 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -366,7 +366,9 @@ static void xhci_handle_stopped_cmd_ring(struct xhci_hcd *xhci,
 /* Must be called with xhci->lock held, releases and aquires lock back */
 static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 {
-	u32 temp_32;
+	struct xhci_segment *new_seg    = xhci->cmd_ring->deq_seg;
+	union xhci_trb *new_deq         = xhci->cmd_ring->dequeue;
+	u64 crcr;
	int ret;

	xhci_dbg(xhci, "Abort command ring\n");
@@ -375,13 +377,18 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)

	/*
	 * The control bits like command stop, abort are located in lower
-	 * dword of the command ring control register. Limit the write
-	 * to the lower dword to avoid corrupting the command ring pointer
-	 * in case if the command ring is stopped by the time upper dword
-	 * is written.
+	 * dword of the command ring control register.
+	 * Some controllers require all 64 bits to be written to abort the ring.
+	 * Make sure the upper dword is valid, pointing to the next command,
+	 * avoiding corrupting the command ring pointer in case the command ring
+	 * is stopped by the time the upper dword is written.
	 */
-	temp_32 = readl(&xhci->op_regs->cmd_ring);
-	writel(temp_32 | CMD_RING_ABORT, &xhci->op_regs->cmd_ring);
+	next_trb(xhci, NULL, &new_seg, &new_deq);
+	if (trb_is_link(new_deq))
+		next_trb(xhci, NULL, &new_seg, &new_deq);
+
+	crcr = xhci_trb_virt_to_dma(new_seg, new_deq);
+	xhci_write_64(xhci, crcr | CMD_RING_ABORT, &xhci->op_regs->cmd_ring);

	/* Section 4.6.1.2 of xHCI 1.0 spec says software should also time the
	 * completion of the Command Abort operation. If CRR is not negated in 5
