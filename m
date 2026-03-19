Return-Path: <linux-usb+bounces-35148-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAujERUBvGmurAIAu9opvQ
	(envelope-from <linux-usb+bounces-35148-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A90962CC4AF
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2617631F96D7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9B238F22A;
	Thu, 19 Mar 2026 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPHUPCFO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FF62BEC57
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928628; cv=none; b=Yxv0H63raVI/IQz7S4wp3pJoObpB35WjoXZtTNrEOaj5LIGPY2cSEJ1obWtnNkTmETpxlH0KaHSXSIyqZhg6g2EMmQC2LHNSjpNeAUEKpZPjfX53QPbqx0McujSsBG/iOhBAVLgfa3D611+/Rh/U7QhKekKogt7sXhOI2lokYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928628; c=relaxed/simple;
	bh=BCZaqG1oxyp0kOeA5w93NF8kCW8M7/L6V4LySf3GEmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlCZBRpkAJ+Gzdt3TgcberXZA2jpaJiEU60jXukjM3o6XqM5vkZ7giBP0rzseTQ7vUlZBc9bNGyNtUSLjOnIuKkr296V1mdBYE27iD4Y/O8Yr3QMQZ+Oag6BZP4fr/0bRzYFTaHXn/1MLvDxexrjHESdChRqCkgUywGKH4faVJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPHUPCFO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928627; x=1805464627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BCZaqG1oxyp0kOeA5w93NF8kCW8M7/L6V4LySf3GEmQ=;
  b=MPHUPCFON3l5DEPhb/Cu2DzjH7+oBkglUoepe0jJNSPkbLbpGx8PgSmV
   GHp2d53WrW1jvKAb88S9yXWku11XeYWu+yd++E4MySSUd46UUTO9Qobbr
   lWdKYOAAgbjoU3hd2YD7E/KVc8wyeRw514DBNoY3Yw/84+z8jrIHr876M
   9owJw8g/oV6+QP1pImI1MHQ/xaip2Ec+eDgaiadEshy4ROFqHSc2UM2gE
   f9z8uOr24a4vUe+XgTTNdjwu7xm2+XCQO6woEC3o6FO2xIf+KOPvsqqvY
   7xeZrxWVSCR8Q8DHbrEdlh+ImgkDkS27YOrxFszvpilfbYmw6ADPr+IF6
   A==;
X-CSE-ConnectionGUID: jAfXAaILRM+vUkzdxchteQ==
X-CSE-MsgGUID: E2aZeVfVR2O/vlXckaF4bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78904202"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78904202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:57:06 -0700
X-CSE-ConnectionGUID: xwvg5ovyTgKZXx6klJoRDw==
X-CSE-MsgGUID: 6cKyznEMTj+BdHoEN+l5Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260866315"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 06:57:05 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 485D29B; Thu, 19 Mar 2026 14:57:04 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/9] usb: xhci: clean up handling of upper bits in SetPortFeature wIndex
Date: Thu, 19 Mar 2026 14:56:18 +0100
Message-ID: <20260319135626.3077643-4-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35148-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: A90962CC4AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In Set Port Feature requests, the upper byte of 'wIndex' encodes
feature-specific parameters. The current code reads these upper bits in
an early pre-processing block, and then the same feature is handled again
later in the main switch statement. This results in duplicated condition
checks and makes the control flow harder to follow.

Move all feature-specific extraction of 'wIndex' upper bits into the
main SetPortFeature logic so that each feature is handled in exactly one
place. This reduces duplication, makes the handling clearer, and keeps
'wIndex' parsing local to the code that actually uses the values.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index de843ecc7d63..daa04ac811fc 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1205,10 +1205,10 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	u32 temp, status;
 	int retval = 0;
 	struct xhci_bus_state *bus_state;
-	u16 link_state = 0;
-	u16 wake_mask = 0;
-	u16 timeout = 0;
-	u16 test_mode = 0;
+	u16 link_state;
+	u16 wake_mask;
+	u8 timeout;
+	u8 test_mode;
 	struct xhci_hub *rhub;
 	struct xhci_port **ports;
 	struct xhci_port *port;
@@ -1286,15 +1286,6 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		}
 		break;
 	case SetPortFeature:
-		if (wValue == USB_PORT_FEAT_LINK_STATE)
-			link_state = (wIndex & 0xff00) >> 3;
-		if (wValue == USB_PORT_FEAT_REMOTE_WAKE_MASK)
-			wake_mask = wIndex & 0xff00;
-		if (wValue == USB_PORT_FEAT_TEST)
-			test_mode = (wIndex & 0xff00) >> 8;
-		/* The MSB of wIndex is the U1/U2 timeout */
-		timeout = (wIndex & 0xff00) >> 8;
-
 		portnum = (wIndex & 0xff) - 1;
 		if (!in_range(portnum, 0, max_ports))
 			goto error;
@@ -1349,6 +1340,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			bus_state->suspended_ports |= 1 << portnum;
 			break;
 		case USB_PORT_FEAT_LINK_STATE:
+			link_state = (wIndex & 0xff00) >> 3;
 			temp = xhci_portsc_readl(port);
 			/* Disable port */
 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
@@ -1498,6 +1490,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				 hcd->self.busnum, portnum + 1, temp);
 			break;
 		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
+			wake_mask = wIndex & 0xff00;
 			xhci_set_remote_wake_mask(xhci, port, wake_mask);
 			temp = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "set port remote wake mask, actual port %d-%d status  = 0x%x\n",
@@ -1511,6 +1504,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_U1_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
+
+			timeout = (wIndex & 0xff00) >> 8;
 			temp = readl(&port->port_reg->portpmsc);
 			temp &= ~PORT_U1_TIMEOUT_MASK;
 			temp |= PORT_U1_TIMEOUT(timeout);
@@ -1519,6 +1514,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_U2_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
+
+			timeout = (wIndex & 0xff00) >> 8;
 			temp = readl(&port->port_reg->portpmsc);
 			temp &= ~PORT_U2_TIMEOUT_MASK;
 			temp |= PORT_U2_TIMEOUT(timeout);
@@ -1528,6 +1525,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
 			if (hcd->speed != HCD_USB2)
 				goto error;
+
+			test_mode = (wIndex & 0xff00) >> 8;
 			if (test_mode > USB_TEST_FORCE_ENABLE ||
 			    test_mode < USB_TEST_J)
 				goto error;
-- 
2.50.1


