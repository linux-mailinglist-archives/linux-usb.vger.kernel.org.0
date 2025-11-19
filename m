Return-Path: <linux-usb+bounces-30716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E86D6C6F677
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7F914F969A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE8E36A02F;
	Wed, 19 Nov 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C41ga8lB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7836A014
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562303; cv=none; b=CqKaYL21M+i+ekD5/Z9T9U95ceR1T5B04c5DlD5Iqg052qnfsK7DRo4ZfDhaI1nI0YTDpJuta/jKkyOkAuy0Ii4cPslrn0zr2WGNNp610YiRbv/gcfm3BNKXcomLDUXV17plSwgIGRvfF4BPL1jTDRjOXx9lzDZd4c31zqrwuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562303; c=relaxed/simple;
	bh=vqkReJUUNEwoWUIYCv6XAkbYMNFUwl4psp7lOTxqsr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VajpYK2vK0FsHkrB1MC6cORtHy02Ym81y94VFY8DNVva8J1aDDy72bCfRbgWAYzF6zPi4DKhIOGxKP3InAr83h6tgihOiDI/7XeNBpwQy2Udjge73iyAMHIqHG5T7ynUlSDxigzTD8BrPCInATz3/LUAok5cgKrG7E54cpJgfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C41ga8lB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562302; x=1795098302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vqkReJUUNEwoWUIYCv6XAkbYMNFUwl4psp7lOTxqsr8=;
  b=C41ga8lB+yQrD1BHerezbWsHEh7RDK1OVfRULbJ0rDnQrwLetMxYNAgD
   5IUE27Gv0IYGODBN2tLLf6lVhr9m3EgLe+/tugAImQjqGdnQm1Hrzyx6f
   kPkl8iLr8NSCMgqWmqDuUw7mLdoNebomqPSHsBkk72ghrN98RItX/IsK9
   YTsE7PVZjX6b90zM+vkvm6pCSEZNozd6SQr5LytLtmt7ULDam9pVazCHG
   DzwDPhp0UuMc7/ALw5PPttbZauLLUFAFhOh/ZFReEm5eliYgzpxRGSHgJ
   R5nu8YsX2kkbb3kSR1oJScnVfyO23fOFH3GZogQ7RPZZ66bTJr61fXVxi
   A==;
X-CSE-ConnectionGUID: 59x6EGRGQd6JZ0FKz+HQ6w==
X-CSE-MsgGUID: 2iVeY3BDS0SC3Nt91xH6EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645570"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645570"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:00 -0800
X-CSE-ConnectionGUID: EwTCTEomRzu6B/HME8cJQw==
X-CSE-MsgGUID: +rC97H8gRZqk0JsnKyiEug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992123"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:59 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/23] usb: xhci: limit number of ports to 127
Date: Wed, 19 Nov 2025 16:24:10 +0200
Message-ID: <20251119142417.2820519-17-mathias.nyman@linux.intel.com>
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

The xHCI driver allocates various port-related structures based on the
maximum number of ports reported by the controller. The Number of Ports
(MaxPorts) field occupies bits 31:24 of the HCSPARAMS1 register and can
represent values up to 255. However, the 'HCS_MAX_PORTS()' macro currently
reads bits 30:24, effectively limiting the maximum to 127.

Fixing the macro increases the reported port limit to 255, which in turn
increases memory usage regardless of how many ports are actually used.

To maintain compatibility and control memory consumption, set
'xhci->max_ports' to the minimum of the value read from 'HCS_MAX_PORTS()'
and 127 (MAX_HC_PORTS). This preserves the existing limit while making
the restriction explicit and easier to adjust in the future.

Summary:
 * Port allocations are now limited to 127.
 * HC max ports macro now correctly reads the MaxPorts value.
 * Macro 'MAX_HC_PORTS' can be modified to set the port limit.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 4 ++--
 drivers/usb/host/xhci.c      | 2 +-
 drivers/usb/host/xhci.h      | 5 ++++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 89bc83e4f1eb..8390c969389e 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -12,8 +12,8 @@
 #define HCS_SLOTS_MASK		0xff
 /* bits 8:18, Max Interrupters */
 #define HCS_MAX_INTRS(p)	(((p) >> 8) & 0x7ff)
-/* bits 24:31, Max Ports - max value is 0x7F = 127 ports */
-#define HCS_MAX_PORTS(p)	(((p) >> 24) & 0x7f)
+/* bits 31:24, Max Ports - max value is 255 */
+#define HCS_MAX_PORTS(p)	(((p) >> 24) & 0xff)
 
 /* HCSPARAMS2 - hcs_params2 - bitmasks */
 /* bits 0:3, frames or uframes that SW needs to queue transactions
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ad5ef294d4f3..cb82b15fc203 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5448,7 +5448,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
 	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
-	xhci->max_ports = HCS_MAX_PORTS(hcs_params1);
+	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
 	if ((!xhci->max_interrupters) || xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
 		xhci->max_interrupters = HCS_MAX_INTRS(hcs_params1);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index fface54dbc7a..e04bc491a22b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -34,7 +34,10 @@
 
 /* Max number of USB devices for any host controller - limit in section 6.1 */
 #define MAX_HC_SLOTS		256
-/* Section 5.3.3 - MaxPorts */
+/*
+ * Max Number of Ports. xHCI specification section 5.3.3
+ * Valid values are in the range of 1 to 255.
+ */
 #define MAX_HC_PORTS		127
 
 /*
-- 
2.43.0


