Return-Path: <linux-usb+bounces-9897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188628B5AB4
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C977F287BA0
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C5F76F1D;
	Mon, 29 Apr 2024 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtyDjaxQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04256757E3
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399265; cv=none; b=oUtG5POGkI+Dozq2PCCi2G9vhEvK9vg6ZkJvkgcYSywYQ/UU3rkK85UMIVUxSFcbL8tpcxjMARNkbD6rgkwr/TGer4z2gvngHQzkt7eF/t91nHcpgv7PmGB6NK80aqQ2zjQi4RnOhSncJ6RXRXfW8QrsDIMO5MtxtY8gp762EA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399265; c=relaxed/simple;
	bh=TrVmpoQBnatVsTfMlrc5YFUnDB6w6aMg4DgIs4VWnjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=srkUZb2/gOaVP7ne+F1bRdPNB9r3pRyWg/M0qxLa0jeJKOqBnNmGQLhN1/SiceqT7F58xoWBDlvn1X0lUcwEaLKInQyLOMKiKHJTmE5v8G/ByVJOoCgomDhURFAyAZcvZBCZdoo9JHtf4WaPWNCAG8UDlyMdeWoP375BpaOSIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtyDjaxQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399264; x=1745935264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TrVmpoQBnatVsTfMlrc5YFUnDB6w6aMg4DgIs4VWnjE=;
  b=YtyDjaxQ0z+P8CGBKa+XKkvtchHXh1NrCojCVHJpLs69LUcvvJEN2aiv
   s4FhhkHBE7EzkwClruAyk/BN1quMiYMCJ3UOJ3d+8Td873fejo0avKwal
   MnqEy5EouqP5lkngaZYFllzNBkwYJ0YOsE8TZda2vu1tZ6Yq2XwMjB7eC
   I5YtR3CVpNdNg70kaVxKxLcuz+nPZXyz5yNX0SEyy3s39cdgu4F5ZZN5b
   FK5iPn2kyNdXNw5dRmyt4zO4/KCobFDg4tqJkxbjcItnWfrmsPm5K9cZ8
   uKCvmYLsM+A+6SwAuTwRnPVG/2VV8YbX+32RJ3+4J+0su3hUHsPkDTd/E
   g==;
X-CSE-ConnectionGUID: 51CUKC2wRW+LwPgZDSNmSQ==
X-CSE-MsgGUID: Kj5+L36KSh+6HsEAlcRB8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911410"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911410"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:03 -0700
X-CSE-ConnectionGUID: QbBdeY62QlG999QONIFMqw==
X-CSE-MsgGUID: NlCoGLhLTuWiroUkGrUe2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521719"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:01 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/18] usb: xhci: improve debug message in xhci_ring_expansion_needed()
Date: Mon, 29 Apr 2024 17:02:31 +0300
Message-Id: <20240429140245.3955523-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Address debug message inaccuracies in xhci_ring_expansion_needed().
Specifically, remove the portion of the debug message that indicates the
number of enqueue TRBs to be added to the dequeue segment. This part of
the message may mislead and the calculated value is incorrect. Given that
this value is not of significant importance and the statement is not
consistently accurate, it has been omitted.

The specific issues with the debug message that this commit resolves:
- The calculation of the number of TRBs is incorrect. The current
  calculation erroneously includes the link TRB, which is reserved.
  Furthermore, the calculated number of TRBs can exceed the dequeue
  segment, resulting in a misleading debug message.

- The current phrasing suggests that "ring expansion by X is needed,
  adding X TRBs moves enqueue Y TRBs into the dequeue segment".
  The intended message, however, is "IF the ring is NOT expanded by X,
  THEN adding X TRBs moves enqueue Y TRBs into the dequeue segment".

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 575f0fd9c9f1..3cc5c70d54c7 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -351,10 +351,8 @@ static unsigned int xhci_ring_expansion_needed(struct xhci_hcd *xhci, struct xhc
 	while (new_segs > 0) {
 		seg = seg->next;
 		if (seg == ring->deq_seg) {
-			xhci_dbg(xhci, "Ring expansion by %d segments needed\n",
-				 new_segs);
-			xhci_dbg(xhci, "Adding %d trbs moves enq %d trbs into deq seg\n",
-				 num_trbs, trbs_past_seg % TRBS_PER_SEGMENT);
+			xhci_dbg(xhci, "Adding %d trbs requires expanding ring by %d segments\n",
+				 num_trbs, new_segs);
 			return new_segs;
 		}
 		new_segs--;
-- 
2.25.1


