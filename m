Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543F320FC65
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 21:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgF3TAb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 15:00:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:57132 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726531AbgF3TAa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Jun 2020 15:00:30 -0400
IronPort-SDR: 32fFNbx8rIpnf47i37/S6JjDo1nnq5zJ3gRVcHzu2ghAMbca56Kq/5dNMLC6eZxWbZZu7iWbmL
 EQIZTRVteQQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231223469"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208,223";a="231223469"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 12:00:24 -0700
IronPort-SDR: 7U+wKWYZ0sNOx9EKRrtrGmkBzQAonOXeHbCxEa1YvadqKjkZ0JdAKr3nSNVDqyDh76zZzQWHD8
 rQ/Tor57ktow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208,223";a="312454015"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 30 Jun 2020 12:00:22 -0700
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 4 comp_code 1
To:     Fabian Melzow <fabian.melzow@gmail.com>
Cc:     linux-usb@vger.kernel.org
References: <20200620211913.1535bac0@ping>
 <264e8287-b538-0798-36a6-7eafc4387a8d@linux.intel.com>
 <20200630185803.2a72c123@ping>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <f41aab00-ea04-bdd2-4174-33b2b19dc850@linux.intel.com>
Date:   Tue, 30 Jun 2020 22:03:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200630185803.2a72c123@ping>
Content-Type: multipart/mixed;
 boundary="------------3C74D052FCCB63EBEC5C4863"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------3C74D052FCCB63EBEC5C4863
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 30.6.2020 19.58, Fabian Melzow wrote:
> Hi!
> 
> Am Mon, 29 Jun 2020 20:47:24 +0300
> schrieb Mathias Nyman <mathias.nyman@linux.intel.com>:
> 
>> First issue I see is that the attempt to recover from a transaction
>> error with a soft retry isn't working. We expect the hardware to
>> retry the transfer but nothing seems to happen. Soft retry is
>> described in xhci specs 4.6.8.1 and is basically a reset endpoint
>> command with TSP set, followed by ringing the endpoint doorbell.
>> Traces indicate driver does this correctly but hardware isn't
>> retrying. We get don't get any event, no error, success or stall.
>>
>> This could be hardware flaw.
>> Any chance you could try this on a xHC from some other vendor?
> 
> There is no other xHC hardware available to me.
> 
>> Second issue is a driver flaw, when nothing happened for 20 seconds
>> we see the URB is canceled. xhci driver needs to stop then endpoint
>> to cancel the URB, but there is a hw race and endpoint ends up halted
>> instead of stopped. The xhci driver can't handle a halted endpoint in
>> its stop endpoint handler properly, and the URB is never actually
>> removed from the ring.
>>
>> The reason you see the IO_PAGE_FAULT is probably because once the
>> ring starts running the driver will handle the cancelled URB, and
>> touch already freed memory: AMD-Vi: Event logged [IO_PAGE_FAULT
>> domain=0x000d address=0xdc707028 flags=0x0020]
>>
>> I have a patch for this second case, I haven't upstreamed it as it
>> got some conflicting feedback earlier. It won't solve the 20 second
>> delay, but should solve the the IO_PAGE_FAULT and the "WARN Set TR
>> Deq Ptr cmd failed due to incorrect slot or ep state" message
>>
>> Can you try it out?
> 
> I successful applied the patch against Linux 5.7.4, but get this error when
> compiling drivers/usb/host/xhci-ring.c:
> 
>   CC [M]  drivers/usb/host/xhci-ring.o
> drivers/usb/host/xhci-ring.c: In function ‘xhci_handle_cmd_stop_ep’:
> drivers/usb/host/xhci-ring.c:857:3: error: implicit declaration of function ‘xhci_reset_halted_ep’ [-Werror=implicit-function-declaration]
>   857 |   xhci_reset_halted_ep(xhci, slot_id, ep_index, reset_type);
>       |   ^~~~~~~~~~~~~~~~~~~~
> 

Right, forgot that you need another patch before this.

both patches attached, also applied to 5.8-rc1 in branch "fix_invalid_context_at_stop_endpoint"
git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_invalid_context_at_stop_endpoint

-Mathias


--------------3C74D052FCCB63EBEC5C4863
Content-Type: text/x-patch;
 name="0001-xhci-crete-xhci_reset_halted_ep-helper-function.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-xhci-crete-xhci_reset_halted_ep-helper-function.patch"

=46rom ddb2004cb51fcf5acd668590c56fbf571ca66071 Mon Sep 17 00:00:00 2001
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Tue, 17 Dec 2019 14:03:34 +0200
Subject: [PATCH 1/2] xhci: crete xhci_reset_halted_ep() helper function

Create a separate helper function to only issue reset endpont
commands to clear halted endpoints.

This will be useful for cases where the a halted endpoint is discovered
while completing some other command, and needs to be cleared before
continuing.

No functional changes

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2c255d0620b0..5c223e92b8db 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -708,6 +708,26 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_=
hcd *xhci,
 	seg->bounce_offs =3D 0;
 }
=20
+static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot=
_id,
+				unsigned int ep_index, enum xhci_ep_reset_type reset_type)
+{
+	struct xhci_command *command;
+	int ret =3D 0;
+
+	command =3D xhci_alloc_command(xhci, false, GFP_ATOMIC);
+	if (!command) {
+		ret =3D -ENOMEM;
+		goto done;
+	}
+
+	ret =3D xhci_queue_reset_ep(xhci, command, slot_id, ep_index, reset_typ=
e);
+done:
+	if (ret)
+		xhci_err(xhci, "ERROR queuing reset endpoint for slot %d ep_index %d, =
%d\n",
+			 slot_id, ep_index, ret);
+	return ret;
+}
+
 /*
  * When we get a command completion for a Stop Endpoint Command, we need=
 to
  * unlink any cancelled TDs from the ring.  There are two ways to do tha=
t:
@@ -1855,7 +1875,7 @@ static void xhci_cleanup_halted_endpoint(struct xhc=
i_hcd *xhci,
 		enum xhci_ep_reset_type reset_type)
 {
 	struct xhci_virt_ep *ep =3D &xhci->devs[slot_id]->eps[ep_index];
-	struct xhci_command *command;
+	int err;
=20
 	/*
 	 * Avoid resetting endpoint if link is inactive. Can cause host hang.
@@ -1864,13 +1884,11 @@ static void xhci_cleanup_halted_endpoint(struct x=
hci_hcd *xhci,
 	if (xhci->devs[slot_id]->flags & VDEV_PORT_ERROR)
 		return;
=20
-	command =3D xhci_alloc_command(xhci, false, GFP_ATOMIC);
-	if (!command)
-		return;
-
 	ep->ep_state |=3D EP_HALTED;
=20
-	xhci_queue_reset_ep(xhci, command, slot_id, ep_index, reset_type);
+	err =3D xhci_reset_halted_ep(xhci, slot_id, ep_index, reset_type);
+	if (err)
+		return;
=20
 	if (reset_type =3D=3D EP_HARD_RESET) {
 		ep->ep_state |=3D EP_HARD_CLEAR_TOGGLE;
--=20
2.17.1


--------------3C74D052FCCB63EBEC5C4863
Content-Type: text/x-patch;
 name="0002-xhci-fix-halted-endpoint-at-stop-endpoint-command-co.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0002-xhci-fix-halted-endpoint-at-stop-endpoint-command-co.pa";
 filename*1="tch"

=46rom 9483b48fd7167358d76d86d48790df4301ec7b43 Mon Sep 17 00:00:00 2001
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Tue, 7 Jan 2020 16:12:17 +0200
Subject: [PATCH 2/2] xhci: fix halted endpoint at stop endpoint command
 completion

xhci 4.6.9: A Busy endpoint may asynchronously transition from the
Running to the Halted or Error state due to error conditions detected
while processing TRBs. A possible race condition may occur if software,
thinking an endpoint is in the Running state, issues a Stop Endpoint
Command however at the same time the xHC asynchronously transitions
the endpoint to the Halted or Error state. In this case, a Context
State Error may be generated for the command completion. Software
may verify that this case occurred by inspecting the EP State for
Halted or Error when a Stop Endpoint Command results in a Context
State Error.

Fix this case by resetting the halted endpoint after cleaning
up the calcelled trbs from the ring.
If the TRB we halted on was cancelled then queue a new set TR dequeue
pointer command as usually.
If it wasn't cancelled then move past it with a set TR dequeue pointer
and give it back with -EPIPE status as in a normal halted endpoint case.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5c223e92b8db..ceb3fac3f1c9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -745,11 +745,13 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd=
 *xhci, int slot_id,
 	struct xhci_ring *ep_ring;
 	struct xhci_virt_ep *ep;
 	struct xhci_td *cur_td =3D NULL;
+	struct xhci_td *halted_td =3D NULL;
 	struct xhci_td *last_unlinked_td;
 	struct xhci_ep_ctx *ep_ctx;
 	struct xhci_virt_device *vdev;
 	u64 hw_deq;
 	struct xhci_dequeue_state deq_state;
+	u32 comp_code;
=20
 	if (unlikely(TRB_TO_SUSPEND_PORT(le32_to_cpu(trb->generic.field[3])))) =
{
 		if (!xhci->devs[slot_id])
@@ -764,9 +766,19 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd =
*xhci, int slot_id,
=20
 	vdev =3D xhci->devs[slot_id];
 	ep_ctx =3D xhci_get_ep_ctx(xhci, vdev->out_ctx, ep_index);
+
 	trace_xhci_handle_cmd_stop_ep(ep_ctx);
=20
 	ep =3D &xhci->devs[slot_id]->eps[ep_index];
+	comp_code =3D GET_COMP_CODE(le32_to_cpu(event->status));
+
+	if (comp_code =3D=3D COMP_CONTEXT_STATE_ERROR) {
+		/* endpoint is halted and needs to be reset */
+		if (GET_EP_CTX_STATE(ep_ctx) =3D=3D EP_STATE_HALTED) {
+			ep->ep_state |=3D EP_HALTED;
+		}
+	}
+
 	last_unlinked_td =3D list_last_entry(&ep->cancelled_td_list,
 			struct xhci_td, cancelled_td_list);
=20
@@ -833,16 +845,60 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd=
 *xhci, int slot_id,
=20
 	xhci_stop_watchdog_timer_in_irq(xhci, ep);
=20
+	/*
+	 * If stop endpoint command raced with a halting endpoint we need to
+	 * reset the endpoint first. If the TD we halted on isn't cancelled we
+	 * must give it back with -EPIPE status, and move ring dequeue past it.=

+	 * If we can't find hw_deq, or the TD we halted on, do a soft reset
+	 */
+	   /* FIXME, is there a risk EP_HALTED is set from other cases */
+	if (ep->ep_state & EP_HALTED) {
+		enum xhci_ep_reset_type reset_type =3D EP_SOFT_RESET;
+		struct xhci_td *td;
+
+		if (deq_state.new_deq_ptr && deq_state.new_deq_seg) {
+			reset_type =3D EP_HARD_RESET;
+		} else if (ep->ep_state & EP_HAS_STREAMS) {
+			/* soft reset, nothing else */
+		} else if (!list_empty(&ep->ring->td_list)) {
+			hw_deq =3D xhci_get_hw_deq(xhci, vdev, ep_index, 0);
+			hw_deq &=3D ~0xf;
+			td =3D list_first_entry(&ep->ring->td_list,
+						     struct xhci_td, td_list);
+			if (trb_in_td(xhci, td->start_seg, td->first_trb,
+				      td->last_trb, hw_deq, false)) {
+				halted_td =3D td;
+				reset_type =3D EP_HARD_RESET;
+				xhci_find_new_dequeue_state(xhci, slot_id,
+							    ep_index, 0, td,
+							    &deq_state);
+			}
+		}
+		xhci_reset_halted_ep(xhci, slot_id, ep_index, reset_type);
+		/* FIXME xhci_clear_hub_tt_buffer(xhci, td, ep); */
+	}
+
 	/* If necessary, queue a Set Transfer Ring Dequeue Pointer command */
 	if (deq_state.new_deq_ptr && deq_state.new_deq_seg) {
 		xhci_queue_new_dequeue_state(xhci, slot_id, ep_index,
 					     &deq_state);
 		xhci_ring_cmd_db(xhci);
+	} else if (ep->ep_state & EP_HALTED) {
+		xhci_ring_cmd_db(xhci); /* for endpoint soft reset command */
 	} else {
 		/* Otherwise ring the doorbell(s) to restart queued transfers */
 		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 	}
=20
+	/* If TD we halted on wasn't cancelled give it back with -EPIPE */
+	if (halted_td) {
+		xhci_unmap_td_bounce_buffer(xhci, ep->ring, halted_td);
+		list_del_init(&halted_td->td_list);
+		inc_td_cnt(halted_td->urb);
+		if (last_td_in_urb(halted_td))
+			xhci_giveback_urb_in_irq(xhci, halted_td, -EPIPE);
+	}
+
 	/*
 	 * Drop the lock and complete the URBs in the cancelled TD list.
 	 * New TDs to be cancelled might be added to the end of the list before=

--=20
2.17.1


--------------3C74D052FCCB63EBEC5C4863--
