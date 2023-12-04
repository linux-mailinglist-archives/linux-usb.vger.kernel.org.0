Return-Path: <linux-usb+bounces-3666-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E533F8030D6
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CA901C20A84
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CE422EF7;
	Mon,  4 Dec 2023 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6FxOANN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9307F2
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686681; x=1733222681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=894Vsxx0y1Q10HLL7y3coEcqiF1gDHzFItD8bLrT3ps=;
  b=V6FxOANN7Oadb4qexGAd0AP2W0vRExNpxnnD9rCP39OiPbJwVSx77qi5
   N1COFI6p9hcxSV7mA9rjUA5/oZwRC9JCoZAMr8JJiYgJjOMpPKQOWmNmH
   L7OoALBK3XhBhtGMX7Jh5oXRBWiDwusUmzoPIwmQNvWom3pKRO/Hm7eeD
   lE9XwpR/MNzVZ24iCu2NmaDfRUB0Nxfp4bQs+1DXorgPf9MG7OUm0QFOE
   hl4ggzzxVjAKtbZiy5g5Jj5MPjlYPOqj5nhAwWSKH8vRjPsMaczGfJS3d
   gn87PlqkP9knvackV5XonjOP7B5Twu909D21WjjN2W+fdYGlGeUlc2RBN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260668"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260668"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338945"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338945"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:38 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 10/18] xhci: check if legacy irq is available before using it as fallback
Date: Mon,  4 Dec 2023 12:45:26 +0200
Message-Id: <20231204104534.1335903-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
References: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Move the error check "No MSI-X/MSI found and no IRQ in BIOS" inside
'goto legacy'. It is better to check if the IRQ interrupt is available,
before trying to add a handler. Additionally the aforementioned error
message is much more clear.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 95ed9404f6f8..7f2b1312e943 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -228,12 +228,12 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 		return 0;
 	}
 
+legacy_irq:
 	if (!pdev->irq) {
 		xhci_err(xhci, "No msi-x/msi found and no IRQ in BIOS\n");
 		return -EINVAL;
 	}
 
- legacy_irq:
 	if (!strlen(hcd->irq_descr))
 		snprintf(hcd->irq_descr, sizeof(hcd->irq_descr), "%s:usb%d",
 			 hcd->driver->description, hcd->self.busnum);
-- 
2.25.1


