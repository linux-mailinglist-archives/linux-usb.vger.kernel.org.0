Return-Path: <linux-usb+bounces-16693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6D9AFFE3
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 12:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAF9F28393F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 10:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648E21DE2A9;
	Fri, 25 Oct 2024 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhYhGn9H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AAA1D63D9
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729851571; cv=none; b=k+gGInG7nFhUeLIM4x0HY7HCyz/q7HrtsfxvNt5q7KBj7hNfYLpHDFXXMubI7199dXvkB91YfYJ8S2PHqlKHXUfM9tXNbpGPxoSN4yzWNxnt/myg2znZ6dgngcmh1junA97z1JXeukYjMEtw4BE1GGkTG2dddrrNciYiTWyyfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729851571; c=relaxed/simple;
	bh=8IyL9gEbOl/3c7jHBQ8X4anGpfLeleqRtQUPrjOhA/g=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XWBk3pKY1Cqk2OpHNT6QCd1m8TXTeMhO9kMbYLy4X+FxPcYlxV9al4YWQX0EjMfkKYY7YfKDiYHeWJMM88UQ6qZnAa83UNqC7Q2x2FdJ717yRZWek4A/ITX6o3W1Ve7pYxhQw4DynwHsoE+bK2jlmKmvmK0yPh94oSxfPyPvpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhYhGn9H; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so19141971fa.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729851567; x=1730456367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bzELc5MT1XAeVvrPClnocjS1syNVKVfRxBo+EVe2JE=;
        b=GhYhGn9HzZeo5jiJ6egi36/GAVy3INi7PAr5PsmKru7Q7sdMBEbCweXOtRFR2aikrY
         iCWZcTXeqUkC/y5wR/GxcvH9gXcfzkmGBpeHSog9aVQ/cKiUEpYiA847x95aFiMNoac5
         QG5hD8PplsahQ0FGpv4LNL56XpxXGOwgaAyCON4iYBY1m+DKVQ7R2GAi6si3f1v8RkhF
         bHA/n8XW/422DH0bukn0RWs4cPRaCiIbqEML+8gaGU+39RsWHbUn2yXOD59ZpOhgCcSn
         R/Oe+xtcMI+ycd10tfUfvazk/WEQbx0bvoBOza4S/N5pH3b4Hj4UfpKKGJsxXyyKW3xy
         V8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729851567; x=1730456367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bzELc5MT1XAeVvrPClnocjS1syNVKVfRxBo+EVe2JE=;
        b=J70DiJQYDpsPmdj0cnZVRmc89hDUcDlOiFoo4dNSJVeg/FlFBR4kth/7N0lNe/Z7hW
         Pnx7M+bsJ1+deBkh6zvlFrfOFz98XIpA+v0hyJOgmTK1rs4ePHhokZUDZzlTD13Pivhn
         XGR4ARUdDHAXL8QsWw530vin9ZwpTXqCYnwSqnHHf4rSMXWmC0W4lA1/mTbT4SgOiizl
         0caiv44rx9B5GmoR3tcdifdI4W7z02QjpuEMh8OUkK37QYRGWHIRKu1KF1PozDYeov5y
         xprmn0go90zBRTxRxwg2HvbPnivJrtM9+1T/Rem4nB+7tAP1QImS6KqZSCNHv7iR+fN9
         XI8g==
X-Forwarded-Encrypted: i=1; AJvYcCWh2JbjdipsM7bIwlR161T59oU1kY1ELN3ul5aHDQnNZpq31LBDnQ9qKcC1b9NagRsvKkAVujRlHQo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrt5nI6CixKGjxwMnf17fyrL5a4vdQxtrxMWIVOLbnZnUH1ySv
	Yxrib2RuJ5WndgTLP9VeLSYKdZUfRGUYwmIYZZF9p5vZdQaXPndz/RC1Og==
X-Google-Smtp-Source: AGHT+IEGsAD2VR4BVB6LVPfid8hBAeF3wcDKE+nzIfAXW5K0tESRBaYqXRmUS7KXWxZ++mk4gB3rFg==
X-Received: by 2002:a2e:be26:0:b0:2fb:4bee:47ec with SMTP id 38308e7fff4ca-2fc9d59ef88mr52480061fa.33.1729851567083;
        Fri, 25 Oct 2024 03:19:27 -0700 (PDT)
Received: from foxbook (bfe176.neoplus.adsl.tpnet.pl. [83.28.42.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4507f24sm1340421fa.3.2024.10.25.03.19.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 25 Oct 2024 03:19:25 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:19:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 1/2] usb: xhci: Fix the NEC stop bug workaround
Message-ID: <20241025121921.3d51c61b@foxbook>
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

The NEC uPD720200 has a bug which prevents reliably stopping
an endpoint shortly after it has been restarted. This usually
happens when a driver kills many URBs in quick succession and
it results in concurrent execution and cancellation of TDs.

This is handled by stopping the endpoint again if in doubt.

This "doubt" turns out to be a problem, because Stop Endpoint
may be queued when the EP is already Stopped (for Set TR Deq
execution, for example) or becomes Stopped concurrently (by
Reset Endpoint, for example). If the EP is truly Stopped, the
command fails and further retries just keep failing forever.

This is easily triggered by modifying uvcvideo to unlink its
isochronous URBs in 100us intervals instead of poisoning them.
Any driver that unlinks URBs asynchronously may trigger this,
and any URB unlink during ongoing halt recovery also can.

Fix the problem by flagging redundant Stop Endpoint commands
which are sure to fail, and by not retrying them. It's easy,
because xhci_urb_dequeue() is the only user ever queuing the
command with the default handler which can't guarantee that
the endpoint is Running and will not Halt before it Stops.
For this case, we assume that an endpoint with pending URBs
is always Running, unless certain operations are pending on
it which indicate known exceptions.

Also detect if a Halted EP was reset concurrently after our
command failed. As command handlers run in order, EP_HALTED
would still be set in this case, so simply test for it.

It's possible that other HCs have similar bugs (see also the
related "Running" case below), but the workaround is limited
to NEC chips, where it is known to give good results.

Fixes: fd9d55d190c0 ("xhci: retry Stop Endpoint on buggy NEC controllers")
CC: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 45 +++++++++++++++++++++++++++++++++---
 drivers/usb/host/xhci.h      |  2 ++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b6eb928e260f..1441c196a5c0 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1149,15 +1149,37 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 				break;
 			ep->ep_state &= ~EP_STOP_CMD_PENDING;
 			return;
+
 		case EP_STATE_STOPPED:
 			/*
-			 * NEC uPD720200 sometimes sets this state and fails with
-			 * Context Error while continuing to process TRBs.
-			 * Be conservative and trust EP_CTX_STATE on other chips.
+			 * Per xHCI 4.6.9, Stop Endpoint command on a Stopped
+			 * EP is a Context State Error, and EP stays Stopped.
+			 * This outcome is valid if the command was redundant.
+			 */
+			if (ep->ep_state & EP_STOP_CMD_REDUNDANT)
+				break;
+			/*
+			 * Or it really failed on Halted, but somebody ran Reset
+			 * Endpoint later. EP state is now Stopped and EP_HALTED
+			 * still set because Reset EP handler will run after us.
+			 */
+			if (ep->ep_state & EP_HALTED)
+				break;
+			/*
+			 * On some HCs EP state remains Stopped for some tens of
+			 * us to a few ms or more after a doorbell ring, and any
+			 * new Stop Endpoint fails without aborting the restart.
+			 * This handler may run quickly enough to still see this
+			 * Stopped state, but it will soon change to Running.
+			 *
+			 * Assume this bug on unexpected Stop Endpoint failures.
+			 * Keep retrying until the EP starts and stops again, on
+			 * chips known to have the bug and to react positively.
 			 */
 			if (!(xhci->quirks & XHCI_NEC_HOST))
 				break;
 			fallthrough;
+
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
 			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
@@ -4375,11 +4397,28 @@ int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 int xhci_queue_stop_endpoint(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			     int slot_id, unsigned int ep_index, int suspend)
 {
+	struct xhci_virt_ep *ep;
 	u32 trb_slot_id = SLOT_ID_FOR_TRB(slot_id);
 	u32 trb_ep_index = EP_INDEX_FOR_TRB(ep_index);
 	u32 type = TRB_TYPE(TRB_STOP_RING);
 	u32 trb_suspend = SUSPEND_PORT_FOR_TRB(suspend);
 
+	/*
+	 * Any of that means the EP is or will be Stopped by the time this
+	 * command runs. Queue it anyway for its side effects like calling
+	 * our default handler or complete(). But our handler must know if
+	 * the command is redundant, so check it now. The handler can't do
+	 * it later because those operations may finish before it runs.
+	 */
+	ep = xhci_get_virt_ep(xhci, slot_id, ep_index);
+	if (ep) {
+		if (ep->ep_state & (SET_DEQ_PENDING | EP_HALTED | EP_CLEARING_TT))
+			ep->ep_state |= EP_STOP_CMD_REDUNDANT;
+		else
+			ep->ep_state &= ~EP_STOP_CMD_REDUNDANT;
+	}
+	/* else: don't care, the handler will do nothing anyway */
+
 	return queue_command(xhci, cmd, 0, 0, 0,
 			trb_slot_id | trb_ep_index | type | trb_suspend, false);
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f0fb696d5619..4db2cb843a8b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -670,6 +670,8 @@ struct xhci_virt_ep {
 #define EP_SOFT_CLEAR_TOGGLE	(1 << 7)
 /* usb_hub_clear_tt_buffer is in progress */
 #define EP_CLEARING_TT		(1 << 8)
+/* queued Stop Endpoint is expected to fail */
+#define EP_STOP_CMD_REDUNDANT	(1 << 9)
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
-- 
2.43.0


