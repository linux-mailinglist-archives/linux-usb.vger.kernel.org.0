Return-Path: <linux-usb+bounces-30563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5479C63E79
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6CA80353B9B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5878F32B98D;
	Mon, 17 Nov 2025 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5iXa861"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CE732A3C5
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379822; cv=none; b=sURay50IWbvLWhA7zv7fr2z0XTv8A3diYaCh3Cq1hjMegAbFVBRUy+VjozbmO1WTeba/a0IDM9zGyL60WZf1btn9RDRl408cbkE2SyvYkU3EFHjnrzng4X2EOePsrrXAymX7xZ8oEtvrYaUoXWSFUiUkgs3N1IL2homgCJmQBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379822; c=relaxed/simple;
	bh=N9xKKnor1MHIJEbDe81loikc5HfaSq4mhV6OJBBey9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBc5zM1J0hKUChQYmgHsRhWh0QZ8iZKpxTxEGMdAJbKqxIrECy3Nmw+WZyvbrNqDZc2Xyx8niYoHPix3pG/pXe3TrhCHqx5X31kpZI9Byuxt5HgI/FK9ZyfJX3XZK/um2O3hOjTOBg0bUi5FnJBVzyQ7hS0L68Y/I/iLQ81CFX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5iXa861; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379820; x=1794915820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N9xKKnor1MHIJEbDe81loikc5HfaSq4mhV6OJBBey9A=;
  b=F5iXa8613NDInhqMLRzMVNS/wkRuRuDUL89UXDZHatWzp8OBhlfWsq7f
   uVZR5ux+JJmTOQIJwZ65Z8tzwXphbjD3kh3Cd7LQdC9lYcTH6KDVP6iFb
   IZdR8pVZvB0r9Nu2V07eYtdsb02wlNKymiA6PHvy8h2LTC9STdb6fs91+
   54Z5qqJvzTBCbPIglE7WjR1fJki3bsHw4ArEnIbZkjyEnZojATbvKhq/e
   vWSuk7I9tmI5aNUTBX9qOPOQhAkGtC41QdyM0ulikJILEk5NtzbsNe8VY
   q1nArtCzO7cdAa/fg+UxhoywOGE1RFVMXlhQfK+zHUqv21pC9urrX+OYF
   Q==;
X-CSE-ConnectionGUID: LWEBcDJKSeeDY95eBLNLZA==
X-CSE-MsgGUID: +bgNUsbxTRueIz5TnphubA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76726925"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76726925"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:39 -0800
X-CSE-ConnectionGUID: 8toFKFhNQ2SlDyvJbDoBAg==
X-CSE-MsgGUID: ZVw/IvH+SyCxbYBFLjtebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189729282"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 03:43:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 31D8B99; Mon, 17 Nov 2025 12:43:37 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 4/9] usb: xhci: simpilfy resume root hub code
Date: Mon, 17 Nov 2025 12:42:36 +0100
Message-ID: <20251117114242.3507856-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
References: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resume roothubs without checking 'retval' value, as it is always '0'.
Due to changes made in commit 79989bd4ab86 ("xhci: always resume roothubs
if xHC was reset during resume") the check is redundant.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/usb/host/xhci.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 281b17760416..e36a1be265c5 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1236,29 +1236,25 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 
 	xhci_dbc_resume(xhci);
 
-	if (retval == 0) {
-		/*
-		 * Resume roothubs only if there are pending events.
-		 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
-		 * the first wake signalling failed, give it that chance if
-		 * there are suspended USB 3 devices.
-		 */
-		if (xhci->usb3_rhub.bus_state.suspended_ports ||
-		    xhci->usb3_rhub.bus_state.bus_suspended)
-			suspended_usb3_devs = true;
+	/*
+	 * Resume roothubs only if there are pending events.
+	 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
+	 * the first wake signalling failed, give it that chance if
+	 * there are suspended USB 3 devices.
+	 */
+	if (xhci->usb3_rhub.bus_state.suspended_ports || xhci->usb3_rhub.bus_state.bus_suspended)
+		suspended_usb3_devs = true;
 
+	pending_portevent = xhci_pending_portevent(xhci);
+	if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
+		msleep(120);
 		pending_portevent = xhci_pending_portevent(xhci);
+	}
 
-		if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
-			msleep(120);
-			pending_portevent = xhci_pending_portevent(xhci);
-		}
-
-		if (pending_portevent) {
-			if (xhci->shared_hcd)
-				usb_hcd_resume_root_hub(xhci->shared_hcd);
-			usb_hcd_resume_root_hub(hcd);
-		}
+	if (pending_portevent) {
+		if (xhci->shared_hcd)
+			usb_hcd_resume_root_hub(xhci->shared_hcd);
+		usb_hcd_resume_root_hub(hcd);
 	}
 
 	/*
-- 
2.50.1


