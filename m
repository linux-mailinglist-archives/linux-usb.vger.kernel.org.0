Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA9829E327
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 03:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgJ1Vd1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 17:33:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:44643 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJ1VdS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:18 -0400
IronPort-SDR: Nyh3sPdc13gtjEHHKxA5z5266K6gch2GmUdgD4zVX57+xaTXe7+QgasEpTexBGDs95v2HJAiF4
 5FEjkYd5Bgkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168432566"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="168432566"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2020 13:30:04 -0700
IronPort-SDR: YPbDCuQ5i2O3EksLaTWIKp54qm2T8Tt2WFIAKFv+ae52X6RGF//4dfuZHrzlm6JSVdpoDNmuJN
 l0Lw+a/jqspQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="323467777"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2020 13:30:02 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/3] xhci: Fix sizeof() mismatch
Date:   Wed, 28 Oct 2020 22:31:22 +0200
Message-Id: <20201028203124.375344-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof() is being used, sizeof(rhub->ports) is not
correct, it should be sizeof(*rhub->ports).  This bug did not
cause any issues because it just so happens the sizes are the same.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: bcaa9d5c5900 ("xhci: Create new structures to store xhci port information")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fe405cd38dbc..138ba4528dd3 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2252,8 +2252,8 @@ static void xhci_create_rhub_port_array(struct xhci_hcd *xhci,
 
 	if (!rhub->num_ports)
 		return;
-	rhub->ports = kcalloc_node(rhub->num_ports, sizeof(rhub->ports), flags,
-			dev_to_node(dev));
+	rhub->ports = kcalloc_node(rhub->num_ports, sizeof(*rhub->ports),
+			flags, dev_to_node(dev));
 	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
 		if (xhci->hw_ports[i].rhub != rhub ||
 		    xhci->hw_ports[i].hcd_portnum == DUPLICATE_ENTRY)
-- 
2.25.1

