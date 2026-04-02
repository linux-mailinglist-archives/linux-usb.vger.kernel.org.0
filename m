Return-Path: <linux-usb+bounces-35881-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHnHHUVvzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35881-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:29:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF115389BE9
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E503315A0A3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1729A2877DA;
	Thu,  2 Apr 2026 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HagUuCbg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E642FE591
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135859; cv=none; b=XHnTKgefsf/T/MhCBSFG8wSfyEFySXj0MeMiurVO2ay370ztQ5EMM6MGghN5+uzkonl0h7SR5deZA7qd0DaOWNztQmwXoaMxdjp7tg99YIdZ3yXr0EWTiI1g0GhSv/5CpO628CR9HFSOVqIYn9xqmGbsEOZDX2lwCj7vXdFHF4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135859; c=relaxed/simple;
	bh=yKkfzo6AHgx7FK8YlyoedDUd6f/ELg2OMIsijZZ9qkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njUbUdhcLQwWQ8B//5GBvCAC/05MMCy/gpEZ2GK9a+GXuEJY6XjF7Ijm2AbKoCetsiCFQwFxPSqCKY1fig+/Hy/a7Phdn9W7VJmSVCPThc0gj6pSzKLojBN5hv19G5Am0efJcohKgSQ85HtJGlc9DhhOfRVsNYc7+tRbwnuRWDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HagUuCbg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135859; x=1806671859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yKkfzo6AHgx7FK8YlyoedDUd6f/ELg2OMIsijZZ9qkA=;
  b=HagUuCbgNWHHcs39URU7GAk2cJUEPSN8FBmImDlDpAZXvTUO1viGfQps
   wKMac2W7ruOY2W8n+xD2UqlgPx0OPHUdKWBQZr/n02ybaGXHIfkNWOn93
   5BLnjkIu1/+sQ5javo1X3XQhKJPI6e15/b8pJv1Dtf4ssfJOY8a5LwOo2
   Ofol/I7aN1NqqrgAwnnFADcKyRFaJJsZxuQUO78CMM0b6iC2qDm9vrdUo
   s7ZKV4pUdH9jHHuThuY1ix/NfXTi3/1BcSudHDyj9PyUNz/oBRVuNb6XQ
   xPW5LvdptEy96Ok7eEbHkoGW+uQCUlGocySL1vC/DMCz5WOcss15zoLNe
   Q==;
X-CSE-ConnectionGUID: 34kAuklUSw6SdEWzbmdtpg==
X-CSE-MsgGUID: GXdfWgX8TEOf2v6JB9tTaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650885"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:39 -0700
X-CSE-ConnectionGUID: rlfISpbGSVa1lxjOG3btbw==
X-CSE-MsgGUID: muKYL5XSRyyAXlAvpmbJTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241570"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:37 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/25] usb: xhci: clean up 'wValue' handling in xhci_hub_control()
Date: Thu,  2 Apr 2026 16:13:33 +0300
Message-ID: <20260402131342.2628648-17-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35881-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: DF115389BE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Several hub control requests encode a descriptor type in the upper byte
of 'wValue'. Clean this up by extracting the descriptor type into a local
variable and using it for all relevant requests.

Replace magic value (0x02) with the appropriate macro (HUB_EXT_PORT_STATUS)

This improves readability and makes the handling of 'wValue' consistent.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
2.43.0


