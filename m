Return-Path: <linux-usb+bounces-30483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 64414C57823
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 13:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3420A35319D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D994B350A18;
	Thu, 13 Nov 2025 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAspiXQ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73B235029B
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038742; cv=none; b=ZnFPdPx9Yh+IuxSV2s4Jn2Z9ur9pEADPZugudEYN/lS5RHcgeXn8zGoyC+7FnKqV4oG/YgDnhpyhohcjppOtbogFf52eATDY4xl5YM2q0Xu+Ch7Nu3gOayBBes/d0FUpZoecPEednHq7XcZtguBihRNKGkspzKEaZfFamF7BIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038742; c=relaxed/simple;
	bh=N12cmv/mOsCV9Hff6gdQCo6RzosiUwxBU/0VmpKCrmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFqXXqRn0hZlazBBZICAO7I+YIMnmgM62qfApY2szA+h95RuH9P1kCfbDr7GhB3HT+fO7pEdrinUBjfkOD1re/0EK6o+EZPJd5lQUbsKxUW6wDPJfr6bbmGHfBD9RZOCoeG+qjYV77L0bSySUqPLiZLvx7IoIzhaIcuJptMB05k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAspiXQ9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038741; x=1794574741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N12cmv/mOsCV9Hff6gdQCo6RzosiUwxBU/0VmpKCrmA=;
  b=QAspiXQ9jVtVHcKkDZWR9S+vfRdvjXWdHq0nG8Ekr63Ve+5K0UEg6Otc
   SagZvw/3qUGzcySaBTbziTVtI00CZqiOaHDisHGIQvSxV722c1akR+jtg
   AySD+R7ihBpLp4tIVnu3ns+gJbSbGcXdu4N9z8eHBJNKdjHC5gac6cNOa
   x9VY8Lfrd+cxFAnzBvUqpW0VqY3QBZKeP4YNEsHIzwKmdiB8R6ITOEs10
   FScgJ7cJfPtD3DaLoAPqznfipOQ09RB8aevK+e59lUi9LO5ygtDG0+SHa
   F1ajUDHSRYN83wJBoxEMUlWSs29tDEU/rN+lPzUhrBi5KxJjFXhUeKqJk
   A==;
X-CSE-ConnectionGUID: im9RkwVvQXiV4bGCAy4wog==
X-CSE-MsgGUID: E/HVPYs1SDOs88V1w2Gnmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150399"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:58:59 -0800
X-CSE-ConnectionGUID: v+R5TvUGT+C1eXkO+L+D6A==
X-CSE-MsgGUID: 6koXomtNTRKXnCOUYW232Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673831"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:58:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 620E499; Thu, 13 Nov 2025 13:58:57 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 05/13] usb: xhci: limit number of ports to 127
Date: Thu, 13 Nov 2025 13:56:32 +0100
Message-ID: <20251113125640.2875608-6-niklas.neronin@linux.intel.com>
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
index d74f47a75c68..5eb3ea0d9e15 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5436,7 +5436,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
 	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
-	xhci->max_ports = HCS_MAX_PORTS(hcs_params1);
+	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
 	if ((!xhci->max_interrupters) || xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
 		xhci->max_interrupters = HCS_MAX_INTRS(hcs_params1);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index acf52112ab4c..e68bf547f90b 100644
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
2.50.1


