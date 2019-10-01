Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B698C32AC
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 13:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732862AbfJALjC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 07:39:02 -0400
Received: from mga17.intel.com ([192.55.52.151]:27911 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732684AbfJALin (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 07:38:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 04:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="181663269"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 01 Oct 2019 04:38:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8F8865AD; Tue,  1 Oct 2019 14:38:31 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 16/22] thunderbolt: Call tb_eeprom_get_drom_offset() from tb_eeprom_read_n()
Date:   Tue,  1 Oct 2019 14:38:24 +0300
Message-Id: <20191001113830.13028-17-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We are going to re-use tb_drom_read() for USB4 DROM reading as well.
USB4 has separate router operations for this which does not need the
drom_offset. Therefore we move call to tb_eeprom_get_drom_offset() into
tb_eeprom_read_n() where it is needed.

While there change return -ENOSYS to -ENODEV because the former is only
supposed to be used with system calls (invalid syscall nr).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/eeprom.c | 88 ++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 8dd7de0cc826..540e0105bcc0 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -130,13 +130,52 @@ static int tb_eeprom_in(struct tb_switch *sw, u8 *val)
 	return 0;
 }
 
+/**
+ * tb_eeprom_get_drom_offset - get drom offset within eeprom
+ */
+static int tb_eeprom_get_drom_offset(struct tb_switch *sw, u16 *offset)
+{
+	struct tb_cap_plug_events cap;
+	int res;
+
+	if (!sw->cap_plug_events) {
+		tb_sw_warn(sw, "no TB_CAP_PLUG_EVENTS, cannot read eeprom\n");
+		return -ENODEV;
+	}
+	res = tb_sw_read(sw, &cap, TB_CFG_SWITCH, sw->cap_plug_events,
+			     sizeof(cap) / 4);
+	if (res)
+		return res;
+
+	if (!cap.eeprom_ctl.present || cap.eeprom_ctl.not_present) {
+		tb_sw_warn(sw, "no NVM\n");
+		return -ENODEV;
+	}
+
+	if (cap.drom_offset > 0xffff) {
+		tb_sw_warn(sw, "drom offset is larger than 0xffff: %#x\n",
+				cap.drom_offset);
+		return -ENXIO;
+	}
+	*offset = cap.drom_offset;
+	return 0;
+}
+
 /**
  * tb_eeprom_read_n - read count bytes from offset into val
  */
 static int tb_eeprom_read_n(struct tb_switch *sw, u16 offset, u8 *val,
 		size_t count)
 {
+	u16 drom_offset;
 	int i, res;
+
+	res = tb_eeprom_get_drom_offset(sw, &drom_offset);
+	if (res)
+		return res;
+
+	offset += drom_offset;
+
 	res = tb_eeprom_active(sw, true);
 	if (res)
 		return res;
@@ -238,36 +277,6 @@ struct tb_drom_entry_port {
 } __packed;
 
 
-/**
- * tb_eeprom_get_drom_offset - get drom offset within eeprom
- */
-static int tb_eeprom_get_drom_offset(struct tb_switch *sw, u16 *offset)
-{
-	struct tb_cap_plug_events cap;
-	int res;
-	if (!sw->cap_plug_events) {
-		tb_sw_warn(sw, "no TB_CAP_PLUG_EVENTS, cannot read eeprom\n");
-		return -ENOSYS;
-	}
-	res = tb_sw_read(sw, &cap, TB_CFG_SWITCH, sw->cap_plug_events,
-			     sizeof(cap) / 4);
-	if (res)
-		return res;
-
-	if (!cap.eeprom_ctl.present || cap.eeprom_ctl.not_present) {
-		tb_sw_warn(sw, "no NVM\n");
-		return -ENOSYS;
-	}
-
-	if (cap.drom_offset > 0xffff) {
-		tb_sw_warn(sw, "drom offset is larger than 0xffff: %#x\n",
-				cap.drom_offset);
-		return -ENXIO;
-	}
-	*offset = cap.drom_offset;
-	return 0;
-}
-
 /**
  * tb_drom_read_uid_only - read uid directly from drom
  *
@@ -277,17 +286,11 @@ static int tb_eeprom_get_drom_offset(struct tb_switch *sw, u16 *offset)
 int tb_drom_read_uid_only(struct tb_switch *sw, u64 *uid)
 {
 	u8 data[9];
-	u16 drom_offset;
 	u8 crc;
-	int res = tb_eeprom_get_drom_offset(sw, &drom_offset);
-	if (res)
-		return res;
-
-	if (drom_offset == 0)
-		return -ENODEV;
+	int res;
 
 	/* read uid */
-	res = tb_eeprom_read_n(sw, drom_offset, data, 9);
+	res = tb_eeprom_read_n(sw, 0, data, 9);
 	if (res)
 		return res;
 
@@ -489,7 +492,6 @@ static int tb_drom_copy_nvm(struct tb_switch *sw, u16 *size)
  */
 int tb_drom_read(struct tb_switch *sw)
 {
-	u16 drom_offset;
 	u16 size;
 	u32 crc;
 	struct tb_drom_header *header;
@@ -517,11 +519,7 @@ int tb_drom_read(struct tb_switch *sw)
 		return 0;
 	}
 
-	res = tb_eeprom_get_drom_offset(sw, &drom_offset);
-	if (res)
-		return res;
-
-	res = tb_eeprom_read_n(sw, drom_offset + 14, (u8 *) &size, 2);
+	res = tb_eeprom_read_n(sw, 14, (u8 *) &size, 2);
 	if (res)
 		return res;
 	size &= 0x3ff;
@@ -535,7 +533,7 @@ int tb_drom_read(struct tb_switch *sw)
 	sw->drom = kzalloc(size, GFP_KERNEL);
 	if (!sw->drom)
 		return -ENOMEM;
-	res = tb_eeprom_read_n(sw, drom_offset, sw->drom, size);
+	res = tb_eeprom_read_n(sw, 0, sw->drom, size);
 	if (res)
 		goto err;
 
-- 
2.23.0

