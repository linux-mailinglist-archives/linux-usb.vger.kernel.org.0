Return-Path: <linux-usb+bounces-3558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5469800DF2
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1207E1C2132D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F734A9A4;
	Fri,  1 Dec 2023 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ie9oTb3c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F060F170E
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443161; x=1732979161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=894Vsxx0y1Q10HLL7y3coEcqiF1gDHzFItD8bLrT3ps=;
  b=ie9oTb3c5D72zBYE1zBc5brYAShfJFftbjNlqAhUEUElmocgH1oIdpna
   ztkkpMKdZYkP3p3iNAuEY4cNjZkRkZWAIKeqSYWNXLFYM5Fa0C+gT7b5r
   sYEfyofZQ2f8TA9rtqd2Ge9mQhKuMf6G4RnK5uAzdD4H9WjwtlfSI7brX
   x8k7x3UbFi+drbg4kUf/2LsbgVmBaGaR0Whk6F7Lr9tbgEpucrNwWSSQH
   fzHwlboGAdK9AcDEVJdtH8xsmC4hlUWL5zWbTQnhwbQVvvm/9H9flLBAi
   9+YoTsE345i8YiV5PRG2BdiJt6glMUPzFBeJkWcRghvuZaK57FyVSQhl5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309746"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309746"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112593"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112593"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:59 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/19] xhci: check if legacy irq is available before using it as fallback
Date: Fri,  1 Dec 2023 17:06:39 +0200
Message-Id: <20231201150647.1307406-12-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
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


