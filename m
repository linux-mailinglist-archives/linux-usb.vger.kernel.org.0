Return-Path: <linux-usb+bounces-17176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9129BE3D3
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0BA0288E5B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2751DD554;
	Wed,  6 Nov 2024 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBQ2TNle"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064421D5CFA
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887969; cv=none; b=H1CrFAjgOtEAV/lJ0/QganJKZg0D5gAvAG026aEXGx8Rq06g7bpAV5EV4C1gXzmbjXDBPebRK383VcujnC77iexA6kpifY9JbRjhtiTZ95o8h/41P2ZEII/xdLHA4K0shco/M6SO8qa4g0YuSYJATemijYHHbqDCnT50Lr25ukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887969; c=relaxed/simple;
	bh=b3kN85tiYxX17X3EwtdFsDL4rcqNRGlmb19y0lrOwgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S+9FndHQcArFBZtn/MDyb5xz/ZXoMiJjppOMlcbLIWVfJkJKWQ5uK3ZKQOWRDBVCH+JzfAL8V7jPnFTLX/p7iSFhdvF0quHlUtglcz0lnQTc2aqMFj8SAG9oJxwCTrlVyeDaexS58mbQVKzLVX6P5F0IKhsEulVoGIMyKdL0/YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBQ2TNle; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887968; x=1762423968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b3kN85tiYxX17X3EwtdFsDL4rcqNRGlmb19y0lrOwgs=;
  b=UBQ2TNlezynEfYNduFD+paaDkUJEFZSjfDoCjAGNCoUdjsH2HTTJ4wUr
   M3yM9tgF/088U66FzHAKWt41VpZKkjJjB5iHLsuZoCDKwLCJjVTEAOhuS
   tUbJp4v0/pWW3jc+EiGHsDIX8/SRMh9SZv/MCg4ZiTPBVpSyUbL6F7ctR
   FsLf4TGBwnEBqG4MBAxJe5bURTZNUh+Wxj4RGvfW7Bfzg00y5FWV48N1B
   GHUt55ms+KO8OxJpYXyOtM1jlhYigtWtPGj7SW9cZ0waVRXVw7Vx9KKvY
   nuKloDSnKC2gO7AYi9zxNtBvdpRT7k1yk+GtrBPcaRm+ueZGHp7PT2ff2
   w==;
X-CSE-ConnectionGUID: Beugch/BQ3u5OssWutHknw==
X-CSE-MsgGUID: gR7xgtJVTCGBO5J6ZKXRWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059369"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059369"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:47 -0800
X-CSE-ConnectionGUID: qjYJyucOQCOxU/iq85I7LA==
X-CSE-MsgGUID: c8ehvUV/S0mkuxPjuSdoBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84812912"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:46 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/33] xhci: Add Isochronous TRB fields to TRB tracer
Date: Wed,  6 Nov 2024 12:14:27 +0200
Message-Id: <20241106101459.775897-2-mathias.nyman@linux.intel.com>
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

In addition to Normal TRB fields the Isoch TRBs have a SIA flag,
Frame ID, TLBPC and TBC fields.

Add these fields to tracing output

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 55a81073cf1e..7d81645c2c5d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1023,9 +1023,6 @@ enum xhci_setup_dev {
 /* Interrupter Target - which MSI-X vector to target the completion event at */
 #define TRB_INTR_TARGET(p)	(((p) & 0x3ff) << 22)
 #define GET_INTR_TARGET(p)	(((p) >> 22) & 0x3ff)
-/* Total burst count field, Rsvdz on xhci 1.1 with Extended TBC enabled (ETE) */
-#define TRB_TBC(p)		(((p) & 0x3) << 7)
-#define TRB_TLBPC(p)		(((p) & 0xf) << 16)
 
 /* Cycle bit - indicates TRB ownership by HC or HCD */
 #define TRB_CYCLE		(1<<0)
@@ -1059,6 +1056,12 @@ enum xhci_setup_dev {
 /* Isochronous TRB specific fields */
 #define TRB_SIA			(1<<31)
 #define TRB_FRAME_ID(p)		(((p) & 0x7ff) << 20)
+#define GET_FRAME_ID(p)		(((p) >> 20) & 0x7ff)
+/* Total burst count field, Rsvdz on xhci 1.1 with Extended TBC enabled (ETE) */
+#define TRB_TBC(p)		(((p) & 0x3) << 7)
+#define GET_TBC(p)		(((p) >> 7) & 0x3)
+#define TRB_TLBPC(p)		(((p) & 0xf) << 16)
+#define GET_TLBPC(p)		(((p) >> 16) & 0xf)
 
 /* TRB cache size for xHC with TRB cache */
 #define TRB_CACHE_SIZE_HS	8
@@ -2072,7 +2075,6 @@ static inline const char *xhci_decode_trb(char *str, size_t size,
 				field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_NORMAL:
-	case TRB_ISOC:
 	case TRB_EVENT_DATA:
 	case TRB_TR_NOOP:
 		snprintf(str, size,
@@ -2089,7 +2091,25 @@ static inline const char *xhci_decode_trb(char *str, size_t size,
 			field3 & TRB_ENT ? 'E' : 'e',
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
-
+	case TRB_ISOC:
+		snprintf(str, size,
+			"Buffer %08x%08x length %d TD size/TBC %d intr %d type '%s' TBC %u TLBPC %u frame_id %u flags %c:%c:%c:%c:%c:%c:%c:%c:%c",
+			field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
+			GET_INTR_TARGET(field2),
+			xhci_trb_type_string(type),
+			GET_TBC(field3),
+			GET_TLBPC(field3),
+			GET_FRAME_ID(field3),
+			field3 & TRB_SIA ? 'S' : 's',
+			field3 & TRB_BEI ? 'B' : 'b',
+			field3 & TRB_IDT ? 'I' : 'i',
+			field3 & TRB_IOC ? 'I' : 'i',
+			field3 & TRB_CHAIN ? 'C' : 'c',
+			field3 & TRB_NO_SNOOP ? 'S' : 's',
+			field3 & TRB_ISP ? 'I' : 'i',
+			field3 & TRB_ENT ? 'E' : 'e',
+			field3 & TRB_CYCLE ? 'C' : 'c');
+		break;
 	case TRB_CMD_NOOP:
 	case TRB_ENABLE_SLOT:
 		snprintf(str, size,
-- 
2.25.1


