Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7B73A685D
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 15:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhFNNv6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 09:51:58 -0400
Received: from mga14.intel.com ([192.55.52.115]:49039 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233434AbhFNNv5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Jun 2021 09:51:57 -0400
IronPort-SDR: cH3pgZBBVB3/g0YkPh/TKtxIJoLTyJLp+jIH8X3MMhbUbWt2XPA/rVxpJ6v4ZKnwf7OGshcCte
 IMEVynQzoJdg==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205631114"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="205631114"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2021 06:49:54 -0700
IronPort-SDR: KhrLnVeM+ZRfyw83WFQG15hm+t+jrEYphqDJkh2t+wkDpg/Ron847hJfAyOYLAHYupWVXrNTBw
 Yly1UghhSV+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="403661401"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga006.jf.intel.com with ESMTP; 14 Jun 2021 06:49:52 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH] thunderbolt: Fix DROM handling for USB4 DROM
Date:   Mon, 14 Jun 2021 16:52:10 +0300
Message-Id: <20210614135210.29787-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DROM for USB4 host/device has a shorter header than Thunderbolt DROM
header. This patch addresses host/device with USB4 DROM (According to spec:
Universal Serial Bus 4 (USB4) Device ROM Specification, Rev 1.0, Feb-2021).

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/eeprom.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 46d0906a3070..f9d26bd4f486 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -214,7 +214,10 @@ static u32 tb_crc32(void *data, size_t len)
 	return ~__crc32c_le(~0, data, len);
 }
 
-#define TB_DROM_DATA_START 13
+#define TB_DROM_DATA_START		13
+#define TB_DROM_HEADER_LENGTH		22
+/* BYTES 16-21 - nonexistent in USB4 DROM */
+#define TB_DROM_USB4_HEADER_LENGTH	16
 struct tb_drom_header {
 	/* BYTE 0 */
 	u8 uid_crc8; /* checksum for uid */
@@ -224,9 +227,9 @@ struct tb_drom_header {
 	u32 data_crc32; /* checksum for data_len bytes starting at byte 13 */
 	/* BYTE 13 */
 	u8 device_rom_revision; /* should be <= 1 */
-	u16 data_len:10;
-	u8 __unknown1:6;
-	/* BYTES 16-21 */
+	u16 data_len:12;
+	u8 reserved:4;
+	/* BYTES 16-21 - Only for TBT DROM, nonexistent in USB4 DROM */
 	u16 vendor_id;
 	u16 model_id;
 	u8 model_rev;
@@ -401,10 +404,10 @@ static int tb_drom_parse_entry_port(struct tb_switch *sw,
  *
  * Drom must have been copied to sw->drom.
  */
-static int tb_drom_parse_entries(struct tb_switch *sw)
+static int tb_drom_parse_entries(struct tb_switch *sw, size_t header_length)
 {
 	struct tb_drom_header *header = (void *) sw->drom;
-	u16 pos = sizeof(*header);
+	u16 pos = header_length;
 	u16 drom_size = header->data_len + TB_DROM_DATA_START;
 	int res;
 
@@ -566,7 +569,7 @@ static int tb_drom_parse(struct tb_switch *sw)
 			header->data_crc32, crc);
 	}
 
-	return tb_drom_parse_entries(sw);
+	return tb_drom_parse_entries(sw, TB_DROM_HEADER_LENGTH);
 }
 
 static int usb4_drom_parse(struct tb_switch *sw)
@@ -583,7 +586,7 @@ static int usb4_drom_parse(struct tb_switch *sw)
 		return -EINVAL;
 	}
 
-	return tb_drom_parse_entries(sw);
+	return tb_drom_parse_entries(sw, TB_DROM_USB4_HEADER_LENGTH);
 }
 
 /**
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

