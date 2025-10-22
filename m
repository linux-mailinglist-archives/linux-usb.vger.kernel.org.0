Return-Path: <linux-usb+bounces-29521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0BBFC5A1
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 16:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABCCB622DFB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 13:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2819347BC4;
	Wed, 22 Oct 2025 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="V2e+GI9/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5122FC866
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140586; cv=none; b=jLL6VsW2iZ8uQw/saS+vXr0v7okztCFT9FmntlrYIPJ0/CFI4b5cRzPRp3rVJyU51mcab6oAeyzpoTJC322E+vNnpJcXWsVzJJGgwWq/sj2FTd+m3Km9luTMtsTnkIWZcp89+hUUIOPwbQFwUhGbzmudpy2A22+LpKE4REQSxvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140586; c=relaxed/simple;
	bh=lWu6hbEKMFn1WLcKvOfLmTKQ48W5AyUbgO/Kl3BpYcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fu2jUV7JecduFi4tf4ahm5ZeTXj2ZlueMCTjC/66R4oG+WHzf/4Fh8MqPVE0jk3BLnrSM1Q5sQZSZkuWnbiVgJigEK2gbEI3ZGeZiw/b5DB0fKnrdUK4OR7UyyxjZJWK4lNXyjVT8EVCkjvf8qpIK0c6EoURjm2JcjiXd4Nz/yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=V2e+GI9/; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7845D1D7C46C;
	Wed, 22 Oct 2025 16:42:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1761140572; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EcXzIEBvMsOh5SBVzP6oBUrkGDLYbasdGtbVwUdqdl4=;
	b=V2e+GI9/VapVq6kx46/7S20PYwjwmNSb9OoOcduChvkBHdywo6h4K13pqU3StW/TGkjopG
	vBc/K11QH8308VSoN4mD01VjXBELlr2C5CSfhwvgvcg3zxzFByMlUZHxAanadFzXk1TAwn
	5u//UZgjaBPSPNCAe3Ub60Q7QVudN6IuNz4cRNVo0ZmXncGmJtu9vYh4vfyoj+UKZ90tnI
	T9geSvg3QI4LsgHKKyvsBh76K3Sk+vwou1nIMO//PG2Wg3IfC7evV7/SfE2lBX2TpZzVTa
	eemogsimPYVDr+Wtdz/SlvPBLNv5MBM7rdb1rQF4SaXi0/3CjuZNRI2MWN6vqA==
From: ValdikSS <iam@valdikss.org.ru>
To: Greg KH <greg@kroah.com>
Cc: linux-usb@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	ValdikSS <iam@valdikss.org.ru>
Subject: [PATCH v2 RESEND] usb: ohci: delay endpoint descriptor unlinking to reduce transfer latency
Date: Wed, 22 Oct 2025 16:39:26 +0300
Message-ID: <20251022133926.97856-1-iam@valdikss.org.ru>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <1ff1f025-dd54-4c1e-bdf9-376a359178ef@rowland.harvard.edu>
References: <1ff1f025-dd54-4c1e-bdf9-376a359178ef@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The current OHCI implementation immediately unlinks Endpoint Descriptors
(EDs) when they become idle. Unlinking process waits for the next Start
of Frame (SOF) interrupt as a synchronization primitive before unlinking
it.

This adds ~1ms latency per transfer cycle for rapid bidirectional
communication which leads to half the USB 1.1 speed for smaller packets
at best.

When a transfer completes, takeback_td() immediately calls
start_ed_unlink() if the ED has no more TDs queued. This triggers:
1. ED marked for unlinking with SOF interrupt enabled
2. Wait for next 1ms frame boundary (SOF interrupt)
3. finish_unlinks() processes the ED removal

This patch adds 275+10 ms timeout to the idle EDs. If new transfers
arrive on the same ED before timeout expiry, clear the timeout and
continue using the ED. Only EDs that remain idle after the timeout
period are cleared by the existing I/O watchdog, which runs every
275 ms (and the ED timeout is 10 ms).

This eliminates SOF synchronization delays for consecutive transfers,
but preserves the one-frame unlinking delay which was added as a race
condition elimination measure before the modern git history in
commit 961c380cef (March 2004) by David Brownell.

Performance Impact:
Tested on Orange Pi Zero3 (Allwinner H618) with Canon LBP1120 printer:
- Before: 1.984ms average latency (write-read pattern)
- After:  0.981ms average latency

Link: https://lore.kernel.org/all/9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru/T/
Signed-off-by: ValdikSS <iam@valdikss.org.ru>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/host/ohci-hcd.c | 15 +++++++++++++++
 drivers/usb/host/ohci-q.c   | 15 ++++++++++++---
 drivers/usb/host/ohci.h     |  1 +
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 9c7f30086..e89c9daec 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -364,6 +364,7 @@ ohci_endpoint_disable (struct usb_hcd *hcd, struct usb_host_endpoint *ep)
 	if (ohci->rh_state != OHCI_RH_RUNNING) {
 sanitize:
 		ed->state = ED_IDLE;
+		ed->idle_timeout = 0;
 		ohci_work(ohci);
 	}
 
@@ -384,6 +385,15 @@ ohci_endpoint_disable (struct usb_hcd *hcd, struct usb_host_endpoint *ep)
 			break;
 		}
 		fallthrough;
+	case ED_OPER:		/* check for delayed unlinking */
+		if (ed->idle_timeout) {
+			/* ED marked for delayed unlinking, unlink it now */
+			start_ed_unlink(ohci, ed);
+			spin_unlock_irqrestore(&ohci->lock, flags);
+			schedule_timeout_uninterruptible(1);
+			goto rescan;
+		}
+		fallthrough;
 	default:
 		/* caller was supposed to have unlinked any requests;
 		 * that's not our job.  can't recover; must leak ed.
@@ -795,6 +805,11 @@ static void io_watchdog_func(struct timer_list *t)
 			}
 		}
 
+		/* Check for idle EDs that have timed out and unlink them to prevent memory leaks */
+		if (ed->state == ED_OPER && ed->idle_timeout &&
+				time_after(jiffies, ed->idle_timeout))
+			start_ed_unlink(ohci, ed);
+
 		/* Starting from the latest pending TD, */
 		td = ed->pending_td;
 
diff --git a/drivers/usb/host/ohci-q.c b/drivers/usb/host/ohci-q.c
index 3b445312b..e0725e490 100644
--- a/drivers/usb/host/ohci-q.c
+++ b/drivers/usb/host/ohci-q.c
@@ -603,6 +603,9 @@ static void td_submit_urb (
 	int		i, this_sg_len, n;
 	struct scatterlist	*sg;
 
+	/* Clear idle timeout since we're adding new TDs */
+	urb_priv->ed->idle_timeout = 0;
+
 	/* OHCI handles the bulk/interrupt data toggles itself.  We just
 	 * use the device toggle bits for resetting, and rely on the fact
 	 * that resetting toggle is meaningless if the endpoint is active.
@@ -1162,10 +1165,16 @@ static void takeback_td(struct ohci_hcd *ohci, struct td *td)
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
+			ed->idle_timeout += !ed->idle_timeout;
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


