Return-Path: <linux-usb+bounces-35334-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIqRJOIxwWm7RQQAu9opvQ
	(envelope-from <linux-usb+bounces-35334-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 13:28:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0EF2F1E8B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 13:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7ADF30101C8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7181F366558;
	Mon, 23 Mar 2026 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B92Gi0GR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD4B39FCB6
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268894; cv=none; b=HFwbuPV4pYNFatmmcPyvJ1NDp1hrTjzplH1+MbKzPbHX1Rt4dPqc0A5wh+6btPiREf3CIOhdH7px6qCxUFpDaUI7X09u4nRby6x+Xf0kBI2QYLcbQ8SH5TMn8Kbur3KoPruTvBZNDf9rwoGKZgF6XA1aOon/CuJMb6mMNZPD5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268894; c=relaxed/simple;
	bh=yxBFSPBlJGSByOMWV+pLsYGngXFCdTuXzxFmcluOFc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FsQVn0m20kvEzAn1QgVKzgy73yCMwUozgJiAbcs4dI35c4PVDNK0qTP1cOQOFJaw6jQHqJpekNzDtXAGAwHMAC2VLH8Ehl1ymAvzFhS2hMO1/DLF7+rVvIxGth2wDtMndyfZq2AmTcoee94pUJZC83WkvS/UYTvQ1PtiJeQW2/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B92Gi0GR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774268893; x=1805804893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yxBFSPBlJGSByOMWV+pLsYGngXFCdTuXzxFmcluOFc0=;
  b=B92Gi0GRcfG5n4X5VNiFU1VO9ZZnKEkVXAtslqS9s3ewilJ1P4SeNl4Z
   K2ERwDkv/rphmc8UFbH1Svz4m0LzoG8m1xqDFRMF5OGDVUWQeJXaSygV0
   8Z4IReHb0Pu1PJVdTT8RJ9Fe3IQ2ttLlhjffG/6Z7cu0t0rOuqPHbaDTq
   +/CeIHnVmaywxx3XIRzp8Fxo7g7LcRfFzHDLCJdc/H1RSYNuZRJkv3WIT
   KNR+cTaHJwPub7zUNqMDYsk5Al5AtDE45dmxyM24N74CecJSR3cR5LnxG
   tH65h/NZtsyMrj9sErUhrdbGMFDUlAESjdJZ8DoQWf3sx9GvqaWQfasCt
   w==;
X-CSE-ConnectionGUID: BQCQQMNBSGO4pEEysB3u9A==
X-CSE-MsgGUID: NfHAVtf3TNCXLWE+mFRg0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75151947"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75151947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:28:13 -0700
X-CSE-ConnectionGUID: OrOM8iAyQeqb/c9Dj9DO3A==
X-CSE-MsgGUID: ICapzrp9RSiDGBW7GRif6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223083609"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.40])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:28:11 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>
Cc: <stern@rowland.harvard.edu>,
	Thinh.Nguyen@synopsys.com,
	michal.pecio@gmail.com,
	oneukum@suse.com,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFC PATCH 2/2] xhci: Ensure URB is given back when endpoint halts on a multi-TD URB
Date: Mon, 23 Mar 2026 14:25:12 +0200
Message-ID: <20260323122512.2019893-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35334-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,synopsys.com,gmail.com,suse.com,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 3A0EF2F1E8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make sure URB is given back by xhci driver after a stall (EPIPE)
or transaction error (EPROTO) on one of the TDs in the URB.

Most bulk, interrupt and control transfer URBs consist of one TD,
so adding that TD to the cancel list was enough to give back the
entire URB when invalidating and giving back cancelled TDs

Some bulk URBs that need an additional zero length packet consist
of two TDs. Make sure the second TD is added to the cancel list so
that URB is given back when clearing the internal endpoint halt.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f01f343a7e37..5305ad7be025 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -982,8 +982,9 @@ static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
 }
 
 /*
- * Mark the TD the endpoint halted on as TD_HALTED and add it to the cancelled
- * td list, ensuring invalidate_cancelled_tds() clears the TD from xHC cache.
+ * Mark the TD the endpoint halted on as TD_HALTED, add all TDs of that URB
+ * to the cancelled td list, ensuring invalidate_cancelled_tds() clears the
+ * TD from xHC cache and URB is given back.
  * Mark the other TDs on that bulk or interrupt endpoint as TD_TAINTED to
  * prevent the ring from being restarted too early.
  */
@@ -997,10 +998,11 @@ static void xhci_cancel_halted_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *e
 	ring = xhci_urb_to_transfer_ring(xhci, td->urb);
 
 	td->cancel_status = TD_HALTED;
-	if (list_empty(&td->cancelled_td_list))
-		list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
 
 	list_for_each_entry(tdi, &ring->td_list, td_list) {
+		if (tdi->urb == td->urb && list_empty(&tdi->cancelled_td_list))
+			list_add_tail(&tdi->cancelled_td_list, &ep->cancelled_td_list);
+
 		if (!tdi->cancel_status && ring->type != TYPE_CTRL)
 			tdi->cancel_status = TD_TAINTED;
 	}
-- 
2.43.0


