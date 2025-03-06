Return-Path: <linux-usb+bounces-21439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A81A54E2F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4D1188E0D1
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC5C188724;
	Thu,  6 Mar 2025 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2WuY0pL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE55176ADB
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272577; cv=none; b=Z3+2nj9CI+AQq0KvQ3BQprI0KKI5iwrmzi9r7SUgqXtrfdLnd58E/q4K94a6rkpD5HN6DG/lEtY7IJvJctef9B7nIctdA1t6TZkVcrLiQYsxyg44rnukjIqbexJgfyXgVBbcxjW0WPCSKFOeP5KhTA2hKwPz/Pr7Tf/b7y8G/V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272577; c=relaxed/simple;
	bh=zVRu0Dcyn4GnoVhJbWKp0to9ukP5+nTq0yFqha6kKpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpT4DtwJEHAj+tS6INu27H9wUz2fp/Vupx3HdEqy/WjhmhaBwkE3Ui5zGDf/vj7joZgEcpTnDn+HyHwdmSm35P6pYxhZqjGlqqCsTP7P8oB/1lyaIpyCOwOC1+R05qxjBjXOkp/30ow3C016QZkx4cLCP8O9HkQlFSpEEtHiQWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2WuY0pL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272576; x=1772808576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zVRu0Dcyn4GnoVhJbWKp0to9ukP5+nTq0yFqha6kKpE=;
  b=J2WuY0pL03EiHHR9G2Ay7ITut3tdtNr81NjCqZQ50Bs6DF2W1yXj/hKZ
   j8BIzwqBrgZpHzTEyXsIJnzf65q3eK2E0yaA5oHXo9qGcONdGO0nQDPMI
   FIanXLDc/kePjKTEocvY5Twka5JkxIa21S0he4yTgHorhHJELtR1r8/WE
   T6n3XVGh4uS0e/h6u1YZR6M/vBNZvZ51eZZV9muWp8hl3Y0Nrc9GErjuS
   enlgnml6MSdIDqUiMAZgXNTmpjXxPZ+3LXZuboqtX7dh81TatIDvQs9O0
   s+NXB69hkXJpfFMIC/ohEQvDVM4z7NOMPSaYCVJ+JRriPoiP9kaAvQQAY
   Q==;
X-CSE-ConnectionGUID: f/KKg8RXRPGGUmWrFYTodg==
X-CSE-MsgGUID: y1C31HJSS+KPRZXEv13aeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657087"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657087"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:35 -0800
X-CSE-ConnectionGUID: GBIn5CQsT2CmRSnY2emjHw==
X-CSE-MsgGUID: Jee0kzDeTJmAVbUv2V7N3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954806"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:33 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/15] usb: xhci: Expedite skipping missed isoch TDs on modern HCs
Date: Thu,  6 Mar 2025 16:49:45 +0200
Message-ID: <20250306144954.3507700-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

xHCI spec rev. 1.0 allowed the TRB pointer of Missed Service events
to be NULL. Having no idea which of the queued TDs were missed and
which are waiting, we can only set a flag to skip missed TDs later.

But HCs are also allowed to give us pointer to the last missed TRB,
and this became mandatory in spec rev. 1.1 and later.

Use this pointer, if available, to immediately skip all missed TDs.
This reduces latency and risk of skipping-related bugs, because we
can now leave the skip flag cleared for future events.

Handle Missed Service Error events as 'error mid TD', if applicable,
because rev. 1.0 spec excplicitly says so in notes to 4.10.3.2 and
later revs in 4.10.3.2 and 4.11.2.5.2. Notes to 4.9.1 seem to apply.

Tested on ASM1142 and ASM3142 v1.1 xHCs which provide TRB pointers.
Tested on AMD, Etron, Renesas v1.0 xHCs which provide TRB pointers.
Tested on NEC v0.96 and VIA v1.0 xHCs which send a NULL pointer.

Change inspired by a discussion about realtime USB audio.

Link: https://lore.kernel.org/linux-usb/76e1a191-020d-4a76-97f6-237f9bd0ede0@gmx.net/T/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d34f46b63006..e871dd61a636 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2439,6 +2439,12 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		if (ep_trb != td->end_trb)
 			td->error_mid_td = true;
 		break;
+	case COMP_MISSED_SERVICE_ERROR:
+		frame->status = -EXDEV;
+		sum_trbs_for_length = true;
+		if (ep_trb != td->end_trb)
+			td->error_mid_td = true;
+		break;
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
 	case COMP_STALL_ERROR:
 		frame->status = -EPROTO;
@@ -2749,8 +2755,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		ep->skip = true;
 		xhci_dbg(xhci,
-			 "Miss service interval error for slot %u ep %u, set skip flag\n",
-			 slot_id, ep_index);
+			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
+			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
 		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
@@ -2799,8 +2805,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
-	/* Missed TDs will be skipped on the next event */
-	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR)
+	/* If the TRB pointer is NULL, missed TDs will be skipped on the next event */
+	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !ep_trb_dma)
 		return 0;
 
 	if (list_empty(&ep_ring->td_list)) {
-- 
2.43.0


