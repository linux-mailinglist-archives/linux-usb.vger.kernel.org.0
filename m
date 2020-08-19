Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D551249BB8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 13:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgHSL11 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 07:27:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:62831 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727818AbgHSL1U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 07:27:20 -0400
IronPort-SDR: vomSbFE6nqdO3gqAmEjhNkTl38yUZGUK/sJ6skDpAGU07Mivg8klvLHIG2xpkz8J/ljY0mAg3D
 K1M8w7tdTsxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="142901106"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="142901106"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 04:27:19 -0700
IronPort-SDR: tqHEt5Xzx6yRUBt85PEaP2DL0sD7cdfVLUgF3cYNkhA1aeS1T/gP7r6CDJWvttDpq+s6jTkvXJ
 6DnzRTuD0vjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="293088787"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 19 Aug 2020 04:27:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C38FB1FD; Wed, 19 Aug 2020 14:27:16 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Nikunj A . Dadhania" <nikunj.dadhania@linux.intel.com>,
        Srikanth Nandamuri <srikanth.nandamuri@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/2] thunderbolt: Disable ports that are not implemented
Date:   Wed, 19 Aug 2020 14:27:15 +0300
Message-Id: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "Nikunj A. Dadhania" <nikunj.dadhania@linux.intel.com>

Commit 4caf2511ec49 ("thunderbolt: Add trivial .shutdown") exposes a bug
in the Thunderbolt driver, that frees an unallocated id, resulting in the
following spinlock bad magic bug.

[ 20.633803] BUG: spinlock bad magic on CPU#4, halt/3313
[ 20.640030] lock: 0xffff92e6ad5c97e0, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
[ 20.672139] Call Trace:
[ 20.675032] dump_stack+0x97/0xdb
[ 20.678950] ? spin_bug+0xa5/0xb0
[ 20.682865] do_raw_spin_lock+0x68/0x98
[ 20.687397] _raw_spin_lock_irqsave+0x3f/0x5d
[ 20.692535] ida_destroy+0x4f/0x124
[ 20.696657] tb_switch_release+0x6d/0xfd
[ 20.701295] device_release+0x2c/0x7d
[ 20.705622] kobject_put+0x8e/0xac
[ 20.709637] tb_stop+0x55/0x66
[ 20.713243] tb_domain_remove+0x36/0x62
[ 20.717774] nhi_remove+0x4d/0x58

Fix the issue by disabling ports that are enabled as per the EEPROM, but
not implemented. While at it, update the kernel doc for the disabled
field, to reflect this.

Cc: stable@vger.kernel.org
Fixes: 4caf2511ec49 (thunderbolt: Add trivial .shutdown)
Reported-by: Srikanth Nandamuri <srikanth.nandamuri@intel.com>
Signed-off-by: Nikunj A. Dadhania <nikunj.dadhania@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 1 +
 drivers/thunderbolt/tb.h     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 712395f518b8..698c52775eec 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -684,6 +684,7 @@ static int tb_init_port(struct tb_port *port)
 		if (res == -ENODEV) {
 			tb_dbg(port->sw->tb, " Port %d: not implemented\n",
 			       port->port);
+			port->disabled = true;
 			return 0;
 		}
 		return res;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index a413d55b5f8b..df08f6d7aaa0 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -186,7 +186,7 @@ struct tb_switch {
  * @cap_adap: Offset of the adapter specific capability (%0 if not present)
  * @cap_usb4: Offset to the USB4 port capability (%0 if not present)
  * @port: Port number on switch
- * @disabled: Disabled by eeprom
+ * @disabled: Disabled by eeprom or enabled, but not implemented
  * @bonded: true if the port is bonded (two lanes combined as one)
  * @dual_link_port: If the switch is connected using two ports, points
  *		    to the other port.
-- 
2.28.0

