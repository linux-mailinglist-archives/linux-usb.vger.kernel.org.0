Return-Path: <linux-usb+bounces-30482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 567ADC5781D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 13:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2FC88353196
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD865350A15;
	Thu, 13 Nov 2025 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APZ+fbgi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F6734FF7D
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038742; cv=none; b=jESJkiBjg3JIAJKVsehVpJ+vt7KVv9XgUigNR9r8daAo0HMVTFjudTm6cmt16r2h9E7OiRQPxaZumJXLPIP+21Gi8C9SrvditVE2Y9cceFkhqcTyBVpUh5NSF+G6tm3gM1MczO1T346u4IUl2q6J7ugRQ1PLZRCci4u1iL7w1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038742; c=relaxed/simple;
	bh=oQ5EUSqOZG4R3pUMbL7n4qkaHbZ/F2Cxrfy1JQC86kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWsskLUtwjUSClSEP4IOUd2iGR5ZC1wL0/dUXXqc7F5JYw4rFs+KcjRztl+hDijO96pjvOsmloluFX1ajLMuw30KgwMmL/5wUcTxhjZBxV5EuJmKLjTHjUdIXenNrE2fsR6Hh2ZqO16rbMCNobjDvMbZOXct1jLgPNr3Bik/m6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APZ+fbgi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038741; x=1794574741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQ5EUSqOZG4R3pUMbL7n4qkaHbZ/F2Cxrfy1JQC86kE=;
  b=APZ+fbgiCMsmSBFQfZne7CSrM32PVeHRctewSkg70kkp1cO7Ee6yyl5I
   QfCCUmDn20zW5+COvgmR/I+fwu9OPiJo0fvQ36CJVashmLE89ZiIWCRGc
   J8pDaQA07PXqP8S12P47FN5EgfLsPHwXM+J8MQdPyowr0euInRbZNX7/e
   43FX7f+nm7XN7uSXG0LUfG0kBuK2LRiYVRkizQECCUM62BikA6zkjajfa
   zZ/EnNtbIhzTjZkc4UjY+cbYs5cl0hVy0iZ1J7AZfuzWziYt7A857baCh
   Zbyb9SH4Rmb/l26d5OUB9m2vzNkcri7dr7KnK7yMr0wJLrRg/jA+3h9C0
   A==;
X-CSE-ConnectionGUID: 29K3ONRoSGC8LgTKoHvRfQ==
X-CSE-MsgGUID: rSsAh7vYSaiLD8uCW64tXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150395"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150395"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:58:58 -0800
X-CSE-ConnectionGUID: xQQa/ht1SlWjYLakoL3LJw==
X-CSE-MsgGUID: IZ2kHtKISRe2oPZn1eZtJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673828"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:58:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id ADF1897; Thu, 13 Nov 2025 13:58:56 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 03/13] usb: xhci: use cached HCSPARAMS1 value
Date: Thu, 13 Nov 2025 13:56:30 +0100
Message-ID: <20251113125640.2875608-4-niklas.neronin@linux.intel.com>
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

The Structural Parameters 1 (HCSPARAMS1) register is read and cached in
'xhci->hcs_params1' during host controller initialization. Since this
register is read-only and its value remains constant for the lifetime of
the controller, re-reading it later is unnecessary.

Replace subsequent register reads with the cached 'xhci->hcs_params1'
value to avoid redundant MMIO access.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 42975df517cb..0630269e5ab7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4222,8 +4222,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		xhci_err(xhci, "Error while assigning device slot ID: %s\n",
 			 xhci_trb_comp_code_string(command->status));
 		xhci_err(xhci, "Max number of devices this xHCI host supports is %u.\n",
-				HCS_MAX_SLOTS(
-					readl(&xhci->cap_regs->hcs_params1)));
+			 HCS_MAX_SLOTS(xhci->hcs_params1));
 		xhci_free_command(xhci, command);
 		return 0;
 	}
-- 
2.50.1


