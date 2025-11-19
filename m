Return-Path: <linux-usb+bounces-30720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64BC6F527
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D3780350D21
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39C236C0C2;
	Wed, 19 Nov 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBof9XOa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FF536A014
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562307; cv=none; b=B2ht0fV5Np4mIU0SM8MLZq+E9KnqRUAvOrcm/jT3AETKdd7X6RKHCgy7ErrgZBG79KDjpLmH4rc0/k6M5Gkj8Qh8OQfnYPsahCS6TS1zkjE1W27O+YZnB6kCQ+14yKE2NIkBIJayTVdECQkv4SuN18LJH1KpF7M3Ng1kSnV9DqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562307; c=relaxed/simple;
	bh=qJQ3oSBZBAPhRK/0zTtF0oboNw2pKhys4k20f19n4lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEj+ftj2pwY/VssPBNxPb9XlpAekY7gkX3cdcagyo4funKEl/UKWQmlBuR/wb4mdiBrYIzERVmOgmbLvQ5sSqf0LuQMVuGoCaYz9TEU/gmEGaGLs3HV6Bze5EgIHvdd2WBQdpb+IhynCupYwiSa8VbaND8bvPX8rebHAjQZ0v7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBof9XOa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562305; x=1795098305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJQ3oSBZBAPhRK/0zTtF0oboNw2pKhys4k20f19n4lA=;
  b=GBof9XOa+qyqlQ4925hAJjdzFUAxWdrYV1P5LB2gppbZClqr+VO3g7ct
   bkhLZQN3DQOSnLOQmrg6JBz22ZRjf1UYQV/O6uYeQmhuYyopjlFRzF3+i
   cv13seJNK0oxnWO2GAqe7Ose17J+FeZxCyrBoMzWLqtLa31UztPl7Tjwi
   lH+xX6dfZic6CW/qqYABX+SCKa53udm4VZd7KJOH7/889c0dyoY4ZtXSF
   /h2IjzpcpbP+WBgaiySrRvkBmHDDgikJH0S9a9c7UKQwQ2SWOlDu3rqXy
   JhugJnKCyvH0RrAaOX1Nq4+otYtu+mGmfx1japr09plyz6N1dPxhgOmR7
   Q==;
X-CSE-ConnectionGUID: H9rftX4PTzClZ9LyGCmjIQ==
X-CSE-MsgGUID: b2g/7hEaS8imCW8l0AFQYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645583"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:05 -0800
X-CSE-ConnectionGUID: KzkOuvrDQ4O+Yj3ydKMO2Q==
X-CSE-MsgGUID: SfQl8vOxSG6Lg0kIW6oDFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992176"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:03 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 19/23] usb: xhci: simplify Isochronous Scheduling Threshold handling
Date: Wed, 19 Nov 2025 16:24:13 +0200
Message-ID: <20251119142417.2820519-20-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The IST is represented by bits 2:0, with bit 3 indicating the unit of
measurement, Frames or Microframes. Introduce xhci_ist_microframes(),
which returns the IST value in Microframes, simplifying the code and
reducing duplication.

Improve documentation in xhci-caps.h to clarify the IST register specifics,
including the unit conversion details. These change removes the need to
explain it each time the IST values is retrieved.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
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
index 0ac7f9870d3d..104fd6f83265 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3961,6 +3961,16 @@ static unsigned int xhci_get_last_burst_packet_count(struct xhci_hcd *xhci,
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
@@ -3980,17 +3990,7 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
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
@@ -4311,9 +4311,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
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
2.43.0


