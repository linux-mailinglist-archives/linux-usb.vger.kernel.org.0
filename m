Return-Path: <linux-usb+bounces-16694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED6D9AFFEE
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 12:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E64128384E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 10:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB251CC8AB;
	Fri, 25 Oct 2024 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qc8BLoGF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479FB1DD9D6
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729851658; cv=none; b=QUazoOyk+LZzMWHtVcaZleZy6JEhmcBH+YSlNTMYStKC+R9XQvY3LNiW0qgt8L+h0Kkrn/vC6ApnfyVH6kcMRdlz+jxBvcY5UDoduA/kiXf2lzzGFiUnZxW+gM0uHTWYOW02UsPlySZPM8kWdGakKcCYVzPVwIEHxISeNFucaK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729851658; c=relaxed/simple;
	bh=t4hYdrDczGcaAufq6wSJbI9r/AjTFJE+lQ071/coWUQ=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZoy5Gn+EgNBTLEJrLipnIMbuVRdaxxRkxHaRpU4ga6MeEPxingHpvUdYJtqwyj9WCCqSeBzku34Hn9oWWeTUP7QAwWpPE8useqsNBGHg6quhEOMRtsgdqDfSe6PWSIK7ijC1g8Q3KoFoCs15vt34z/8y4ksYgLDVFJLJOoEGS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qc8BLoGF; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so19267411fa.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729851653; x=1730456453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvfDYXLz1fMew+y+5ZRSGV/WQN+X883FdYtxSuJ8/tc=;
        b=Qc8BLoGFEJZA4OPUnnJFJQuq0dDGBAHDIwGrixO8laHgHSjJYmzomIdfGWAZaSbmQ5
         lctb+KbuV+BIKr5ujHMT8bY437UfTQ9bRQ8AHgH1GZhLGUKhYpze1MSOmW7N3Pcxv2uW
         PgU6H0tzzloBUsU0ldhG1+F5M5E8PqSwk9wOCtJNLisM5vu6RRjAu7q6oUTRQoD32nwQ
         GV+WvFZowrUoga/A8kU1IeZWdZeVrmqEzeohTZ8ojfaT+QwvmCHLlkC1OqPJG9idpJrA
         9awLKYlNfHvVX0JI6egZzkQuTUM/aQSFM79lqUI3Cje7GWT78/Cc9Dv2Fv12ghDYoErp
         dR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729851653; x=1730456453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvfDYXLz1fMew+y+5ZRSGV/WQN+X883FdYtxSuJ8/tc=;
        b=MKxog9+IpydIY+EGnXd7lcVSl0GZ8/DkjtNh7onoGbrzz8DcYGv5e/Sobf+G9itb7s
         dIZ4FlhG148v+5vQBJetrXHE5DxYk0MIHlespUKr9yislMrOfPw5l6j/WWUeEbj/wPTE
         MpVHoa39g16GLifZ0xC9ogteNmuyOv69m1EzuWDu0hTMEQnM2y5zU8+MdCDdfenHXam1
         RQRd27nIRVLBtZBa0iOb6zGu5MloNyKVCoFjtb5cwj+3oswWeXgcZqJLZ3FA7E4zTAoT
         4RLUUQMjOyFnQBQ/u5YVKEDMp1R4ZOtaAE+R+6frAOXUF422Zoy0vwAvP5o49P2W2E3f
         aV7A==
X-Forwarded-Encrypted: i=1; AJvYcCVf8r9rtY2YqoodjoWBumT5tiG/zGb/JfA3dH5UHsEJ4IJIP8LJhPsFuDxfTW85RHwx6UyFfgHUSgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmO09LQkxjLPX/oPGoePSmCny2tuPWvqi/SUSwuw2vmmoFxvOa
	7Gl+Nq7K1sJfMoy21qcqjZotd5YMJ3eKsem5MAWClq2etuz6Kumn
X-Google-Smtp-Source: AGHT+IEVnp8jwHBVkCnsME2W5a0JsqbVyipJBbZSVzHBRQBf8xM8o7ik2YVTJ6hD9O0Kb3JRCfDydg==
X-Received: by 2002:a2e:a593:0:b0:2fb:36df:3c8 with SMTP id 38308e7fff4ca-2fc9d34efd2mr50223811fa.10.1729851652994;
        Fri, 25 Oct 2024 03:20:52 -0700 (PDT)
Received: from foxbook (bfe176.neoplus.adsl.tpnet.pl. [83.28.42.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4507f5dsm1319571fa.7.2024.10.25.03.20.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 25 Oct 2024 03:20:51 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:20:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/2 RFC] usb: xhci: Don't queue redundant Stop Endpoint
 commands
Message-ID: <20241025122047.1684b5d6@foxbook>
In-Reply-To: <20241025121806.628e32c0@foxbook>
References: <20241025121806.628e32c0@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Sometimes we can tell right away that the command is pointless because
the endpoint is or will soon be stopped anyway. Detect such cases and
process cancelled TDs without queuing redundunt commands, by leaving
this work to already pending command handlers or by doing it instantly.

This saves some time and CPU cycles and simplifies dealing with those
nasty start/stop reordering bugs present in certain host controllers.

There are four endpoint state flags which imply a stopped endpoint:

1. In case of EP_STOP_CMD_PENDING, simply do nothing as before.

2. In case of EP_HALTED, do nothing and let the Reset Endpoint handler
   clean up cancelled TDs, because it already does that.

3. In case of EP_CLEARING_TT but none of the others, the endpoint has
   been reset already, it is stopped now and no commands are pending.
   Call a new xhci_process_cancelled_tds() function immediately, which
   directly activates xhci_ring's cancellation machinery. If necessary,
   a new Set TR Deq command will be queued.

4. In case of SET_DEQ_PENDING, the handler doesn't clean up cancelled
   TDs. Adapt xhci_invalidate_cancelled_tds() to handle being called
   under SET_DEQ_PENDING and run xhci_process_cancelled_tds() as in 3.

If none of these flags are set, an endpoint with pending URBs is always
supposed to be running, so queue a Stop Endpoint then.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 73 ++++++++++++++++++++----------------
 drivers/usb/host/xhci.c      | 24 ++++++++++--
 drivers/usb/host/xhci.h      |  3 +-
 3 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1441c196a5c0..ab97f4595e1b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -954,9 +954,7 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 
 /*
  * Fix up the ep ring first, so HW stops executing cancelled TDs.
- * We have the xHCI lock, so nothing can modify this list until we drop it.
- * We're also in the event handler, so we can't get re-interrupted if another
- * Stop Endpoint command completes.
+ * Call this under xhci->lock, so nothing can modify TD lists or interrupt us.
  *
  * only call this when ring is not in a running state
  */
@@ -971,6 +969,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	u64			hw_deq;
 	unsigned int		slot_id = ep->vdev->slot_id;
 	int			err;
+	bool			pending_td = false;	/* cached_td is already pending */
 
 	xhci = ep->xhci;
 
@@ -1000,7 +999,18 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 		if (td->cancel_status == TD_HALTED || trb_in_td(xhci, td, hw_deq, false)) {
 			switch (td->cancel_status) {
 			case TD_CLEARED: /* TD is already no-op */
+				break;
 			case TD_CLEARING_CACHE: /* set TR deq command already queued */
+				xhci_dbg(xhci, "Found cached TD in URB %p pending\n", td->urb);
+				if (cached_td && !pending_td)
+					/* not supposed to happen... */
+					xhci_warn(xhci, "Cached TDs cleared out of order: URB %p pending but URB %p not done yet\n",
+							td->urb, cached_td->urb);
+					// WTF, no easy way to handle this. We may have already
+					// picked up to two TDs for clearing and can't undo it
+					// without adding more complexity to this function.
+				cached_td = td;
+				pending_td = true;
 				break;
 			case TD_DIRTY: /* TD is cached, clear it */
 			case TD_HALTED:
@@ -1020,12 +1030,14 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 						  "Found multiple active URBs %p and %p in stream %u?\n",
 						  td->urb, cached_td->urb,
 						  td->urb->stream_id);
-					td_to_noop(xhci, ring, cached_td, false);
-					cached_td->cancel_status = TD_CLEARED;
+					td_to_noop(xhci, ring, td, false);
+					td->cancel_status = TD_CLEARED;
+					break;
 				}
 				td_to_noop(xhci, ring, td, false);
 				td->cancel_status = TD_CLEARING_CACHE;
 				cached_td = td;
+				xhci_dbg(xhci, "Pick cached TD in URB %p for clearing\n", td->urb);
 				break;
 			}
 		} else {
@@ -1034,8 +1046,11 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 		}
 	}
 
-	/* If there's no need to move the dequeue pointer then we're done */
-	if (!cached_td)
+	/*
+	 * We are done if there's no need to move the dequeue pointer or if the
+	 * command is already pending. Completion handler will call us again.
+	 */
+	if (!cached_td || ep->ep_state & SET_DEQ_PENDING)
 		return 0;
 
 	err = xhci_move_dequeue_past_td(xhci, slot_id, ep->ep_index,
@@ -1061,6 +1076,19 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	return 0;
 }
 
+/*
+ * Erase queued TDs from transfer ring(s) and give back those the xHC didn't
+ * stop on. If necessary, queue commands to move the xHC off cancelled TDs it
+ * stopped on. Those will be given back later when the commands complete.
+ *
+ * Call under xhci->lock on a stopped/halted endpoint.
+ */
+void xhci_process_cancelled_tds(struct xhci_virt_ep *ep)
+{
+	xhci_invalidate_cancelled_tds(ep);
+	xhci_giveback_invalidated_tds(ep);
+}
+
 /*
  * Returns the TD the endpoint ring halted on.
  * Only call for non-running rings without streams.
@@ -1154,12 +1182,9 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			/*
 			 * Per xHCI 4.6.9, Stop Endpoint command on a Stopped
 			 * EP is a Context State Error, and EP stays Stopped.
-			 * This outcome is valid if the command was redundant.
-			 */
-			if (ep->ep_state & EP_STOP_CMD_REDUNDANT)
-				break;
-			/*
-			 * Or it really failed on Halted, but somebody ran Reset
+			 * This is avoided by never queuing redundant commands.
+			 *
+			 * But maybe it failed on Halted, and somebody ran Reset
 			 * Endpoint later. EP state is now Stopped and EP_HALTED
 			 * still set because Reset EP handler will run after us.
 			 */
@@ -1199,11 +1224,10 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 	}
 
 	/* will queue a set TR deq if stopped on a cancelled, uncleared TD */
-	xhci_invalidate_cancelled_tds(ep);
-	ep->ep_state &= ~EP_STOP_CMD_PENDING;
+	xhci_process_cancelled_tds(ep);
 
 	/* Otherwise ring the doorbell(s) to restart queued transfers */
-	xhci_giveback_invalidated_tds(ep);
+	ep->ep_state &= ~EP_STOP_CMD_PENDING;
 	ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
 
@@ -4397,28 +4421,11 @@ int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 int xhci_queue_stop_endpoint(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			     int slot_id, unsigned int ep_index, int suspend)
 {
-	struct xhci_virt_ep *ep;
 	u32 trb_slot_id = SLOT_ID_FOR_TRB(slot_id);
 	u32 trb_ep_index = EP_INDEX_FOR_TRB(ep_index);
 	u32 type = TRB_TYPE(TRB_STOP_RING);
 	u32 trb_suspend = SUSPEND_PORT_FOR_TRB(suspend);
 
-	/*
-	 * Any of that means the EP is or will be Stopped by the time this
-	 * command runs. Queue it anyway for its side effects like calling
-	 * our default handler or complete(). But our handler must know if
-	 * the command is redundant, so check it now. The handler can't do
-	 * it later because those operations may finish before it runs.
-	 */
-	ep = xhci_get_virt_ep(xhci, slot_id, ep_index);
-	if (ep) {
-		if (ep->ep_state & (SET_DEQ_PENDING | EP_HALTED | EP_CLEARING_TT))
-			ep->ep_state |= EP_STOP_CMD_REDUNDANT;
-		else
-			ep->ep_state &= ~EP_STOP_CMD_REDUNDANT;
-	}
-	/* else: don't care, the handler will do nothing anyway */
-
 	return queue_command(xhci, cmd, 0, 0, 0,
 			trb_slot_id | trb_ep_index | type | trb_suspend, false);
 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 899c0effb5d3..f57127358bb4 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1768,10 +1768,28 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		}
 	}
 
-	/* Queue a stop endpoint command, but only if this is
-	 * the first cancellation to be handled.
+	/*
+	 * The endpoint needs to be stopped to remove cancelled TDs from xHC
+	 * queues. But don't stop it unnecessarily: firstly - for efficiency,
+	 * secondly - for correctness, because our completion handler assumes
+	 * that any apparent attempt to stop a stopped EP is a hardware bug.
 	 */
-	if (!(ep->ep_state & EP_STOP_CMD_PENDING)) {
+
+	/* These completion handlers will sort out cancelled TDs for us */
+	if (ep->ep_state & (EP_STOP_CMD_PENDING | EP_HALTED)) {
+		xhci_dbg(xhci, "Not queuing Stop Endpoint on slot %d ep %d state 0x%x\n",
+				urb->dev->slot_id, ep_index, ep->ep_state);
+		goto done;
+	}
+
+	/* In these cases the endpoint is stopped already */
+	if (ep->ep_state & (SET_DEQ_PENDING | EP_CLEARING_TT)) {
+		/* and cancelled TDs can be given back right away */
+		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d state 0x%x\n",
+				urb->dev->slot_id, ep_index, ep->ep_state);
+		xhci_process_cancelled_tds(ep);
+	} else {
+		/* Otherwise, queue a new Stop Endpoint command */
 		command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 		if (!command) {
 			ret = -ENOMEM;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 4db2cb843a8b..ba253e8c79b7 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -670,8 +670,6 @@ struct xhci_virt_ep {
 #define EP_SOFT_CLEAR_TOGGLE	(1 << 7)
 /* usb_hub_clear_tt_buffer is in progress */
 #define EP_CLEARING_TT		(1 << 8)
-/* queued Stop Endpoint is expected to fail */
-#define EP_STOP_CMD_REDUNDANT	(1 << 9)
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
@@ -1915,6 +1913,7 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.43.0


