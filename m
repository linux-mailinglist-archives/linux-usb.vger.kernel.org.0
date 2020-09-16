Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E5A26BEF2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 10:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgIPIQf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 04:16:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:38802 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726498AbgIPIQ1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 04:16:27 -0400
IronPort-SDR: ZLy+TkxImBd46usKNs6YTMPCjgPUCOTyJuGPXuI44PCmeSSH1+Zun250UyMHk59XRio78kDWDV
 3lZKVgWywSQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147174212"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="147174212"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 01:16:26 -0700
IronPort-SDR: 5c81Lo2DL8GxSOz46R8fGbz1IlrtyKB3tLaOGu3z9z2+fTrpAu9vr1POJ+ZDBIlE3epfyKu453
 z7ubwQGNB4sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409471858"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2020 01:16:24 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org, Azhar Shaikh <azhar.shaikh@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH 4/5] usb: typec: intel_pmc_mux: Pass correct USB Type-C port number to SoC
Date:   Wed, 16 Sep 2020 11:16:16 +0300
Message-Id: <20200916081617.17146-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
References: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Azhar Shaikh <azhar.shaikh@intel.com>

The SoC expects the USB Type-C ports numbers to be starting with 0.
If the port number is passed as it is, the IOM status will not be
updated. The IOM port status check fails which will eventually
lead to PMC IPC communication failure.

Fixes: 43d596e32276 ("usb: typec: intel_pmc_mux: Check the port status before connect")
Suggested-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
Signed-off-by: Azhar Shaikh <azhar.shaikh@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 307830b374ec7..109c1a796e844 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -148,8 +148,13 @@ struct pmc_usb {
 
 static void update_port_status(struct pmc_usb_port *port)
 {
+	u8 port_num;
+
+	/* SoC expects the USB Type-C port numbers to start with 0 */
+	port_num = port->usb3_port - 1;
+
 	port->iom_status = readl(port->pmc->iom_base + IOM_PORT_STATUS_OFFSET +
-				 port->usb3_port * sizeof(u32));
+				 port_num * sizeof(u32));
 }
 
 static int sbu_orientation(struct pmc_usb_port *port)
-- 
2.28.0

