Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822DE2603AD
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 19:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730810AbgIGRxK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 13:53:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:29151 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728897AbgIGLWx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 07:22:53 -0400
IronPort-SDR: KJg6LNaFUQva6a0+CmI4Bt1E+C7+SI5HQguGHn9kU8Z6xt15795w584FHWLtGR9Ujj4cxluusJ
 c0X9NWiB4GWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="145696982"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; 
   d="scan'208";a="145696982"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 04:03:43 -0700
IronPort-SDR: 9IXG5z2Zamb8VXZqHIJLIe3ucrY1MV9J/z5bHNOeK7xSRJO6ZDr9TaT6V6rEjIUDUeVSgnLpEN
 BlBkVo83f1qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; 
   d="scan'208";a="343193312"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 07 Sep 2020 04:03:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8141715D; Mon,  7 Sep 2020 14:03:40 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Retry DROM read once if parsing fails
Date:   Mon,  7 Sep 2020 14:03:40 +0300
Message-Id: <20200907110340.71031-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Kai-Heng reported that sometimes DROM parsing of ASUS PA27AC Thunderbolt 3
monitor fails. This makes the driver to fail to add the device so only
DisplayPort tunneling is functional.

It is not clear what exactly happens but waiting for 100 ms and retrying
the read seems to work this around so we do that here.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206493
Reported-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/eeprom.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 3ebca44ab3fa..0c8471be3e32 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/crc32.h>
+#include <linux/delay.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include "tb.h"
@@ -389,8 +390,8 @@ static int tb_drom_parse_entries(struct tb_switch *sw)
 		struct tb_drom_entry_header *entry = (void *) (sw->drom + pos);
 		if (pos + 1 == drom_size || pos + entry->len > drom_size
 				|| !entry->len) {
-			tb_sw_warn(sw, "drom buffer overrun, aborting\n");
-			return -EIO;
+			tb_sw_warn(sw, "DROM buffer overrun\n");
+			return -EILSEQ;
 		}
 
 		switch (entry->type) {
@@ -526,7 +527,8 @@ int tb_drom_read(struct tb_switch *sw)
 	u16 size;
 	u32 crc;
 	struct tb_drom_header *header;
-	int res;
+	int res, retries = 1;
+
 	if (sw->drom)
 		return 0;
 
@@ -612,7 +614,17 @@ int tb_drom_read(struct tb_switch *sw)
 		tb_sw_warn(sw, "drom device_rom_revision %#x unknown\n",
 			header->device_rom_revision);
 
-	return tb_drom_parse_entries(sw);
+	res = tb_drom_parse_entries(sw);
+	/* If the DROM parsing fails, wait a moment and retry once */
+	if (res == -EILSEQ && retries--) {
+		tb_sw_warn(sw, "parsing DROM failed, retrying\n");
+		msleep(100);
+		res = tb_drom_read_n(sw, 0, sw->drom, size);
+		if (!res)
+			goto parse;
+	}
+
+	return res;
 err:
 	kfree(sw->drom);
 	sw->drom = NULL;
-- 
2.28.0

