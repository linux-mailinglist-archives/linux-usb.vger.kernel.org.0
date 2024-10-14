Return-Path: <linux-usb+bounces-16195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BE599D708
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 21:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5E4E1C224C0
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 19:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BC81CB51E;
	Mon, 14 Oct 2024 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8zf6f5G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E520323
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933016; cv=none; b=Gyi6iM/UEKR2PCM7PvkI53CBUfloN/tfGSuny9vWbPsWHso1C5Sj0ucUULBLO8yvYxw7QJDlZKL/8FKRsJo4zFs5QwJOUk0hDABwIuXinlro88WGnRH8Wj2HD0FueQe0zelBzv8JCodRGQc/WbTxP1aTaVNOqSYJ+VTRSKIVzXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933016; c=relaxed/simple;
	bh=wjQjpFWfTlggDSkxukKvUiUojPOauwpGm2Z8GU0WKeY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhSiFdbwrsF0o1pPOvzi88+9X+kUN+FKszF1ZB5i72eN5rQMLzYL8WS/aUlLACTZ3m2Uh6NTs8LEAuFKuJQITICeGLGcA2T2g+3bupCAMmQbkmjJwKyXYLOumARTwnysuBnAawYvr4fUMQroeMbQ7Up0lPeL+lkOfwVumesl9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8zf6f5G; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb443746b8so11981341fa.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728933013; x=1729537813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuirvL/3Bkt9PYDPdJvD+H6fVXGUd+rlr06f8hE59/c=;
        b=N8zf6f5Gk5qR4uuEjNZQVSb6elzXrhw2/CkR84HBB6rcnQYBIkQwWpxSbhIAT1JHzO
         kt9wPP2bEajkR8deiXMiFl2rLMVqyAle+i+lLzWbvcnLq7Erld1ufSfGRVyA6enno85M
         xTCeL2OXZgVj7uTV+I0OcTL1mmkdu2xhyA1QVNL5tVOMxl/365mtTSJZByKiKBCuUN+0
         zdsxZ5E+RsTgS9/sBvMjvWoUQ3PTYNRQix0pgkHrSodyzBPP53iB8RYfdQt4Fg7sM2cQ
         ZSHwt/1fcix3KwaJG/41xnV95GS+E5/NQyMSwnRXZVqHBv7CjYeP2VEV+ayBAOE3jEGE
         RE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728933013; x=1729537813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuirvL/3Bkt9PYDPdJvD+H6fVXGUd+rlr06f8hE59/c=;
        b=vHnQ4mw+Krc2pHez+It+iwJdkpRDhOEzwoFBXfPVyQyg6cH4yTIWjL4xgj80GHFSMP
         jmmNfrZeCJlJQMJpYNVGmhmfzX0NULBV5JtC6b46EfCY3PFqzxMixFyrLpcWuvpUgvbE
         1ic67Kw51tf+wOA4E3fvWScMPJ3YCXW8Wx4jTFrUMN7/2wVXfqvBZ2FTW/0XRvSflVmm
         ud/6Vo+0iETTqkopl671SEFMrg2Rvf08zOUBvpQkcS3TYtqMiPSHXosegArKgU4EfcDU
         upeMRMJLxQ5zJG7EzjXAbVl+o7Dcbh9bOGzHfk3xUi16NtG81j7cVYmuUBApHXNgeQSp
         d9pA==
X-Gm-Message-State: AOJu0YwczIuDWX/4ElxTyevW2q1+11tbyZktH/LctisgTfHpopt9ZNUm
	DTwbOTRS0ecfrQWcZZnfkfLqcSntY4OIQQ42BZ3anTMq7GYX5C6WnmTOgQ==
X-Google-Smtp-Source: AGHT+IHwfeaYPf1fvfHrX89+DN4fHlNNgw9fwuUL/PfudeNntz8nsTUSYYMDrRdI7hiJ6GRnb0JdZQ==
X-Received: by 2002:a05:6512:1315:b0:52c:d819:517e with SMTP id 2adb3069b0e04-539da4cd040mr6279727e87.30.1728933012585;
        Mon, 14 Oct 2024 12:10:12 -0700 (PDT)
Received: from foxbook (bfe48.neoplus.adsl.tpnet.pl. [83.28.42.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e04ae6cfsm1275301e87.138.2024.10.14.12.10.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Oct 2024 12:10:11 -0700 (PDT)
Date: Mon, 14 Oct 2024 21:10:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: xhci: Fix the NEC stop bug workaround
Message-ID: <20241014211005.07562933@foxbook>
In-Reply-To: <20241014210840.5941d336@foxbook>
References: <20241014210840.5941d336@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The NEC uPD720200 has a bug, which prevents reliably stopping
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

Fix the problem by tracking redundant Stop Endpoint commands
which are sure to fail, and by not retrying them. It's easy,
because xhci_urb_dequeue() is the only user ever queuing the
command with the default handler and without ensuring that
the endpoint is Running and will not Halt before it Stops.
For this case, we assume that an endpoint with pending URBs
is always Running, unless certain operations are pending on
it which indicate known exceptions.

Note that we need to catch those exceptions when they occur,
because their flags may be cleared before our handler runs.

It's possible that other HCs have similar bugs (see also the
related "Running" case below), but the workaround is limited
to NEC because no such chips are currently known and tested.

Fixes: fd9d55d190c0 ("xhci: retry Stop Endpoint on buggy NEC controllers")
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 44 +++++++++++++++++++++++++++++++++---
 drivers/usb/host/xhci.h      |  2 ++
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4d664ba53fe9..c0efb4d34ab9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -911,6 +911,21 @@ static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
 	return ret;
 }
 
+/*
+ * A Stop Endpoint command is redundant if the EP is not in the Running state.
+ * It will fail with Context State Error. We sometimes queue redundant Stop EP
+ * commands when the EP is held Stopped for Set TR Deq execution, or Halted.
+ * A pending Stop Endpoint command *becomes* redundant if the EP halts before
+ * its completion, and this flag needs to be updated in those cases too.
+ */
+static void xhci_update_stop_cmd_redundant(struct xhci_virt_ep *ep)
+{
+	if (ep->ep_state & (SET_DEQ_PENDING | EP_HALTED | EP_CLEARING_TT))
+		ep->ep_state |= EP_STOP_CMD_REDUNDANT;
+	else
+		ep->ep_state &= ~EP_STOP_CMD_REDUNDANT;
+}
+
 static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 				struct xhci_virt_ep *ep,
 				struct xhci_td *td,
@@ -946,6 +961,7 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 		return err;
 
 	ep->ep_state |= EP_HALTED;
+	xhci_update_stop_cmd_redundant(ep);
 
 	xhci_ring_cmd_db(xhci);
 
@@ -1149,15 +1165,31 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
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
+			 * The EP could be stopped by some concurrent job, so
+			 * ignore this error when that's the case.
+			 */
+			if (ep->ep_state & EP_STOP_CMD_REDUNDANT)
+				break;
+			/*
+			 * NEC uPD720200 controllers have this bug: it takes one
+			 * service interval to restart a stopped EP, and in this
+			 * time its state remains Stopped. Any new Stop Endpoint
+			 * command fails and this handler may run quickly enough
+			 * to still observe the Stopped state, but it's bound to
+			 * soon change to Running, and all hell breaks loose.
+			 *
+			 * So keep retrying until the command clearly succeeds.
+			 * Not clear what to do if other HCs have similar bugs.
 			 */
 			if (!(xhci->quirks & XHCI_NEC_HOST))
 				break;
 			fallthrough;
+
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
 			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
@@ -4383,11 +4415,17 @@ int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 int xhci_queue_stop_endpoint(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			     int slot_id, unsigned int ep_index, int suspend)
 {
+	struct xhci_virt_ep *ep;
 	u32 trb_slot_id = SLOT_ID_FOR_TRB(slot_id);
 	u32 trb_ep_index = EP_INDEX_FOR_TRB(ep_index);
 	u32 type = TRB_TYPE(TRB_STOP_RING);
 	u32 trb_suspend = SUSPEND_PORT_FOR_TRB(suspend);
 
+	ep = xhci_get_virt_ep(xhci, slot_id, ep_index);
+	if (ep)
+		xhci_update_stop_cmd_redundant(ep);
+	/* else: don't care, the handler will do nothing anyway */
+
 	return queue_command(xhci, cmd, 0, 0, 0,
 			trb_slot_id | trb_ep_index | type | trb_suspend, false);
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 620502de971a..dd803b016c48 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -670,6 +670,8 @@ struct xhci_virt_ep {
 #define EP_SOFT_CLEAR_TOGGLE	(1 << 7)
 /* usb_hub_clear_tt_buffer is in progress */
 #define EP_CLEARING_TT		(1 << 8)
+/* the EP is kept Stopped or recovering from Halt/Error */
+#define EP_STOP_CMD_REDUNDANT	(1 << 9)
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
-- 
2.43.0


