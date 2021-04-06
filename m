Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33ED354D30
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 09:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244109AbhDFHA1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Apr 2021 03:00:27 -0400
Received: from mga04.intel.com ([192.55.52.120]:9889 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244102AbhDFHA0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Apr 2021 03:00:26 -0400
IronPort-SDR: Zotpupym478akpPklsYBUZ0VX9Iz9nPhArXgD7i84gPV8M3Hmvrpoh1fntPQ0Mu34ts1OEWOmS
 Ofd2GC1VLZlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="190835024"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="190835024"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 00:00:19 -0700
IronPort-SDR: drD7iEZMuFUX9Fv6PnWedrLru3iIddp8UeuyR/OlSR+mffcIJ+dU0FSlBbBrdTw945yRHndGpM
 YQda7RlWeuGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="448443168"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2021 00:00:18 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/4] xhci: check port array allocation was successful before dereferencing it
Date:   Tue,  6 Apr 2021 10:02:05 +0300
Message-Id: <20210406070208.3406266-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
References: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

return if rhub->ports is null after rhub->ports = kcalloc_node()
Klockwork reported issue

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 34d95c006751..f66815fe8482 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2249,6 +2249,9 @@ static void xhci_create_rhub_port_array(struct xhci_hcd *xhci,
 		return;
 	rhub->ports = kcalloc_node(rhub->num_ports, sizeof(*rhub->ports),
 			flags, dev_to_node(dev));
+	if (!rhub->ports)
+		return;
+
 	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
 		if (xhci->hw_ports[i].rhub != rhub ||
 		    xhci->hw_ports[i].hcd_portnum == DUPLICATE_ENTRY)
-- 
2.25.1

