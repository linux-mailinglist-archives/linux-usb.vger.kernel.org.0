Return-Path: <linux-usb+bounces-21648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CBDA5C8A6
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 16:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77E43163399
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 15:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7316F25F78A;
	Tue, 11 Mar 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AT0ZOOGr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E425E83A
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707895; cv=none; b=h4N7BKWmfo4F54PoR7EB6WLjHxeT+7qZDUQ4QqRQ8RwqXbqtjVXXLMNpXRfUXcIbhlo70eh7S8y5L1PAv1lTjvh59/OvG8oHQS7qva3JJD3FC+jBOE/ZI3jzMLbL8cDXKbjPGI/4NRZ1Sp7brWvO8CZ7JE/VuNgtPLwxHFhLrZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707895; c=relaxed/simple;
	bh=wU0o/mz4ba52ZJLJ1FH+/Uo1Zt8koAcEWfIlZwhnimo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRuw5Gs2MUUkYpAR9chzeJ5WdfIyS9ytryPs1nJaKohLytloxB3u3p68RJsYmVwgOY11zup8u9Diuut/wge1CFC3fZv0wipdKHIn2iUe94e1Fjds9rahGgqi/sXSYFZbW+dtx98c16kCBVOpzZJ/KU5CZ0DIeB9oajxQw/x23kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AT0ZOOGr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741707893; x=1773243893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wU0o/mz4ba52ZJLJ1FH+/Uo1Zt8koAcEWfIlZwhnimo=;
  b=AT0ZOOGrJ2t6l0fkaX5VnWN1P2dhl9qfu5MlXxdz3qRWhVKXeu1X0a0P
   zTIFxbrs65dxtAC9mJtUn0lB7l0z+2gDNKtNJa77Z0d8wntLBVCSGaCnv
   yT9p3zocfYTrrTWnk10ItOxVb9/rxQq1AVdo8Bq9cwshubW7xwrcQrGDh
   Cnu35ruMzUviBjNe++ZLXxv+fCnZWd7tdAdm9iDaOfSXqjmkcf9PjQ21S
   oI3wDcnyjPSKNVeck6kRFvvmkLnfK5AoWi5ut/u7OftyBUR6NIjBvCzQ5
   HJ5Ta4wZdfOJDPpac5n4jnrDN63LRG8kgfTc5XPU00c2VpdWz3OD9hufA
   g==;
X-CSE-ConnectionGUID: k8f9psKdQxiqYdPk9cxAeg==
X-CSE-MsgGUID: F31/Vl8nTres7iE8s+ssxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30327902"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="30327902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 08:44:53 -0700
X-CSE-ConnectionGUID: gCQhknSqR7Gy6h9D45ltrA==
X-CSE-MsgGUID: e/WGlIebSW+ttFX92oWkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125396701"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 11 Mar 2025 08:44:52 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/3] usb: xhci: Don't change the status of stalled TDs on failed Stop EP
Date: Tue, 11 Mar 2025 17:45:50 +0200
Message-ID: <20250311154551.4035726-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311154551.4035726-1-mathias.nyman@linux.intel.com>
References: <20250311154551.4035726-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

When the device stalls an endpoint, current TD is assigned -EPIPE
status and Reset Endpoint is queued. If a Stop Endpoint is pending
at the time, it will run before Reset Endpoint and fail due to the
stall. Its handler will change TD's status to -EPROTO before Reset
Endpoint handler runs and initiates giveback.

Check if the stall has already been handled and don't try to do it
again. Since xhci_handle_halted_endpoint() performs this check too,
not overwriting td->status is the only difference.

I haven't seen this case yet, but I have seen a related one where
the xHC has already executed Reset Endpoint, EP Context state is
now Stopped and EP_HALTED is set. If the xHC took a bit longer to
execute Reset Endpoint, said case would become this one.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0f8acbb9cd21..303d66df271e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1220,7 +1220,14 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 	 */
 		switch (GET_EP_CTX_STATE(ep_ctx)) {
 		case EP_STATE_HALTED:
-			xhci_dbg(xhci, "Stop ep completion raced with stall, reset ep\n");
+			xhci_dbg(xhci, "Stop ep completion raced with stall\n");
+			/*
+			 * If the halt happened before Stop Endpoint failed, its transfer event
+			 * should have already been handled and Reset Endpoint should be pending.
+			 */
+			if (ep->ep_state & EP_HALTED)
+				goto reset_done;
+
 			if (ep->ep_state & EP_HAS_STREAMS) {
 				reset_type = EP_SOFT_RESET;
 			} else {
@@ -1231,8 +1238,11 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			}
 			/* reset ep, reset handler cleans up cancelled tds */
 			err = xhci_handle_halted_endpoint(xhci, ep, td, reset_type);
+			xhci_dbg(xhci, "Stop ep completion resetting ep, status %d\n", err);
 			if (err)
 				break;
+reset_done:
+			/* Reset EP handler will clean up cancelled TDs */
 			ep->ep_state &= ~EP_STOP_CMD_PENDING;
 			return;
 		case EP_STATE_STOPPED:
-- 
2.43.0


