Return-Path: <linux-usb+bounces-35552-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGtTKix8xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35552-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:46:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A91344843
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8B223095326
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF75C34DCEC;
	Fri, 27 Mar 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/9huXQm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ACF1474CC
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615279; cv=none; b=FD54/v6sDynHoV4No8rdFIxPNrigC0nTTzP4XILwTdYwyfMK0fE0t5FvfvJ1nQIO4E1Gt/vD8Jus+q8CTF3huF1xoxUSTZTRuTpb492nJqrC4x2X/8CP7BbaK+JFrW0f7DVYMx/4ypUxDKaC4bL76+WuTUZyDp4qVVVQknY7SM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615279; c=relaxed/simple;
	bh=kIJt4YzuW7XIks3CsJPfsyQxlBby7/h/9BCwpmXEywA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5BWT6UR9WWn0bYtvpaw1rcBrorhcuyuz+QjlSUiAQE1XShH4I+Ke0cd49zT6o0naW+1kfI+9AfgposhpYn5g9RwhQ+fnnEgX0BxbhJlJviVrHXfGOVEacwzyHrTDruU0r5oEfvtCkWRbQwZ00zpawXqepenFRxS56oVW33pggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/9huXQm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615278; x=1806151278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kIJt4YzuW7XIks3CsJPfsyQxlBby7/h/9BCwpmXEywA=;
  b=J/9huXQm74fMXQqa36N3/LA2Upcm964E4KyCK0zkZZnpbHM9TVxig39c
   UblR5ocE++zgthAkwquK9jh5s8uE/esIZGBd7FSb11OSrzMgHBYiy8vEc
   8ZJucgZfdgPz4rNbsYjpOjD2ASbCQLMMzulOZKoiOqaDPxyH0jC/maR4h
   o0dnNwDXRVr5SDLnFpaEA6QZFmIuD2NlmUrokxmAx9sY4vPcPeNxkmuOK
   2Nbr4wo4dU2ZGygjTgX+429x/8eWG6lW3qpWj2hYcYXKG3j7oDG1P9Hpi
   w1WWlhkdAQmlboUbIx5NoAnfdMPlYAeycA2Wq86/onx2n8VWymb4oPAwK
   Q==;
X-CSE-ConnectionGUID: quFYoB6YSrqZMviPWYnXuQ==
X-CSE-MsgGUID: jbp5HR5eQqyoknEhBY7j4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79287714"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="79287714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:17 -0700
X-CSE-ConnectionGUID: +DsH2Bu6Rmuw/KInycWOUA==
X-CSE-MsgGUID: mrMt7LpFTxqcseajgoknAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230076179"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 05:41:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 1D69B99; Fri, 27 Mar 2026 13:41:15 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 2/9] usb: xhci: relocate Restore/Controller error check
Date: Fri, 27 Mar 2026 13:34:33 +0100
Message-ID: <20260327123441.806564-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com,intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35552-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 07A91344843
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A Restore Error or Host Controller Error indicates that the host controller
failed to resume after suspend. In such cases, the xhci driver is fully
re-initialized, similar to a post-hibernation scenario.

The existing error check is only relevant when 'power_lost' is false.
If 'power_lost' is true, a Restore or Controller error has no effect:
no warning is printed and the 'power_lost' state remains unchanged.

Move the entire error check into the if '!power_lost' condition
to make this dependency explicit and simplify the resume logic.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 810905b824d3..a04b1365bb6a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1140,16 +1140,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 			spin_unlock_irq(&xhci->lock);
 			return -ETIMEDOUT;
 		}
-	}
 
-	temp = readl(&xhci->op_regs->status);
-
-	/* re-initialize the HC on Restore Error, or Host Controller Error */
-	if ((temp & (STS_SRE | STS_HCE)) &&
-	    !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
-		if (!power_lost)
+		/* re-initialize the HC on Restore Error, or Host Controller Error */
+		temp = readl(&xhci->op_regs->status);
+		if ((temp & (STS_SRE | STS_HCE)) && !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
 			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
-		power_lost = true;
+			power_lost = true;
+		}
 	}
 
 	if (power_lost) {
-- 
2.50.1


