Return-Path: <linux-usb+bounces-14911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB5D973946
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 16:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCC871C20CD9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 14:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D890A192D7B;
	Tue, 10 Sep 2024 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnPGJY7G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C150118FC65
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725976940; cv=none; b=OO/cwy6WpGmHhpT/oSsbHihNzVBIM9/g0rly+gndluZ0uegk5Uj+2eW3AMZBvgZlisD5g3b3Okw0WmDnEBSLCLrvzze+Y3DrNQ43cPFf0lolxstQYujpxjWJdIbPkj7Qpd0N90lt9LBEOZ/a9n3R+cT4AH4mqTOJRBrnb7+stQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725976940; c=relaxed/simple;
	bh=HfBHGql09L3sdKiyTGj89SBaxXlmFzGAo6CDWYtRK7c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebnNDe6bmlhyB/SW8oza7PNxXjE7NSKA25Y/QpyTRGvyXyLyQrmBkd1UY9oOQdCip+xI52RT3Ym0B/bJWnkFTFCr2WOx/g4Z1wDuQ3FLfQYEXhs1EMadUKFbiT0hwueaG7FJqxdpNUlJdexaw0UoTgl+TubGx0A+T7b5QnQLxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnPGJY7G; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so121561a12.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725976937; x=1726581737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Qy9Srqaw4c6WC5pjZpQgN15Z3GqcYv2pbBfM9zQ5Q=;
        b=gnPGJY7GOdQI6Ynbt9j0Pe0wZIVPBkH9oKGPzXi08uS5iRAo6K366vg31b0slzgz40
         E0sCqFuDiFVoY7u7EMXPLW8LOu3uOIylnN7kvPfA02QQZAzUQX7TlatD26E9gNIJVxLe
         LogToM/ul9kH8zC9SLUWFBoBOD3+7zCOYi4z5bALtXk3ECK5CPvoasBp8RdFMTzqiRT3
         vlS5UInCCYlgI+zthV5jMY4a6yM0y2GnSNgyPGTKt05wovcumzJ49n4Fg/Zj0lvlDSAs
         2LnAM2AfgkGpEshtbXFHr+RBdeP/0Ynzqs8QYbmR5dU4pQuvhktYbNz0WTenTPooVo6m
         M1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976937; x=1726581737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8Qy9Srqaw4c6WC5pjZpQgN15Z3GqcYv2pbBfM9zQ5Q=;
        b=C2CPd7ZKgsbu42f+4aO8Z9ggsp8FH6z87qHUJPyKXBS7qj/nZHfuP76WEoYStXxMXn
         Ljp+EtGlztPmyYSYgUk++juT7z0RD6Djvl1Sb+BQpWRO0YLlEvYKl2vMXumv2b9MSOFM
         T1nu0+j2Hqhk8y4DaHRnhIB9OtzK31MUuV0tGi6GIetZZJrVZw+W7CxUk5//lcTV5vZb
         Zm+Oagih9oIU78+bAhxjx/76+TxhIwPrE2ZDVaJZpSb07xxRTjgX+DmmzFuN3p0JzkNQ
         8ESWvAujMhKDbBmUcX/QqffsCMe4gQ9fY/4wIvfD4RpIUNpsBxHwAvDtJvbMaCCZKfX0
         gLBw==
X-Gm-Message-State: AOJu0Yx7cbX53+dj08VYnyUQcH3u55qqq6vKK8+pPHzPSQJPN/mCuB9u
	jy+fFGUoXe82gPnpYnmccutg4hZvh6zWjD/T8tsElbWZlFcW8jLB
X-Google-Smtp-Source: AGHT+IEUy1C9ZCHPHuPz2vNMCiGz+u51JxK6wcvzorMc6DRBAXz5o+J1ejjV0dmieVNvoS88UBXxaQ==
X-Received: by 2002:a05:6402:84b:b0:5c3:ce35:d165 with SMTP id 4fb4d7f45d1cf-5c4015e753dmr4148246a12.12.1725976936492;
        Tue, 10 Sep 2024 07:02:16 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd8cc33sm4324359a12.87.2024.09.10.07.02.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 07:02:16 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:02:12 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: xhci: Remove unused parameters of next_trb()
Message-ID: <20240910160212.6098854b@foxbook>
In-Reply-To: <20240910160114.50b77a91@foxbook>
References: <20240910160114.50b77a91@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The function has two parameters which it doesn't use and hasn't ever
used. One caller even puts NULL there, knowing it will work anyway.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4ea2c3e072a9..a3ffadf8e400 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -145,10 +145,8 @@ static void trb_to_noop(union xhci_trb *trb, u32 noop_type)
  * TRB is in a new segment.  This does not skip over link TRBs, and it does not
  * effect the ring dequeue or enqueue pointers.
  */
-static void next_trb(struct xhci_hcd *xhci,
-		struct xhci_ring *ring,
-		struct xhci_segment **seg,
-		union xhci_trb **trb)
+static void next_trb(struct xhci_segment **seg,
+			union xhci_trb **trb)
 {
 	if (trb_is_link(*trb) || last_trb_on_seg(*seg, *trb)) {
 		*seg = (*seg)->next;
@@ -446,9 +444,9 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * avoiding corrupting the command ring pointer in case the command ring
 	 * is stopped by the time the upper dword is written.
 	 */
-	next_trb(xhci, NULL, &new_seg, &new_deq);
+	next_trb(&new_seg, &new_deq);
 	if (trb_is_link(new_deq))
-		next_trb(xhci, NULL, &new_seg, &new_deq);
+		next_trb(&new_seg, &new_deq);
 
 	crcr = xhci_trb_virt_to_dma(new_seg, new_deq);
 	xhci_write_64(xhci, crcr | CMD_RING_ABORT, &xhci->op_regs->cmd_ring);
@@ -678,7 +676,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 		    link_trb_toggles_cycle(new_deq))
 			new_cycle ^= 0x1;
 
-		next_trb(xhci, ep_ring, &new_seg, &new_deq);
+		next_trb(&new_seg, &new_deq);
 
 		/* Search wrapped around, bail out */
 		if (new_deq == ep->ring->dequeue) {
@@ -756,7 +754,7 @@ static void td_to_noop(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		if (trb == td->last_trb)
 			break;
 
-		next_trb(xhci, ep_ring, &seg, &trb);
+		next_trb(&seg, &trb);
 	}
 }
 
@@ -2259,7 +2257,7 @@ static int sum_trb_lengths(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	union xhci_trb *trb = ring->dequeue;
 	struct xhci_segment *seg = ring->deq_seg;
 
-	for (sum = 0; trb != stop_trb; next_trb(xhci, ring, &seg, &trb)) {
+	for (sum = 0; trb != stop_trb; next_trb(&seg, &trb)) {
 		if (!trb_is_noop(trb) && !trb_is_link(trb))
 			sum += TRB_LEN(le32_to_cpu(trb->generic.field[2]));
 	}
-- 
2.43.0


