Return-Path: <linux-usb+bounces-35151-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNyDMLoAvGmurAIAu9opvQ
	(envelope-from <linux-usb+bounces-35151-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:57:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC82CC45E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFBB230166FA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F0A2C21DD;
	Thu, 19 Mar 2026 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gu9NgI22"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125737F8B5
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928629; cv=none; b=nJFT5ixGk1x0P76Oy9anUQeBJDEx946z0rCFHl9zuaR/cZwTFKNo+WmT1Gxp0O4VpD8aoniHbKrLcPJy7/9gzry0L/U1piZVVN3+zrqsEmx6b7uytIaUJ4qm9JjUqVHIP2D+ltWP8GzsN58ZMuWiE2RuufwMtV3H0YlJqpP0Im0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928629; c=relaxed/simple;
	bh=Hm2Rw6qwGLY5BtfLJUqLoka3l+RaX01lxXXFdtA3bcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2ZqNgxbILLcJSIUN1pCzMl4sI4Hwkkx/T3iU91m73sJQ3twR5MOEQ+zvisSWlWIeQMwimFZQRbAoqzElDeTmBW6C9u4/uQDYW/rJv1AOsTp2AUgUMHTD5pTQfeOVmT83Rt2YlV+z4JcgbCeVGC0JLg/k43Tpam+QHpihC8wzwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gu9NgI22; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928628; x=1805464628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hm2Rw6qwGLY5BtfLJUqLoka3l+RaX01lxXXFdtA3bcE=;
  b=gu9NgI22jmSzk0C+2JXqNfH9M1ThlhX/B/SVL1Me4ByfZUTW+K+jv28/
   f7VBCn1oVOzFFHWUkag8ewd2JnIYN038ZDzpnioiVDaA1Um25JPVsc/PP
   Z/Lxf8RO7C3g2Iz/UlAr8qJOS2yPC1l4YiSguNOXVw5bM/e0+oCP8PERH
   kQgWaM+SA684ifK7uRRR+tH72xEnxH+4u/eziNdVh9wwjgAg9lrkHLkOJ
   nsg4SzqcmHaTgmDqoAxwfKFrjfWVZ2/mlEMyNopAXhu+nX0Dgzm5e7pbL
   ARnwB93HwGg1uo4xHYhUwNhOgA02NcePBOcy48EajlFFVN2Gpzdv8SM2c
   A==;
X-CSE-ConnectionGUID: FB+xQmfKQeWCsI7xV4kCiQ==
X-CSE-MsgGUID: Kc7V6NE/QjW4vxj3byi9Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78904205"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78904205"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:57:07 -0700
X-CSE-ConnectionGUID: Q2LSyvjBQ+iU8N0ki6eC3g==
X-CSE-MsgGUID: EVurhfSGTNSKB9PinSlPNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260866322"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 06:57:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 7EF7398; Thu, 19 Mar 2026 14:57:05 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 5/9] usb: xhci: separate use of USB Chapter 11 PLS macros from xHCI-specific PLS macros
Date: Thu, 19 Mar 2026 14:56:20 +0100
Message-ID: <20260319135626.3077643-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
References: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35151-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 53DC82CC45E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.50.1


