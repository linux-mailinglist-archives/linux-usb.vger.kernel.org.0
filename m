Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C56C45D5A9
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 08:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbhKYHos (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 02:44:48 -0500
Received: from mga11.intel.com ([192.55.52.93]:7786 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236679AbhKYHms (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 02:42:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="232957921"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="232957921"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 23:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="591927302"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2021 23:37:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4D2FA348; Thu, 25 Nov 2021 09:37:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/6] thunderbolt: Do not program path HopIDs for USB4 routers
Date:   Thu, 25 Nov 2021 10:37:32 +0300
Message-Id: <20211125073733.74902-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These fields are marked read-only for USB4 routers so do not touch them
in that case. Update the kernel-doc of tb_dp_port_set_hops() to reflect
this too.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 463cfdc0b42f..e00f4b878b56 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1322,7 +1322,9 @@ int tb_dp_port_hpd_clear(struct tb_port *port)
  * @aux_tx: AUX TX Hop ID
  * @aux_rx: AUX RX Hop ID
  *
- * Programs specified Hop IDs for DP IN/OUT port.
+ * Programs specified Hop IDs for DP IN/OUT port. Can be called for USB4
+ * router DP adapters too but does not program the values as the fields
+ * are read-only.
  */
 int tb_dp_port_set_hops(struct tb_port *port, unsigned int video,
 			unsigned int aux_tx, unsigned int aux_rx)
@@ -1330,6 +1332,9 @@ int tb_dp_port_set_hops(struct tb_port *port, unsigned int video,
 	u32 data[2];
 	int ret;
 
+	if (tb_switch_is_usb4(port->sw))
+		return 0;
+
 	ret = tb_port_read(port, data, TB_CFG_PORT,
 			   port->cap_adap + ADP_DP_CS_0, ARRAY_SIZE(data));
 	if (ret)
-- 
2.33.0

