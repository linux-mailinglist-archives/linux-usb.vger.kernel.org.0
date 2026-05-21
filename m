Return-Path: <linux-usb+bounces-37899-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMEuFtY/D2pNIQYAu9opvQ
	(envelope-from <linux-usb+bounces-37899-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 19:24:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3EC5AA2B1
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 19:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 357AD32A5FC1
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 15:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A011E355F46;
	Thu, 21 May 2026 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9uGJjwB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A813446A7
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377251; cv=none; b=SGmIIpDZN5AR27z53/KncvRSl+YlErdTtDq7KFSraiOUM+wjc5Efn8HZ5NKmBKOhNE4z+wyy66m7A2q0sayvmlC2UAavDr45DDqSfLDhPr+OY3uC8szi9EFEXXHm/aO9XycLCl1UDuMVTHWjLu6b05+P5XH60gWne2GyHJdFntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377251; c=relaxed/simple;
	bh=2JN1saH0xjFfyjaseYlqRMur0ikIkmUCDMiaPChrh5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uqw2dGswkY8Qe38GNJ9KbjxAdqqhBEYdze7QfOibuB5nCZGHQSuIO9/zyPnTErtsVk097eU/HB8qYgQNBHQFDPnuZOrSAjrnnhT6D6HRjOFO7uw/F+SJAyJ9tArRlBgQYfR5+xxg5ZzD2WasZdXyrrLsCriII3RcmyNxsoTT5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9uGJjwB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779377250; x=1810913250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2JN1saH0xjFfyjaseYlqRMur0ikIkmUCDMiaPChrh5E=;
  b=m9uGJjwBfTNz1P4ZzF3dZoyPHSKF09PPtU0TYLibBtXnOla7AX7G1eLv
   oj+NHUCbjibDiQcPDtPGlvJfTmZqe33+DN2yoDIC9pV5CZRz14TpLP+iz
   8pn4xTgBZ4K1ammeupq/5DFDwK7UyqvjHd+RLNFzR73eO/te8jAC7otfU
   0gbDi9bXCoQZQIgwuulzmI+e3iRT1pNyL+2wfEk9FMOgFf4dS98QK/iO9
   6wKjNnPdsq82vvOQudMPe/b9i2cxldYGBON6+EpTCgxjExWI55lFm+gA4
   r6LOHwVCWQrsyp3kkC+9zDiVBXF5CsOYEbPVMdTjnbv/LD40r8pyuwhn4
   g==;
X-CSE-ConnectionGUID: 2vKWCW0URkS2mN18lg0Y9A==
X-CSE-MsgGUID: R8S1NUgBTCWXZU4BeGZviA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91406261"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="91406261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:27:29 -0700
X-CSE-ConnectionGUID: obxQwSA8SRqkkfx5VG3Bqw==
X-CSE-MsgGUID: iC52JyXeSxuqfhRvhg/Eww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="236306687"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.42])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:27:28 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: dylan_robinson@motu.com,
	michal.pecio@gmail.com
Cc: mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	stern@rowland.harvard.edu
Subject: [RFT PATCHv3 2/3] xhci: Set frame ID field of isoc TRB when starting an isoch stream
Date: Thu, 21 May 2026 18:27:13 +0300
Message-ID: <20260521152715.288995-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521152715.288995-1-mathias.nyman@linux.intel.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
 <20260521152715.288995-1-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37899-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[motu.com,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 7D3EC5AA2B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The frame id field can be set for the first TD of the first isoc
URB to schedule the start of an isoc stream even in host doesn't
support CFC (Contiguous Frame ID Capability)

Set the frame ID TRB field of the first isoc TD unless URB has the
schedule immediately 'URB_ISO_ASAP' transfer flag set.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b1318515ae58..55a10d1e70cb 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3976,6 +3976,23 @@ static int xhci_ist_microframes(struct xhci_hcd *xhci)
 	return ist;
 }
 
+
+static bool xhci_isoc_td_uses_frame_id(struct xhci_hcd *xhci, struct urb *urb,
+				       struct xhci_virt_ep *ep, int i)
+{
+	if (urb->transfer_flags & URB_ISO_ASAP)
+		return false;
+
+	if (xhci->hcc_params & HCC_CFC)
+		return true;
+
+	/* set frame id for first TD of first URB in stream */
+	if (ep->next_uframe == -1 && i == 0)
+		return true;
+
+	return false;
+}
+
 /*
  * Check if frame is in the valid frame window, including start and end.
  * If start > end then assume window wrapped around at a limit the frame
@@ -4089,7 +4106,6 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int i, j;
 	bool more_trbs_coming;
 	struct xhci_virt_ep *xep;
-	int frame_id;
 	int uinterval = urb->interval;
 	int start_uframe;
 
@@ -4145,12 +4161,13 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		}
 		td = &urb_priv->td[i];
 
-		/* use SIA as default, if frame id is used overwrite it */
-		sia_frame_id = TRB_SIA;
-		if (!(urb->transfer_flags & URB_ISO_ASAP) && (xhci->hcc_params & HCC_CFC)) {
-			frame_id = (start_uframe + i * uinterval) / 8;
-			frame_id %= MAX_FRAMES;
-			sia_frame_id = TRB_FRAME_ID(frame_id);
+
+		/* Choose SIA of frame ID based scheduling for this TD */
+		if (xhci_isoc_td_uses_frame_id(xhci, urb, xep, i)) {
+			sia_frame_id = (start_uframe + i * uinterval) / 8;
+			sia_frame_id = TRB_FRAME_ID(sia_frame_id % MAX_FRAMES);
+		} else {
+			sia_frame_id = TRB_SIA;
 		}
 
 		/*
-- 
2.43.0


