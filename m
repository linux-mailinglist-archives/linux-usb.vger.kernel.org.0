Return-Path: <linux-usb+bounces-14194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46CF9615FB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E147284BA3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A141D1739;
	Tue, 27 Aug 2024 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6RDgSXX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644ED64A
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781152; cv=none; b=j4AAbgtZlBvJR+6mFZTjlPN/lYBs2MUTIMxwViHnSOkOHNnoq+gc0gBBQfE1gPkRzHVa0RShTd6lquhspXOS0yPU2StoO1HBWwv+rED8BqywVobA8YJEOJkbcws4zaxxYq2mCYrla4GDHF4MQJLEPOPLZL66LC08unnrl8Cfcso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781152; c=relaxed/simple;
	bh=kf8HkXCqaw+F1v+PLnYSfXw0dV2Pbt7C8s9HdtNFX58=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mIl8iFip1mxq4C0CviLtdAgNvhOD/RwmwFYEXmapSoZs1dfeKegNgACdJPM+UJQIAyNcvmvyrR1ha/k10tt7/xT1Q5GHCdZyiIo2Nt2nRo126dFkL0ukbuFQV2JNt4nAcShCEWYZehHELHU94A2JECLrjAH7jRhLT86QjjeMAXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6RDgSXX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5334fdabefbso5048451e87.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781148; x=1725385948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrBzCKt4N9BQ5EKcvX9GvFSkuSAxcwLEZXKVeR6c198=;
        b=i6RDgSXXU2N4vI1pKMtDj3oQ8WrAhX12k7OK7fP5dh/eNoe7MXQWXUsaSdygpywgev
         A5x1C9YVRpPQDW2jgxVak0abVdjlo0vrfHs3MWkcaPj0w8yvve1w3MS+QtYzJ1ENCNBO
         j+XPCPS6vRiru0RSQUvm8ihlrsu3CGP3wcta/Uu8AgDDZnATRWH+vWZTF3AHBMYsy0zt
         Z417OVEK+tIJZdk0ziwNAu0fJLF5j2YleEDRfTsf1RnjJ9MT5U7RhsU9wCaaLKZ5zwIq
         zdrOcCjdiYpxz+/HlaUFtIGPYrfdyWdDB9Xwog8T3uSY58BGDrqOJJCGcUVLPaetMMlF
         OvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781149; x=1725385949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrBzCKt4N9BQ5EKcvX9GvFSkuSAxcwLEZXKVeR6c198=;
        b=I4fs3U1CSx3Ek7KEbL7z5CG+4t5tbVzPJNWJRpbdEekp06/otgrnuFBQMyMRrl5+n1
         VWX4Zg9X6NePHTK4JkPfFoDTNohNigwwzK8vKMd/xG8FVmrB/Pp/y2UNi7aOAG6im4tq
         lyM+egL9Uj02Epi1m4qxQSe9bNrFdwz5z1N+bHOh7mZ52kVr/C+W9oNJ8ELsoKQY7Df4
         EEzN8niTWOcdTpBeodwulgF3zy/WEnd1axUNCdK69KwuyA93GS68C98Y7NBIjReRzCpB
         UWGlHikMLH/TmqopFOEmPNS+Ycyrcn+T8vgAWzBgc9rByCrDc9/AsmJAXaPhVncdaj24
         /KxA==
X-Gm-Message-State: AOJu0YwFC9gscexPscKSyU8oGJm+xTtstjgqhRwrbslrkYtiq5q/AalU
	N6QFFAp+Vjw6gqSmeEXikzI//HQqL8awUnr7hFz1xzaLN+VK32lj
X-Google-Smtp-Source: AGHT+IGqJrejqmKAVXV5UIZP79vEwUlc8PyuNMtqBwpcqS79p0T0WdvlbqvS7+gI33g3lShHZrIe0g==
X-Received: by 2002:a05:6512:398e:b0:52f:cf2d:a1a0 with SMTP id 2adb3069b0e04-53455235773mr886e87.26.1724781148207;
        Tue, 27 Aug 2024 10:52:28 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5e4aasm1860712e87.240.2024.08.27.10.52.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:52:27 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:52:24 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 6/9] usb: xhci: Sanity check "spurious success" handling
Message-ID: <20240827195224.02c32551@foxbook>
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

It's not spurious, it's expected, it's required by the spec since its
final 1.0 revision 14 years ago, and it's handled incorrectly here.
But until somebody puts some effort to get it all right, try at least
not to do obviously wrong things here.

This code claims to handle "spurious" Success events, but in reality
it is ready and willing to silently swallow any kind of event, on most
host controllers these days, after any short transfer.

It got in my way while debugging genuinely incorrect events from the
xHC, which this code thought were meant for it, because it has no way
of knowing better, because it's utterly broken.

Limit it at least to only accept Success and Short Packet completions
so that rightful warnings will be printed in other cases.

So far I found no instances of this change exposing previously hidden
errors, besides the aforementioned case of a buggy xHC. The buggy xHC
completely fails to acknowledge some TDs in any way. It proceeeds to
the next TD, whose event then doesn't match the current TD, so if the
prior TD got a short packet, the "spurious" code swallows the event.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c777cb897579..e19c8a17b59c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2785,9 +2785,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			 */
 
 			if (!(trb_comp_code == COMP_STOPPED ||
 			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
-			      ep_ring->last_td_was_short)) {
+			      (trb_comp_code == COMP_SUCCESS && ep_ring->last_td_was_short) ||
+			      (trb_comp_code == COMP_SHORT_PACKET && ep_ring->last_td_was_short))) {
 				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d with no TDs queued?\n",
 					  slot_id, ep_index);
 			}
 			if (ep->skip) {
@@ -2878,9 +2879,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * transfer. Ignore it.
 		 * FIXME xHCI 4.10.1.1: this should be freed now, not mid-TD
 		 */
 		if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
-		    ep_ring->last_td_was_short) {
+		    ep_ring->last_td_was_short &&
+		    (trb_comp_code == COMP_SUCCESS ||
+		    trb_comp_code == COMP_SHORT_PACKET)) {
 			ep_ring->last_td_was_short = false;
 			return 0;
 		}
 
-- 
2.43.0


