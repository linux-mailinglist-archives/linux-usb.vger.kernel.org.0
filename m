Return-Path: <linux-usb+bounces-14899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F32A9735FC
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 13:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D68DBB24A44
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 11:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC93618C925;
	Tue, 10 Sep 2024 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DelAvc0b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8B1F956
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966868; cv=none; b=FGsVimAoJRydC737wIcm5ZsdCw+g88d9oThZSOAlB2jyqwLj/4Cj8em5ISgFzMXHouu94WUai8iMUU4mG7/67aKHG+seLXRGYVenFkQ9qrgesBtAJyZBjRzR7VWfmGO8l61SjwCufuk3iwpDIr3FY7otF0cxUFE3PO4ZbIKyRAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966868; c=relaxed/simple;
	bh=PlLnZyG7s6FFM1KOXNmWkwphcEqMDPrz3CRs0EXSvmk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGug3/0p3cROMMSI6TwGJjWqYyfUouM0NCEeBpzBGTJqxb2a3O5QbjXAN48E2fwUPD7RRT9wb3fLZNbDi6gq1L88k5SQNTVVP4AJFZM6tVTLt4+MlCMPZfT6JSTZtXZ0662rwwEvsZj7KBknZVrv1SBGPYyvgX3cKMlmymvDgfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DelAvc0b; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f01b8738dso470921e87.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 04:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725966865; x=1726571665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQE/xQz8E3TBsWh3hm+jzO/w4KFV1pN/JUyOxyhMsPg=;
        b=DelAvc0be+xTZP8moecH/O4bRlH39lN7LNHsOueJ5aiAA9hf+ajx9ZH92fxXMLYYBy
         ddc9KufGgJ88abj6r7VspftjJq9x+xr3Oj4ibLf/kXhOsD4DRMdRhDtuSfiAB44OtC9B
         CpvHvB6OXIOUyYN1oFE3SdHTOwn/9TVQ73BVAq0sZ4yWaRNnTFxxI6ooJC8mj7P+x+kU
         ni4OqMH0wKgI5KcfazFI9/ees/unkzOSuLFufweA4pSgAf0XNi2LgspoYbOG8A/zoojS
         LwMr4QdexZNX4bpBE0lfkyXjJDiMN6d0hU1B74Ii2MmSLLkJI29MWvd0GOWvBhhN1vYW
         vQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725966865; x=1726571665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQE/xQz8E3TBsWh3hm+jzO/w4KFV1pN/JUyOxyhMsPg=;
        b=Oj2vB2U5yEX3YNm/VLaj0oOdt7VcskApFXWLIyRw8GhSSFaL8NuWzIDQhhbZvVNxqw
         qic4xiPt7wArB/0qDYARwdhP2BU2AlmYELTn5I7ImVDnLyllisTxr3j1A03l/ZAGpUKU
         0/177YfN01xHjTlcUjPRlKwZdKqNJ1YU+T8ZWzcZ6wc93MZk08Opg9S8rI51dd3nJSxx
         bBtL28VihyQz3Oj9/6rsUjMRZczs2Yq1Lw2p5lJGDeQ+YOnAnHMwcIC+gIbf8B3pUgF7
         v050tbEDPkLoz+6DOFoepDoYkG1YNxL4uibrADkiW6RTAqwwOP5y8WmrgaH8Z6pc+z9Q
         LQ2w==
X-Gm-Message-State: AOJu0YwizCpoWZPlsSucfy1PflCxoKf5Tn0dQ5j8m3G6KZ9TKvpZ9XZI
	lPULTlTrutagGzQ1t2hMbBr8xBXyAuUVuHZ+pBVM/cFNMTSNE1aeh4WHaQ==
X-Google-Smtp-Source: AGHT+IEZlNBDpUOb92Mu14PiKa18GU4DfGe/Ib+gd/usCWNEZgnsjEU1Anhl10Jljq2bqSUZOpxHfQ==
X-Received: by 2002:a05:6512:2806:b0:533:4689:973c with SMTP id 2adb3069b0e04-536587b220fmr8871124e87.23.1725966864122;
        Tue, 10 Sep 2024 04:14:24 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d40c70sm466437066b.195.2024.09.10.04.14.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 04:14:23 -0700 (PDT)
Date: Tue, 10 Sep 2024 13:14:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 2/5] usb: xhci: Clean up the TD skipping loop
Message-ID: <20240910131421.60f14062@foxbook>
In-Reply-To: <20240910131233.409c6481@foxbook>
References: <20240910131233.409c6481@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Recent reworks left this loop ending with:

		if (ep->skip)
			ep->skip = false;
	while (ep->skip);

which obviously cannot ever repeat. Repetition is only possible by a
'continue' statement earlier in the loop body.

Move the "tail", which only executes once, out of the loop body.

Bring the cases of "Found TD" and "skip isoc td" closely together to
consolidate the skipping logic in one place and improve clarity. Now
this code properly controls the loop condition.

No functional change.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 100 ++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 49 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0cab482b3f4e..0eef7cd2f20a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2823,60 +2823,62 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		/* Is this a TRB in the currently executing TD? */
 		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
 
-		if (!ep_seg) {
-
-			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
-				skip_isoc_td(xhci, td, ep, status);
-				continue;
-			}
-
-			/*
-			 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
-			 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
-			 * pointer still at the previous TRB of the current TD. The previous TRB
-			 * maybe a Link TD or the last TRB of the previous TD. The command
-			 * completion handle will take care the rest.
-			 */
-			if (trb_comp_code == COMP_STOPPED ||
-			    trb_comp_code == COMP_STOPPED_LENGTH_INVALID) {
-				return 0;
-			}
-
-			/*
-			 * Some hosts give a spurious success event after a short
-			 * transfer. Ignore it.
-			 */
-			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
-			    ep_ring->last_td_was_short) {
-				ep_ring->last_td_was_short = false;
-				return 0;
-			}
-
-			/* HC is busted, give up! */
-			xhci_err(xhci,
-				"ERROR Transfer event TRB DMA ptr not "
-				"part of current TD ep_index %d "
-				"comp_code %u\n", ep_index,
-				trb_comp_code);
-			trb_in_td(xhci, td, ep_trb_dma, true);
-			return -ESHUTDOWN;
-		}
-
+		/*
+		 * If ep->skip is set, it means there are missed tds on the
+		 * endpoint ring need to take care of.
+		 * Process them as short transfer until reach the td pointed by
+		 * the event.
+		 */
 		if (ep->skip) {
-			xhci_dbg(xhci,
-				 "Found td. Clear skip flag for slot %u ep %u.\n",
-				 slot_id, ep_index);
-			ep->skip = false;
+			if (ep_seg) {
+				xhci_dbg(xhci,
+					 "Found td. Clear skip flag for slot %u ep %u.\n",
+					 slot_id, ep_index);
+				ep->skip = false;
+			} else {
+				if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
+					skip_isoc_td(xhci, td, ep, status);
+				else
+					break;
+			}
 		}
 
-	/*
-	 * If ep->skip is set, it means there are missed tds on the
-	 * endpoint ring need to take care of.
-	 * Process them as short transfer until reach the td pointed by
-	 * the event.
-	 */
 	} while (ep->skip);
 
+	if (!ep_seg) {
+
+		/*
+		 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
+		 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
+		 * pointer still at the previous TRB of the current TD. The previous TRB
+		 * maybe a Link TD or the last TRB of the previous TD. The command
+		 * completion handle will take care the rest.
+		 */
+		if (trb_comp_code == COMP_STOPPED ||
+		    trb_comp_code == COMP_STOPPED_LENGTH_INVALID) {
+			return 0;
+		}
+
+		/*
+		 * Some hosts give a spurious success event after a short
+		 * transfer. Ignore it.
+		 */
+		if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
+		    ep_ring->last_td_was_short) {
+			ep_ring->last_td_was_short = false;
+			return 0;
+		}
+
+		/* HC is busted, give up! */
+		xhci_err(xhci,
+			"ERROR Transfer event TRB DMA ptr not "
+			"part of current TD ep_index %d "
+			"comp_code %u\n", ep_index,
+			trb_comp_code);
+		trb_in_td(xhci, td, ep_trb_dma, true);
+		return -ESHUTDOWN;
+	}
+
 	if (trb_comp_code == COMP_SHORT_PACKET)
 		ep_ring->last_td_was_short = true;
 	else
-- 
2.43.0


