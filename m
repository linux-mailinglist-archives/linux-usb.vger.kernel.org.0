Return-Path: <linux-usb+bounces-2393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B57DCC9B
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 13:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FEFC1C20C4A
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 12:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631081DA26;
	Tue, 31 Oct 2023 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILnuI18r"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53130110E
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:11:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0876A2
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754284; x=1730290284;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ndh9sL2FMfUpxyjsp7RVfhRUSNmjBdDr7oEmIySVC2c=;
  b=ILnuI18rQlxL1hpwggJhELI1am8ud1ZTUZyLgY8aZOPsZj0+fJdYA725
   rRsu5/lLUJP7c+UD2FH9dcCno93+qqs5ee86q4YC/ZqeJRFeUDhcjEJd4
   Pv8BLovYxfDoSeJlZosma/Csgd1r8ZhhIVq5yXSoRQMKlUnW72oiNKmw7
   e6+/McFKYoLjLdEjHxBt9qar4EkV9vnMXinaHbxP75FLMJ94a8RVnrM7K
   nAjMMfsamefA6DGyUqCbKIQWuGIB3PI4cVHU3/VMuOdgk3yHmrdQF+El3
   Zm5J/u2neweB86MUrNTGb+0LINhEKsq2AriABW+v6U4LdR6Ot7Cu4Cj1I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1163595"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1163595"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="754120436"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="754120436"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 31 Oct 2023 05:11:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id C76754A0; Tue, 31 Oct 2023 14:11:10 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 1/7] xhci: check if legacy irq is available before using it as fallback
Date: Tue, 31 Oct 2023 14:10:11 +0200
Message-ID: <20231031121017.41487-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the error check "No MSI-X/MSI found and no IRQ in BIOS" inside
'goto legacy'. It is better to check if the IRQ interrupt is available,
before trying to add a handler. Additionally the aforementioned error
message is much more clear.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b9ae5c2a2527..afbee93d1cf8 100644
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
2.40.1


