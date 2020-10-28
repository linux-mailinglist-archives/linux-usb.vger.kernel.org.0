Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7ED629E326
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 03:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgJ1Vda (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 17:33:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:44643 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgJ1VdT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:19 -0400
IronPort-SDR: q7iquxM/ondJh42HI3aA42p4TxoMCWn74xZ2OjpQibp0R+Bq29dDE80LDUeuhLTFCUCPoCfujb
 QszYg0aEFZ9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168432581"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="168432581"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2020 13:30:08 -0700
IronPort-SDR: rO3kI377EHDBcOhlUBqeSJDQbQTsStpR+rzc6r+365XZ5H/OKoIxf+36GFSl5FxlvQU+X5XdUJ
 vqhmivUJMx9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="323467833"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2020 13:30:07 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mike Galbraith <efault@gmx.de>, Li Jun <jun.li@nxp.com>
Subject: [PATCH 3/3] xhci: Don't create stream debugfs files with spinlock held.
Date:   Wed, 28 Oct 2020 22:31:24 +0200
Message-Id: <20201028203124.375344-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Creating debugfs files while loding the spin_lock_irqsave(xhci->lock)
creates a lock dependecy that could possibly deadlock.

Lockdep warns:

=====================================================
WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
5.10.0-rc1pdx86+ #8 Not tainted
-----------------------------------------------------
systemd-udevd/386 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
ffffffffb1a94038 (pin_fs_lock){+.+.}-{2:2}, at: simple_pin_fs+0x22/0xa0

and this task is already holding:
ffff9e7b87fbc430 (&xhci->lock){-.-.}-{2:2}, at: xhci_alloc_streams+0x5f9/0x810
which would create a new lock dependency:
(&xhci->lock){-.-.}-{2:2} -> (pin_fs_lock){+.+.}-{2:2}

Create the files a bit later after lock is released.

Reported-by: Hans de Goede <hdegoede@redhat.com>
Reported-by: Mike Galbraith <efault@gmx.de>
Tested-by: Hans de Goede <hdegoede@redhat.com>
CC: Li Jun <jun.li@nxp.com>
Fixes: 673d74683627 ("usb: xhci: add debugfs support for ep with stream")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 482fe8c5e3b4..d4a8d0efbbc4 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3533,11 +3533,14 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
 			 udev->slot_id, ep_index);
 		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
-		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
 	}
 	xhci_free_command(xhci, config_cmd);
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
+	for (i = 0; i < num_eps; i++) {
+		ep_index = xhci_get_endpoint_index(&eps[i]->desc);
+		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
+	}
 	/* Subtract 1 for stream 0, which drivers can't use */
 	return num_streams - 1;
 
-- 
2.25.1

