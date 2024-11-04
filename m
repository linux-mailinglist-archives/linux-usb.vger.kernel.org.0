Return-Path: <linux-usb+bounces-17010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9419BAFB8
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 10:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1F651C21834
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE1F1AD3E5;
	Mon,  4 Nov 2024 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKmFPnTd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4A6FC5
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712887; cv=none; b=Pl7QrGC9jUn9dSkDOUBk0uLDMhbP8xWxXUewcUeCIK2I/tK3dPi2xRhcfDcp5hcs5AEeNd+WjtIir0t13IQKG4rakgfyPZNDO8pgwbRdkudcq64YEc4Jyga3mjRAsz1VI+ScotRPgDDo9AJARaHp6KpiZSApkruYh65v4kszcvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712887; c=relaxed/simple;
	bh=SwBw0u2oB9YWmUAWvLcSrdIztuafapwkYZlH6X3wVW4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U20ny6ZVIWZBMbIcbgLWeEW0vdDxXLREhpavwdNiq2NnRwdLlxFrG3oQPgZfJrPmOZ24HU1iC7tWrRIaixoqJKsP0bQFPnwZBId3b+0qgpX+ofzrfk+8eMkEEZ3QXELoYhiRTNg1xdO8YnbmvZA6lljhQ5g2AnnhXxT7/uETnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKmFPnTd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e6c754bdso3829614e87.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 01:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730712884; x=1731317684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IglvRZ5385zU0mmHh62rTw1JW5g8sQ0kUxTBvIPUQZQ=;
        b=IKmFPnTdKDPgtddijxNfW60cZQYy8aDh/tdcO7ThKpK/7K20leVx0UyvWrQYvap2YI
         PdD1h6Hm7z09vvn9erThc9ByV9HvVNfBgQ+0jbR2nUJ1Znk0YVer9ujIrythPuw3Xe/g
         pOSxJXSXqFfHXs0LxBkEc8afiP9Agb6UjSYj4CwDytWSJ4Z23HIyvLQHBLIes/HDvI/5
         7SdEJeWKcMVVm8V3Z1NmlhlO0hIklztptXyyKRoppRJv7iMYcvAhjmMUPUNCtf2UdTJi
         MSuSbpa0uXj/xyRUhvtMKsKpzqjsSa1IqMyoDyQvSxOcierxNlf0Q1oPhBsRfe65PVzQ
         RdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712884; x=1731317684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IglvRZ5385zU0mmHh62rTw1JW5g8sQ0kUxTBvIPUQZQ=;
        b=rc1Q5N/Jo2hvJgSKOAndwBRmsIAWGHQnOFti1b890HACNQ85LbTIaWnW1qSjByzw9E
         LEcmjx4wj08JZlY16BMsTRAdON4lx3cxt5m+cH2XKoCTrSdAKdhVHtJ9H4v8ijjeDvb8
         aRkcaAxvjiuVT/uqqGGU/ISrkI+CD85aVFBxMi1xzYg/XXETt1n3SJbYB3d0WoQA3tfm
         vj4kmAYkRUcW1OgwpuMu37ziSduHmRMM87s3X7NOBrZcw6PU9PDpcgviuJblT2QCJwB9
         f5bkcRQl1+i3TLrbUavszK1a4WsTKEZcXzby97q2t9ZQtbH6wqTAObue39ye6vH46ki5
         Qosw==
X-Gm-Message-State: AOJu0YxeOHq4wFjkmCPsI1wgDpKNlmWdcn7Rf4tA1EyKpIjRQZokeWl7
	H44p+nrQnno3qOYxg/6lUQa7tqm1uP3pPOF3zWywijGDb5upCWHYcV6DTg==
X-Google-Smtp-Source: AGHT+IGwAGtiWux+yHuACaJpEIpd+psYaQwWzsCCXOB4ath7tF+0e+6+46ZPtRZ38I6mTV0UFceqlA==
X-Received: by 2002:a05:6512:68d:b0:535:699b:b076 with SMTP id 2adb3069b0e04-53c79e2fdb7mr6578023e87.16.1730712883905;
        Mon, 04 Nov 2024 01:34:43 -0800 (PST)
Received: from foxbook (bhf124.neoplus.adsl.tpnet.pl. [83.28.95.124])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde08c4sm1582637e87.253.2024.11.04.01.34.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 Nov 2024 01:34:42 -0800 (PST)
Date: Mon, 4 Nov 2024 10:34:38 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v4 3/3] usb: xhci: Avoid queuing redundant Stop Endpoint
 commands
Message-ID: <20241104103438.14b07877@foxbook>
In-Reply-To: <20241104103200.533fe1fb@foxbook>
References: <20241104103200.533fe1fb@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Stop Endpoint command on an already stopped endpoint fails and may be
misinterpreted as a known hardware bug by the completion handler. This
results in an unnecessary delay with repeated retries of the command.

Avoid queuing this command when endpoint state flags indicate that it's
stopped or halted and the command will fail. If commands are pending on
the endpoint, their completion handlers will process cancelled TDs so
it's done. In case of waiting for external operations like clearing TT
buffer, the endpoint is stopped and cancelled TDs can be processed now.

This eliminates practically all unnecessary retries because an endpoint
with pending URBs is maintained in Running state by the driver, unless
aforementioned commands or other operations are pending on it. This is
guaranteed by xhci_ring_ep_doorbell() and by the fact that it is called
every time any of those operations completes.

The only known exceptions are hardware bugs (the endpoint never starts
at all) and Stream Protocol errors not associated with any TRB, which
cause an endpoint reset not followed by restart. Sounds like a bug.

Generally, these retries are only expected to happen when the endpoint
fails to start for unknown/no reason, which is a worse problem itself,
and fixing the bug eliminates the retries too.

All cases were tested and found to work as expected. SET_DEQ_PENDING
was produced by patching uvcvideo to unlink URBs in 100us intervals,
which then runs into this case very often. EP_HALTED was produced by
restarting 'cat /dev/ttyUSB0' on a serial dongle with broken cable.
EP_CLEARING_TT by the same, with the dongle on an external hub.

Fixes: fd9d55d190c0 ("xhci: retry Stop Endpoint on buggy NEC controllers")
CC: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 13 +++++++++++++
 drivers/usb/host/xhci.c      | 19 +++++++++++++++----
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 30b392715f1e..92f9b6c468c6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1069,6 +1069,19 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	return 0;
 }
 
+/*
+ * Erase queued TDs from transfer ring(s) and give back those the xHC didn't
+ * stop on. If necessary, queue commands to move the xHC off cancelled TDs it
+ * stopped on. Those will be given back later when the commands complete.
+ *
+ * Call under xhci->lock on a stopped endpoint.
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
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 1ed4dce7eeb7..695e29b0946c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1769,10 +1769,21 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		}
 	}
 
-	/* Queue a stop endpoint command, but only if this is
-	 * the first cancellation to be handled.
-	 */
-	if (!(ep->ep_state & EP_STOP_CMD_PENDING)) {
+	/* These completion handlers will sort out cancelled TDs for us */
+	if (ep->ep_state & (EP_STOP_CMD_PENDING | EP_HALTED | SET_DEQ_PENDING)) {
+		xhci_dbg(xhci, "Not queuing Stop Endpoint on slot %d ep %d in state 0x%x\n",
+				urb->dev->slot_id, ep_index, ep->ep_state);
+		goto done;
+	}
+
+	/* In this case no commands are pending but the endpoint is stopped */
+	if (ep->ep_state & EP_CLEARING_TT) {
+		/* and cancelled TDs can be given back right away */
+		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%x\n",
+				urb->dev->slot_id, ep_index, ep->ep_state);
+		xhci_process_cancelled_tds(ep);
+	} else {
+		/* Otherwise, queue a new Stop Endpoint command */
 		command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 		if (!command) {
 			ret = -ENOMEM;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 0bef6c8b51cf..33e57f408e86 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1914,6 +1914,7 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.43.0


