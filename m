Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D58E354D32
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 09:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244113AbhDFHA3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Apr 2021 03:00:29 -0400
Received: from mga04.intel.com ([192.55.52.120]:9889 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244110AbhDFHA3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Apr 2021 03:00:29 -0400
IronPort-SDR: Dd/W/VZP5HpBigIH+1ZyWr/C9JIthTm1/GDG7IZFUpBQfdbFXwN0dXVDbQoA9CSgDpIsyzv9uF
 rod4svsRGpXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="190835034"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="190835034"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 00:00:22 -0700
IronPort-SDR: kiYWw04oGmiAnO5c/EIMZcvsEWw5jAd8JGNgToVHucWdulD9NLhzk70OOp40rZJGubaVirJIV4
 cZLS5Tzog2cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="448443193"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2021 00:00:20 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] xhci: fix potential array out of bounds with several interrupters
Date:   Tue,  6 Apr 2021 10:02:07 +0300
Message-Id: <20210406070208.3406266-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
References: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Max Interrupters supported by the controller is given in a 10bit
wide bitfield, but the driver uses a fixed 128 size array to index these
interrupters.

Klockwork reports a possible array out of bounds case which in theory
is possible. In practice this hasn't been hit as a common number of Max
Interrupters for new controllers is 8, not even close to 128.

This needs to be fixed anyway

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f9614716ecd7..ca9385d22f68 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -227,6 +227,7 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	int err, i;
 	u64 val;
+	u32 intrs;
 
 	/*
 	 * Some Renesas controllers get into a weird state if they are
@@ -265,7 +266,10 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 	if (upper_32_bits(val))
 		xhci_write_64(xhci, 0, &xhci->op_regs->cmd_ring);
 
-	for (i = 0; i < HCS_MAX_INTRS(xhci->hcs_params1); i++) {
+	intrs = min_t(u32, HCS_MAX_INTRS(xhci->hcs_params1),
+		      ARRAY_SIZE(xhci->run_regs->ir_set));
+
+	for (i = 0; i < intrs; i++) {
 		struct xhci_intr_reg __iomem *ir;
 
 		ir = &xhci->run_regs->ir_set[i];
-- 
2.25.1

