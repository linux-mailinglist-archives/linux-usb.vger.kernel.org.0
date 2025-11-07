Return-Path: <linux-usb+bounces-30192-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D98C3F5A7
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 11:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49C173A3842
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 10:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6624A30216A;
	Fri,  7 Nov 2025 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWwQj/mf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F8302153
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510404; cv=none; b=NMUuJarxeaqRf26rwqKCUmn14/T1GwF4KgAzLLOPafN/a43q53pB/cQIGiCS1qAsskzBTiqZS7wrdXMz/k318qKrnWA/aE4AMJ3+oviKIPyzp/YtQNEtnna7M2FFBmBSqTJ7zr6B8QCShDNS/KWuKISzTPYWjfTBv3BPQSD9jrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510404; c=relaxed/simple;
	bh=p54O8RFY7n+zRVjeBfEWzWigzrQVcI4n5XMu0wSwBzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XSiQh7pJCEJPI7Tc+cBzPR59zGhh/bQyLePP6WVBT0iZLCFrM3IGGZrEAlHRW2t43QeBq6INoD7oEPfhiYqZ/QmsJNb6It05l3+whufOXd+UknvqKuR2Qce530Mv9Fu9738lgxjjYGqL9lrt0CdJ2q1zsHph+nZp65epPCStFUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWwQj/mf; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640b2a51750so1197187a12.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 02:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762510401; x=1763115201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xBG3yseegGQ7KkrzPwoa8hJbgG/nUl+f+ZjFLhxHqe8=;
        b=mWwQj/mfNGYr2KsG55HG2uBOirbopszYVZsorhz2vdktbNMm6Zi212WzPebYbiHvdm
         8GHWBTXjVMp4fOu4MiAQiCSc2wIALFITu7nQrhcJ/BgGQ+V54Y0x/fhNa8cMzOFs1BQ3
         SEuPgZFP5rURTJwJMDIpyJ3Tf6624V30KihUgH1bsAJ+6G0X2hfwNeP3mw7sYMZZqbpQ
         plRw6iM/0tVCxuHHOv/yWcwbnGB5ngQ/UTIdk8kvUfTIiiyHwdgSkrZYlrmw/6sd7mfe
         30Ohb2F6ExNp0q4WeWUprkGwZzELxMBcb5/SYHVbv/6tFpKeN9KlEHm/rFmAA06yWbTD
         BaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510401; x=1763115201;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBG3yseegGQ7KkrzPwoa8hJbgG/nUl+f+ZjFLhxHqe8=;
        b=Poc0LfVbHbK9P2j2kOX7O6N9/2efBbfVvs/sSvnPJoUdw+fpb3RJkQYouOavjRbEQh
         +NGzIaP/l15dCz43mI8PRiS/Up0OLG7RG4dghn/i+L3BBn8skl9sn8vsBNB2AgU7fu5Q
         V9iS1l6iG49TJM37r8iZfCq8htOTUAA573V5c3K8OpdyQEZv08Vx1m1cxFJuyRAYIpm3
         7F1UvKoaBqCy0axoAeaR1fPS+Bss7DbxLyRJMZKbf5d4lSYjIWUN1m3OZiDSC6geUnP4
         4Auljpv3KkSfSJXPlGmGYFURDrNJeVdhheL/5nrJfsT5mn9blQIOHpLOhqUVaGvhRl1W
         OARA==
X-Gm-Message-State: AOJu0Yz+o198Dn+wc0ls6Ax6qiO8GtakWNaVyqSrODTSUjNfx3IKxsC3
	ioWaZX5jXUFAdRGlpOrqQZ8VeGzhIOuirSpxhg6bP0ppD51rdHDRMeg6
X-Gm-Gg: ASbGncuKQUr3d7wsI+iDHNdyWz70WqBLS9TXPr3uGPC4c1es6qAT1rwGeqn7NNUotl8
	1hfNaIO9VTvNZJANQkFkEUmgWwYHrCdTiPnTaXmZHqIqDT8x/atm2C0Iz5FOMAj/U8OTA4TvgYQ
	UMRRm/qIjuQXjJMaAuA4yeK0WtGe/wsMyvwMeJngTN9nmmJpqS+46lhOnhqWto95t1thdAQ4DW3
	eaQ+PV0sWzKrNButJiB2KBVJKEbvRR5psPQushxMk/NF8WmNn6ijBWB1Sq4+Uo7ZANMsfnIEBft
	M/aa7cLtursXAfnpGavO8qUxynCHGIpwHco9HyR+DS2mCO52BloIEAn3hmwvKZN6+zCctK+LVpT
	+56UWbz16QRot7AkqaR2liVoNOy0gIIJ7+TUuwjr/A9sXodUqxVZRWMrohtqmBa1xq8GFZcTZ9m
	QFisono3G2rtrTLX2qnGJL3pb/
X-Google-Smtp-Source: AGHT+IE4ZUym8B7oEhCQSVqwEk2oiRy3Shfqh7Joj+Z+pomLQhTj8e4KI/UaQ8y66MPHPylOnelYuA==
X-Received: by 2002:a17:907:8689:b0:b46:8bad:6972 with SMTP id a640c23a62f3a-b72c0ae3affmr247134666b.38.1762510401040;
        Fri, 07 Nov 2025 02:13:21 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcaeaasm210237466b.1.2025.11.07.02.13.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 07 Nov 2025 02:13:20 -0800 (PST)
Date: Fri, 7 Nov 2025 11:13:17 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Assume that endpoints halt as specified
Message-ID: <20251107111317.69be45a5.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xHCI 4.8.3 recommends that software should simply assume endpoints to
halt after certain events, without looking at the Endpoint Context for
confirmation, because HCs may be slow to update that.

While no cases of such "slowness" appear to be known, different problem
exists on AMD Promontory chipsets: they may halt and generate a transfer
event, but fail to ever update the Endpoint Context at all, at least not
until some command is queued and fails with Context State Error. This is
easily triggered by disconnecting D- of a full speed serial device.

Possibly similar bug in non-AMD hardware has been reported to linux-usb.

In such case, failed TD is given back without erasing from the ring and
endpoint isn't reset. If some URB is unlinked later, Stop Endpoint fails
and its handler resets the endpoint. On next submission it will restart
on the stale TD. Outcome is UAF on success, or another halt on error and
then Dequeue doesn't move and URBs are stuck. Unlinking and resubmitting
the URBs causes unlimited ring expansion if the situation repeats.

This can be solved by ignoring Endpoint Context State and trusting that
endpoints halt when required, except one known case in ancient hardware.
The check for "Already resolving halted ep" becomes redundant, because
for these completion codes we now jump to xhci_handle_halted_endpoint()
which deals with pending EP_HALTED internally.

Link: https://lore.kernel.org/linux-usb/20250311234139.0e73e138@foxbook/
Link: https://lore.kernel.org/linux-usb/20250918055527.4157212-1-zhangjinpeng@kylinos.cn/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 73 ++++++++++++------------------------
 1 file changed, 23 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fc0043ca85a4..a038464bd6ac 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2185,24 +2185,31 @@ static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
  * External device side is also halted in functional stall cases. Class driver
  * will clear the device halt with a CLEAR_FEATURE(ENDPOINT_HALT) request later.
  */
-static bool xhci_halted_host_endpoint(struct xhci_ep_ctx *ep_ctx, unsigned int comp_code)
+static bool xhci_halted_host_endpoint(struct xhci_hcd *xhci, struct xhci_ep_ctx *ep_ctx,
+				      unsigned int comp_code)
 {
-	/* Stall halts both internal and device side endpoint */
-	if (comp_code == COMP_STALL_ERROR)
-		return true;
+	int ep_type = CTX_TO_EP_TYPE(le32_to_cpu(ep_ctx->ep_info2));
 
-	/* TRB completion codes that may require internal halt cleanup */
-	if (comp_code == COMP_USB_TRANSACTION_ERROR ||
-	    comp_code == COMP_BABBLE_DETECTED_ERROR ||
-	    comp_code == COMP_SPLIT_TRANSACTION_ERROR)
+	switch (comp_code) {
+	case COMP_STALL_ERROR:
+		/* on xHCI this always halts, including protocol stall */
+		return true;
+	case COMP_BABBLE_DETECTED_ERROR:
 		/*
 		 * The 0.95 spec says a babbling control endpoint is not halted.
 		 * The 0.96 spec says it is. Some HW claims to be 0.95
 		 * compliant, but it halts the control endpoint anyway.
 		 * Check endpoint context if endpoint is halted.
 		 */
-		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_HALTED)
-			return true;
+		if (xhci->hci_version <= 0x95 && ep_type == CTRL_EP)
+			return GET_EP_CTX_STATE(ep_ctx) == EP_STATE_HALTED;
+
+		fallthrough;
+	case COMP_USB_TRANSACTION_ERROR:
+	case COMP_SPLIT_TRANSACTION_ERROR:
+		/* these errors halt all non-isochronous endpoints */
+		return ep_type != ISOC_IN_EP && ep_type != ISOC_OUT_EP;
+	}
 
 	return false;
 }
@@ -2239,41 +2246,9 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		 * the ring dequeue pointer or take this TD off any lists yet.
 		 */
 		return;
-	case COMP_USB_TRANSACTION_ERROR:
-	case COMP_BABBLE_DETECTED_ERROR:
-	case COMP_SPLIT_TRANSACTION_ERROR:
-		/*
-		 * If endpoint context state is not halted we might be
-		 * racing with a reset endpoint command issued by a unsuccessful
-		 * stop endpoint completion (context error). In that case the
-		 * td should be on the cancelled list, and EP_HALTED flag set.
-		 *
-		 * Or then it's not halted due to the 0.95 spec stating that a
-		 * babbling control endpoint should not halt. The 0.96 spec
-		 * again says it should.  Some HW claims to be 0.95 compliant,
-		 * but it halts the control endpoint anyway.
-		 */
-		if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_HALTED) {
-			/*
-			 * If EP_HALTED is set and TD is on the cancelled list
-			 * the TD and dequeue pointer will be handled by reset
-			 * ep command completion
-			 */
-			if ((ep->ep_state & EP_HALTED) &&
-			    !list_empty(&td->cancelled_td_list)) {
-				xhci_dbg(xhci, "Already resolving halted ep for 0x%llx\n",
-					 (unsigned long long)xhci_trb_virt_to_dma(
-						 td->start_seg, td->start_trb));
-				return;
-			}
-			/* endpoint not halted, don't reset it */
-			break;
-		}
-		/* Almost same procedure as for STALL_ERROR below */
-		xhci_clear_hub_tt_buffer(xhci, td, ep);
-		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
-		return;
-	case COMP_STALL_ERROR:
+	}
+
+	if (xhci_halted_host_endpoint(xhci, ep_ctx, trb_comp_code)) {
 		/*
 		 * xhci internal endpoint state will go to a "halt" state for
 		 * any stall, including default control pipe protocol stall.
@@ -2284,14 +2259,12 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		 * stall later. Hub TT buffer should only be cleared for FS/LS
 		 * devices behind HS hubs for functional stalls.
 		 */
-		if (ep->ep_index != 0)
+		if (!(ep->ep_index == 0 && trb_comp_code == COMP_STALL_ERROR))
 			xhci_clear_hub_tt_buffer(xhci, td, ep);
 
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 
 		return; /* xhci_handle_halted_endpoint marked td cancelled */
-	default:
-		break;
 	}
 
 	xhci_dequeue_td(xhci, td, ep_ring, td->status);
@@ -2368,7 +2341,7 @@ static void process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	case COMP_STOPPED_LENGTH_INVALID:
 		goto finish_td;
 	default:
-		if (!xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+		if (!xhci_halted_host_endpoint(xhci, ep_ctx, trb_comp_code))
 			break;
 		xhci_dbg(xhci, "TRB error %u, halted endpoint index = %u\n",
 			 trb_comp_code, ep->ep_index);
@@ -2979,7 +2952,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	return 0;
 
 check_endpoint_halted:
-	if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+	if (xhci_halted_host_endpoint(xhci, ep_ctx, trb_comp_code))
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 
 	return 0;
-- 
2.48.1

