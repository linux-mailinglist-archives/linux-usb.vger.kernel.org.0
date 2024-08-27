Return-Path: <linux-usb+bounces-14191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 406DB9615EB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17B64B224AA
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A23F1D1F76;
	Tue, 27 Aug 2024 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg6OPMVs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5A1D1F6C
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781004; cv=none; b=jFsuNiUfSCrnHlOLGlrWQVwoDXnek2P2Aj4hzu4RiHfLJh+VpddJdo1ASiM7+5aNeY930PxtUH8mla/rZ1ST5O5hEL/pbAd4Is6vnnfxisggELAfis9dwi7EJ0q5bnDgJmPTbs8ToDrpmypAADEEro4k0dFPAfVim2xl3yiOB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781004; c=relaxed/simple;
	bh=JJhIKTk9bf+E+DzZOnkbZp8yn1cw1DaSfrljsKvHLB0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R5YTAyHopMVTq27OtzRZjjIwNvo+N1ZFzWXINxcBM+oTh7875wc9NgWJLm38IQXpJu4Z5vjzqCKFsWVKV+iyeu8AfOayw6KB9M5ybL2HnIImZf1Y7Sf6H5wZGYEQrn/sEAwCDW42L8h6sQTY5SMyh4YzTnHU23vf8n/9wj8EQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg6OPMVs; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so66380871fa.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781001; x=1725385801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW+0n8rzUwmHxcQrm9+AWLnjviY2qXp2A8UIezo+VJo=;
        b=jg6OPMVs7I1kIfyALQ5XQ9qZ6CXOzWdBI0CBskOlnpuaGDUhIP5mxx+fRFL8Sn3toP
         7LrtKxuBi15UNIflqknOxNxWgZyt8DDNyoX/2n3JhgESeUqHmPC0XIettcUK2rplHCm1
         mlzF37Sggy1kyi/PPtE/oT8KGZJdeWH0plRuZ+C8sw3RlbRIFEAtAUgdgJPO0jDCYPem
         niDqo4XfnwqZy9j/az2oo5P15vSewkA4vVoQLoesYtwr9euKGKFXU8ZqHfsQB5TvwzPs
         FuqV9V1zlZVOG04uZajS/2PFshs4gfHLsZ9yHg2N/Uow81UsUEgWvQTOEnkem3brsqFC
         DMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781001; x=1725385801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW+0n8rzUwmHxcQrm9+AWLnjviY2qXp2A8UIezo+VJo=;
        b=YXNKsFKeg/c0vOyOE3AAn8rkfQLTFFHM3ard+7N+e4hwrsh3A8xTNZVyN5v83QxCx6
         dXXo0JWTpKQlP4edpN9NmrfKH7goN+vyjRgn5QCMwe2wFLZjM5ayQNRsq8l+gOijt3iE
         /ENhDIw+wiJwiHJZDHSkP+02qOEgn+xeKVFlF7Z1KpvTw01s8fohnuKiwX5yVBouPgwi
         kCwLAZg5syMamip9XwbTCSOFOAZplXZ37Hk9ljqrf7GSIrQ1SiXx4QDewukQ0JUGabaP
         ozPOJRBoyiVtOKlEhM9H+hYNnktppNVf/7WIBK8POq+8lKCs8WCSs+uxJoz/5aesqZje
         PZ5A==
X-Gm-Message-State: AOJu0Yxz9AwFw3E3aCJUDjWKA05Sg/XoQXU1uJw0572E/ZWPZRNfcoup
	4TgJZmo2f83zAGvNIEnM5qWHEH4QVi9IgnzmMYGMdRzKGJno34X3
X-Google-Smtp-Source: AGHT+IGlFWA/+3zPgLd70uVe8EaT4RUCN+jFRGqYozda1Dc2kKe+zRV6jazQu1IqoxSVUycLZizmpQ==
X-Received: by 2002:a2e:f09:0:b0:2f0:20cd:35fc with SMTP id 38308e7fff4ca-2f4f573a316mr97934851fa.7.1724781000559;
        Tue, 27 Aug 2024 10:50:00 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4048ae5dfsm16573061fa.140.2024.08.27.10.49.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:49:59 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:49:56 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 3/9] usb: xhci: Clean up the TD skipping loop
Message-ID: <20240827194956.537b963a@foxbook>
In-Reply-To: <20240827194625.61be5733@foxbook>
References: <20240827194625.61be5733@foxbook>
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

Move the "tail" which only executes once out of the loop body.

Bring the cases of "Found TD" and "skip isoc td" closely together to
consolidate the skipping logic in one place and improve clarity. Now
this code properly controls the loop condition.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 102 ++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 401c34ff2260..e65cc80cb285 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2829,63 +2829,65 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				}
 			}
 		}
 
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
-			 * FIXME xHCI 4.10.1.1: this should be freed now, not mid-TD
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
+		 * FIXME xHCI 4.10.1.1: this should be freed now, not mid-TD
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
 		ep_ring->last_td_was_short = false;
-- 
2.43.0


