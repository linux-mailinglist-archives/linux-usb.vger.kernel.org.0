Return-Path: <linux-usb+bounces-16892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F76D9B77C7
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 10:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5741CB2494D
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 09:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F91514BF92;
	Thu, 31 Oct 2024 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8AnruTV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8614B092
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367923; cv=none; b=fV2cAPNWzVIAXdLF7vcrJ76yc0d1asRXFjmR12Ef0gGYJkY83lyM+HwUFBW66O/CIwvgp/iV7dLGrhpGe23ZxZZPTIDeiEtZCgFXskNADKHwPyO3OzMG/kabYLvwAA61QzlbDOgb1nW2rHUJ0S/1SqIFeICpZVdPZ4R54GI23UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367923; c=relaxed/simple;
	bh=JunvI9XqI9yAFv1j4jxWHR1+zx58G4fPLc9u+mGQF4A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UoxjCCtgTqG5AWSLWm6TnZOixMBQlxx4Lx9Dh/KyshHjx0SatGQ0ZUu/M+9OLKh6zDeinwcjcGHD995IYYiO+U9o5wmckFTQy4EEIcCDuu002mInRLs/7WZJ8W5T6wlxgnBkoMM86PZSThop2GLFhBO0Koqysy2ciNJXZrwHpkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8AnruTV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f6e1f756so750424e87.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730367920; x=1730972720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlltefIDet63GGdv5+a74N+BOLA2GSCLpaDd5YD1nDw=;
        b=h8AnruTVi019HOVyk0kBTGoy0wMwn9KrdVl6f69ye6BtglPq5e9VEp3CLebmF76rTo
         TPEf/gNe2zozVB75RGWHtf7Qd5P5VqXL1pCwFvm73Pjkx1ATNcd9yiqXcipg7yvtuzfN
         jJ0mXi7C9aCU5dIB6ZYSpi5ay4Wz2PAPrkFWYsJM2nqwrwU7Bj0i+yPVnNNlaiFzNiVc
         UUIG3Ou/aqHiIm1Iui1NSkiiSj/i8ubxcB+S7A9O/r+3kwNhRl9Zlpm8nz5tRJXRnhy/
         5lT0ZEmmPDS1JGJNJ2hiv2hMslFeusQBuIa9IZqwIBLIvhRa0QejGrk4vPwRr7Wn5xJg
         /RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367920; x=1730972720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlltefIDet63GGdv5+a74N+BOLA2GSCLpaDd5YD1nDw=;
        b=nnkmbJjttOSOROGUJNKLIj8ctIQ/nP3nDaZbYwDoaTE/G6BmeRfkDpMAdzAR8HCw+E
         RpuhG6QfThFvNNk1QimTxuFkBbmMSL/MvjZvZTiPBzcir7+eTkmeEO1iKFvJar0pHAGr
         x8XAjdb1hF0jCFZnpIKMXj1OCji9gdZwLpN4fWXLWOxLJwJ0n/KL8xmkm2ktZH1VZA9D
         YLhB6J1s/DlAXpiIDqRGqsB13udJBTAJ5D7eqcOA4/n7kpeHj5nUHDdgh4vCqoSJNvrj
         ly+aR9XB5V0yDxHEJrnuePIFUu4ByX3vYYw5WxqbFBScxYt8tg7+2KDautiVnY4cHkhj
         tCkQ==
X-Gm-Message-State: AOJu0Yzo+D5+WgU7xMFdDEpCGYQiexu97f5jAJWE9NlNoj1TkxPlLkNI
	FTBey6F765hUb1U1Bql7obsi1x0EBL4LQxy9GsEESkqMUkxvdwp/nHkhQg==
X-Google-Smtp-Source: AGHT+IGoMQXOo8V70oV6OSJRvri3ox38N/hY7lZV7q9+h9zmY6DoxQdmDnWvZFS4gmWbau5dlc3KZg==
X-Received: by 2002:a05:6512:318c:b0:53b:1f14:e11a with SMTP id 2adb3069b0e04-53b348d0d32mr9408763e87.15.1730367919331;
        Thu, 31 Oct 2024 02:45:19 -0700 (PDT)
Received: from foxbook (bfh123.neoplus.adsl.tpnet.pl. [83.28.45.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbe2dsm142066e87.196.2024.10.31.02.45.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Oct 2024 02:45:17 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:45:14 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v3 3/3] usb: xhci: Avoid queuing redundant Stop Endpoint
 commands
Message-ID: <20241031104514.256db6c1@foxbook>
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

Stop Endpoint command on an already stopped endpoint fails, which may be
misinterpreted as a hardware bug by the completion handler. This results
in an unnecessary delay with repeated retries of the command.

Avoid queuing this command when our endpoint state indicates that it is
pointless: when other endpoint management commands are pending and will
process cancelled TDs on completion, or when the endpoint is waiting for
TT buffer to be cleared.

This should reduce unnecessary retries to almost zero. Known exceptions
include hard endpoint reset not followed by a ring restart and HW faults
causing the endpoint never to restart at all.

The endpoint reset case is likely a bug, so dealing with it is left for
later, when the matter is analyzed and resolved satisfactorily.

Fixes: fd9d55d190c0 ("xhci: retry Stop Endpoint on buggy NEC controllers")
CC: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 13 +++++++++++++
 drivers/usb/host/xhci.c      | 24 ++++++++++++++++++++----
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 52eb3ee1d7bf..7726168b72ab 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1071,6 +1071,19 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
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
index 1ed4dce7eeb7..e75a6bf4e8d5 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1680,6 +1680,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	unsigned long flags;
 	int ret, i;
 	u32 temp;
+	bool cancelled = false;
 	struct xhci_hcd *xhci;
 	struct urb_priv	*urb_priv;
 	struct xhci_td *td;
@@ -1766,13 +1767,28 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 			td->cancel_status = TD_DIRTY;
 			list_add_tail(&td->cancelled_td_list,
 				      &ep->cancelled_td_list);
+			cancelled = true;
 		}
 	}
 
-	/* Queue a stop endpoint command, but only if this is
-	 * the first cancellation to be handled.
-	 */
-	if (!(ep->ep_state & EP_STOP_CMD_PENDING)) {
+	if (!cancelled)
+		goto done;
+
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


