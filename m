Return-Path: <linux-usb+bounces-28480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26738B91CB0
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 16:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3DBA1896C14
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 14:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AE226462E;
	Mon, 22 Sep 2025 14:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="48Gk1Dql"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83B212578
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552556; cv=none; b=sSiQqKw4j5wyu5oM5UpRZCQ7LCPTDPy7I8NsVN6eXwtWtLnURqepjnmCffWsQ7UjG4g0J/sIxUk8/NkrdgUH4uXj9wxECrxzR4eOuzuCcGi8AMbU0q3ZEFsjUq5AzjoEhGLnAkPBG4Yhi01FEWgFI2iePidHWS0uhO+cl33nryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552556; c=relaxed/simple;
	bh=JXOuXPHYHxqGLGv5M8as+qJHCQFY3DOYGrA+8PGsH7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKqUJdx7xxvJ55AUoLMh7osjSJFqtYkeabL7h9/ScTGuf+M0NcXXL3H8OHGIpczpRxFtfOsfp7+iRxSk0WXzvf+5258dKsG2igwhtPnIIecr9Nxgo6hcegvY+1lS/PO8H5kJh3/oY+wLicpgNz/MkOmpXDwzc/RcQYKeHeHU+i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=48Gk1Dql; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15F8E1C85C56;
	Mon, 22 Sep 2025 17:49:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1758552548; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=HSPTuTHX4ML8grH837iLhWnC6paIXp8HEZ819Q5X7ac=;
	b=48Gk1DqldNh2inYiX5eRhFW4RnZwtvLp63T3TOdOm+F2QntSupAtMKtIcMuw27z3XmLWp8
	nJzbkdPKAVNYNw1gRGs8BZ/kQe26ujzgGy0pXI47GxQ5M9aLBFTUYsMFRuERjksuoOD/eW
	G0HK/L2LZ6s8PgK3rAgF8SU0+pQrkqAghRdEhRO17EJcFW8pmz8NZbB+7s2Rcr5h069OJw
	20cUS1waOS9dhBHj7/KHtHuVGupleswvWWnx0RX3dLKPnfTe3qMr/s3WtQcLm/PQs5NWvo
	i3QwNT7tCcqqiuy0pzYxZA3TFqFGhQAxF8pWtxLBNeFCaOFnFPD6qPtfSsvF3w==
From: ValdikSS <iam@valdikss.org.ru>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	ValdikSS <iam@valdikss.org.ru>
Subject: [PATCH] usb: ohci: delay endpoint descriptor unlinking to reduce transfer latency
Date: Mon, 22 Sep 2025 17:48:48 +0300
Message-ID: <20250922144848.23418-1-iam@valdikss.org.ru>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <78c2bf8d-e67f-4520-a7fb-7a9f3db159d6@rowland.harvard.edu>
References: <78c2bf8d-e67f-4520-a7fb-7a9f3db159d6@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The current OHCI implementation immediately unlinks Endpoint Descriptors (EDs)
when they become idle. Unlinking process waits for the next Start of Frame (SOF)
interrupt as a synchronization primitive before unlinking it.

This adds ~1ms latency per transfer cycle for rapid bidirectional communication
which leads to half the USB 1.1 speed for smaller packets at best.

When a transfer completes, takeback_td() immediately calls start_ed_unlink()
if the ED has no more TDs queued. This triggers:
1. ED marked for unlinking with SOF interrupt enabled
2. Wait for next 1ms frame boundary (SOF interrupt)
3. finish_unlinks() processes the ED removal

This patch adds 275+10 ms timeout to the idle EDs. If new transfers
arrive on the same ED before timeout expiry, clear the timeout and continue
using the ED. Only unlink EDs that remain idle after the timeout period
are cleared by the existing I/O watchdog, which runs every 275 ms (and
the ED timeout is 10 ms).

This eliminates SOF synchronization delays for consecutive transfers,
but preserves the one-frame unlinking delay which was added as a
race condition elimination measure before the modern git history
in commit 961c380cef (March 2004) by David Brownell.

Performance Impact:
Tested on Orange Pi Zero3 (Allwinner H618) with Canon LBP1120 printer:
- Before: 1.984ms average latency (write-read pattern)
- After:  0.981ms average latency

Link: https://lore.kernel.org/all/9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru/T/
---
 drivers/usb/host/ohci-hcd.c | 18 ++++++++++++++++++
 drivers/usb/host/ohci-q.c   | 15 ++++++++++++---
 drivers/usb/host/ohci.h     |  1 +
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 9c7f30086..daaa03dd6 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -364,6 +364,7 @@ ohci_endpoint_disable (struct usb_hcd *hcd, struct usb_host_endpoint *ep)
 	if (ohci->rh_state != OHCI_RH_RUNNING) {
 sanitize:
 		ed->state = ED_IDLE;
+		ed->idle_timeout = 0;
 		ohci_work(ohci);
 	}
 
@@ -384,6 +385,16 @@ ohci_endpoint_disable (struct usb_hcd *hcd, struct usb_host_endpoint *ep)
 			break;
 		}
 		fallthrough;
+	case ED_OPER:		/* check for delayed unlinking */
+		if (list_empty(&ed->td_list) && ed->idle_timeout) {
+			/* ED marked for delayed unlinking, unlink it now */
+			ed->idle_timeout = 0;
+			start_ed_unlink(ohci, ed);
+			spin_unlock_irqrestore (&ohci->lock, flags);
+			schedule_timeout_uninterruptible(1);
+			goto rescan;
+		}
+		fallthrough;
 	default:
 		/* caller was supposed to have unlinked any requests;
 		 * that's not our job.  can't recover; must leak ed.
@@ -795,6 +806,13 @@ static void io_watchdog_func(struct timer_list *t)
 			}
 		}
 
+		/* Check for idle EDs that have timed out and unlink them to prevent memory leaks */
+		if (ed->state == ED_OPER && list_empty(&ed->td_list) &&
+		    ed->idle_timeout && time_after(jiffies, ed->idle_timeout)) {
+			ed->idle_timeout = 0;
+			start_ed_unlink(ohci, ed);
+		}
+
 		/* Starting from the latest pending TD, */
 		td = ed->pending_td;
 
diff --git a/drivers/usb/host/ohci-q.c b/drivers/usb/host/ohci-q.c
index 3b445312b..1df57a454 100644
--- a/drivers/usb/host/ohci-q.c
+++ b/drivers/usb/host/ohci-q.c
@@ -433,6 +433,7 @@ static struct ed *ed_get (
 		ed->hwTailP = cpu_to_hc32 (ohci, td->td_dma);
 		ed->hwHeadP = ed->hwTailP;	/* ED_C, ED_H zeroed */
 		ed->state = ED_IDLE;
+		ed->idle_timeout = 0;
 
 		is_out = !(ep->desc.bEndpointAddress & USB_DIR_IN);
 
@@ -603,6 +604,9 @@ static void td_submit_urb (
 	int		i, this_sg_len, n;
 	struct scatterlist	*sg;
 
+	/* Clear idle timeout since we're adding new TDs */
+	urb_priv->ed->idle_timeout = 0;
+
 	/* OHCI handles the bulk/interrupt data toggles itself.  We just
 	 * use the device toggle bits for resetting, and rely on the fact
 	 * that resetting toggle is meaningless if the endpoint is active.
@@ -1162,10 +1166,15 @@ static void takeback_td(struct ohci_hcd *ohci, struct td *td)
 	if (urb_priv->td_cnt >= urb_priv->length)
 		finish_urb(ohci, urb, status);
 
-	/* clean schedule:  unlink EDs that are no longer busy */
+	/* clean schedule: delay unlinking EDs to avoid SOF synchronization overhead */
 	if (list_empty(&ed->td_list)) {
-		if (ed->state == ED_OPER)
-			start_ed_unlink(ohci, ed);
+		if (ed->state == ED_OPER) {
+			/* Mark ED as idle but don't unlink immediately to avoid
+			 * 1ms SOF synchronization delays on rapid consecutive transfers.
+			 * Watchdog will clean up after 10ms if truly idle.
+			 */
+			ed->idle_timeout = jiffies + msecs_to_jiffies(10);
+		}
 
 	/* ... reenabling halted EDs only after fault cleanup */
 	} else if ((ed->hwINFO & cpu_to_hc32(ohci, ED_SKIP | ED_DEQUEUE))
diff --git a/drivers/usb/host/ohci.h b/drivers/usb/host/ohci.h
index 631dda617..858c7bebe 100644
--- a/drivers/usb/host/ohci.h
+++ b/drivers/usb/host/ohci.h
@@ -75,6 +75,7 @@ struct ed {
 #define	OKAY_TO_TAKEBACK(ohci, ed)			\
 		((int) (ohci->wdh_cnt - ed->takeback_wdh_cnt) >= 0)
 
+	unsigned long		idle_timeout;	/* when ED became idle (jiffies) */
 } __attribute__ ((aligned(16)));
 
 #define ED_MASK	((u32)~0x0f)		/* strip hw status in low addr bits */
-- 
2.51.0


