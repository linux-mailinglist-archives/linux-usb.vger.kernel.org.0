Return-Path: <linux-usb+bounces-16890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FAF9B77C3
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 10:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 485AF1F235FD
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 09:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A11196450;
	Thu, 31 Oct 2024 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR9IqjYM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7249A13BAC3
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367790; cv=none; b=Ial/1PtrsaU6Bq3PCJ+6zT9CiWzViR/8RTIxpykbnyVPyYbc9x6GbZTpucvQ1o4roEcV6JKFXrJrohgHnOHrC4KIHfNiBT+FRYRzQOiJgTCHALOwclB3VxyIbStQLIo7/itYR6uYp0AW9yLfQifsyC7UsGFamgJxwtvdhvvwetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367790; c=relaxed/simple;
	bh=1pMRCbv89qdg0o11ljih3Oei+WaZwQDEVdijBxFNLqY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfqYCULsgi+3CdqGeWY6FfrUYlmk7R5uHRtZlqodCg15/uO//R7GV8ghgXJoFmZblw6WVXXn3pAC0EVYqD7WPBYFDZyLjw4Hhba2ayV5U689Iz5Vx6C42oPpBbuTfSsAbR/NnPP81qcU+KC5ylSeyafx1KMESumsNlCHMy63l54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR9IqjYM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so931355e87.1
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730367786; x=1730972586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZYvbcblMqiRk+LHTGLqF0u2yHlKbcksAPMq/ywRDBU=;
        b=PR9IqjYMQPdAFsu1oOXHurWTr2cySJkMlf4mxc0Bz6EbcCOJwh4b5wM2ALfpMDhM+d
         flV0rjLF4KtisTtZw2ma/o+3AUTLFavxI3fa5i3hR7OaEZf9++ptsiqQwPGpmkwdXvUg
         VVZK53Bq5R+byMZTlMfDC2yCe3HD8TLFsOeiT8d0PvRnTiqsvKBAHCGk1kjAzss1QGeK
         eLWWP2j1LuX0xzCY9n8PQAkcvbJ6KwuNk8D+pWpVRi/9/xgpme8w66ylqjMqeGZ0TqAe
         fRpIZpPpgZwKAZU/YTqACzYLBAxZUjUOowUQLoegzvg9p0/jL5haaFw80tVyghI1JW1D
         HTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367786; x=1730972586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZYvbcblMqiRk+LHTGLqF0u2yHlKbcksAPMq/ywRDBU=;
        b=bpNs/RfZoZl0sIPbFtQFpWjfv5CO935AVn9gxJV7XeRyVADTjDeWP/2hRqBF+EpW8U
         /6/d7ibigMD2JtKm4shDJxbu5RYcoDISV8+mJG4zely4hqbpM2fCWzlEmQ9USPHVgVrv
         9lAWxGIpJLs+OZH+vgD1xCCx+OYEORYCaNiegq1lA3JbHGhv/stvE5q5lRgGRLY8hCUh
         v2VRMEjoH0XupqeOrNU8lJbLGiVWJof+ZqMq7H2vvG7wkta3vBWCkl+Dl32jQ6+ep5+6
         QxndTnZpChiuWuKD8V5dRNZEoz9I7ZyobZw3OuWZ2LDksqt8Mj8repWGR2sskLwXRVL7
         4KoQ==
X-Gm-Message-State: AOJu0YzeTw321da6OO74IXCxRNDzSO03MhQ2MKEL39XPSIuV+J8osq7M
	kizX88bkbW8qVFKn/BIKtiz2VvSlL3cpPKfRCUrR3G2BPcj0Y3GpDhhDyw==
X-Google-Smtp-Source: AGHT+IHzYn0oMyQ7sTFjqlkrB7jEi5UWX1iQ8IXjyuCnz20ezOvs2QHQ9xb03Z7mO0rsTdvubjKOEA==
X-Received: by 2002:a05:6512:1392:b0:536:73b5:d971 with SMTP id 2adb3069b0e04-53b34c5f886mr9722493e87.38.1730367786148;
        Thu, 31 Oct 2024 02:43:06 -0700 (PDT)
Received: from foxbook (bfh123.neoplus.adsl.tpnet.pl. [83.28.45.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde0ae2sm141369e87.260.2024.10.31.02.43.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Oct 2024 02:43:05 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:43:02 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v3 1/3] usb: xhci: Limit Stop Endpoint retries
Message-ID: <20241031104302.6b7538cd@foxbook>
In-Reply-To: <20241031104159.25f9ff70@foxbook>
References: <20241031104159.25f9ff70@foxbook>
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
cases was discovered later and reproduced. Some proved difficult to
deal with, and it is outright impossible to predict if an endpoint may
fail to ever restart at all due to hardware bug. One bug of this kind
(albeit not on NEC) was discovered and is reproducible from userspace:

  while true; do ifconfig eth1 up; ifconfig eth1 down; done

An endless retries storm is quite nasty. Besides putting needless load
on the xHC and CPU, it causes URBs never to be given back, paralyzing
the device and connection/disconnection logic for the whole bus if the
device is unplugged. User processes waiting for URBs become unkillable
and xhci_hcd cannot be unbound from the HC or reloaded.

For peace of mind, impose a timeout on Stop Endpoint retries in this
case. If they don't succeed in 100ms, consider the endpoint stopped
permanently for some reason and just give back the unlinked URBs. This
failure case is rare already and work is under way to make it rarer.

Start this work today by also handling one simple case of race with
Reset Endpoint, because it costs practically nothing to implement.

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


