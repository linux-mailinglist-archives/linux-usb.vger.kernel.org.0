Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FF529E7B2
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 10:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgJ2Jql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 05:46:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:31459 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbgJ2Jql (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 05:46:41 -0400
IronPort-SDR: zC/A0SDaxyp+ggIvkOEm9iSY4+7wmBwitWIVSNiVBRa62YtIzxpyb1nkgk/qufDmy/cjy0VDp/
 BJTBERfFshJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168504717"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="168504717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 02:46:40 -0700
IronPort-SDR: IkYfbMI6UXriII5eEolUEBT07xXhybCrkzbTXDJQP+8cPuNvtbEtrFyFRi6458DUbrnwysmhTZ
 NZInAfzmI66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="536604867"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 29 Oct 2020 02:46:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 272A15F2; Thu, 29 Oct 2020 11:46:37 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Casey Bowman <casey.g.bowman@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Only configure USB4 wake for lane 0 adapters
Date:   Thu, 29 Oct 2020 12:46:36 +0300
Message-Id: <20201029094636.51818-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029094636.51818-1-mika.westerberg@linux.intel.com>
References: <20201029094636.51818-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Only USB4 lane 0 adapter has the USB4 port capability for wakes so only
program wakes on such adapters.

Fixes: b2911a593a70 ("thunderbolt: Enable wakes from system suspend")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 40f13579a3fe..f2583b4053e4 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -421,8 +421,12 @@ int usb4_switch_set_wake(struct tb_switch *sw, unsigned int flags)
 	 * upstream USB4 port.
 	 */
 	tb_switch_for_each_port(sw, port) {
+		if (!tb_port_is_null(port))
+			continue;
 		if (!route && tb_is_upstream_port(port))
 			continue;
+		if (!port->cap_usb4)
+			continue;
 
 		ret = tb_port_read(port, &val, TB_CFG_PORT,
 				   port->cap_usb4 + PORT_CS_19, 1);
-- 
2.28.0

