Return-Path: <linux-usb+bounces-35149-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HyAAhkBvGmurAIAu9opvQ
	(envelope-from <linux-usb+bounces-35149-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE852CC4BE
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A98131FDF86
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A6D3A4F50;
	Thu, 19 Mar 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWf6S962"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D452DA749
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928628; cv=none; b=mF8dUZynXYT469A95X1z4p6Btw4r/UZdc0g/YV8tZg2AicHn4NVjhKQFDek+MtcR5AXJEzXXdxpYe23bTNsIGRcsR1/UkKfpw/X+Dx+PslkjIo1OHtNe/dVaRCD5MNRq5X0fCO23TBj/AXyf2FpZvFqaW0wAhCBRoMfYKAQU6cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928628; c=relaxed/simple;
	bh=93GmAKzNU6Onpirs/ktPWSLV3kt8yP5q+LrmOVXkuzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6O0xBSFAgfD3qgdIw5rnFp+J7JdPyMhRLK5sNgie4tGo8vU1Rzrd5H7iHgGPmxwX+HFIX1p7nek9ODsntvD6CiSoC2m1spi95sj1BNHEFb0ep6PRuRyui5rDUKHWV8w8BhvAUX5ZPWPn3DjcRx4XsVD36XK5RLjoT11f3Sd85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWf6S962; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928627; x=1805464627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93GmAKzNU6Onpirs/ktPWSLV3kt8yP5q+LrmOVXkuzo=;
  b=WWf6S962bRCjbGoCzO5ZaVEfZ/9SpXOXs+0c/4lnxHOfnzCx1lM6sRrJ
   RnggO3RkrPXnH64WEdQmHSAhOPe5LwIAbnV79WZJH88hK0NlKla0cwg20
   mYhwVkC9nYuLpRs0SwdtEs1FCSkSayLsDkhjLDkckzsV44y1Qmi3yXb/5
   +2IkVWk6P9uPlgpz4Fs5csgN3A3AczAFWPBnMoygwO6iEcFWTWjrjJHG+
   na+xRnYW63YDKUjzxWkifXSNZrgg+Df7D4zlTj3aB7nQap/N1PPqYkINs
   H6FFcxSrbcqsFvRhJfu3zVtx3t0Wv62dTE1DOXWA2dhbGvnDfrgNMmdbR
   w==;
X-CSE-ConnectionGUID: QY79TauBSDiJ/cI1aU1HtQ==
X-CSE-MsgGUID: sjqVHChVQvySXqopIceKPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78904203"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78904203"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:57:06 -0700
X-CSE-ConnectionGUID: mn7YuilHSPypCOzRz/VNUA==
X-CSE-MsgGUID: MtIPHpgYT2aezJwndxn97g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260866320"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 06:57:05 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id E56069D; Thu, 19 Mar 2026 14:57:04 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/9] usb: xhci: clean up 'wValue' handling in xhci_hub_control()
Date: Thu, 19 Mar 2026 14:56:19 +0100
Message-ID: <20260319135626.3077643-5-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35149-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 7DE852CC4BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several hub control requests encode a descriptor type in the upper byte
of 'wValue'. Clean this up by extracting the descriptor type into a local
variable and using it for all relevant requests.

Replace magic value (0x02) with the appropriate macro (HUB_EXT_PORT_STATUS)

This improves readability and makes the handling of 'wValue' consistent.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index daa04ac811fc..b57fe0967e10 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1209,6 +1209,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	u16 wake_mask;
 	u8 timeout;
 	u8 test_mode;
+	u8 desc_type;
 	struct xhci_hub *rhub;
 	struct xhci_port **ports;
 	struct xhci_port *port;
@@ -1226,13 +1227,13 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		memset(buf, 0, 4);
 		break;
 	case GetHubDescriptor:
+		desc_type = (wValue & 0xff00) >> 8;
 		/* Check to make sure userspace is asking for the USB 3.0 hub
 		 * descriptor for the USB 3.0 roothub.  If not, we stall the
 		 * endpoint, like external hubs do.
 		 */
 		if (hcd->speed >= HCD_USB3 &&
-				(wLength < USB_DT_SS_HUB_SIZE ||
-				 wValue != (USB_DT_SS_HUB << 8))) {
+		    (wLength < USB_DT_SS_HUB_SIZE || desc_type != USB_DT_SS_HUB)) {
 			xhci_dbg(xhci, "Wrong hub descriptor type for "
 					"USB 3.0 roothub.\n");
 			goto error;
@@ -1241,7 +1242,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				(struct usb_hub_descriptor *) buf);
 		break;
 	case DeviceRequest | USB_REQ_GET_DESCRIPTOR:
-		if ((wValue & 0xff00) != (USB_DT_BOS << 8))
+		desc_type = (wValue & 0xff00) >> 8;
+		if (desc_type != USB_DT_BOS)
 			goto error;
 
 		if (hcd->speed < HCD_USB3)
@@ -1272,7 +1274,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
 		/* if USB 3.1 extended port status return additional 4 bytes */
-		if (wValue == 0x02) {
+		if (wValue == HUB_EXT_PORT_STATUS) {
 			u32 port_li;
 
 			if (hcd->speed < HCD_USB31 || wLength != 8) {
-- 
2.50.1


