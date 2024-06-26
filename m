Return-Path: <linux-usb+bounces-11694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA491815F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CB121C22D45
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E791836F6;
	Wed, 26 Jun 2024 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="feqtQsRf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C315186E43
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406037; cv=none; b=ozuFd+HR8Uipu1Q7jj87gDQOY/QtQ/WSRxAc96Pq/8Zm0Y/Qs3hBP1XIn8/B2e28Vv1pK+Sddyle8BmfiuwFAbSXf8b0B4Rvxn8LT+qbHGD93oyCNgKNiuQYvNfkO3Ci9FF7xwGREXMGZARLiIv8KU5oXui2m0CSwM07rUp0xOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406037; c=relaxed/simple;
	bh=vmBUWblzpmIXath72nBkIqVv4PUWSos71TXTYhsxET0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EeOCgMUdyCiclpxTbeo/nvlR0ROoitztLgHJFJbrf1o5nU+pJiEy2MqlCcjYI4zcUMl/q9K3sEH7tSdAiqPHRH++sFgOMoAd8HYY1419W8c/avY5B7erIA935vxd52t5O+2As322zgC6mTwMO9vWykyLr5qdQjZVFTCofofF2dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=feqtQsRf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406036; x=1750942036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vmBUWblzpmIXath72nBkIqVv4PUWSos71TXTYhsxET0=;
  b=feqtQsRfd69zYPFykg6AjhVkpjXyrZGgZ6ANi+1W+7RHmgMwcPIRNTkr
   cZWQt12XOBdtbgzQwsXYa8LHUM0QBuiNruf8UexSGi/A52Bx9WBivWvT0
   UzQ+7Tp6uWchmrNTgi1rYBzI8DIJgCDv9rWi/dHxR+n7jqutxMAxeKffZ
   OC7ge9yCYtuBk8S+07+F/+2Ou9Dsq6C/EfW/osRgvvnHGaz8Yz3DsGJ0L
   WEmY71mmiI+vogqQgphbUTzS20dL/N5iWFxZtEu6wPRHDf3bxK3KWg0F/
   cKgxTFxhb8mqrLXBFicGe17JmhXPS6UqkgShg4F6NzjeqJo71cY1gS+lO
   A==;
X-CSE-ConnectionGUID: Mp8LjKlIRHe5uF4P+p+hpQ==
X-CSE-MsgGUID: NNpfozK/SMSjjPI52tBABw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353440"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353440"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:15 -0700
X-CSE-ConnectionGUID: VPEENAWRS4iTxtwXd7HdgQ==
X-CSE-MsgGUID: ZJcsSEWOTEeQUL3mzP4FUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442776"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:47:13 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 21/21] xhci: sort out TRB Endpoint ID bitfield macros
Date: Wed, 26 Jun 2024 15:48:35 +0300
Message-Id: <20240626124835.1023046-22-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xhci macros that read and write endpoint ID bitfields of TRBs are mixing
the 1-based Endpoint ID as described in the xHCI specification, and
0-based endpoint index used by driver as an array index.

Sort this out by naming macros that deal with 1 based Endpoint ID fields
to *_EP_ID_*, and 0 based endpoint index values to *_EP_INDEX_*.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c |  6 +++---
 drivers/usb/host/xhci.h      | 33 ++++++++++++++-------------------
 2 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 49f8f980776b..b7517c3c8059 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -715,7 +715,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 		lower_32_bits(addr) | trb_sct | new_cycle,
 		upper_32_bits(addr),
 		STREAM_ID_FOR_TRB(stream_id), SLOT_ID_FOR_TRB(slot_id) |
-		EP_ID_FOR_TRB(ep_index) | TRB_TYPE(TRB_SET_DEQ), false);
+		EP_INDEX_FOR_TRB(ep_index) | TRB_TYPE(TRB_SET_DEQ), false);
 	if (ret < 0) {
 		xhci_free_command(xhci, cmd);
 		return ret;
@@ -4379,7 +4379,7 @@ int xhci_queue_stop_endpoint(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			     int slot_id, unsigned int ep_index, int suspend)
 {
 	u32 trb_slot_id = SLOT_ID_FOR_TRB(slot_id);
-	u32 trb_ep_index = EP_ID_FOR_TRB(ep_index);
+	u32 trb_ep_index = EP_INDEX_FOR_TRB(ep_index);
 	u32 type = TRB_TYPE(TRB_STOP_RING);
 	u32 trb_suspend = SUSPEND_PORT_FOR_TRB(suspend);
 
@@ -4392,7 +4392,7 @@ int xhci_queue_reset_ep(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			enum xhci_ep_reset_type reset_type)
 {
 	u32 trb_slot_id = SLOT_ID_FOR_TRB(slot_id);
-	u32 trb_ep_index = EP_ID_FOR_TRB(ep_index);
+	u32 trb_ep_index = EP_INDEX_FOR_TRB(ep_index);
 	u32 type = TRB_TYPE(TRB_RESET_EP);
 
 	if (reset_type == EP_SOFT_RESET)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 65c84185c7fd..9fa1b58121f0 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -805,13 +805,19 @@ struct xhci_transfer_event {
 	__le32	flags;
 };
 
+/* Transfer event flags bitfield, also for select command completion events */
+#define TRB_TO_SLOT_ID(p)	(((p) >> 24) & 0xff)
+#define SLOT_ID_FOR_TRB(p)	(((p) & 0xff) << 24)
+
+#define TRB_TO_EP_ID(p)		(((p) >> 16) & 0x1f) /* Endpoint ID 1 - 31 */
+#define EP_ID_FOR_TRB(p)	(((p) & 0x1f) << 16)
+
+#define TRB_TO_EP_INDEX(p)	(TRB_TO_EP_ID(p) - 1) /* Endpoint index 0 - 30 */
+#define EP_INDEX_FOR_TRB(p)	((((p) + 1) & 0x1f) << 16)
+
 /* Transfer event TRB length bit mask */
-/* bits 0:23 */
 #define	EVENT_TRB_LEN(p)		((p) & 0xffffff)
 
-/** Transfer Event bit fields **/
-#define	TRB_TO_EP_ID(p)	(((p) >> 16) & 0x1f)
-
 /* Completion Code - only applicable for some types of TRBs */
 #define	COMP_CODE_MASK		(0xff << 24)
 #define GET_COMP_CODE(p)	(((p) & COMP_CODE_MASK) >> 24)
@@ -950,8 +956,6 @@ struct xhci_event_cmd {
 	__le32 flags;
 };
 
-/* flags bitmasks */
-
 /* Address device - disable SetAddress */
 #define TRB_BSR		(1<<9)
 
@@ -987,13 +991,8 @@ enum xhci_setup_dev {
 
 /* bits 16:23 are the virtual function ID */
 /* bits 24:31 are the slot ID */
-#define TRB_TO_SLOT_ID(p)	(((p) & (0xff<<24)) >> 24)
-#define SLOT_ID_FOR_TRB(p)	(((p) & 0xff) << 24)
 
 /* Stop Endpoint TRB - ep_index to endpoint ID for this TRB */
-#define TRB_TO_EP_INDEX(p)		((((p) & (0x1f << 16)) >> 16) - 1)
-#define	EP_ID_FOR_TRB(p)		((((p) + 1) & 0x1f) << 16)
-
 #define SUSPEND_PORT_FOR_TRB(p)		(((p) & 1) << 23)
 #define TRB_TO_SUSPEND_PORT(p)		(((p) & (1 << 23)) >> 23)
 #define LAST_EP_INDEX			30
@@ -2023,8 +2022,7 @@ static inline const char *xhci_decode_trb(char *str, size_t size,
 			field1, field0,
 			xhci_trb_comp_code_string(GET_COMP_CODE(field2)),
 			EVENT_TRB_LEN(field2), TRB_TO_SLOT_ID(field3),
-			/* Macro decrements 1, maybe it shouldn't?!? */
-			TRB_TO_EP_INDEX(field3) + 1,
+			TRB_TO_EP_ID(field3),
 			xhci_trb_type_string(type),
 			field3 & EVENT_DATA ? 'E' : 'e',
 			field3 & TRB_CYCLE ? 'C' : 'c');
@@ -2139,8 +2137,7 @@ static inline const char *xhci_decode_trb(char *str, size_t size,
 			xhci_trb_type_string(type),
 			field1, field0,
 			TRB_TO_SLOT_ID(field3),
-			/* Macro decrements 1, maybe it shouldn't?!? */
-			TRB_TO_EP_INDEX(field3) + 1,
+			TRB_TO_EP_ID(field3),
 			field3 & TRB_TSP ? 'T' : 't',
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
@@ -2150,8 +2147,7 @@ static inline const char *xhci_decode_trb(char *str, size_t size,
 			xhci_trb_type_string(type),
 			TRB_TO_SLOT_ID(field3),
 			TRB_TO_SUSPEND_PORT(field3),
-			/* Macro decrements 1, maybe it shouldn't?!? */
-			TRB_TO_EP_INDEX(field3) + 1,
+			TRB_TO_EP_ID(field3),
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_SET_DEQ:
@@ -2161,8 +2157,7 @@ static inline const char *xhci_decode_trb(char *str, size_t size,
 			field1, field0,
 			TRB_TO_STREAM_ID(field2),
 			TRB_TO_SLOT_ID(field3),
-			/* Macro decrements 1, maybe it shouldn't?!? */
-			TRB_TO_EP_INDEX(field3) + 1,
+			TRB_TO_EP_ID(field3),
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_RESET_DEV:
-- 
2.25.1


