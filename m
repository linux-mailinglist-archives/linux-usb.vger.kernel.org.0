Return-Path: <linux-usb+bounces-17199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB69C9BE3F2
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75721B22085
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88711DE896;
	Wed,  6 Nov 2024 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1DsxPN7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10F71DDA3B
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888005; cv=none; b=Z9N4m6r0VhZRr9fZmGX3PoKD9psYIe9yzWLtss/kUu+bYJeJXSfO/duczd5nadEudsEQIKBr1fTuV4oplaj7g8CKgELcNmlKbg/zXtvgxJ5rBAdBH44KVBYsKMi6RLHevxJ8Sd06i9U9f2zcDyNeRBTnvJZX0a8M5Z1xxBo05e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888005; c=relaxed/simple;
	bh=ICMkl8q7QvlDa/ESydkdNUkoJGv3ehZ1PUrusOeBY6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZtSIwixczoTww3NwqGaFPAE4vYv/l276F5E40CBaaluc8B5+IYjoqj6GCoCwXc53Jug5VSGPE3cFtCchsHQF5k8oqu5gGwYJoX/dhZ6nBSUu6AVCOj1kQDCeuDk3PkbbTewYQV/3wPi0oI+AyDnC+nREo4a8CkMHz9OC1onHJdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1DsxPN7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888004; x=1762424004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ICMkl8q7QvlDa/ESydkdNUkoJGv3ehZ1PUrusOeBY6c=;
  b=K1DsxPN7W3JjC7Zck5T4aHL4iKvGO/laT4Bx+Pe/nWclZNf4RlVH1GEl
   tFl2JldsFvvTLpSnDuxv1Cym8QQQwIBT1XRabWNggrkeujEq3V017vQSd
   Z91j7SZ2frLSslyf+r+blT1AB8MHkKP7P+Se+pXWMj4aD7uoQE5nv1XwY
   56MnsCxlzz9Xlyw8x/MW/SsYBVi8CYcsNGCuFLoXpM/s/Kox+cDqHS3Jr
   0OKJM8rvGD/bv1Lqid30JT9/uluicKBCWjX9DOq8DbIHd8u2DxwBTwD8u
   zX19KoLpsiMHY8UTFmMzqA4JSlqohcAmdvLXKvrKOa2d2zxnQBQG8EzhZ
   w==;
X-CSE-ConnectionGUID: Yt8i4wmfSxeXu0C6NbNvLg==
X-CSE-MsgGUID: aLx9bIDlQNyMNOfx9VX5FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059454"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059454"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:23 -0800
X-CSE-ConnectionGUID: 5DbZUJoiRYqPugyPONNkyg==
X-CSE-MsgGUID: NJ6ndy5cQgaaaP0i3huJMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813342"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:22 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 24/33] usb: xhci: move link TRB quirk to xhci_gen_setup()
Date: Wed,  6 Nov 2024 12:14:50 +0200
Message-Id: <20241106101459.775897-25-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

This quirk is old and seldom seen, as a result the trace is changed
to debug message and only printed when the quirk is set.

Move it into xhci_gen_setup() where the majority of quirks are set.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a5ac1e01f82d..e5719fd45a38 100644
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
 
@@ -5311,6 +5304,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
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
2.25.1


