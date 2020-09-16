Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8953226C033
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 11:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgIPJLL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 05:11:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:39051 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgIPJLI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 05:11:08 -0400
IronPort-SDR: Iwbjh3qp+yU6U21EfaEBuKB0TQf7SdvgFOH9BgCF+iqCmf5RssKW6y1yY2BUjDLqvlJsiNwtyx
 Zhuw5t2VUmsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="159480581"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="159480581"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 02:11:08 -0700
IronPort-SDR: PeC6HDa5Fer+0RHrErTXVw6uJh3jFDwRt2RuOh0EIqqu3hRBB3JCxidthdxDROlEne5kXSixpJ
 pS1V3yHXLyMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409490861"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2020 02:11:06 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org, Azhar Shaikh <azhar.shaikh@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH 2/3] usb: typec: intel_pmc_mux: Pass correct USB Type-C port number to SoC
Date:   Wed, 16 Sep 2020 12:11:01 +0300
Message-Id: <20200916091102.27118-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916091102.27118-1-heikki.krogerus@linux.intel.com>
References: <20200916091102.27118-1-heikki.krogerus@linux.intel.com>
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

