Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C90A26BEF3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 10:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgIPIQg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 04:16:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:38802 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbgIPIQ3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 04:16:29 -0400
IronPort-SDR: VAYHhuTEFd0ytKSe5M27rlS5UGq6wnLQBeSIo2VvLMUwLzCCe8v9fb1rOubJ7QZ4wLHr6mVfPe
 a2wh1X/Lgnvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147174213"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="147174213"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 01:16:28 -0700
IronPort-SDR: ZK4tpVpRQ85dzUh3u8TjksZ2S9Sc46ESyhXclEzQgV/l4VeaKSuRksFENA9ckAd1ArY/v3+SOQ
 lduODWibjhlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409471864"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2020 01:16:26 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org,
        Madhusudanarao Amara <madhusudanarao.amara@intel.com>
Subject: [PATCH 5/5] usb: typec: intel_pmc_mux: Handle SCU IPC error conditions
Date:   Wed, 16 Sep 2020 11:16:17 +0300
Message-Id: <20200916081617.17146-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
References: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Madhusudanarao Amara <madhusudanarao.amara@intel.com>

Check and return if there are errors. The response bits are valid
only on no errors.

Fixes: b7404a29cd3d ("usb: typec: intel_pmc_mux: Definitions for response status bits")
Signed-off-by: Madhusudanarao Amara <madhusudanarao.amara@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 109c1a796e844..d7f63b74c6b14 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -176,13 +176,19 @@ static int hsl_orientation(struct pmc_usb_port *port)
 static int pmc_usb_command(struct pmc_usb_port *port, u8 *msg, u32 len)
 {
 	u8 response[4];
+	int ret;
 
 	/*
 	 * Error bit will always be 0 with the USBC command.
-	 * Status can be checked from the response message.
+	 * Status can be checked from the response message if the
+	 * function intel_scu_ipc_dev_command succeeds.
 	 */
-	intel_scu_ipc_dev_command(port->pmc->ipc, PMC_USBC_CMD, 0, msg, len,
-				  response, sizeof(response));
+	ret = intel_scu_ipc_dev_command(port->pmc->ipc, PMC_USBC_CMD, 0, msg,
+					len, response, sizeof(response));
+
+	if (ret)
+		return ret;
+
 	if (response[2] & PMC_USB_RESP_STATUS_FAILURE) {
 		if (response[2] & PMC_USB_RESP_STATUS_FATAL)
 			return -EIO;
-- 
2.28.0

