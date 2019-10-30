Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 469AAE988C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 09:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfJ3I5i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 04:57:38 -0400
Received: from mga07.intel.com ([134.134.136.100]:20844 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbfJ3I5i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Oct 2019 04:57:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 01:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; 
   d="scan'208";a="351242996"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga004.jf.intel.com with ESMTP; 30 Oct 2019 01:57:35 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>, Roger Quadros <rogerq@ti.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu \[EP\]" <b-liu@ti.com>
Subject: Re: g_audio breaks with dwc3
In-Reply-To: <20191030081757.GB12661@jackp-linux.qualcomm.com>
References: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com> <20191030081757.GB12661@jackp-linux.qualcomm.com>
Date:   Wed, 30 Oct 2019 10:57:34 +0200
Message-ID: <87mudihapt.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Jack Pham <jackp@codeaurora.org> writes:
> Will try to take a stab at this...
>
> On Tue, Oct 29, 2019 at 01:30:23PM +0200, Roger Quadros wrote:
>>     irq/170-dwc3-1240  [000] d...    85.449686: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>     irq/170-dwc3-1240  [000] d...    85.449688: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
>>     irq/170-dwc3-1240  [000] d...    85.449693: dwc3_ep_dequeue: ep1out: req ee75d6ac length 0/256 zsI ==> -115
>>     irq/170-dwc3-1240  [000] d...    85.449697: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
>>     irq/170-dwc3-1240  [000] d...    85.449799: dwc3_free_request: ep1out: req ee75d6ac length 0/256 zsI ==> -115
>
> req ee75d6ac is dequeued by f_uac2, and immediately freed. There is no
> giveback here, but oddly the givebacks happen at the end of the log
> right before the panic.
>
>>     irq/170-dwc3-1240  [000] d...    85.449800: dwc3_ep_dequeue: ep1out: req c26c10a3 length 0/256 zsI ==> -115
>>     irq/170-dwc3-1240  [000] d...    85.449803: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [d08] params 00000000 00000000 00000000 --> status: Successful
>>     irq/170-dwc3-1240  [000] d...    85.449905: dwc3_free_request: ep1out: req c26c10a3 length 0/256 zsI ==> -115
>
> ditto for req c26c10a3
>
>>     irq/170-dwc3-1240  [000] d...    85.449906: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 3/1 flags E:swBp:>
>>     irq/170-dwc3-1240  [000] d...    85.449909: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful
>
> Finally usb_ep_disable() is called on ep1out.
>
>>     irq/170-dwc3-1240  [000] d...    85.450013: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>>     irq/170-dwc3-1240  [000] d...    85.450013: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>>     irq/170-dwc3-1240  [000] d...    85.450019: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
>>     irq/170-dwc3-1240  [000] d...    85.450026: dwc3_event: event (080201c4): ep1out: Endpoint Command Complete
>>     irq/170-dwc3-1240  [000] d...    85.450027: dwc3_event: event (080001c4): ep1out: Endpoint Command Complete
>
> Completions for the two End Transfer commands sent during ep_dequeue().
>
>>     irq/170-dwc3-1240  [000] d...    85.450043: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>>     irq/170-dwc3-1240  [000] d...    85.450044: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>>     irq/170-dwc3-1240  [000] d...    85.450047: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
>>     irq/170-dwc3-1240  [000] d...    85.450049: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>     irq/170-dwc3-1240  [000] d...    85.450055: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
>>     irq/170-dwc3-1240  [000] d...    85.450547: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>     irq/170-dwc3-1240  [000] d...    85.450550: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
>>     irq/170-dwc3-1240  [000] d...    85.450555: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
>>     irq/170-dwc3-1240  [000] d...    85.450556: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
>>     irq/170-dwc3-1240  [000] d...    85.450557: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
>>     irq/170-dwc3-1240  [000] d...    85.450559: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
>>     irq/170-dwc3-1240  [000] d...    85.450560: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
>>     irq/170-dwc3-1240  [000] d...    85.450561: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
>>     irq/170-dwc3-1240  [000] d...    85.450562: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
>>     irq/170-dwc3-1240  [000] d...    85.450564: dwc3_gadget_giveback: ep1out: req ee75d6ac length 0/256 zsI ==> -108
>>     irq/170-dwc3-1240  [000] d...    85.450566: dwc3_gadget_giveback: ep1out: req c26c10a3 length 0/256 zsI ==> -108
>>     irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d4301893 length 0/0 zsI ==> 0
>
> Giveback happens on above two reqs after they are already freed. Could
> it be due to f_uac2 / u_audio.c performing usb_ep_free_request()
> immediately after usb_ep_dequeue() without waiting for completion?

this could be a race condition. Add a trace_printk() at the cancelation,
see if the request is moved to cancelled list.

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 86dc1db788a9..affc2f7a929d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1513,6 +1513,7 @@ static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep)
 	struct dwc3_request		*tmp;
 
 	list_for_each_entry_safe(req, tmp, &dep->cancelled_list, list) {
+		trace_printk("---> completing cancellation of req %p\n", req);
 		dwc3_gadget_ep_skip_trbs(dep, req);
 		dwc3_gadget_giveback(dep, req, -ECONNRESET);
 	}
@@ -1551,6 +1552,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 			if (!r->trb)
 				goto out0;
 
+			trace_printk("---> req %p moved to cancelled\n", req);
 			dwc3_gadget_move_cancelled_request(req);
 			if (dep->flags & DWC3_EP_TRANSFER_STARTED)
 				goto out0;


-- 
balbi
