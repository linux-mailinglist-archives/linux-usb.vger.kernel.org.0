Return-Path: <linux-usb+bounces-25901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E2B086C5
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 09:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6FA11A65552
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 07:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53C8264F81;
	Thu, 17 Jul 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBju5dhJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7D42620FC
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737487; cv=none; b=Svee31Vz3H8xbusFnmKk7EoyhpW5+N9bJiSNInbEhsZEh+rHXbjJby3rHaw8YsN9ZAUuGTrTxWv/ttUl+bgSqwFsS4Cjm7cDG/6QkpiltaHAeJc2IkW9kr1MnlolrrTvHF9G/uvyJOAPqqKjP+qH/Y5tQO7VDDrzQf+7nwjRjJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737487; c=relaxed/simple;
	bh=71B2NSEmCqPp3DAlljv7QdsHS2AXGvd3EmmA8eC56z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyDmgwRe3qJU5bZA5fghRCCnway4xn153dWrhUFybb41W4IxxgrSRsBe+e6EeaW394OqeRSH5EHhXb1Oc4r+ZQ7um/1GRi6LywdQSs3YvYjhcwJKxq3JM9KpguJPYIwVUtMr8TwSyxnJqWfCeiOMchpoySCvqF+LdaXbIHvxXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBju5dhJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752737484; x=1784273484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=71B2NSEmCqPp3DAlljv7QdsHS2AXGvd3EmmA8eC56z4=;
  b=OBju5dhJILQRW95XkEISmsIY4B9Mbe3EqgC0X7brYLoySyQSuCO5MLaT
   L9tl+lxvvybJDLB4DhvtVA9AW27cFWHjsoJmbpx/c8AsKVCF6f3qD51Sa
   K1Nh+oacw8A7vulb+UpyS5eQU8mMucw19ScA16ReHa+86B4C7uipRgMLP
   03NXvjKXXT19RYaS6QYysjbMQBbI7AqGSy+3nZW/dZBO+B8FQlhwHD6Uk
   1qlKSojsW9ANbNtXxFqgFhhcBHwRKsO4XMgGSUzyVR2j7wi9c9CiIvRLF
   QnNvJyo745jkjys4Z0EeB3kqw1JgMUEJwBnjtHW/uFSjSGGmjCf3IgWGc
   Q==;
X-CSE-ConnectionGUID: pDma13KxTCyxMKngXvB0AQ==
X-CSE-MsgGUID: yiP9JIK7TSyjYrfnOOu6gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80449325"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="80449325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 00:31:22 -0700
X-CSE-ConnectionGUID: CUERMOStS02eUPB1xluIPg==
X-CSE-MsgGUID: 076R/7VGSLyorjs/irvAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="188721573"
Received: from ettammin-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.50])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2025 00:31:21 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/3] usb: xhci: Avoid showing errors during surprise removal
Date: Thu, 17 Jul 2025 10:31:05 +0300
Message-ID: <20250717073107.488599-2-mathias.nyman@linux.intel.com>
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
being removed as well.

When that flag is set don't show messages in the cleanup path for
marking the controller dead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 94c9c9271658..2b7415dd4170 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1376,12 +1376,15 @@ static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci,
  */
 void xhci_hc_died(struct xhci_hcd *xhci)
 {
+	bool notify;
 	int i, j;
 
 	if (xhci->xhc_state & XHCI_STATE_DYING)
 		return;
 
-	xhci_err(xhci, "xHCI host controller not responding, assume dead\n");
+	notify = !(xhci->xhc_state & XHCI_STATE_REMOVING);
+	if (notify)
+		xhci_err(xhci, "xHCI host controller not responding, assume dead\n");
 	xhci->xhc_state |= XHCI_STATE_DYING;
 
 	xhci_cleanup_command_queue(xhci);
@@ -1395,7 +1398,7 @@ void xhci_hc_died(struct xhci_hcd *xhci)
 	}
 
 	/* inform usb core hc died if PCI remove isn't already handling it */
-	if (!(xhci->xhc_state & XHCI_STATE_REMOVING))
+	if (notify)
 		usb_hc_died(xhci_to_hcd(xhci));
 }
 
-- 
2.43.0


