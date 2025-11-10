Return-Path: <linux-usb+bounces-30293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D130CC477DA
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFD711887D78
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113D1248F7C;
	Mon, 10 Nov 2025 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZUQNQeD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF2B23D2B2
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787720; cv=none; b=Qr76T76xohSzHsR9Soa8zpVZZriA4tumeWS/Kfr+zjtiMSdNEsD0cD/Czs3SntuNPwrmDkB2CLCWSlEWjE2QzILqFCUyPjIgph3c9qUph1/+yQkdMK4hFeN6E+8vs/jUaEYacqY0S3I5k4p36EIL0BoUT3XyeVWNwbZuVlZ0MyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787720; c=relaxed/simple;
	bh=QOTfyOmcK+NFw89uWjc+aAA0VRuVkcsZBvq9mx8Jg4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txhDDgF5btVQkqYmsCAn8ll9y2cl44z+eJhcT5HDZAbM51fgq9f0uMOLYcm2i/raIZAqGDu2MuH4iTlAckbhfxOGZtOMtjhO6r4xhY2uYfl7AOcbbcXSZDC1laOcT+oe5WfgqOme7bkXlsQbQbyVmC2z5jCdHeBlWzkb/CUXRLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZUQNQeD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787719; x=1794323719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QOTfyOmcK+NFw89uWjc+aAA0VRuVkcsZBvq9mx8Jg4A=;
  b=TZUQNQeD1fjuksLD4LyONzhFv/hDhSaGjhLT5EnUiSK1eGjqTMdSJVU4
   6XMnPkAWSEPqEQ0Opd2o+ZZgoK33wl3pkfvU7ym9SFGyBhiLQVcNJgESW
   RdyNqo4kLQXS4j75NiAF71Oo5Rv/xNY1RWNY01arP/xsshvC9j64E+Mn9
   EeFqvzKaFgZ2bWN+Mz1hqJ0525GYKzgOcv/edpwom2sjrkNRqctRi48gF
   FZtGzG6glIR4uE+7YRKLWFahGVYlErMLW+Nay4j75gNOPq9XDG5x1u2ha
   BzpYVrMgBoeHlHI9EK7oH2mu66z+iteYSfNHxhR/14/EMAOA1zO8Yx4mv
   A==;
X-CSE-ConnectionGUID: TGQUKuhPRyOkhx3Q97UeVw==
X-CSE-MsgGUID: TApzHSpARrWBonOFWb6Azw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76185479"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="76185479"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:18 -0800
X-CSE-ConnectionGUID: xC3i6JtWQKSYWeBuJMmNaA==
X-CSE-MsgGUID: OjhEsv6/SX6YkfZNyCdlLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192954239"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 07:15:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 75AF796; Mon, 10 Nov 2025 16:15:17 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 08/13] usb: xhci: simplify Isochronous Scheduling Threshold handling
Date: Mon, 10 Nov 2025 16:14:45 +0100
Message-ID: <20251110151450.635410-9-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
References: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IST is represented by bits 2:0, with bit 3 indicating the unit of
measurement, Frames or Microframes. Introduce xhci_ist_in_microseconds(),
which returns the IST value in Microframes, simplifying the code and
reducing duplication.

Improve documentation in xhci-caps.h to clarify the IST register specifics,
including the unit conversion details. These change removes the need to
explain it each time the IST values is retrieved.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
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
index 5f46661c8e6b..7b7c61d79d0a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3983,6 +3983,16 @@ static unsigned int xhci_get_last_burst_packet_count(struct xhci_hcd *xhci,
 	return total_packet_count - 1;
 }
 
+/* Returns the Isochronous Scheduling Threshold in Microframes. 1 Frame is 8 Microframes. */
+static int xhci_ist_in_microseconds(u32 hcs_params2)
+{
+	int ist = HCS_IST_VALUE(hcs_params2);
+
+	if (HCS_IST_UNIT(hcs_params2))
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
+	ist = xhci_ist_in_microseconds(xhci->hcs_params2);
 
 	/* Software shall not schedule an Isoch TD with a Frame ID value that
 	 * is less than the Start Frame ID or greater than the End Frame ID,
@@ -4333,9 +4333,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 * Round up to the next frame and consider the time before trb really
 	 * gets scheduled by hardare.
 	 */
-	ist = HCS_IST(xhci->hcs_params2) & 0x7;
-	if (HCS_IST(xhci->hcs_params2) & (1 << 3))
-		ist <<= 3;
+	ist = xhci_ist_in_microseconds(xhci->hcs_params2);
 	start_frame += ist + XHCI_CFC_DELAY;
 	start_frame = roundup(start_frame, 8);
 
-- 
2.50.1


