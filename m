Return-Path: <linux-usb+bounces-17008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D39BAFB4
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 10:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B79121C217B2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC2C1AD3F6;
	Mon,  4 Nov 2024 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PO4Rm0B3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6906FC5
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712790; cv=none; b=mQGxWyj2fJdPmkCNSmAGT2Q+PqTdIuFTozx9hEITiPmtGFt3w5xTSWfUL+JPSlFUxth4ipdgf2cxuHDe2aDl57XGRLxhSFhf/JG2zYA6t7foJG2VBW4HZRGMwxMpUUOYG8X9G9rxU8Nse8Z3PCKCPQMrc2i6Y7iO7uRGBa1yil4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712790; c=relaxed/simple;
	bh=uA3l/ZAsN+U9x0hp3zWWQ0Qvvx7VT3rJZooxKQ02R+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMZlDMVawwKqGO7lWhmzoIeB4mwiaHBN+SjVSO3WXA0E1h83dy7U+gKjKbMgF5VJY3Xqy4FSPjNuDxvOEqTz1mm8fe6ew0IjgxvK9nsAkrFzWOlLVk8AESDAi6HBTBb5CbHSNWn02gNCT5VAmhoFFcn5fMhqTEAVq5kPs9MwNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PO4Rm0B3; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso57436621fa.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730712787; x=1731317587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kci4jz+pzI7To/0XFg7fTr7ly41ccauv/ECZTS12fdY=;
        b=PO4Rm0B3atXu0n9EA1n0x/AH+gPnWzPlhTBd1yLq1ZtwuJX9g+Lx1khIefGZOLfQZ+
         FnyRRIGfOIKhgSFpA9+7NBHqIXB0MmCZu/KIUX78IiwMBawgqVngEXz+EUOvhvxLi/p+
         M5wI+T17PQY5xuUpsvodqC6C6IVyHn+Y2HID3yRjpGE5e/YoyP7KNq/ipGpoAuAO/kXc
         Do906J3EHdCpLjXTKbAE4FlV8LJiae456wmNpDI3YHKfmCsAUwJ78bN/9QArXhPteEUU
         CS79ZAIvqLfnsQiSO9qAICZ2ni4Lm3PynBVwtZmQAd2/qmDYGtWxEfcAUcRTr9czDVT4
         LjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712787; x=1731317587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kci4jz+pzI7To/0XFg7fTr7ly41ccauv/ECZTS12fdY=;
        b=seSQdH0Wa5GzdJK8N2JL2qdVoenCWYyEasO9FMq9AsCh716cRLeFWjh+ObRoPQlFvn
         yOajyE7xoDQ5Dp4z1mVh5r6B3eiY82AGPXknpfZ5XdZoElCA/H5KKkFuhlUEZ+HPH8MP
         zXGAlxntat1ZqCI+Jgl+oESpO2hCY9aDT1QWAmu++j2tfyNZG+tC58r7SA3N+B8bEHEe
         n5TYcdBROmmCEC5XE9pHus4KWyzWSmiUbAVHGh9Kz7R5evOhn+lXBiHHQws4EnM2R0sm
         XNccVzjyDEOtAqmqQOC9ERLf239gQ2SjG9bK+vEOUsQyVHgfMvNEqdtNnKThzE+lpA7c
         3wWg==
X-Gm-Message-State: AOJu0YyMEK0xpgm/HC8APUdpqREX7mKxFA79OuHMC2OXxdPUc2XDLiie
	wXfAaX3PzMRle4otLfA7fk0E6I4AsktBhmL9WJitG3B/ROMbNMf7
X-Google-Smtp-Source: AGHT+IGertSGLysntXGxMaxnQpxPKhlh6eD7GxRCGVc1hYNLc32i8uzPn6uBYW9ntbg+VrkUaePRTg==
X-Received: by 2002:a2e:a908:0:b0:2fb:2a1c:936d with SMTP id 38308e7fff4ca-2fedb7a1fd0mr80760331fa.10.1730712786783;
        Mon, 04 Nov 2024 01:33:06 -0800 (PST)
Received: from foxbook (bhf124.neoplus.adsl.tpnet.pl. [83.28.95.124])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8c3871sm15811961fa.110.2024.11.04.01.33.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 Nov 2024 01:33:06 -0800 (PST)
Date: Mon, 4 Nov 2024 10:33:02 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v4 1/3] usb: xhci: Limit Stop Endpoint retries
Message-ID: <20241104103302.731601c8@foxbook>
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

Some host controllers fail to atomically transition an endpoint to the
Running state on a doorbell ring and enter a hidden "Restarting" state,
which looks very much like Stopped, with the important difference that
it will spontaneously transition to Running anytime soon.

A Stop Endpoint command queued in the Restarting state typically fails
with Context State Error and the completion handler sees the Endpoint
Context State as either still Stopped or already Running. Even a case
of Halted was observed, when an error occurred right after the restart.

The Halted state is already recovered from by resetting the endpoint.
The Running state is handled by retrying Stop Endpoint.

The Stopped state was recognized as a problem on NEC controllers and
worked around also by retrying, because the endpoint soon restarts and
then stops for good. But there is a risk: the command may fail if the
endpoint is "stopped for good" already, and retries will fail forever.

The possibility of this was not realized at the time, but a number of
cases were discovered later and reproduced. Some proved difficult to
deal with, and it is outright impossible to predict if an endpoint may
fail to ever start at all due to a hardware bug. One such bug (albeit
on ASM3142, not on NEC) was found to be reliably triggered simply by
toggling an AX88179 NIC up/down in a tight loop for a few seconds.

An endless retries storm is quite nasty. Besides putting needless load
on the xHC and CPU, it causes URBs never to be given back, paralyzing
the device and connection/disconnection logic for the whole bus if the
device is unplugged. User processes waiting for URBs become unkillable,
drivers and kworker threads lock up and xhci_hcd cannot be reloaded.

For peace of mind, impose a timeout on Stop Endpoint retries in this
case. If they don't succeed in 100ms, consider the endpoint stopped
permanently for some reason and just give back the unlinked URBs. This
failure case is rare already and work is under way to make it rarer.

Start this work today by also handling one simple case of race with
Reset Endpoint, because it costs just two lines to implement.

Fixes: fd9d55d190c0 ("xhci: retry Stop Endpoint on buggy NEC controllers")
CC: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 28 ++++++++++++++++++++++++----
 drivers/usb/host/xhci.c      |  2 ++
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b6eb928e260f..98e12267bbf6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -52,6 +52,7 @@
  *   endpoint rings; it generates events on the event ring for these.
  */
 
+#include <linux/jiffies.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
@@ -1151,16 +1152,35 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			return;
 		case EP_STATE_STOPPED:
 			/*
-			 * NEC uPD720200 sometimes sets this state and fails with
-			 * Context Error while continuing to process TRBs.
-			 * Be conservative and trust EP_CTX_STATE on other chips.
+			 * Per xHCI 4.6.9, Stop Endpoint command on a Stopped
+			 * EP is a Context State Error, and EP stays Stopped.
+			 *
+			 * But maybe it failed on Halted, and somebody ran Reset
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
+			 * chips where this is known to help. Wait for 100ms.
 			 */
 			if (!(xhci->quirks & XHCI_NEC_HOST))
 				break;
+			if (time_is_before_jiffies(ep->stop_time + msecs_to_jiffies(100)))
+				break;
 			fallthrough;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
-			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
+			xhci_dbg(xhci, "Stop ep completion ctx error, ctx_state %d\n",
+					GET_EP_CTX_STATE(ep_ctx));
 
 			command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 			if (!command) {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 899c0effb5d3..1ed4dce7eeb7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -8,6 +8,7 @@
  * Some code borrowed from the Linux EHCI driver.
  */
 
+#include <linux/jiffies.h>
 #include <linux/pci.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
@@ -1777,6 +1778,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 			ret = -ENOMEM;
 			goto done;
 		}
+		ep->stop_time = jiffies;
 		ep->ep_state |= EP_STOP_CMD_PENDING;
 		xhci_queue_stop_endpoint(xhci, command, urb->dev->slot_id,
 					 ep_index, 0);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f0fb696d5619..0bef6c8b51cf 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -690,6 +690,7 @@ struct xhci_virt_ep {
 	/* Bandwidth checking storage */
 	struct xhci_bw_info	bw_info;
 	struct list_head	bw_endpoint_list;
+	unsigned long		stop_time;
 	/* Isoch Frame ID checking storage */
 	int			next_frame_id;
 	/* Use new Isoch TRB layout needed for extended TBC support */
-- 
2.43.0


