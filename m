Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1CF354D31
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 09:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244111AbhDFHA2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Apr 2021 03:00:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:9889 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244110AbhDFHA1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Apr 2021 03:00:27 -0400
IronPort-SDR: KMKGePVgnbyt6svWCVMPsZENkWRYNmJEar0R9y1p3W2kmmr6pdVzof7DzZI7BfgTRt+s621nUb
 OsyE1keWT/0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="190835029"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="190835029"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 00:00:20 -0700
IronPort-SDR: kbu4ek1yCs9IS4r2xuvf8xz16vFxe8akpfpbwmzWPfKHdgpbvnOVRzUWS6YUj+JhVVefVcb2bz
 19r/x+SVXomg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="448443180"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2021 00:00:19 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/4] xhci: check control context is valid before dereferencing it.
Date:   Tue,  6 Apr 2021 10:02:06 +0300
Message-Id: <20210406070208.3406266-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
References: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't dereference ctrl_ctx before checking it's valid.
Issue reported by Klockwork

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5d9fc3cd07a5..f9614716ecd7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3261,6 +3261,14 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 
 	/* config ep command clears toggle if add and drop ep flags are set */
 	ctrl_ctx = xhci_get_input_control_ctx(cfg_cmd->in_ctx);
+	if (!ctrl_ctx) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		xhci_free_command(xhci, cfg_cmd);
+		xhci_warn(xhci, "%s: Could not get input context, bad type.\n",
+				__func__);
+		goto cleanup;
+	}
+
 	xhci_setup_input_ctx_for_config_ep(xhci, cfg_cmd->in_ctx, vdev->out_ctx,
 					   ctrl_ctx, ep_flag, ep_flag);
 	xhci_endpoint_copy(xhci, cfg_cmd->in_ctx, vdev->out_ctx, ep_index);
-- 
2.25.1

