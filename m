Return-Path: <linux-usb+bounces-35150-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBquLh4BvGmurAIAu9opvQ
	(envelope-from <linux-usb+bounces-35150-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 602C12CC4C6
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 292FB32062C0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982722D5C97;
	Thu, 19 Mar 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUokgeJt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132937EFF4
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928629; cv=none; b=V7WTPiyh3r3aakhNcmjdaZ+fyOJRyBTTJpCYOfOxA+ibPSkL+7GMHBvhpUAqA9sBcW5sQuNPcBRZQrVJaKeDCOtn3VNVUgFAGOvSr0iHQgM5CdE737SCjxAkOQHG/A6X6l/fkzxcwuDmxejPc6g31KkTibODomDe+zRKPsLhIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928629; c=relaxed/simple;
	bh=DnmpWKZFrAzyjpXNksEL5PkCz9YtxGZcEr9MZd/UejA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AO4z8h2A7Jqle2I0VthCtCxII7gh/DErua6tkfKx3f1WK7JG4FV5O/78JfbSH8nFrnnhyP5VuBSjy2gMZxvC4L/fzxsEZV9FjZoOAexDE7iCcV7MdbhTCUjvqoJDpwJDiK9RgTg61b2l3Or2YtdtVPMyxNqKrpi5EW0fgFKEBso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUokgeJt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928628; x=1805464628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DnmpWKZFrAzyjpXNksEL5PkCz9YtxGZcEr9MZd/UejA=;
  b=WUokgeJtp6k8xQKh0UmptgVOdklojRLQGoRc/+glnUN9wTqhBEPzWJ1m
   L2JZMD7YQzbeZIs0F3+USUDXz7s/TrnTLfw88PoC40YaI81KE9XTpTSOZ
   mVTYozfzx7ZiBaeC4ZTsQh2BUY+KKMHlbwEs4g6IEAK0usgQgxf3o8uLI
   9tnftVpRy2TuHbxLAUUdHHoPqIR9K9NzzdNQX9F05gLixnXXcSPaSQ7kT
   Nm0zxplR8Hghpv4ts1ZhrGQthXFWrNoGiDuj1DQ25ra7G2RgPNZM2tZGo
   1R6xdwgNgOmDrSmPIPJtvngkeIzluDzr4moiOVieQIi6Zlkq1Mm5kVe8D
   A==;
X-CSE-ConnectionGUID: P2zh/e30Teqzujk5fvEoLA==
X-CSE-MsgGUID: efFc3WpiQhKQyjdf4q65+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74971450"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74971450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:57:08 -0700
X-CSE-ConnectionGUID: 6PZI5r+pTDuhyWj5x+9N+g==
X-CSE-MsgGUID: C9zXQHKUTQKAf4LMvKNDSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223185557"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 06:57:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 2231B99; Thu, 19 Mar 2026 14:57:06 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 6/9] usb: xhci: add PORTPMSC variable to xhci_hub_control()
Date: Thu, 19 Mar 2026 14:56:21 +0100
Message-ID: <20260319135626.3077643-7-niklas.neronin@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-35150-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 602C12CC4C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The code handling U1/U2 timeout updates reads and modifies the PORTPMSC
register using the generic 'temp' variable, which is also used for
PORTSC. This makes the code hard to read and increases the risk of mixing
up register contents.

Introduce a dedicated 'portpmsc' variable for PORTPMSC accesses and use
it in both U1 and U2 timeout handlers. This makes the intent clearer and
keeps register operations logically separated.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 7fb17799cfdc..4da3b48dfce0 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1202,7 +1202,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int max_ports;
 	unsigned long flags;
-	u32 temp, status;
+	u32 temp, portpmsc, status;
 	int retval = 0;
 	struct xhci_bus_state *bus_state;
 	u16 link_state;
@@ -1508,20 +1508,20 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				goto error;
 
 			timeout = (wIndex & 0xff00) >> 8;
-			temp = readl(&port->port_reg->portpmsc);
-			temp &= ~PORT_U1_TIMEOUT_MASK;
-			temp |= PORT_U1_TIMEOUT(timeout);
-			writel(temp, &port->port_reg->portpmsc);
+			portpmsc = readl(&port->port_reg->portpmsc);
+			portpmsc &= ~PORT_U1_TIMEOUT_MASK;
+			portpmsc |= PORT_U1_TIMEOUT(timeout);
+			writel(portpmsc, &port->port_reg->portpmsc);
 			break;
 		case USB_PORT_FEAT_U2_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
 
 			timeout = (wIndex & 0xff00) >> 8;
-			temp = readl(&port->port_reg->portpmsc);
-			temp &= ~PORT_U2_TIMEOUT_MASK;
-			temp |= PORT_U2_TIMEOUT(timeout);
-			writel(temp, &port->port_reg->portpmsc);
+			portpmsc = readl(&port->port_reg->portpmsc);
+			portpmsc &= ~PORT_U2_TIMEOUT_MASK;
+			portpmsc |= PORT_U2_TIMEOUT(timeout);
+			writel(portpmsc, &port->port_reg->portpmsc);
 			break;
 		case USB_PORT_FEAT_TEST:
 			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
-- 
2.50.1


