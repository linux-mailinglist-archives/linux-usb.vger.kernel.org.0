Return-Path: <linux-usb+bounces-38153-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMUSKSVZGWqtvggAu9opvQ
	(envelope-from <linux-usb+bounces-38153-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 11:15:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A95FFC42
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 11:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6E043082FE3
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 09:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E103B8BB6;
	Fri, 29 May 2026 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqG3Zjqk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B17130C60E
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045808; cv=none; b=bgiCw1Eg8smlPsmhFk1VTa1jHEUzlZVrtV5TsqvyXvaOPBOTwx/NJpHK5A0JgJAmtqKhEv7CcDAB5iGc3D0t3C05uPangVotaPNRm0BM9pfLVQ5xC2+zGS8mKucoJ9XzdSw+iBgtjECih5WBn2G7Ri2OxTJK9ymtHcHqp4VpoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045808; c=relaxed/simple;
	bh=+Arbk+Ag/YtsDlZ/g01Ccd7EXpX8ItsEZarsO0NQV18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pm3KunbXe+nBYD3WvIYyrT2RdqPjP8HvXJp0b3gIvZPsfC/4Cm7dO7Y6FL0FaqYz+xko5H304NGEBcSTKMvtNst3PZdsnHLmqt3vTyTsaHkciI/QL5yZ8BZS58EEb+Q1Rw3fUUBGWrbdpXNc0jT+SXNR1fEatZAagGox7KIe7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqG3Zjqk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49068493267so37745855e9.1
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780045805; x=1780650605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1/chd/0Eg7IccK0AHoHDnIKOULdYOVL4SXq0meVkTw=;
        b=IqG3Zjqkb2UYLoECVITfm8DKrUqUjT159z3jq3qJfIO90lCU6bSo8DMTCWatfnWH1Z
         h752V9UnGtS3A4MIq3H2yQM705SnJAJK940uxktV/qByYqRQSDNNcPAJxaw99n8kZLhl
         Wo+HeqUCyTVDR0buGvE8qRrZfNSaoebzYtrdd+4f3n2sgQuxdMq27G8svwEVx8m+zlCn
         uuE++t/rhqPjzVLKWq99lDOvcdAQd6h+gcjECC6tnv9hQ1wKs+pw/9FZca113yOVbDLg
         780k8n4qNas1zGhejgn1610xrSbWzmY2XIGHAeLYdkYnnYkFB3t24UiKPLajml3w4R/z
         JJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780045805; x=1780650605;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1/chd/0Eg7IccK0AHoHDnIKOULdYOVL4SXq0meVkTw=;
        b=ijDA2/MYkADhRiZl7gqj+qlaqGG+KDQl9DhIKbJl6Jh7g62HAVQj5Xtq8HMmmQ2/NG
         tXcfo3MyIHajSmPpCmnH9C3p1bDnU8hf1DX2NED5ZamINAkh4Zz2Ru4lZeoaQh/S2Tg1
         uXt/OUiFzKzwxgnAm+0XwIwl+yxbj5AhPT6XES4EVZJweEpshmrHZkg7KKmCjxUps7ln
         rXHT6OyfBeuIYvatNwBYRGz4ZSjMqaCpDQxoggZ75YkICIEdehLWAY1kDqOEYx2PfJop
         wk6jCVLG9VdcXbJHt9pEmap/RRBshpSaqzErpY8Ton9omtJ+6cxHLtyzg3/5Fzs8tpX9
         pyOA==
X-Forwarded-Encrypted: i=1; AFNElJ+BzyfFKG7mDV7eQUHGZzfkN8Xnvh7XUIEjorwpkP62C+c8KT7EuBtFrjPjjQlZkdiBYlWD2fbPjxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVanhpunFj8QeuW1SHcEH0v1rK5d2a2J4MaJN03XSS7NaqWDv
	3YD2YO1GMzh28KMBEv6BMA55FM+34/wXfV/eu2sWGIJNJ6B0Riw/S0Fb39ukgg==
X-Gm-Gg: Acq92OGRzkXnsHTbmUBgHp3FOp8rBkOzK2XUJ7bj8lHkZwHjY7TtUuqbLSebfkukxGj
	BLjWk+XHEGFE9qSlkruym1ZmMS57mAUHhlDxnpHfBVx2nZl8MZeaQ0ev178Wm4BUtO7p7ql6qTY
	yS+QtoZW6EVnBWZ4N4soibRAST44SaEnMyHtuL8VVr24C2NPXg69/0LeYFn6lVGEWPu5l6/3Cn6
	TDzJlDYXAZncwDAWf0733qGcuqvrjW8DSBczS4IpYuzNsgwFzqKFII9L/ZXGDxY1aAFaOo7ARsP
	XbdmGW+a3jz+GMH8nj7ZPvyXzDjnkSuOxaCnfzqQz9h+AOGEG14OsTdOAu8naLGw8nl/E8CF6CQ
	uLJWzh1sj1nTVc+5SBU+qFmedGUSzLkYy82p9ticEQFOmIPBaZCCzh6RDmTqPsWuwiK+QGUUFoD
	QlcXbh/4bvZoszd7pvS6wN+MSho85H6RoZHXak4/zoYxnBTw==
X-Received: by 2002:a05:600c:1550:b0:490:44eb:c1e9 with SMTP id 5b1f17b1804b1-4909c0bd916mr36783025e9.26.1780045805462;
        Fri, 29 May 2026 02:10:05 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0c39b0sm15968405e9.2.2026.05.29.02.10.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 May 2026 02:10:05 -0700 (PDT)
Date: Fri, 29 May 2026 11:10:02 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Remove skip_isoc_td()
Message-ID: <20260529111002.7621e94b.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38153-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A96A95FFC42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This function is pointless because usb_submit_urb() initializes all
isoc frame descriptors to -EXDEV and 0 length so that HCDs don't need
to do anything with transfers which were never executed.

Other HCDs rely on this (e.g. EHCI itd_complete()), so we can too.
This gets rid of a potentially dangereous function which could corrupt
memory if we weren't super careful to only call it on isoc URBs.

Also, set status to 0 rather than any random status determined by the
later TD which caused skipping. This status will be ignored anyway.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b8568a069897..a6c2f2373849 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2497,26 +2497,6 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
-static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
-			 struct xhci_virt_ep *ep, int status)
-{
-	struct urb_priv *urb_priv;
-	struct usb_iso_packet_descriptor *frame;
-	int idx;
-
-	urb_priv = td->urb->hcpriv;
-	idx = urb_priv->num_tds_done;
-	frame = &td->urb->iso_frame_desc[idx];
-
-	/* The transfer is partly done. */
-	frame->status = -EXDEV;
-
-	/* calc actual length */
-	frame->actual_length = 0;
-
-	xhci_dequeue_td(xhci, td, ep->ring, status);
-}
-
 /*
  * Process bulk and interrupt tds, update urb status and actual_length.
  */
@@ -2860,7 +2840,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
 					return 0;
 
-				skip_isoc_td(xhci, td, ep, status);
+				/*
+				 * TD was missed, skip it. Core already initialized frame->status
+				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
+				 */
+				xhci_dequeue_td(xhci, td, ep_ring, 0);
 
 				if (!list_empty(&ep_ring->td_list)) {
 					if (ring_xrun_event) {
-- 
2.48.1

