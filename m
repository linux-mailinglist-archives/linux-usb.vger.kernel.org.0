Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3063AB6C5
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 17:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbhFQPD5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 11:03:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:4084 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232973AbhFQPDz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Jun 2021 11:03:55 -0400
IronPort-SDR: paL5nm4e3bKzdoyj7Zhhn1hyJMTVnAUDpKkipHKZiuevbUcdPudHRh9lw1QDZ1vD8/Ugx+dKO7
 3zJWndGXEE3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="206204838"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="206204838"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 08:01:46 -0700
IronPort-SDR: tBF7LmQgVHjL3ztUF/DaFbdCZtuXtyC8+neG28+QMsKATEOYBkLsM8nWBNKcYEoKJZ1Fq+GyJJ
 0en6SuUePkCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="479490859"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2021 08:01:45 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] xhci: handle failed buffer copy to URB sg list and fix a W=1 copiler warning
Date:   Thu, 17 Jun 2021 18:03:53 +0300
Message-Id: <20210617150354.1512157-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
References: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set the urb->actual_length to bytes successfully copied in case all bytes
weren't copied from a temporary buffer to the URB sg list.
Also print a debug message

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 27283654ca08..9248ce8d09a4 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1361,12 +1361,17 @@ static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
 				 urb->transfer_buffer_length,
 				 dir);
 
-	if (usb_urb_dir_in(urb))
+	if (usb_urb_dir_in(urb)) {
 		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
 					   urb->transfer_buffer,
 					   buf_len,
 					   0);
-
+		if (len != buf_len) {
+			xhci_dbg(hcd_to_xhci(hcd),
+				 "Copy from tmp buf to urb sg list failed\n");
+			urb->actual_length = len;
+		}
+	}
 	urb->transfer_flags &= ~URB_DMA_MAP_SINGLE;
 	kfree(urb->transfer_buffer);
 	urb->transfer_buffer = NULL;
-- 
2.25.1

