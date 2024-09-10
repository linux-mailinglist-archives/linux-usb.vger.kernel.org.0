Return-Path: <linux-usb+bounces-14912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E428973947
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 16:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21F471F244AC
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 14:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1804319309D;
	Tue, 10 Sep 2024 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CU8AvWRL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D2728389
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725976988; cv=none; b=IR+64L0gIaBA9lM6iefO81I9cZGNfMP8wabqwM27i6uY3maPjoN7xSCNLPRYIA6zXUInVbhzk+ua/gt/x1CHfZn18T4pTIZwY8EhqY58M5f8cCy4yG4hX/2TXM3uuGihY8BbGXkcn/7t0xl+fTYelX96mxcRVsuRZWbfe9xsH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725976988; c=relaxed/simple;
	bh=OmviRgppHGhq8YSAjyzxPpHL3eBFIaV8TfAAO9+0pF8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzoq9TAoDocWJBhaWRLZTY127HFC8bObkryYLbHbQKgnOulNzlwNCqXgS2ILUstPbuGSwQ7b2SkuRgw4c6FTZgbGHr/CBxMGWwZ8+ffwru5QA3dMiSjEdzGhAE3a6EHkKy9vadeBDLqLFSAlri5P+ZxxGgI1D7hEC2CneOvFEqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CU8AvWRL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8ce5db8668so640549666b.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725976985; x=1726581785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3sdldMH+y5OeaRs0sQiUc69EoWGH2zYBCHPZqq8+kI=;
        b=CU8AvWRLee07c6F34bKdhe2zcI6CIVOemareHwed+sBdzWZ3b+gvoISiXPRGDvB57j
         W+8bVOyOBqtaaiY9Jw7DJfiERjQqC60W7+qTCmfwaDAr9YSsZHpJadkZBXcTB2PAn0SC
         9v517mqQm0r38J2sl0fjbkgAMc+G1hM5bhZb1P9DU4+5GPbwUBZ98/6fM9HtbWrpRCq+
         7UukNugDFWC15Gyc9eDeSoBodCeFHxIDzIAn4zpoozPj6p/weKrJ1EvO4s3c3gvYlcWG
         zrX4ipFpttHp13O72sRPl5sCfDfm+Bm9sh/ZPVEVXPa27Eks3svreU/f+vvW7YlbUvlw
         KqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976985; x=1726581785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3sdldMH+y5OeaRs0sQiUc69EoWGH2zYBCHPZqq8+kI=;
        b=Z2WtmHRq1lX3agGd0921OMi3mU9uJUyV0TAoFdbDuqlSHZxInyTZE1o9P85bhwOWi3
         gW+rftfVzdvzZcttLnQO3flAKsKtWdaGP0tSPTk3xQB16CVATk2ob3LpLj46JyjiRJSS
         08nRr7NNB9OF4BAi80orwqSeKV6wxFnfD2wVaUzK+0IqezVDM8aG+ebP804u1gZjf+MG
         kzMmhtnZBCvxVClf2629D6rJBTT7aV8n4YEza67SvecUd+3EJU2yDlsPKEIEvsT3XHHM
         VmPkYIXWNuN0IWv2TR/9WEfNzrjggTbn5Hbgn+1DxdyA5HeHUymVABe5AW55Vap5AXAa
         fk0w==
X-Gm-Message-State: AOJu0Yyb+EM1biLGTTb+JJEm3s/sZZyHfSR/70qFslsM93eGkoDTWJAF
	7/Kccuyl0fnFNl/UBhfB+erkBZMwAFDaMbIfEUFuyvKFQ3btV9JqoDP3Ew==
X-Google-Smtp-Source: AGHT+IFNWXjyRw1VP45UIj39XSSjWlNGii5CicDZrgTUjgdjBls7VjCTUeeKrYpzkmY9fx1jGOwTqQ==
X-Received: by 2002:a17:907:7f0b:b0:a8a:ead3:851c with SMTP id a640c23a62f3a-a8ffab18544mr88088166b.15.1725976985020;
        Tue, 10 Sep 2024 07:03:05 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc8csm485817266b.206.2024.09.10.07.03.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 07:03:04 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:03:01 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: xhci: Fix sum_trb_lengths()
Message-ID: <20240910160301.340571ef@foxbook>
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

This function is supposed to sum the lengths of all transfer TRBs in
a TD up to a point, but it starts summing at the current dequeue since
it only ever gets called on the first pending TD.

This won't work when there are cancelled TDs at the beginning of the
ring. The function tries to exclude No-Ops from the count, but not all
cancelled TDs are No-Op'ed - not those the HW stopped on.

The absolutely obvious fix is to start counting at the TD's first TRB.
And remove the now-useless 'ring' parameter, and 'xhci' too.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a3ffadf8e400..e5c5cf4d38c6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2249,13 +2249,12 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	return xhci_td_cleanup(xhci, td, ep_ring, td->status);
 }
 
-/* sum trb lengths from ring dequeue up to stop_trb, _excluding_ stop_trb */
-static int sum_trb_lengths(struct xhci_hcd *xhci, struct xhci_ring *ring,
-			   union xhci_trb *stop_trb)
+/* sum trb lengths from the first trb up to stop_trb, _excluding_ stop_trb */
+static u32 sum_trb_lengths(struct xhci_td *td, union xhci_trb *stop_trb)
 {
 	u32 sum;
-	union xhci_trb *trb = ring->dequeue;
-	struct xhci_segment *seg = ring->deq_seg;
+	union xhci_trb *trb = td->first_trb;
+	struct xhci_segment *seg = td->start_seg;
 
 	for (sum = 0; trb != stop_trb; next_trb(&seg, &trb)) {
 		if (!trb_is_noop(trb) && !trb_is_link(trb))
@@ -2446,7 +2445,7 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		goto finish_td;
 
 	if (sum_trbs_for_length)
-		frame->actual_length = sum_trb_lengths(xhci, ep->ring, ep_trb) +
+		frame->actual_length = sum_trb_lengths(td, ep_trb) +
 			ep_trb_len - remaining;
 	else
 		frame->actual_length = requested;
@@ -2529,7 +2528,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		goto finish_td;
 	case COMP_STOPPED_LENGTH_INVALID:
 		/* stopped on ep trb with invalid length, exclude it */
-		td->urb->actual_length = sum_trb_lengths(xhci, ep_ring, ep_trb);
+		td->urb->actual_length = sum_trb_lengths(td, ep_trb);
 		goto finish_td;
 	case COMP_USB_TRANSACTION_ERROR:
 		if (xhci->quirks & XHCI_NO_SOFT_RETRY ||
@@ -2550,7 +2549,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = requested - remaining;
 	else
 		td->urb->actual_length =
-			sum_trb_lengths(xhci, ep_ring, ep_trb) +
+			sum_trb_lengths(td, ep_trb) +
 			ep_trb_len - remaining;
 finish_td:
 	if (remaining > requested) {
-- 
2.43.0


