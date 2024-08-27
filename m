Return-Path: <linux-usb+bounces-14197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A717496160A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1C0284C8C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1F21D1739;
	Tue, 27 Aug 2024 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnUbIOmU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0814126F1E
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781307; cv=none; b=gK9p0wjR7h+vRyaqEQXmEyUUcCcHnfQrlmUfWKQYHVzWdncsXIzZp+9GaV8ugKHXUoaxfTFrNWvrYEFsecFMd43aJRZJWveADAX6ozcwskc7Munw9sj1xg2wDcPXG9RKPcf8d88giOwmERK8M3DcNYtNwy8gwIK+QUjKwxa6Kdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781307; c=relaxed/simple;
	bh=Ek+97aUzfUHnBjrTrfC1PaNgK7RQVXC3JXKgv+Q/D7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fc4+yFntKalHazkdu97yeZosTMi5aFkzvUXWXbbuvmMrIgzOL8hJS4dOy3gW1FnshU3CAxwmwCHqNgriblUSw1OwFVQ8umEpa1s83IXpDph/4TsgNXnfF/MCgfDwgOAXOuYOCyQhXgUYxm8ooDn+CQklhuAnLYfZZcHBVJpSWt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnUbIOmU; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f409c87b07so68567491fa.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781304; x=1725386104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkWuFvU5thx26Cu4RL0ja4mxDjiRu1s7MuOQ4orjyZ4=;
        b=jnUbIOmU42Am3fyVGrhXvBbdoGQtG3xxvNuDvRTyVnkW14XatkVpqXbqgiI+i6xQ8b
         fFh2Cqyw2nO3ImbEAKQJvUGnNoQJSF8j4hSB8VItDX9puaYBSH4JaXavglKyIhVXaGCc
         9JdRiR0JFXwJG6l1kj/IdxrxBLRK/Lqx5Zc8o5NwG1+7I+k033hv+kDr5fldWr3PTvbE
         wqSRAfuTEihXAYwmpbflQ+rpO8tEeXmzmppXTZXVhXg0QPbie8Txa5tmdLNHW1GaAJmp
         H7La7e36qjGmFj8cH7AlOAAUM1JORi5tE1A6MUnU6lm8325sy8yOy2MWmkcrtav+t4BZ
         gvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781304; x=1725386104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkWuFvU5thx26Cu4RL0ja4mxDjiRu1s7MuOQ4orjyZ4=;
        b=VMjd9hMVHb1354reV8kjEgUEp3IMkoDP6h6E4wzi/Du6FcjH9cVBi50n61+GHr/YJ3
         F43t/ot7dHjOQT+WEsww4xtRuaSNSJbLjyUDGDxeKXXRlsKeJjEuTRfvow14Cfc5QSnv
         enbIWgYN9XlMbe8QZFMxBTh+/y9aC858e98AqN15Fpe6lg2RagZKsZGU1J0bto2fmjC2
         0o2FhbU6VgpjDX01mCOEoLyu7+pEb047KkVhCwL9Au7G0lvN3Hs367+UR1BeiWW0ZTOP
         yT6ap2mQoL6BXPMI4ZSAH2o2tnOic+I/3mNsq02+h+Sasouec3PMs9hllYS3+s9Ad8PO
         YKCw==
X-Gm-Message-State: AOJu0YwMZ/k4qiztVe+87yl1GPKEldnMfEZKTkMRW5lHT6FDAa3hqMVv
	hS11y1xrpYnMKAJ9DV41+9vtMEpOwVjh09J69ZxV5IJ5/VRhcFXY
X-Google-Smtp-Source: AGHT+IFOlMfdE3tB+/xMb6p8CaeBQoIxQTREVJBgr2OsWwS2xbABE0+SViUpCb7Bp/hyQOS0hFAe6A==
X-Received: by 2002:a2e:811:0:b0:2f3:ed84:9e66 with SMTP id 38308e7fff4ca-2f4f48eeebemr83346771fa.13.1724781303358;
        Tue, 27 Aug 2024 10:55:03 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047e0082sm16357921fa.70.2024.08.27.10.55.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:55:03 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:55:00 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 9/9] usb: xhci: Clean up and rename bad stream event handler
Message-ID: <20240827195500.37f88120@foxbook>
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

Function handle_transferless_tx_event() pretends that it sometimes
deals with certain isochronous events, but it really doesn't.

All isochronous events are handled in the big switch statement of
handle_tx_event(). The above function is never called on isoch EPs
because xhci_dma_to_transfer_ring() never returns NULL on those.

The only conceivable way we could end up there is if an isoch EP
is marked EP_HAS_STREAMS or its ring pointer is NULL, or we get an
X-run event on a non-isoch EP. Either way it's a blatant bug, so
don't "handle" this with a no-op, but print the default warning.

The actual meaningful work done by this function is cleaning up
after various problems on streams in questionable state, so give
it a more specific name and add a bit of comment.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9d1af76955cd..aebbdbfd8da8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2566,10 +2566,14 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
-/* Transfer events which don't point to a transfer TRB, see xhci 4.17.4 */
-static int handle_transferless_tx_event(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+/*
+ * Transfer events which don't point to a transfer TRB, see xhci 4.17.4
+ * Specifically, this deals with cases where the EP has streams and the event
+ * TRB pointer is NULL or otherwise doesn't point into any known stream ring.
+ */
+static int handle_bad_stream_event(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 					u32 trb_comp_code)
 {
 	switch (trb_comp_code) {
 	case COMP_STALL_ERROR:
@@ -2581,10 +2585,8 @@ static int handle_transferless_tx_event(struct xhci_hcd *xhci, struct xhci_virt_
 			xhci_handle_halted_endpoint(xhci, ep, NULL, EP_HARD_RESET);
 		else
 			xhci_handle_halted_endpoint(xhci, ep, NULL, EP_SOFT_RESET);
 		break;
-	case COMP_RING_UNDERRUN:
-	case COMP_RING_OVERRUN:
 	case COMP_STOPPED_LENGTH_INVALID:
 		break;
 	default:
 		xhci_err(xhci, "Transfer event %u for unknown stream ring slot %u ep %u\n",
@@ -2637,9 +2639,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		goto err_out;
 	}
 
 	if (!ep_ring)
-		return handle_transferless_tx_event(xhci, ep, trb_comp_code);
+		return handle_bad_stream_event(xhci, ep, trb_comp_code);
 
 	/* Look for common error cases */
 	switch (trb_comp_code) {
 	/* Skip codes that require special handling depending on
-- 
2.43.0


