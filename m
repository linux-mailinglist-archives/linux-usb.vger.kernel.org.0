Return-Path: <linux-usb+bounces-28859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB33BB2028
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 258BE3B773E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0767D311974;
	Wed,  1 Oct 2025 22:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="IPcmv55O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7951FCFEF
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759358473; cv=none; b=E6MfyB6DwBoJMUXzo56A7qFGkq7Wu5ez78n6a/Hr+tYdse7zP/Cg9EhV7LL7jxn7Avd5at5TP9cGlOo0v+TH74kNFL7MbceMQVjVX48Cj3t5CxC+7qUrYSI7HCb0AgLGGqLY8iQ0Bj32g+pb0GdRUmbLeCLL2bKnvPmtvtkNzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759358473; c=relaxed/simple;
	bh=jrl8YEyNLP9Kip9w0KARdJU0xgUXcLvdpQ/lemxteEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEPA36qIqwvll+c8QO9w94eqfkyQgvlV2n93fEkE1i4mpfbhPAXlVCZT0Nw9RtQJjj5rTPC5rcP75r/3M9r+IC9DGetgzCKphNpB+z0gvAjVRz1h/CMxPHcY1baVpqlXoyNrhK/KwNVAKC77IOAHFF0U4S7T9ieoGko7W+/iQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=IPcmv55O; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A43D71CD3106;
	Thu,  2 Oct 2025 01:34:58 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1759358100; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xZY8PGdcEDPdaMFmcbf/cmRSBovdBUnoj9h64KvsGRc=;
	b=IPcmv55OxpPTz5qrrf7SzEU/dOVN4M2v7d0jLHBt4OlS/4zBHZL7V2VJnzd84C5Vq6tGGh
	2tcqONMzlYx7MhBU24+9LQYYqyWDOw4BF8kny8oQ9Z7ib8pmNCxH/ZISe+Ql8Y23O7xIML
	5OsRedDy/5Kmt1oyqullfBvWK5duK5SpuFdRkWhK3MoR38pcM0fy30PyTOdkgWj+YDIQP7
	Jq4KJX5DFutaGbWMF/yvNxht1rtvbYFJPkKWPMAFTAPuUxzHzo2M6SRaim0LEgCTiDIl8t
	fmg1iT0vZeBXQcJY7CrW4yW84Lgc7t6zSUJtpecIndfLKjy25FnS0LPVOuIhPw==
From: ValdikSS <iam@valdikss.org.ru>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	ValdikSS <iam@valdikss.org.ru>
Subject: [PATCH v2] usb: ohci: delay endpoint descriptor unlinking to reduce transfer latency
Date: Thu,  2 Oct 2025 01:34:42 +0300
Message-ID: <20251001223442.286058-1-iam@valdikss.org.ru>
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
---
v1 -> v2: removed redundant list_empty() checks and idle_timeout=0 assignment,
          ensured idle_timeout jiffy to be non-zero.
Thanks Alan!
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


