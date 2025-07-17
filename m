Return-Path: <linux-usb+bounces-25900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E67B086C8
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 09:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4671A655C2
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 07:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C4B264608;
	Thu, 17 Jul 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehfKBkTP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E942627F9
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737486; cv=none; b=l7r3l6Rq8ga9M1zEduAr2/maIUeVr1OYjBreNPJtU4n7IrzHzSw83g7PGzx6D/V9AB1oa41yPkEGcBMtjifylXdsI8zxvQNJpzb3PWgNoLhb9+qCyLFsXwB7rsPTLWfe7YlJGMhrVqQEpvNwjCQ4ERxSoROMUSxiX2rFCxVHLXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737486; c=relaxed/simple;
	bh=huzgp7VnvkibGSXYOexuMJotgEAwfQRytZzVS1xD+1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGbWpe53Ju+PTxgjyN2MuVaTGwm9tvp9tnq0NbniBXIR9kzsxfQ5e5XL17Ev4wlToKu4Ay/gq3LQpL3/FN/neI+6uP2yhxd+n+wlnc+8Cp6lhImpewCrpoUg9u0Bl2G4tFkYACp33knp6j1O2k2nNCa9CQ5vurnGG44kiprDOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehfKBkTP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752737484; x=1784273484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=huzgp7VnvkibGSXYOexuMJotgEAwfQRytZzVS1xD+1c=;
  b=ehfKBkTPTYK0K7FthwCrUY6jWv70LShvhJeckTON1RGgRUPrTenxo3te
   JuKSB7eGTM23E8SzzFQfLM0N1hRyxlBOK0IxIYQXWjJ511QfmAi0mbD4j
   MN29g+PYaSNgyuPRqQNDkcC6ZDB0kmomRrf9fDMbHSzpdySEJMlJlagh1
   ssXM7TglKVOs4Ums3AR7LPCZIB+DolF0VNYmVSYrH1+cClIP6oNGkjMKK
   /QvBf9BA/wS+Y8vNNbLeBWGaGUHiM771Hilw1C+/Vx7rdmNow0MZhd4L7
   kePfw2ry9+RNS5woL1FHY5eV7tlnu4PkaQ8x0/6kd1rn4yb0ejGj4dDhw
   Q==;
X-CSE-ConnectionGUID: +wbWmQWERkqzzqvhdwrXZA==
X-CSE-MsgGUID: 97+Si2BLQ4GwDa2EYtzPDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80449330"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="80449330"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 00:31:24 -0700
X-CSE-ConnectionGUID: u5moNuL2SY2WzhVn2XJZig==
X-CSE-MsgGUID: ZST69JuNQNG/9oa7Vy7MWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="188721574"
Received: from ettammin-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.50])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2025 00:31:22 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/3] usb: xhci: Avoid showing warnings for dying controller
Date: Thu, 17 Jul 2025 10:31:06 +0300
Message-ID: <20250717073107.488599-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717073107.488599-1-mathias.nyman@linux.intel.com>
References: <20250717073107.488599-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

When a USB4 dock is unplugged from a system it won't respond to ring
events. The PCI core handles the surprise removal event and notifies
all PCI drivers. The XHCI PCI driver sets a flag that the device is
being removed, and when the device stops responding a flag is also
added to indicate it's dying.

When that flag is set don't bother to show warnings about a missing
controller.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8a819e853288..47151ca527bf 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -121,7 +121,8 @@ int xhci_halt(struct xhci_hcd *xhci)
 	ret = xhci_handshake(&xhci->op_regs->status,
 			STS_HALT, STS_HALT, XHCI_MAX_HALT_USEC);
 	if (ret) {
-		xhci_warn(xhci, "Host halt failed, %d\n", ret);
+		if (!(xhci->xhc_state & XHCI_STATE_DYING))
+			xhci_warn(xhci, "Host halt failed, %d\n", ret);
 		return ret;
 	}
 
@@ -180,7 +181,8 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 	state = readl(&xhci->op_regs->status);
 
 	if (state == ~(u32)0) {
-		xhci_warn(xhci, "Host not accessible, reset failed.\n");
+		if (!(xhci->xhc_state & XHCI_STATE_DYING))
+			xhci_warn(xhci, "Host not accessible, reset failed.\n");
 		return -ENODEV;
 	}
 
-- 
2.43.0


