Return-Path: <linux-usb+bounces-37388-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF8tMLCNBGoKLgIAu9opvQ
	(envelope-from <linux-usb+bounces-37388-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:41:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0E5354D1
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C193530B6742
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 14:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9136D44E045;
	Wed, 13 May 2026 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T58Bmluh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1521844BC90
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682959; cv=none; b=gKRIesJ0hn7UTnMxnTW7fvrVUuaYEfLvfHnAgDKfx+o/gwrRfYqxkvDDQJ9vqMrNhXxPlpDOjUY31Z1QSChUT49dSN8HTrY/DgDI/p0+SOKnCUF6Z6Mb8nKFf+rsfqbXCvDsUz75VSu6iLZRRz7Mae3OhDFY6okxiem8nAvEsvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682959; c=relaxed/simple;
	bh=2JN1saH0xjFfyjaseYlqRMur0ikIkmUCDMiaPChrh5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIsZB99MKqrYujQzxTpFh9D2W/hGkAhUnuaIeC+9bV9XICaWX1JCvENwxJw9A9BTCpVcNSPdIzrIgva57Zg3qyFiyVCBgXzpaaCoN4mTgOOjzd5nhosI5IY1mdyOflbKBWv4whjJjEUayLb+MaEhp1jJEiI/Pt0t/i3kPwcnvRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T58Bmluh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778682956; x=1810218956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2JN1saH0xjFfyjaseYlqRMur0ikIkmUCDMiaPChrh5E=;
  b=T58BmluhlcTAEoMKJV9CrYqg9oPq2CtHcbm9iN1gf+/94I9WSQmFs9kb
   Epfm3F2b+OW2EpluxQmPV51tA4n1xjP5WeryorzGFRDJihyYBtWAmihi6
   Xf8RCqTYpewGDsUmY/fjUAu/Todaz/fsjQW5hHOhk5zBl8IZ74+PnMXcN
   3WWtnsCNGGnzICKBtUXtizEbs1VGmrczWO/L6hQtFPaeTRkstfifLGWQP
   hVgshu+Rur4wpyF3r7cIIXgeA1CMPrmxSEzPIDEupO5RrSLFirwOMpMfa
   FiAe6tPFNSvUFMwjUC+gHlHEEbU1WK76iYBIVNop1QeL/5MSL0GmpGD7J
   g==;
X-CSE-ConnectionGUID: F6saKz/DQnSaOkXYmQukIg==
X-CSE-MsgGUID: DMF6zEyuRjet8dNZmXaWXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97180761"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97180761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:35:55 -0700
X-CSE-ConnectionGUID: aTaCxRMsTGmYtDmPkB86Ug==
X-CSE-MsgGUID: CnEgIIopR+CS9Cde4vP4xw==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:35:53 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: dylan_robinson@motu.com,
	michal.pecio@gmail.com
Cc: mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	stern@rowland.harvard.edu
Subject: [RFT PATCHv2 2/2] xhci: Set frame ID field of isoc TRB when starting an isoch stream
Date: Wed, 13 May 2026 17:35:33 +0300
Message-ID: <20260513143533.52992-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513143533.52992-1-mathias.nyman@linux.intel.com>
References: <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
 <20260513143533.52992-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3BF0E5354D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37388-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[motu.com,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


