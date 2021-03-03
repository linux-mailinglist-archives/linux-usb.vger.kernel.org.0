Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E5132C601
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237845AbhCDA1R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:27:17 -0500
Received: from mga09.intel.com ([134.134.136.24]:25628 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1443655AbhCCMO7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 07:14:59 -0500
IronPort-SDR: rY9xXrA/m07oLD9H7pqXDEv+liEO2rab+A8tqZu14fUgbtjbt9aw/UmKaupqy/1efCtXOIAH0h
 VE0ZyCqV7lDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="187299463"
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
   d="scan'208";a="187299463"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 04:13:12 -0800
IronPort-SDR: UnOimma7BB3u0E0a0Q9LIEAUJe9TMZIwRWSI0eFasLpu4uRFm66mNHoxHsWuZ3ArD3L8Akawtw
 coJuHLLH9ikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
   d="scan'208";a="586338810"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 03 Mar 2021 04:13:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5227F128; Wed,  3 Mar 2021 14:13:10 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/2] thunderbolt: Initialize HopID IDAs in tb_switch_alloc()
Date:   Wed,  3 Mar 2021 15:13:09 +0300
Message-Id: <20210303121310.80937-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If there is a failure before the tb_switch_add() is called the switch
object is released by tb_switch_release() but at that point HopID IDAs
have not yet been initialized. So we see splat like this:

BUG: spinlock bad magic on CPU#2, kworker/u8:5/115
...
Workqueue: thunderbolt0 tb_handle_hotplug
Call Trace:
 dump_stack+0x97/0xdc
 ? spin_bug+0x9a/0xa7
 do_raw_spin_lock+0x68/0x98
 _raw_spin_lock_irqsave+0x3f/0x5d
 ida_destroy+0x4f/0x127
 tb_switch_release+0x6d/0xfd
 device_release+0x2c/0x7d
 kobject_put+0x9b/0xbc
 tb_handle_hotplug+0x278/0x452
 process_one_work+0x1db/0x396
 worker_thread+0x216/0x375
 kthread+0x14d/0x155
 ? pr_cont_work+0x58/0x58
 ? kthread_blkcg+0x2e/0x2e
 ret_from_fork+0x1f/0x40

Fix this by always initializing HopID IDAs in tb_switch_alloc().

Fixes: 0b2863ac3cfd ("thunderbolt: Add functions for allocating and releasing HopIDs")
Cc: stable@vger.kernel.org
Reported-by: Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index b63fecca6c2a..2a95b4ce06c0 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -768,12 +768,6 @@ static int tb_init_port(struct tb_port *port)
 
 	tb_dump_port(port->sw->tb, &port->config);
 
-	/* Control port does not need HopID allocation */
-	if (port->port) {
-		ida_init(&port->in_hopids);
-		ida_init(&port->out_hopids);
-	}
-
 	INIT_LIST_HEAD(&port->list);
 	return 0;
 
@@ -1842,10 +1836,8 @@ static void tb_switch_release(struct device *dev)
 	dma_port_free(sw->dma_port);
 
 	tb_switch_for_each_port(sw, port) {
-		if (!port->disabled) {
-			ida_destroy(&port->in_hopids);
-			ida_destroy(&port->out_hopids);
-		}
+		ida_destroy(&port->in_hopids);
+		ida_destroy(&port->out_hopids);
 	}
 
 	kfree(sw->uuid);
@@ -2025,6 +2017,12 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 		/* minimum setup for tb_find_cap and tb_drom_read to work */
 		sw->ports[i].sw = sw;
 		sw->ports[i].port = i;
+
+		/* Control port does not need HopID allocation */
+		if (i) {
+			ida_init(&sw->ports[i].in_hopids);
+			ida_init(&sw->ports[i].out_hopids);
+		}
 	}
 
 	ret = tb_switch_find_vse_cap(sw, TB_VSE_CAP_PLUG_EVENTS);
-- 
2.30.1

