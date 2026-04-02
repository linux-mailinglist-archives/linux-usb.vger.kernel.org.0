Return-Path: <linux-usb+bounces-35883-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBabGP9szmmpngYAu9opvQ
	(envelope-from <linux-usb+bounces-35883-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:19:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A581B3898E3
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57412303E189
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4DC3033F5;
	Thu,  2 Apr 2026 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jl5Dw0Ke"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070DA2F1FD0
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135863; cv=none; b=ReRgqixNgZZnje6FMDsT64832Q2lNffmaQFkrbyv1g2Ugge2QHldtq97YMeglf7Q7t9ZTj/KjRQD2is+RnCmMFBCBB+8huI+yTgcOMF2fi9OwvI9UMQ8vqzPGfcPWh46fcPPfTOGyqsbpxDGFUn5AdM6aws85G9AmKQR0Tguprs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135863; c=relaxed/simple;
	bh=Qx8x1Hs/LDo1KLBG5jKzdEcUAQMZiDYZ8fZGEijXZwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6jycnTQxP1HShmKKoj4H2Y4tgyPUwsgZEfp1pK/dmXtd52vjV9V3RipCUTFmSkZgj1kRMEVJlTIRfNOqQbIrQ4JXEFcEK3SOr0AjK5tw4JQ1tGPK8DK0dydhHILeBcWYikbv7eAQciGrM48elhH7jrdpadiJ0D3/NdVCOTR7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jl5Dw0Ke; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135862; x=1806671862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qx8x1Hs/LDo1KLBG5jKzdEcUAQMZiDYZ8fZGEijXZwU=;
  b=Jl5Dw0KeVWSkbJGcTGIEXwkKe0ZAbb1rWX+Cd8+YdmD48jVUKGrrmr/6
   7zGDuS9VKipUi8alL65wCHcYbgmcdoizmSmHWo0QwEPSItzIrTXy6sv3U
   fCOfuLlGdHCn99pf2MMt9pvBk2hLY5HlgGT++ue63S+6+i3LAMK1JN22G
   BnPsa4/+PHEmbE4PssZqjtBLjHgIDsX7VYf169lMKzCiK6hL+QtrlSnlR
   PadLMt2RawuE1q5rohkkeixN+Fek+ebhxE/wrMSU0mqOjRmPBjJFhpi6C
   XWklXJvAt1YaBA7eUJJyNTUF/fuTyp5KQRcpnU5EKosSoZN4lZjLzFJB5
   A==;
X-CSE-ConnectionGUID: puJmwagZQGaGhxXYJzXxJQ==
X-CSE-MsgGUID: Inrq3oM1QTqNS5jvtfUPgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650895"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:42 -0700
X-CSE-ConnectionGUID: 8QgGmCbbQpGxpxty14Wwrg==
X-CSE-MsgGUID: YxOXqhMWSQ65ssbVykq0LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241578"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:41 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 18/25] usb: xhci: add PORTPMSC variable to xhci_hub_control()
Date: Thu,  2 Apr 2026 16:13:35 +0300
Message-ID: <20260402131342.2628648-19-mathias.nyman@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-35883-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A581B3898E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The code handling U1/U2 timeout updates reads and modifies the PORTPMSC
register using the generic 'temp' variable, which is also used for
PORTSC. This makes the code hard to read and increases the risk of mixing
up register contents.

Introduce a dedicated 'portpmsc' variable for PORTPMSC accesses and use
it in both U1 and U2 timeout handlers. This makes the intent clearer and
keeps register operations logically separated.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
2.43.0


