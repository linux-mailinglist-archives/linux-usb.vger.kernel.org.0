Return-Path: <linux-usb+bounces-27411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0C7B3DA3E
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 08:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBCCB189AD74
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 06:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CE024E4A1;
	Mon,  1 Sep 2025 06:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1kt4OY/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F89169AD2
	for <linux-usb@vger.kernel.org>; Mon,  1 Sep 2025 06:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709346; cv=none; b=FL2GYQPuNiREOg2suibd+0oQrztl+mVoBeD2w1RySIivFLZ0+0tqpe5Tp7TLiD+OWgx0Lqhqe29XYpOyBDHTFsr/DSzoYvnYrP4XG6wo9GGq3pJdU6KJP3ki/trwN63u9zq/OfDbC4hDzPuLPN6+wKcr1tajRgM+kdu2ydmi1fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709346; c=relaxed/simple;
	bh=9bpGVUOric3sYfh4BYMLniTa9055LsShI/TcFntHIZg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QsIaI3/xGOoo4AsFE9KCusLkFENHvHb2oTWdnwP1q+jKbmK74YhuVuEULVObhNFBlczFsv3gbZBrtF2pHhX4znfqrVTrulxb8MeHGIeDbgub2y+j4/2YnvymS3xHTm2l2pxnBkRb5yQs9pf2+4vjL8EydrsFU+XXSUVPURtq250=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1kt4OY/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f687fd3bdso3497002e87.1
        for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 23:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756709343; x=1757314143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKZabS1OtGo0yQW6vY59iZzz6KAaK73mhzdC9qETnGU=;
        b=V1kt4OY/05gCpBeLaojk6uSWdBam8RTLwm6MJgDThCfiSJECAUSz7KJp3JwctBjX3b
         i0xSdWf7mhptEvLReOEkk6xzRNAdVQp+QZtmT2nZ7yW4hZ0U70HX+VvOONp9SoPxMhLR
         i0fDpa0wpgzjwMwukmF34En/iM2a2oL3UYH77knGpD6qWrdzyfwkJr/OVR8huZOgxcDB
         UzV0bfrFJFIy5+jkdN/eYwQXs5cusJEXtfvQhPcYWX7CgVP8n9fMiChqF06L4i9lvZ0Q
         uuSGSjOrJyLWZz2N4JUl99YPhvBMsbCn6M85DvxT37UY8YExuc4+fLlwMz3u2lxbyS4F
         uEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709343; x=1757314143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKZabS1OtGo0yQW6vY59iZzz6KAaK73mhzdC9qETnGU=;
        b=RR8o2bvS6SJLbc4IeykHQBxLhL5RIqOohpOpMNO4xBWn1dOLuN7pE4sc/MwdB1aTmV
         R0xKl+IIFqg14QruPswxSx7+E+9v5vzoSoK/Qpg8u8/m0p0G1U9Slvg5AFztWzctoydO
         BufriMEZ9RuPGGmglipu4j9wr+UvtGYEacIY7qoQ5/Fv4peaksCQKm7ZXveT9os6X6EO
         VPk2w+7TlykozJzo+RJH7emOYL8ZXjCNgMtBGZO0QhYC/dBAk7ziKPQzq+c50l0q/gML
         VxhBPfHrdIaZJVQPp6uLFL8fo8TDvyx0pCTH0QX+Hq36+qA6ZWcEjymFqL+cQd9N3EmW
         +Tqg==
X-Gm-Message-State: AOJu0YzK/K817sFbGsEoTFvNFrjjCj4iGcn3Fg5MUnxvr94yrBhLLhxq
	z5nd+KR9qip+l7UpONMujfelw00l2TDVNz4gGeyeg/EjdXlcAOaeaBgu
X-Gm-Gg: ASbGncslkKy5afhcfK+cWowrBPT4GFKQzmhYY7fjV1QG0i6dkDjccmVfvSe1ByvpYA9
	fM1zAhXi2UbnbU+D35KeFoHrfTMgDopH5Xfpz2G6dWjjNlo1AfNhwW+4ODKaotbobDtyjT/dVVR
	hlugTTgbKR+zZseFF5avzPfWyXL0fWKvenayjkCmQ/DT/YeaZncAmZG6y9Ar4eJWjoRkTl1m4EP
	lhNCTZyjNLVc4xEw9ObmIwYeY8jDclZldGBwHs4039d1UHVVM8pmZta9mLMbzPShy9f1hjufTMy
	u97Gwc7qwtHPon593IjHiZgQ+x2rZtVlZdfNeCXW1mrZ5KWCE235PesvoYNzMGCX354IL7z/d1o
	Qq0BeptiEOVrIKfgtyjvF+Ig6se6eBLvHNFoNeWwV54mOoQ==
X-Google-Smtp-Source: AGHT+IG/58PX7MmtKFH5LU32/rWSEnWyzxw0Ppm7hCKdGCl1ecf6Hon2EIekUAxHFiwvEXbVI4UHgA==
X-Received: by 2002:a05:6512:2513:b0:55f:6ba6:e8d7 with SMTP id 2adb3069b0e04-55f709061bcmr1772006e87.35.1756709342571;
        Sun, 31 Aug 2025 23:49:02 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678502easm2721727e87.101.2025.08.31.23.49.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 31 Aug 2025 23:49:02 -0700 (PDT)
Date: Mon, 1 Sep 2025 08:48:58 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH RFC 2/2] usb: xhci: Drop the TD_CLEARING_CACHE_DEFERRED
 cancel
Message-ID: <20250901084858.27f91ab7.michal.pecio@gmail.com>
In-Reply-To: <20250901084642.2b42c0e7.michal.pecio@gmail.com>
References: <20250901084642.2b42c0e7.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The last remaining use is inside xhci_invalidate_cancelled_tds() for
destroying deferred TDs under certain failure conditions.

Instead of violating the spec by crudely erasing those deferred TDs,
we may give them one last chance to get their Set TR Dequeue. Maybe
the prior failure was caused by some corruption of one stream's ring
and other streams are fine, maybe it was a transient -ENOMEM.

Or maybe we want to cover this obscure case with less extra code.

Remove the search for TD_CLEARING_CACHE_DEFERRED TDs, nuke the one
cached TD we tried and failed to skip, and jump back to the main
loop to handle any TDs still in TD_DIRTY or TD_HALTED state. These
are our deferred TDs - all other dirty TDs have been given back.

If we fail again, the deferred TD will be nuked and so on, until we
run out of TDs. We are under the lock so nobody can keep submitting
and cancelling them forever.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 26 +++++++++-----------------
 drivers/usb/host/xhci.h      |  1 -
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fd0f8a9196e2..91a9aa6aec77 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1021,6 +1021,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 
 	xhci = ep->xhci;
 
+again:
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
@@ -1050,14 +1051,12 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 				break;
 			case TD_DIRTY: /* TD is cached, clear it */
 			case TD_HALTED:
-			case TD_CLEARING_CACHE_DEFERRED:
 				if (cached_td) {
 					if (cached_td->urb->stream_id != td->urb->stream_id) {
 						/* Multiple streams case, defer move dq */
 						xhci_dbg(xhci,
 							 "Move dq deferred: stream %u URB %p\n",
 							 td->urb->stream_id, td->urb);
-						td->cancel_status = TD_CLEARING_CACHE_DEFERRED;
 						break;
 					}
 
@@ -1091,22 +1090,15 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 					cached_td);
 	if (err) {
 		/* Failed to move past cached td, just set cached TDs to no-op */
-		list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
-			/*
-			 * Deferred TDs need to have the deq pointer set after the above command
-			 * completes, so if that failed we just give up on all of them (and
-			 * complain loudly since this could cause issues due to caching).
-			 */
-			if (td->cancel_status != TD_CLEARING_CACHE &&
-			    td->cancel_status != TD_CLEARING_CACHE_DEFERRED)
-				continue;
-			xhci_warn(xhci, "Failed to clear cancelled cached URB %p, give back anyway\n",
-				  td->urb);
-			td_to_noop(td, false);
-			ring = xhci_urb_to_transfer_ring(xhci, td->urb);
-			xhci_td_cleanup(xhci, td, ring, td->status);
+		xhci_warn(xhci, "Failed to clear cancelled cached URB %p, give back anyway\n",
+				cached_td->urb);
+		td_to_noop(cached_td, false);
+		xhci_td_cleanup(xhci, cached_td, cached_ring, cached_td->status);
 
-		}
+		/* Try to clear any deferred TDs on other streams */
+		cached_ring = NULL;
+		cached_td = NULL;
+		goto again;
 	}
 	return 0;
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 94394db271bf..1eaa70f7e62e 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1296,7 +1296,6 @@ enum xhci_cancelled_td_status {
 	TD_DIRTY = 0,
 	TD_HALTED,
 	TD_CLEARING_CACHE,
-	TD_CLEARING_CACHE_DEFERRED,
 };
 
 struct xhci_td {
-- 
2.48.1

