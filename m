Return-Path: <linux-usb+bounces-35887-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePCpKbxvzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35887-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:31:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F357D389C44
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F9583171C4A
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CD3313283;
	Thu,  2 Apr 2026 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBzhmIqQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048C31079B
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135870; cv=none; b=e4adjVoPswLIWCaPsV0l7njjJMeY14NyKspnCWNDy/9gV4l+lljgiiH7mX2lYz/1aobdgklltPYfQ+uWKg26i13OG6wrhnRrD8q+AbB+rWoz7VmmPhoQjKLjl5HYyQ+zqhm5w4dJn7FNLhQEXH7bm+SkVd0K526Lvse8AhWzB14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135870; c=relaxed/simple;
	bh=fUEPRpAJPYGx6dQLIfZj06i9wu0ng2REl1JNKaK0NnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKUprskqwXuFSjGq5/891K8A2igEv4Aj7IRkn70jW7VAEpe9ifuJ+A5tru5c9IvlmaqdYwtrz1SSX4u0jkNNwD47tUY9TuT4sxzp9nikbUORCwgHXO2LWoFBgLQX6fJD+XQ3+0C6+2LN95QiPJigRFKHhDwEEqv3k3ZKhRQEtis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBzhmIqQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135869; x=1806671869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fUEPRpAJPYGx6dQLIfZj06i9wu0ng2REl1JNKaK0NnI=;
  b=lBzhmIqQpWczka6Ud59z4tg2LEZSHvrpsI7NHwuD+g45PtpTLkedURtK
   RDotTImnyjyOjtqoDnqwyBa/BuMF0LJcW0cIo+2kvsGy27VPTrSigjjLF
   hSwY6LRXwftlUSGedDS1YDV32DsAch6KHkdtst5gxxkt93AN4Z5PQTZl8
   tUNoCR4uI8SLsr6MWe1I/iuX8CyiXt4NY2g9mTALPzq9diWiwhr9o6N2u
   uIa0G/HmNrkOODIoTmSU49iuqbST2gy+Fq9aSI37z8XUA2FM9A0rs9kts
   g18I4gjFY6UhavNkn7wz2RyFVSPXwc2aONwA4ccnP+2AiXi6MWrXxtrwK
   A==;
X-CSE-ConnectionGUID: 5MADY4bJTfm2G9lfabXt/Q==
X-CSE-MsgGUID: b79eniiNQMORcoHqacYk7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650930"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:49 -0700
X-CSE-ConnectionGUID: t6l4Pw/0TBCZj/+v2oe+LA==
X-CSE-MsgGUID: gNw2+cNYTcayxrLPvffI2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241590"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:48 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 22/25] usb: xhci: simpilfy resume root hub code
Date: Thu,  2 Apr 2026 16:13:39 +0300
Message-ID: <20260402131342.2628648-23-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35887-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: F357D389C44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Resume roothubs without checking 'retval' value, as it is always '0'.
Due to changes made in commit 79989bd4ab86 ("xhci: always resume roothubs
if xHC was reset during resume") the check is redundant.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ece3ff7916ff..6d27c471d4da 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1245,29 +1245,25 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 
 	xhci_dbc_resume(xhci);
 
-	if (retval == 0) {
-		/*
-		 * Resume roothubs only if there are pending events.
-		 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
-		 * the first wake signalling failed, give it that chance if
-		 * there are suspended USB 3 devices.
-		 */
-		if (xhci->usb3_rhub.bus_state.suspended_ports ||
-		    xhci->usb3_rhub.bus_state.bus_suspended)
-			suspended_usb3_devs = true;
+	/*
+	 * Resume roothubs only if there are pending events.
+	 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
+	 * the first wake signalling failed, give it that chance if
+	 * there are suspended USB 3 devices.
+	 */
+	if (xhci->usb3_rhub.bus_state.suspended_ports || xhci->usb3_rhub.bus_state.bus_suspended)
+		suspended_usb3_devs = true;
 
+	pending_portevent = xhci_pending_portevent(xhci);
+	if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
+		msleep(120);
 		pending_portevent = xhci_pending_portevent(xhci);
+	}
 
-		if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
-			msleep(120);
-			pending_portevent = xhci_pending_portevent(xhci);
-		}
-
-		if (pending_portevent) {
-			if (xhci->shared_hcd)
-				usb_hcd_resume_root_hub(xhci->shared_hcd);
-			usb_hcd_resume_root_hub(hcd);
-		}
+	if (pending_portevent) {
+		if (xhci->shared_hcd)
+			usb_hcd_resume_root_hub(xhci->shared_hcd);
+		usb_hcd_resume_root_hub(hcd);
 	}
 
 	/*
-- 
2.43.0


