Return-Path: <linux-usb+bounces-30486-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C4C57832
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 13:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C97E5352E46
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C97351FA2;
	Thu, 13 Nov 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrtN5IvV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6C350A13
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038744; cv=none; b=SkquF6xJbA7pX3gskr3/+ez9iO70iXz4ZZhuAkPfVSTsq+dSu/+rfw7+Li+H35HISb9Wa2kOJzlG/rSFyiwr9w4o0Y+LxS0Dgid0b32TQ4DyU/ZZnOhKGtkWPhvMyNWoX/YpUcpH+1lXudsbyMuz9w+Tw0W3zpqtsGWK5sJhEy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038744; c=relaxed/simple;
	bh=XJ70WbM/oGpSIVoy93OppyHrmb4AjxQYqTb+ZkKiQ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVOgEN0XvvTZGpLh3D88nh45ExGKzg/FX9u7I6nHkqP2WhDGW4GFyeP89ZQgKpSBuBH6acA8ey95+19eJeUl2SUI6dS5tqwk/8xm7JQsEQeApy1y8ZV8DXl/9XI3B8PLN3vYjUKHA0S4redx1a1BWLDxhsiQQBR+wmg9g4oMcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrtN5IvV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038743; x=1794574743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XJ70WbM/oGpSIVoy93OppyHrmb4AjxQYqTb+ZkKiQ/8=;
  b=WrtN5IvVyrl8ZpfCe6MHx+yKCRtSuLp+CiLozf78yK3ZyWsSeZ/JEEN5
   XKESS+vOWsePYvN4ecM91Cs3qOCD1A1N36KcRHYKDe12BygGcmBoczDwP
   1gqSRAtP6dHLbAVm+t6g20IyL5lTFWbH2c2RbmvkS2r9OaEAej5ZarFMa
   A17hh/TmrCYZpiBluHXE1/NNM/5em9rChsmtmSpR/SK8JsneHIu9WSSPF
   B/p+N9TeD5ISlxRwS9KejT8XXCJgYoEz70AZDj710VXNk2YOH184DlLcs
   TKULXyS0EV2haITsDgFdqm8Ag4MqTSs2kz/d+XP+8ZR+XZ9ZK+lliHYyq
   Q==;
X-CSE-ConnectionGUID: s8RAvxu/QX6sEDQFUFapiA==
X-CSE-MsgGUID: eT+MMCYCRcuf+3g+zMcekw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150406"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150406"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:59:00 -0800
X-CSE-ConnectionGUID: pnn63Sx3TH2U+Q/gpSZdJQ==
X-CSE-MsgGUID: 7/NeA1P2RhGpH0xqH21vlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673838"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:58:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 8B83796; Thu, 13 Nov 2025 13:58:58 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 08/13] usb: xhci: simplify Isochronous Scheduling Threshold handling
Date: Thu, 13 Nov 2025 13:56:35 +0100
Message-ID: <20251113125640.2875608-9-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
References: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IST is represented by bits 2:0, with bit 3 indicating the unit of
measurement, Frames or Microframes. Introduce xhci_ist_microframes(),
which returns the IST value in Microframes, simplifying the code and
reducing duplication.

Improve documentation in xhci-caps.h to clarify the IST register specifics,
including the unit conversion details. These change removes the need to
explain it each time the IST values is retrieved.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
v2:
 * Change xhci_ist_in_microseconds() argument to 'xhci'.
 * Rename xhci_ist_in_microseconds() to xhci_ist_microframes().

 drivers/usb/host/xhci-caps.h |  9 ++++++++-
 drivers/usb/host/xhci-ring.c | 26 ++++++++++++--------------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 8a435786f950..e772d5f30d36 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -24,8 +24,15 @@
 /*
  * bits 3:0 - Isochronous Scheduling Threshold, frames or uframes that SW
  * needs to queue transactions ahead of the HW to meet periodic deadlines.
+ * - Bits 2:0: Threshold value
+ * - Bit 3: Unit indicator
+ *   - '1': Threshold in Frames
+ *   - '0': Threshold in Microframes (uframes)
+ * Note: 1 Frame = 8 Microframes
+ * xHCI specification section 5.3.4.
  */
-#define HCS_IST(p)		(((p) >> 0) & 0xf)
+#define HCS_IST_VALUE(p)	((p) & 0x7)
+#define HCS_IST_UNIT(p)		((p) & (1 << 3))
 /* bits 7:4 - Event Ring Segment Table Max, 2^(n) */
 #define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
 /* bits 20:8 - Rsvd */
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5f46661c8e6b..6ea0ae27617e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3983,6 +3983,16 @@ static unsigned int xhci_get_last_burst_packet_count(struct xhci_hcd *xhci,
 	return total_packet_count - 1;
 }
 
+/* Returns the Isochronous Scheduling Threshold in Microframes. 1 Frame is 8 Microframes. */
+static int xhci_ist_microframes(struct xhci_hcd *xhci)
+{
+	int ist = HCS_IST_VALUE(xhci->hcs_params2);
+
+	if (HCS_IST_UNIT(xhci->hcs_params2))
+		ist *= 8;
+	return ist;
+}
+
 /*
  * Calculates Frame ID field of the isochronous TRB identifies the
  * target frame that the Interval associated with this Isochronous
@@ -4002,17 +4012,7 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
 	else
 		start_frame = (urb->start_frame + index * urb->interval) >> 3;
 
-	/* Isochronous Scheduling Threshold (IST, bits 0~3 in HCSPARAMS2):
-	 *
-	 * If bit [3] of IST is cleared to '0', software can add a TRB no
-	 * later than IST[2:0] Microframes before that TRB is scheduled to
-	 * be executed.
-	 * If bit [3] of IST is set to '1', software can add a TRB no later
-	 * than IST[2:0] Frames before that TRB is scheduled to be executed.
-	 */
-	ist = HCS_IST(xhci->hcs_params2) & 0x7;
-	if (HCS_IST(xhci->hcs_params2) & (1 << 3))
-		ist <<= 3;
+	ist = xhci_ist_microframes(xhci);
 
 	/* Software shall not schedule an Isoch TD with a Frame ID value that
 	 * is less than the Start Frame ID or greater than the End Frame ID,
@@ -4333,9 +4333,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 * Round up to the next frame and consider the time before trb really
 	 * gets scheduled by hardare.
 	 */
-	ist = HCS_IST(xhci->hcs_params2) & 0x7;
-	if (HCS_IST(xhci->hcs_params2) & (1 << 3))
-		ist <<= 3;
+	ist = xhci_ist_microframes(xhci);
 	start_frame += ist + XHCI_CFC_DELAY;
 	start_frame = roundup(start_frame, 8);
 
-- 
2.50.1


