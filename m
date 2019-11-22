Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87A1010720D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 13:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKVMQP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 07:16:15 -0500
Received: from mga17.intel.com ([192.55.52.151]:57770 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbfKVMQP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Nov 2019 07:16:15 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Nov 2019 04:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; 
   d="scan'208,223";a="201497099"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 22 Nov 2019 04:16:11 -0800
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 2 comp_code 13
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
References: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
 <4552b779-4b5a-7e81-39ec-0a4229b5d84d@linux.intel.com>
 <871B8184-D636-4F02-B9E9-B13A8BE078E8@canonical.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <23a9798e-704f-3444-42e2-e583a6991950@linux.intel.com>
Date:   Fri, 22 Nov 2019 14:17:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <871B8184-D636-4F02-B9E9-B13A8BE078E8@canonical.com>
Content-Type: multipart/mixed;
 boundary="------------F5EEED19256032A6B55BA9BE"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------F5EEED19256032A6B55BA9BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.11.2019 18.43, Kai-Heng Feng wrote:
> 
> 
>> On Nov 21, 2019, at 19:48, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
>>
>> On 21.11.2019 9.38, Kai-Heng Feng wrote:
>>> Hi,
>>> Currently there are two quirks for Dell TB16 to workaround an issue:
>>> "xhci: Bad Ethernet performance plugged in ASM1042A host", and
>>> "r8152: disable RX aggregation on Dell TB16 dock".
>>> However, the issue wasn't analyzed and root caused. I'd like to understand what's really going on here.
>>> Reverting those two patches, and as soon as doing TX/RX over the ethernet on TB16, xhci_hcd errors out:
>>> [   69.803804] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>>> [   69.803807] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1010 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>>> [   69.803900] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>>> [   69.803901] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1020 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>>> [   69.803998] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>>> [   69.803999] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1030 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>>> [   69.804096] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>>> [   69.804099] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1040 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>>> [   69.955830] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>>> [   69.955847] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1050 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>>> [   69.956704] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>>> [   69.956718] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1060 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>>> [   69.963802] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>>> [   69.963819] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1070 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>>> [   70.112302] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>>> [   70.112321] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1080 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>>> So, under what circumstances the DMA pointer can be out of the TD?
>>
>> When the TRB pointer field of the transfer event doesn't point to a TRB
>> in the TD the xhci driver was expecting next.
>> In your case xhci driver expects an event for a TD (TRB) at 0x47c4b0fe0
>>
>> Looks like driver didn't get that event, or didn't handle it properly.
>> Hardware continues processing TRBs in the ring, sending events for later TDs.
>>
>> Your case looks something like this:
>> endpoint ring segment 1: 256 TRBs (47c047c4b0000 -47c4b0ff0)
>> 000000047c4b0000  1st TRB
>> 000000047c4b0010  2nd TRB
>> ....
>> 000000047c4b0fd0  TRB that driver has handled
>> 000000047c4b0fe0  TRB driver expect an event for
>> 000000047c4b0ff0  LINK TRB, Last TRB of this segment, points to next segment. (probably pointing to 000000047c4b1000
>> endpoint ring segment 2: 256 TRBs (probably 47c047c4b1000 -47c4b1ff0)
>> 000000047c4b1000  TRB (Log donsn't cover this, probably hw competed?)
>> 000000047c4b1010  TRB hardware has completed (short packet 13)
>> 000000047c4b1020  TRB hardware has completed (short packet 13)
>> 000000047c4b1030  TRB hardware has completed (short packet 13)
>> 000000047c4b1040  TRB hardware has completed (short packet 13)
>> 000000047c4b1050  TRB hardware has completed (short packet 13)
>> 000000047c4b1060  TRB hardware has completed (short packet 13)
>> 000000047c4b1070  TRB hardware has completed (short packet 13)
>> 000000047c4b1080  TRB hardware has completed (short packet 13), hardware handling is here while software still waiting for an event for TRB at 47c4b0fe0
>>
>> If you can get xhci traces, dmesg and a snapshot of the xhci event and transfer ring
>> ring after this, we could see if hardware ever wrote the missing event to the event ring,
>> or if driver just failed to handle it properly.
> 
> [  112.224838] rfkill: input handler disabled
> [  434.653968] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 32392 bytes untransferred
> [  438.461323] xhci_hcd 0000:3f:00.0: Cancel URB 00000000c8b2b6a0, dev 1.5, ep 0x7, starting at offset 0x47ccc97b0
> [  438.461338] xhci_hcd 0000:3f:00.0: // Ding dong!
> [  438.461356] xhci_hcd 0000:3f:00.0: Cancel URB 00000000fb7b60a7, dev 1.5, ep 0x7, starting at offset 0x47ccc96f0
> [  438.461367] xhci_hcd 0000:3f:00.0: Cancel URB 0000000008bbc1d8, dev 1.5, ep 0x7, starting at offset 0x47ccc9750
> [  438.461988] xhci_hcd 0000:3f:00.0: Stopped on Transfer TRB for slot 4 ep 13
> [  438.462000] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97b0 (dma).
> [  438.462006] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97c0 (dma).
> [  438.462009] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97d0 (dma).
> [  438.462013] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97e0 (dma).
> [  438.462017] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97f0 (dma).
> [  438.462020] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9800 (dma).
> [  438.462024] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9730 (dma).
> [  438.462028] xhci_hcd 0000:3f:00.0: Finding endpoint context
> [  438.462032] xhci_hcd 0000:3f:00.0: Cycle state = 0x0
> [  438.462037] xhci_hcd 0000:3f:00.0: New dequeue segment = 000000002f634d54 (virtual)
> [  438.462041] xhci_hcd 0000:3f:00.0: New dequeue pointer = 0x47ccc9740 (DMA)
> [  438.462045] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9740 (dma).
> [  438.462049] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9750 (dma).
> [  438.462053] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9760 (dma).
> [  438.462056] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9770 (dma).
> [  438.462060] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9780 (dma).
> [  438.462063] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9790 (dma).
> [  438.462067] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97a0 (dma).
> [  438.462074] xhci_hcd 0000:3f:00.0: Set TR Deq Ptr cmd, new deq seg = 000000002f634d54 (0x47ccc9000 dma), new deq ptr = 00000000872eb19e (0x47ccc9740 dma), new cycle = 0
> [  438.462080] xhci_hcd 0000:3f:00.0: // Ding dong!
> [  438.462304] xhci_hcd 0000:3f:00.0: Successful Set TR Deq Ptr cmd, deq = @47ccc9740
> [  438.467571] xhci_hcd 0000:3f:00.0: xhci_drop_endpoint called for udev 0000000097a7fbc6
> [  438.467613] xhci_hcd 0000:3f:00.0: drop ep 0x7, slot id 4, new drop flags = 0x4000, new add flags = 0x0
> [  438.467621] xhci_hcd 0000:3f:00.0: xhci_check_bandwidth called for udev 0000000097a7fbc6
> [  438.467633] xhci_hcd 0000:3f:00.0: // Ding dong!
> [  438.468374] xhci_hcd 0000:3f:00.0: Successful Endpoint Configure command
> [  443.093658] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 32392 bytes untransferred
> [  446.365530] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 32656 bytes untransferred
> [  446.366192] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 32480 bytes untransferred
> ...
> [  447.067231] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 25048 bytes untransferred
> [  447.067544] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [  447.067553] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d010 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
> [  447.076669] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [  447.076682] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d020 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
> [  447.175990] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [  447.176009] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d030 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
> [  447.189334] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [  447.189350] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d040 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
> [  447.375676] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [  447.375690] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d050 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
> [  447.376920] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [  447.376930] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d060 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
> [  447.386611] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [  447.386628] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d070 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
> [  447.488879] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [  447.488891] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d080 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
> 
> 
>>
>> I don't have a nice way of triggering ring dumping at some specific instance, but there
>> is generic debugfs ring dump code in xhci-debugfs.c
>>
>> (cat /sys/kernel/debug/usb/xhci/0000:3f:00.0/event-ring/trbs for sample output)
> 
> 0x0000000498764000: TRB 0000000499941730 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
> 0x0000000498764010: TRB 0000000499941740 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C

The event ring is already overwritten with new events when dumped.

Could you apply the code below, it will dump both the endpoint transfer ring
and the event ring at the right moment:

Attached as a patch as well.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 620846f30b4f..a1a9a408c479 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -201,6 +201,31 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
   * @more_trbs_coming:  Will you enqueue more TRBs before calling
   *                     prepare_transfer()?
   */
+
+static int xhci_dump_ring(struct xhci_hcd *xhci, struct xhci_ring *ring)
+{
+       struct xhci_segment     *seg;
+       dma_addr_t              dma;
+       union xhci_trb          *trb;
+       int                     i, j;
+
+       seg = ring->first_seg;
+
+       for (i = 0; i < ring->num_segs; i++) {
+               for (j = 0; j < TRBS_PER_SEGMENT; j++) {
+                       trb = &seg->trbs[j];
+                       dma = seg->dma + j * sizeof(*trb);
+                       xhci_err(xhci, "%pad: %s\n", &dma,
+                                xhci_decode_trb(le32_to_cpu(trb->generic.field[0]),
+                                                le32_to_cpu(trb->generic.field[1]),
+                                                le32_to_cpu(trb->generic.field[2]),
+                                                le32_to_cpu(trb->generic.field[3])));
+               }
+               seg = seg->next;
+       }
+       return 0;
+}
+
  static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
                         bool more_trbs_coming)
  {
@@ -2318,6 +2343,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
         u32 trb_comp_code;
         int td_num = 0;
         bool handling_skipped_tds = false;
+       static unsigned int err_cnt;
  
         slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
         ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
@@ -2579,6 +2605,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
                                 trb_in_td(xhci, ep_ring->deq_seg,
                                           ep_ring->dequeue, td->last_trb,
                                           ep_trb_dma, true);
+                               if (err_cnt++ == 5) {
+                                       xhci_err(xhci, "EVENT RING:\n");
+                                       xhci_dump_ring(xhci, xhci->event_ring);
+                                       xhci_err(xhci, "ENDPOINT RING:\n");
+                                       xhci_dump_ring(xhci, ep_ring);
+                               }
                                 return -ESHUTDOWN;
                         }

--------------F5EEED19256032A6B55BA9BE
Content-Type: text/x-patch;
 name="0001-xhci-dump-event-ring-and-endpoint-ring-if-TRB-not-fo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xhci-dump-event-ring-and-endpoint-ring-if-TRB-not-fo.pa";
 filename*1="tch"

From 589f189b860716bc1857683a0be81f36891299f1 Mon Sep 17 00:00:00 2001
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Fri, 22 Nov 2019 14:09:17 +0200
Subject: [PATCH] xhci: dump event ring and endpoint ring if TRB not found in
 TD

After 5 cases of transfer event TRB not matching the queued TD
we dump the event ring and current transfer ring.

Error counter will continue running until it wraps around,
this is a hack so we don't care

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 620846f30b4f..a1a9a408c479 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -201,6 +201,31 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
  * @more_trbs_coming:	Will you enqueue more TRBs before calling
  *			prepare_transfer()?
  */
+
+static int xhci_dump_ring(struct xhci_hcd *xhci, struct xhci_ring *ring)
+{
+	struct xhci_segment     *seg;
+	dma_addr_t              dma;
+	union xhci_trb          *trb;
+	int			i, j;
+
+	seg = ring->first_seg;
+
+	for (i = 0; i < ring->num_segs; i++) {
+		for (j = 0; j < TRBS_PER_SEGMENT; j++) {
+			trb = &seg->trbs[j];
+			dma = seg->dma + j * sizeof(*trb);
+			xhci_err(xhci, "%pad: %s\n", &dma,
+				 xhci_decode_trb(le32_to_cpu(trb->generic.field[0]),
+						 le32_to_cpu(trb->generic.field[1]),
+						 le32_to_cpu(trb->generic.field[2]),
+						 le32_to_cpu(trb->generic.field[3])));
+		}
+		seg = seg->next;
+	}
+	return 0;
+}
+
 static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 			bool more_trbs_coming)
 {
@@ -2318,6 +2343,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	u32 trb_comp_code;
 	int td_num = 0;
 	bool handling_skipped_tds = false;
+	static unsigned int err_cnt;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
 	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
@@ -2579,6 +2605,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				trb_in_td(xhci, ep_ring->deq_seg,
 					  ep_ring->dequeue, td->last_trb,
 					  ep_trb_dma, true);
+				if (err_cnt++ == 5) {
+					xhci_err(xhci, "EVENT RING:\n");
+					xhci_dump_ring(xhci, xhci->event_ring);
+					xhci_err(xhci, "ENDPOINT RING:\n");
+					xhci_dump_ring(xhci, ep_ring);
+				}
 				return -ESHUTDOWN;
 			}
 
-- 
2.17.1


--------------F5EEED19256032A6B55BA9BE--
