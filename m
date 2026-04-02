Return-Path: <linux-usb+bounces-35882-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC4kJPdszmmpngYAu9opvQ
	(envelope-from <linux-usb+bounces-35882-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:19:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9F3898CD
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F28FA305326B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE32F2F1FC3;
	Thu,  2 Apr 2026 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5KKBLuY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FCE3033F5
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135861; cv=none; b=ODwQke++Kn0h9Doti1x7ShF75vwZbP0nNl6j9OtaUOZMXwcKQhX4gdvmXNjgQUzZQRsOFxvzc0yxq2LZYr8am2aKLDZXJlxOPdg475GrKB2cYye5E1jeLIMGzQfUsmYnTrUHlIZ6dvuRxf20Nc6ozr4RwpX76kpbpG0jW1ncIeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135861; c=relaxed/simple;
	bh=h/DjZVdSJuWvwiLkqpLm1aVy8YWY0UqQMjapOhFNc2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHHwU1Aq9JJDqlUkdYnZy9VTNxp4ylU4TxYtserNqhXiRmFzAXzjom+obIrm4iVN9kBdXBt0HMZ7gKIHcnarkqeQdyyt37zbC5mMKgS+qmVwIY9iGT666Pi1ke5IS5o/qCfhcVVsdUyev8D8oJV7nRqRnXIn7CNICLa4VLNwqDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5KKBLuY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135860; x=1806671860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/DjZVdSJuWvwiLkqpLm1aVy8YWY0UqQMjapOhFNc2k=;
  b=C5KKBLuYH51YpRzGoRb/av4+FIV8acxMMicm76LbxlPvDLKkYq3cyqCw
   PgMvx3i9hccYtbHPWI9tEKFC5KavyWrWTpjMh12Q953WCXa6Iea+8cDmb
   NYuaH54GzKaChmR8ugeNlLYRaQhTKUuqmwoNBIX/k4QZYmwZvjcCTy4SA
   mVrckVDv0WQq3JYZTxoE6pYhyRDLzbR+LI6nlOL5eTnJq6LB07Rynzvoq
   gkvX9i4lt5J1sjrRZCZsfMnK/guCHYddIuvQpwxUUZXtjAfY5CzKGS8cC
   UKpvjVmkiDbgkWOvz+G/BQSxCTuWLk1jDwUQKht639s6sdFixmY38Iq9m
   w==;
X-CSE-ConnectionGUID: PPC+qaXeQYC1Nno2M5MFrg==
X-CSE-MsgGUID: HLjopBl8SPSBmPgnVlokdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650887"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:40 -0700
X-CSE-ConnectionGUID: eVN2wKk8SligwTKLR2w8dA==
X-CSE-MsgGUID: yz93wKDPTaeJCRpX45eSvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241576"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:39 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 17/25] usb: xhci: separate use of USB Chapter 11 PLS macros from xHCI-specific PLS macros
Date: Thu,  2 Apr 2026 16:13:34 +0300
Message-ID: <20260402131342.2628648-18-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35882-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92D9F3898CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The xhci driver uses two different sources for Port Link State (PLS):
  1. The PLS field in the PORTSC register (bits 8:5).
  2. The PLS value encoded in bits 15:8 of the USB request wIndex,
     received by xhci_hub_control().

While both represent similar link states, they differ in a few details,
for example, xHCI's Resume State. Because of these differences, the xhci
driver defines its own set of PLS macros in xhci-port.h, which are intended
to be used when reading and writing  PORTSC. The generic USB Chapter 11
macros in ch11.h should only be used when parsing or replying to hub-class
USB requests.

To avoid mixing these two representations and prevent incorrect state
reporting, replace all uses of Chapter 11 PLS macros with the xHCI
versions when interacting with the PORTSC register.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b57fe0967e10..7fb17799cfdc 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -866,8 +866,8 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
 		 * unless we're already in compliance
 		 * or the inactive state.
 		 */
-		if (pls != USB_SS_PORT_LS_COMP_MOD &&
-		    pls != USB_SS_PORT_LS_SS_INACTIVE) {
+		if (pls != XDEV_COMP_MODE &&
+		    pls != XDEV_INACTIVE) {
 			pls = USB_SS_PORT_LS_COMP_MOD;
 		}
 		/* Return also connection bit -
@@ -895,7 +895,7 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
 		 * caused by a delay on the host-device negotiation.
 		 */
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
-				(pls == USB_SS_PORT_LS_COMP_MOD))
+				(pls == XDEV_COMP_MODE))
 			pls |= USB_PORT_STAT_CONNECTION;
 	}
 
@@ -1365,7 +1365,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			if (link_state == USB_SS_PORT_LS_RX_DETECT) {
 				xhci_dbg(xhci, "Enable port %d-%d\n",
 					 hcd->self.busnum, portnum + 1);
-				xhci_set_link_state(xhci, port,	link_state);
+				xhci_set_link_state(xhci, port,	XDEV_RXDETECT);
 				temp = xhci_portsc_readl(port);
 				break;
 			}
@@ -1397,7 +1397,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 				xhci_dbg(xhci, "Enable compliance mode transition for port %d-%d\n",
 					 hcd->self.busnum, portnum + 1);
-				xhci_set_link_state(xhci, port, link_state);
+				xhci_set_link_state(xhci, port, XDEV_COMP_MODE);
 
 				temp = xhci_portsc_readl(port);
 				break;
@@ -1435,7 +1435,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					reinit_completion(&port->u3exit_done);
 				}
 				if (pls <= XDEV_U3) /* U1, U2, U3 */
-					xhci_set_link_state(xhci, port, USB_SS_PORT_LS_U0);
+					xhci_set_link_state(xhci, port, XDEV_U0);
 				if (!wait_u0) {
 					if (pls > XDEV_U3)
 						goto error;
@@ -1461,7 +1461,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					xhci_stop_device(xhci, port->slot_id, 1);
 					spin_lock_irqsave(&xhci->lock, flags);
 				}
-				xhci_set_link_state(xhci, port, USB_SS_PORT_LS_U3);
+				xhci_set_link_state(xhci, port, XDEV_U3);
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				while (retries--) {
 					usleep_range(4000, 8000);
-- 
2.43.0


