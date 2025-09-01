Return-Path: <linux-usb+bounces-27410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F80B3DA39
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 08:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51872189AD08
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 06:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEBA246348;
	Mon,  1 Sep 2025 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L06DRTXl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D071169AD2
	for <linux-usb@vger.kernel.org>; Mon,  1 Sep 2025 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709288; cv=none; b=E09Nz0D186a4XlI9pE5Udp6Vm0kBlKorDy15jnaNP5Tmm4B23RW+WpJFIPK/T/I4pgMpzKrRHNcpMK/wQgEDnbTg99Jt9iF2JiJvYyNCPwOHB7UeVOfaL9cY1FSkDPhBxokRAI4OolunmK96GkJolSGQwliXSy+Dh7CLpibQBtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709288; c=relaxed/simple;
	bh=W4LI3L/nzADG8Jb1hsHbYJqTYI6NdOlfTffNB13kG2s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C56Pzi8CUO1Y2krjXc6RCmQcPkzXXLjuQRig/aDm3TcHwTqyP+D7oo8bbL5lZ6do+Cis173WUXC+aQMX0c9Bh38Zv37RfsE3u9Mvon3ZzeioPliRqAZQIYiKlSe+ivTFp2TiiAJebp8xNPRo7/2kyvYI7Hb2iXX4vAyecGnvRF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L06DRTXl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f6f434c96so1816962e87.2
        for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 23:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756709285; x=1757314085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnl99SUEDbnBzAxbEZLpIcx2C5RYLuzxtmkMuLNItdU=;
        b=L06DRTXlR5ijNVe7UVn9O5gbO9oE/LIMGPMTsaU4qw7xsR01mYtEO458uhIEjbVb5F
         a0Fq+7DK6KrQAj13FEvso+cnWVFftvl1hnKPqkqgEcyq3qKJcNYBPI4NBz97kLX1WvoE
         mp0clWFL7tMZrRQ+9LHYLZjM7xKz06dYsWX0L3WbQ8nGh3BPDTAW63sQDA/4LPcW+U2x
         wLZRJwXgcGAF0yALpCcS130g3JOUNhxQyZLVROR2VgT2pmro/Q9CWy9QTsgIE4qLnr+o
         HXm4LmZP3rAzrhVD50QECW8MXDidKifcIV1Y7G07TapUSZm9Fx67VVdY6rFDDpfxL2fr
         BPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709285; x=1757314085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnl99SUEDbnBzAxbEZLpIcx2C5RYLuzxtmkMuLNItdU=;
        b=QL0T2/A6K/AeVTQ4RANFfVCLtzy3XqZsstAqrSlns/J+ZVvdhCGAinZNzOAwXCjHDo
         JmDbYm9T56BNrmasRvznGgTWKPOckeZ3DyeAawGG9TyPke6HO+gvbbYYL/+ie1ZYu50J
         NHL4D7B6r4YIVqHB6K7XfqHnSUfFEoVEhyevilRqVBRzAtOP5jKELANel9nGzTx63vGY
         DkKD+7DEuEEj3vjGkFSHc1qxn6gEZXN1A3QlaCbHdTVkHiJ7xZXqewz7i63cqDf3WTnP
         Yy8v7ilBeTjuyivxgoAYYn2Iq5CyU6dhtRFGVrnbK3MkgwGzuWlLmBnEnwNJJpvMYVqO
         M4rA==
X-Gm-Message-State: AOJu0Yzn7PfHIcHto+KNafsMGBMa+BXMhlMUThFKpWPkCvV1ejyZuFzb
	nNn7DByiM0nUw30Dzs7mb7K2G1Lsan2eBA8Ch+tLg1+yGpRVz1eF5txy9izpFQ==
X-Gm-Gg: ASbGnctoGbt7Px3AWAK7IgTRNfWTEbBLuDdJQH8tZT1ktPOrEiYp4UynOMJCNwBlaMM
	/Y34B/a/Tsw7smjWrG3+gU1mQgtd0tlgRbeDS0SVglHiwztabi6wzGdDD7RXW0+jxAmzlPNUGCx
	TWsfhV8//8im69QhNE7gcwPrCnHFwQcGXzQ4ONX5SB6XeMoUTzmxTYdzjO3aonJ5APG0aXiPlbb
	ZD23FbxBM8NfnDDmrbehU9nbGNFqZ9IEubAPGLzbkNpWpM9ahyp4jTKtQJX2nlvE89uOKaveZyu
	v43RQXRPP0t7ANRPSZSrM/duT8xZPRTQbxwzGZraseQxktqhVHuoIXH3c7RUbNFoZ6WfgVccKnL
	G3DuPmiqElql/nxoPShOIorAG1AGOWqrxHZptA0m6nujCyZkpbb1yrvCU
X-Google-Smtp-Source: AGHT+IEXQ6GgFhT2QTo2sPIBrSVoiF2PNbZ12Bpz9PrOaS/YOWTaO014m9tDfE38h1Iol4SCLZSe6A==
X-Received: by 2002:a05:6512:689:b0:55f:5195:924a with SMTP id 2adb3069b0e04-55f708ec436mr2092617e87.27.1756709284656;
        Sun, 31 Aug 2025 23:48:04 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc162sm2695877e87.6.2025.08.31.23.48.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 31 Aug 2025 23:48:04 -0700 (PDT)
Date: Mon, 1 Sep 2025 08:48:00 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH RFC 1/2] usb: xhci: Drop the TD_CLEARED cancel status
Message-ID: <20250901084800.35252e61.michal.pecio@gmail.com>
In-Reply-To: <20250901084642.2b42c0e7.michal.pecio@gmail.com>
References: <20250901084642.2b42c0e7.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

There seems to be no need to keep invalidated TDs around and require
callers to follow up with xhci_giveback_invalidated_tds(), so make
xhci_invalidate_cancelled_tds() give back invalidated TDs right away.

TD_CLEARED cancel status is no longer useful and therefore removed.
Code complexity and overhead of repeated list traversals are reduced.

There is no more need to debug interactions between these functions,
so a big source of xhci_dbg() noise (and potential bugs) goes away.
=46rom now, "Removing cancelled TD starting at ..." really means that
the TD is being removed, unless one of the errors below is logged or
dynamic debug indicates that Set TR Dequeue is queued or deferred.

Also clean up some debug noise from xhci_handle_cmd_set_deq(), which
practically duplicates xhci_invalidate_cancelled_tds() messages that
will be printed just before this completion handler returns.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 49 +++++++-----------------------------
 drivers/usb/host/xhci.h      |  1 -
 2 files changed, 9 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 12087f2f9db7..fd0f8a9196e2 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -927,30 +927,6 @@ static void xhci_dequeue_td(struct xhci_hcd *xhci, str=
uct xhci_td *td, struct xh
 	xhci_td_cleanup(xhci, td, ring, status);
 }
=20
-/* Complete the cancelled URBs we unlinked from td_list. */
-static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
-{
-	struct xhci_ring *ring;
-	struct xhci_td *td, *tmp_td;
-
-	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
-				 cancelled_td_list) {
-
-		ring =3D xhci_urb_to_transfer_ring(ep->xhci, td->urb);
-
-		if (td->cancel_status =3D=3D TD_CLEARED) {
-			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
-				 __func__, td->urb);
-			xhci_td_cleanup(ep->xhci, td, ring, td->status);
-		} else {
-			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d=
\n",
-				 __func__, td->urb, td->cancel_status);
-		}
-		if (ep->xhci->xhc_state & XHCI_STATE_DYING)
-			return;
-	}
-}
-
 static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_i=
d,
 				unsigned int ep_index, enum xhci_ep_reset_type reset_type)
 {
@@ -1031,7 +1007,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_=
virt_ep *ep)
 	struct xhci_td		*td =3D NULL;
 	struct xhci_td		*tmp_td =3D NULL;
 	struct xhci_td		*cached_td =3D NULL;
-	struct xhci_ring	*ring;
+	struct xhci_ring	*ring, *cached_ring =3D NULL;
 	u64			hw_deq;
 	unsigned int		slot_id =3D ep->vdev->slot_id;
 	int			err;
@@ -1070,7 +1046,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_=
virt_ep *ep)
=20
 		if (td->cancel_status =3D=3D TD_HALTED || trb_in_td(td, hw_deq)) {
 			switch (td->cancel_status) {
-			case TD_CLEARED: /* TD is already no-op */
 			case TD_CLEARING_CACHE: /* set TR deq command already queued */
 				break;
 			case TD_DIRTY: /* TD is cached, clear it */
@@ -1092,16 +1067,18 @@ static int xhci_invalidate_cancelled_tds(struct xhc=
i_virt_ep *ep)
 						  td->urb, cached_td->urb,
 						  td->urb->stream_id);
 					td_to_noop(cached_td, false);
-					cached_td->cancel_status =3D TD_CLEARED;
+					xhci_td_cleanup(xhci, cached_td, cached_ring,
+							cached_td->status);
 				}
 				td_to_noop(td, false);
 				td->cancel_status =3D TD_CLEARING_CACHE;
+				cached_ring =3D ring;
 				cached_td =3D td;
 				break;
 			}
 		} else {
 			td_to_noop(td, false);
-			td->cancel_status =3D TD_CLEARED;
+			xhci_td_cleanup(xhci, td, ring, td->status);
 		}
 	}
=20
@@ -1123,10 +1100,12 @@ static int xhci_invalidate_cancelled_tds(struct xhc=
i_virt_ep *ep)
 			if (td->cancel_status !=3D TD_CLEARING_CACHE &&
 			    td->cancel_status !=3D TD_CLEARING_CACHE_DEFERRED)
 				continue;
-			xhci_warn(xhci, "Failed to clear cancelled cached URB %p, mark clear an=
yway\n",
+			xhci_warn(xhci, "Failed to clear cancelled cached URB %p, give back any=
way\n",
 				  td->urb);
 			td_to_noop(td, false);
-			td->cancel_status =3D TD_CLEARED;
+			ring =3D xhci_urb_to_transfer_ring(xhci, td->urb);
+			xhci_td_cleanup(xhci, td, ring, td->status);
+
 		}
 	}
 	return 0;
@@ -1142,7 +1121,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_=
virt_ep *ep)
 void xhci_process_cancelled_tds(struct xhci_virt_ep *ep)
 {
 	xhci_invalidate_cancelled_tds(ep);
-	xhci_giveback_invalidated_tds(ep);
 }
=20
 /*
@@ -1295,7 +1273,6 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *=
xhci, int slot_id,
 	ep->ep_state &=3D ~EP_STOP_CMD_PENDING;
=20
 	/* Otherwise ring the doorbell(s) to restart queued transfers */
-	xhci_giveback_invalidated_tds(ep);
 	ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
=20
@@ -1517,13 +1494,9 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd =
*xhci, int slot_id,
 				 cancelled_td_list) {
 		ep_ring =3D xhci_urb_to_transfer_ring(ep->xhci, td->urb);
 		if (td->cancel_status =3D=3D TD_CLEARING_CACHE) {
-			td->cancel_status =3D TD_CLEARED;
 			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
 				 __func__, td->urb);
 			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
-		} else {
-			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d=
\n",
-				 __func__, td->urb, td->cancel_status);
 		}
 	}
 cleanup:
@@ -1538,8 +1511,6 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *=
xhci, int slot_id,
 		xhci_invalidate_cancelled_tds(ep);
 		/* Try to restart the endpoint if all is done */
 		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
-		/* Start giving back any TDs invalidated above */
-		xhci_giveback_invalidated_tds(ep);
 	} else {
 		/* Restart any rings with pending URBs */
 		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
@@ -1574,8 +1545,6 @@ static void xhci_handle_cmd_reset_ep(struct xhci_hcd =
*xhci, int slot_id,
 	/* Clear our internal halted state */
 	ep->ep_state &=3D ~EP_HALTED;
=20
-	xhci_giveback_invalidated_tds(ep);
-
 	/* if this was a soft reset, then restart */
 	if ((le32_to_cpu(trb->generic.field[3])) & TRB_TSP)
 		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index e87ffb284ab2..94394db271bf 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1297,7 +1297,6 @@ enum xhci_cancelled_td_status {
 	TD_HALTED,
 	TD_CLEARING_CACHE,
 	TD_CLEARING_CACHE_DEFERRED,
-	TD_CLEARED,
 };
=20
 struct xhci_td {
--=20
2.48.1

