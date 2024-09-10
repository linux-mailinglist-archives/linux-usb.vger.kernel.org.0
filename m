Return-Path: <linux-usb+bounces-14898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BF9735F9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 13:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F542835A6
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 11:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3196518C90B;
	Tue, 10 Sep 2024 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr3U9Y3r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2B1F956
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966821; cv=none; b=sIykr5EVcGlHzN6kJ5MyVKMJQfh0lGBMbseO5e7blcs/kTdgpp7XU2eiBWIdG4a2iiWr7MdVW2ys3dC34lxyaslPgDOjq2boqstKcfMW9pzSsb+CMjY1oPT7OGr0cFEwx5kDzTPQUS6yooGYUOX8Tjd0EwigrNl8gXlw1+sqwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966821; c=relaxed/simple;
	bh=CpDE9lfGOcA7ZgEmbg0vjc20zxbs5UXX7H2boJUJ/jo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FkpfFxIxJJS2XIQI04CSb38or/pnVV2tpVIIHZ/H+gL87gg6MpOYyimXIqhXdq3DOBzswQRRmTefIzP3y4sN7+sGH714tlg6crTB9zKnVHJJPw7CCZKED9mITmwuseX6C9nv35DvHnqhqO1NiHaKN9E0hDslJmDfawC4bIp265U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr3U9Y3r; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d13b83511so418657166b.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725966818; x=1726571618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/Y0VfG/93qzYbPDOPjttEMIeKEjz982IJT79fbgsw0=;
        b=mr3U9Y3rScML8bvySG/N11XOMnzdb2xw4qTRsLaOISO7x+gRiSk34tgb563lZhOHX6
         izAPQk/JZGAc5XMpRokz7jHjv/b4JOSzSpGqGkAYXbDphOGziLwfHrh8ODKq6pECqQ7u
         4we4k+9wlM1YDK3cDw85Maf76KcRCngIzc+7pHLjRfgwzE0k4za10BqBdoXb28gkC12P
         REqiX876QuL9Kos/LR/tWtO2REwDZetR9UaTcHL+MrARMnPK1CUltHuqLDyWkZMe2+hS
         pPW8/LueLqWWeN3w4A4NpcRktwJjacACIhFrMmRxoqmHinmcGGLOT1xy1F/rr9AH0woo
         kscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725966818; x=1726571618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/Y0VfG/93qzYbPDOPjttEMIeKEjz982IJT79fbgsw0=;
        b=Gq4y6jl5jNp1XtnPuglQB6rNeKai5dBNnwbqqG0afhgrR2dPysJv42La0JtnYUMdK/
         EF+gPpEwD+wxVyoFeUQxuZwxlEIG1PsW8X0x9CXNypZu56hZvmoljEB6wRJLf+BCfWsF
         bpGTSejXHdJl0Pmdw7/Uk4Z3k9Oh7U/KF+nEq8L5XlEEHI5veWSPIsCejSI9GAAvv0kt
         87w7K1GgFdoa5eJFUeZRwWfcS4YPl6hC8XioqtV1vMYQVwEGFDRTNrEsADgIoU4QoHCu
         AyhVW7BGDl70zDZ/ld2DD9YHUpWmH6rS8D+NiWq0vJYd8itAbbBlQPgPymV/yxCnLDS5
         e+DA==
X-Gm-Message-State: AOJu0YzKBJ4CRS/YPE1nD4LCQ39l52CvMc5RoIdc/q8GA/4xTo/FonYb
	uFsTA8ftxSL0MWzZJcnE6oF/eixoZL77OG6ZdxLRtRhtkRpjxw99
X-Google-Smtp-Source: AGHT+IETPQo4BJSihNKsc9JYHtg1ZTis8j078V7HoDFc29UQvOKhdP3BS2Lcjr7NAJlQ5bXvlKCbPg==
X-Received: by 2002:a17:907:3f87:b0:a8d:3998:2de with SMTP id a640c23a62f3a-a8ffaaace71mr38787566b.12.1725966818139;
        Tue, 10 Sep 2024 04:13:38 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced18csm463925066b.161.2024.09.10.04.13.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 04:13:37 -0700 (PDT)
Date: Tue, 10 Sep 2024 13:13:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 1/5] usb: xhci: Fix handling errors mid TD followed by other
 errors
Message-ID: <20240910131334.5da837f8@foxbook>
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

Some host controllers fail to produce the final completion event on an
isochronous TD which experienced an error mid TD. We deal with it by
flagging such TDs and checking if the next event points at the flagged
TD or at the next one, and giving back the flagged TD if the latter.

This is not enough, because the next TD may be missed by the xHC. Or
there may be no next TD but a ring underrun. We also need to get such
TD quickly out of the way, or errors on later TDs may be handled wrong.

If the next TD experiences a Missed Service Error, we will set the skip
flag on the endpoint and then attempt skipping TDs when yet another
event arrives. In such scenario, we ought to report the 'erorr mid TD'
transfer as such rather than skip it.

Another problem case are Stopped events. If we see one after an error
mid TD, we naively assume that it's a Force Stopped Event because it
doesn't match the pending TD, but in reality it might be an ordinary
Stopped event for the next TD, which we fail to recognize and handle.

Fix this by moving error mid TD handling before the whole TD skipping
loop. Remove unnecessary conditions, always give back the TD if the new
event points to any TRB outside it or if the pointer is NULL, as may be
the case in Ring Underrun and Overrun events on 1st gen hardware. Only
if the pending TD isn't flagged, consider other actions like skipping.

As a side effect of reordering with skip and FSE cases, error mid TD is
reordered with last_td_was_short check. This is harmless, because the
two cases are mutually exclusive - only one can happen in any given run
of handle_tx_event().

Tested on the NEC host and a USB camera with flaky cable. Dynamic debug
confirmed that Transaction Errors are sometimes seen, sometimes mid-TD,
sometimes followed by Missed Service. In such cases, they were finished
properly before skipping began.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 70 +++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4ea2c3e072a9..0cab482b3f4e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2764,6 +2764,30 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		return 0;
 	}
 
+	/*
+	 * xhci 4.10.2 states isoc endpoints should continue
+	 * processing the next TD if there was an error mid TD.
+	 * So host like NEC don't generate an event for the last
+	 * isoc TRB even if the IOC flag is set.
+	 * xhci 4.9.1 states that if there are errors in mult-TRB
+	 * TDs xHC should generate an error for that TRB, and if xHC
+	 * proceeds to the next TD it should genete an event for
+	 * any TRB with IOC flag on the way. Other host follow this.
+	 *
+	 * We wait for the final IOC event, but if we get an event
+	 * anywhere outside this TD, just give it back already.
+	 */
+	td = list_first_entry_or_null(&ep_ring->td_list,
+						struct xhci_td, td_list);
+
+	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_trb_dma, false)) {
+		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
+		ep_ring->dequeue = td->last_trb;
+		ep_ring->deq_seg = td->last_trb_seg;
+		inc_deq(xhci, ep_ring);
+		xhci_td_cleanup(xhci, td, ep_ring, td->status);
+	}
+
 	do {
 		/* This TRB should be in the TD at the head of this ring's
 		 * TD list.
@@ -2828,44 +2852,14 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				return 0;
 			}
 
-			/*
-			 * xhci 4.10.2 states isoc endpoints should continue
-			 * processing the next TD if there was an error mid TD.
-			 * So host like NEC don't generate an event for the last
-			 * isoc TRB even if the IOC flag is set.
-			 * xhci 4.9.1 states that if there are errors in mult-TRB
-			 * TDs xHC should generate an error for that TRB, and if xHC
-			 * proceeds to the next TD it should genete an event for
-			 * any TRB with IOC flag on the way. Other host follow this.
-			 * So this event might be for the next TD.
-			 */
-			if (td->error_mid_td &&
-			    !list_is_last(&td->td_list, &ep_ring->td_list)) {
-				struct xhci_td *td_next = list_next_entry(td, td_list);
-
-				ep_seg = trb_in_td(xhci, td_next, ep_trb_dma, false);
-				if (ep_seg) {
-					/* give back previous TD, start handling new */
-					xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
-					ep_ring->dequeue = td->last_trb;
-					ep_ring->deq_seg = td->last_trb_seg;
-					inc_deq(xhci, ep_ring);
-					xhci_td_cleanup(xhci, td, ep_ring, td->status);
-					td = td_next;
-				}
-			}
-
-			if (!ep_seg) {
-				/* HC is busted, give up! */
-				xhci_err(xhci,
-					"ERROR Transfer event TRB DMA ptr not "
-					"part of current TD ep_index %d "
-					"comp_code %u\n", ep_index,
-					trb_comp_code);
-				trb_in_td(xhci, td, ep_trb_dma, true);
-
-				return -ESHUTDOWN;
-			}
+			/* HC is busted, give up! */
+			xhci_err(xhci,
+				"ERROR Transfer event TRB DMA ptr not "
+				"part of current TD ep_index %d "
+				"comp_code %u\n", ep_index,
+				trb_comp_code);
+			trb_in_td(xhci, td, ep_trb_dma, true);
+			return -ESHUTDOWN;
 		}
 
 		if (ep->skip) {
-- 
2.43.0


