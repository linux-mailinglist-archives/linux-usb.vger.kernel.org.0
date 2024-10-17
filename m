Return-Path: <linux-usb+bounces-16365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8EC9A22FC
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 15:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8045E1F230B4
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 13:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8591C1DDC0C;
	Thu, 17 Oct 2024 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UataWYxO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159AB1DA112
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170445; cv=none; b=suhmLMFlm6xLdMH3T0LXTFP6gfUTQEG+O2jnsN52F9Ekku9pSvThX9OtHoWe1y9pkpkuiuQZmg75KrMPCy53Ut90vT+GOvHkA92Ci6zagRuFe5HkRy6erBV4IgX/VYydh6TUw1vESp5F4QaL5507rnsMutlQvFBNgCz6hWFaSLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170445; c=relaxed/simple;
	bh=PHY+ynLY4Pol3ilfxu0YZN9SWjBQw/9NqodcGpCdFfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJ6c5w8D6qaCD41/uz9vpQaKES8OtaeG1UY6rEc29nPHdrTnBn/QNopfiXjCJwuYL9UbTgwzZabvGApBq4lA7WAp/kH3YwA+EHRxOU5A/hwmL3a3nYsRRTZtv+t7S9MeFP/GRKUnvB198X+TfzyFnIO9d08eJ3uUBn44hZ7uJn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UataWYxO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170442; x=1760706442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PHY+ynLY4Pol3ilfxu0YZN9SWjBQw/9NqodcGpCdFfQ=;
  b=UataWYxOdLrnoUjdr+FU37DCuuse/+Ypfkeya0XIuoDFdyUX0cYPFVij
   xgrB1PJxzy8HejG3ZeB26XKbinbuVHzGrW67Q3QpHT6q+dmZiP1rJ4Hgl
   3wIwVvFO6FqdjchQ1sPtBNwxlRjWMiuffeC/2TfAJ4zOZaiMaKa41ob5+
   2LQfoPZix15ohvCExfr8T3VNffqup0gWl34T98Ko1kWvGMXwxpBbWfX91
   s8dNAfJPuEh+tYN68nabkKpxUvYgQdPlceQWurjFLx4pEigmuiRCxIcI8
   Hz8ZsX6E1bo7fL8tF3Wz5W1rOLOMCfXYF7M0k8VM1Jus+Ex/jQOcDRl3M
   Q==;
X-CSE-ConnectionGUID: 1yJ4Ua08RKu0B25C1yE4OQ==
X-CSE-MsgGUID: 68l5lSTuTkaYpGPBKc4+LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="39290389"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="39290389"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:07:21 -0700
X-CSE-ConnectionGUID: 9nzdVpSKS326X5TQRy3gxg==
X-CSE-MsgGUID: YDy438w9RMC139wNejlcZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78882302"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 17 Oct 2024 06:07:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 5A3CD297; Thu, 17 Oct 2024 16:07:19 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/8] usb: xhci: move link TRB quirk to xhci_gen_setup()
Date: Thu, 17 Oct 2024 16:05:02 +0300
Message-ID: <20241017130508.1293021-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
References: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This quirk is old and seldom seen, as a result the trace is changed
to debug message and only printed when the quirk is set.

Move it into xhci_gen_setup() where the majority of quirks are set.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 4edd850e6328..62c2fd301456 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -473,14 +473,7 @@ static int xhci_init(struct usb_hcd *hcd)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_init");
 	spin_lock_init(&xhci->lock);
-	if (xhci->hci_version == 0x95 && link_quirk) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-				"QUIRK: Not clearing Link TRB chain bits.");
-		xhci->quirks |= XHCI_LINK_TRB_QUIRK;
-	} else {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"xHCI doesn't need link TRB QUIRK");
-	}
+
 	retval = xhci_mem_init(xhci, GFP_KERNEL);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished xhci_init");
 
@@ -5247,6 +5240,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (xhci->hci_version > 0x96)
 		xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 
+	if (xhci->hci_version == 0x95 && link_quirk) {
+		xhci_dbg(xhci, "QUIRK: Not clearing Link TRB chain bits");
+		xhci->quirks |= XHCI_LINK_TRB_QUIRK;
+	}
+
 	/* Make sure the HC is halted. */
 	retval = xhci_halt(xhci);
 	if (retval)
-- 
2.45.2


