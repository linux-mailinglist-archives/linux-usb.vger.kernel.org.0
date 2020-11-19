Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787332B8D8D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 09:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgKSIee (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 03:34:34 -0500
Received: from mga03.intel.com ([134.134.136.65]:60138 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgKSIed (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Nov 2020 03:34:33 -0500
IronPort-SDR: qrEaY4c0UxvsSyLSY4Xj+bLVQzIObEWnhFft/vusaYp7diT7thu4xo3mzdEl3PHUzctDV1S+7N
 WpeV5ABGt+SA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171352270"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="171352270"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 00:34:32 -0800
IronPort-SDR: /+KotOtIlupOREqz4QiNiByGhTBR5xWdq4wYit+Fr3+E6dfNc59TYF1D4BoHtVICnj6+9eqMfg
 ZUh1KNZyXW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="357312204"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 19 Nov 2020 00:34:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CDD5311E; Thu, 19 Nov 2020 10:34:29 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Paulian Bogdan Marinca <paulian@marinca.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2] thunderbolt: Fix use-after-free in remove_unplugged_switch()
Date:   Thu, 19 Nov 2020 11:34:29 +0300
Message-Id: <20201119083429.71784-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Paulian reported a crash that happens when a dock is unplugged during
hibernation:

[78436.228217] thunderbolt 0-1: device disconnected
[78436.228365] BUG: kernel NULL pointer dereference, address: 00000000000001e0
...
[78436.228397] RIP: 0010:icm_free_unplugged_children+0x109/0x1a0
...
[78436.228432] Call Trace:
[78436.228439]  icm_rescan_work+0x24/0x30
[78436.228444]  process_one_work+0x1a3/0x3a0
[78436.228449]  worker_thread+0x30/0x370
[78436.228454]  ? process_one_work+0x3a0/0x3a0
[78436.228457]  kthread+0x13d/0x160
[78436.228461]  ? kthread_park+0x90/0x90
[78436.228465]  ret_from_fork+0x1f/0x30

This happens because remove_unplugged_switch() calls tb_switch_remove()
that releases the memory pointed by sw so the following lines reference
to a memory that might be released already.

Fix this by saving pointer to the parent device before calling
tb_switch_remove().

Reported-by: Paulian Bogdan Marinca <paulian@marinca.net>
Fixes: 4f7c2e0d8765 ("thunderbolt: Make sure device runtime resume completes before taking domain lock")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Previous version (v1) can be found:

  https://lore.kernel.org/linux-usb/20201118133745.65628-1-mika.westerberg@linux.intel.com/

v2: Use get_device()/put_device() for the parent device.

 drivers/thunderbolt/icm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index b51fc3f62b1f..cd985f334b9b 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -1976,7 +1976,9 @@ static int complete_rpm(struct device *dev, void *data)
 
 static void remove_unplugged_switch(struct tb_switch *sw)
 {
-	pm_runtime_get_sync(sw->dev.parent);
+	struct device *parent = get_device(sw->dev.parent);
+
+	pm_runtime_get_sync(parent);
 
 	/*
 	 * Signal this and switches below for rpm_complete because
@@ -1987,8 +1989,10 @@ static void remove_unplugged_switch(struct tb_switch *sw)
 	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);
 	tb_switch_remove(sw);
 
-	pm_runtime_mark_last_busy(sw->dev.parent);
-	pm_runtime_put_autosuspend(sw->dev.parent);
+	pm_runtime_mark_last_busy(parent);
+	pm_runtime_put_autosuspend(parent);
+
+	put_device(parent);
 }
 
 static void icm_free_unplugged_children(struct tb_switch *sw)
-- 
2.29.2

