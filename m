Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F5B258AE6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 11:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgIAJBa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 05:01:30 -0400
Received: from mga17.intel.com ([192.55.52.151]:32159 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgIAJB3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 05:01:29 -0400
IronPort-SDR: r6lZqDo1bz8X4wG0HECCJi8zzgFiPSaCAIG6Qk1aApGmZbCWNTrogEquW9Z9CBeimrygah1SlD
 KsRK/cmac9LQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="137178425"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="137178425"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 02:01:28 -0700
IronPort-SDR: U+8yXhSi045XLaF4XSdsfXSSfezh2yEx9pOh+zXC0haTJcL/6792Yxw7Ju/2KqAxWBw4lscknk
 2Czp54jPh1wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="502172580"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2020 02:01:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 11AE811E; Tue,  1 Sep 2020 12:01:24 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 3/9] thunderbolt: Introduce tb_switch_next_cap()
Date:   Tue,  1 Sep 2020 12:01:24 +0300
Message-Id: <20200901090124.31282-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-4-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is similar to tb_port_next_cap() but instead allows walking
capability list of a switch (router). Convert tb_switch_find_cap() and
tb_switch_find_vse_cap() to use this as well.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Hi all,

Just sending this one as the rest of the series is unchanged. I noticed
when testing with older devices, the Port Ridge controller (found on Apple
Thunderbolt ethernet/firewire dongles) does not terminate the router
capability list correctly so this version checks for the two supported
capability IDs and terminates the walk if an unknown ID is found.

Also added Greg's tag.

 drivers/thunderbolt/cap.c | 93 ++++++++++++++++++++++++++-------------
 drivers/thunderbolt/tb.h  |  1 +
 2 files changed, 64 insertions(+), 30 deletions(-)

diff --git a/drivers/thunderbolt/cap.c b/drivers/thunderbolt/cap.c
index c45b3a488412..6f571e912cf2 100644
--- a/drivers/thunderbolt/cap.c
+++ b/drivers/thunderbolt/cap.c
@@ -132,6 +132,50 @@ int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap)
 	return ret;
 }
 
+/**
+ * tb_switch_next_cap() - Return next capability in the linked list
+ * @sw: Switch to find the capability for
+ * @offset: Previous capability offset (%0 for start)
+ *
+ * Finds dword offset of the next capability in router config space
+ * capability list and returns it. Passing %0 returns the first entry in
+ * the capability list. If no next capability is found returns %0. In case
+ * of failure returns negative errno.
+ */
+int tb_switch_next_cap(struct tb_switch *sw, unsigned int offset)
+{
+	struct tb_cap_any header;
+	int ret;
+
+	if (!offset)
+		return sw->config.first_cap_offset;
+
+	ret = tb_sw_read(sw, &header, TB_CFG_SWITCH, offset, 2);
+	if (ret)
+		return ret;
+
+	switch (header.basic.cap) {
+	case TB_SWITCH_CAP_TMU:
+		ret = header.basic.next;
+		break;
+
+	case TB_SWITCH_CAP_VSE:
+		if (!header.extended_short.length)
+			ret = header.extended_long.next;
+		else
+			ret = header.extended_short.next;
+		break;
+
+	default:
+		tb_sw_dbg(sw, "unknown capability %#x at %#x\n",
+			  header.basic.cap, offset);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret >= VSE_CAP_OFFSET_MAX ? 0 : ret;
+}
+
 /**
  * tb_switch_find_cap() - Find switch capability
  * @sw Switch to find the capability for
@@ -143,21 +187,23 @@ int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap)
  */
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap)
 {
-	int offset = sw->config.first_cap_offset;
+	int offset = 0;
 
-	while (offset > 0 && offset < CAP_OFFSET_MAX) {
+	do {
 		struct tb_cap_any header;
 		int ret;
 
+		offset = tb_switch_next_cap(sw, offset);
+		if (offset < 0)
+			return offset;
+
 		ret = tb_sw_read(sw, &header, TB_CFG_SWITCH, offset, 1);
 		if (ret)
 			return ret;
 
 		if (header.basic.cap == cap)
 			return offset;
-
-		offset = header.basic.next;
-	}
+	} while (offset);
 
 	return -ENOENT;
 }
@@ -174,37 +220,24 @@ int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap)
  */
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec)
 {
-	struct tb_cap_any header;
-	int offset;
-
-	offset = tb_switch_find_cap(sw, TB_SWITCH_CAP_VSE);
-	if (offset < 0)
-		return offset;
+	int offset = 0;
 
-	while (offset > 0 && offset < VSE_CAP_OFFSET_MAX) {
+	do {
+		struct tb_cap_any header;
 		int ret;
 
-		ret = tb_sw_read(sw, &header, TB_CFG_SWITCH, offset, 2);
+		offset = tb_switch_next_cap(sw, offset);
+		if (offset < 0)
+			return offset;
+
+		ret = tb_sw_read(sw, &header, TB_CFG_SWITCH, offset, 1);
 		if (ret)
 			return ret;
 
-		/*
-		 * Extended vendor specific capabilities come in two
-		 * flavors: short and long. The latter is used when
-		 * offset is over 0xff.
-		 */
-		if (offset >= CAP_OFFSET_MAX) {
-			if (header.extended_long.vsec_id == vsec)
-				return offset;
-			offset = header.extended_long.next;
-		} else {
-			if (header.extended_short.vsec_id == vsec)
-				return offset;
-			if (!header.extended_short.length)
-				return -ENOENT;
-			offset = header.extended_short.next;
-		}
-	}
+		if (header.extended_short.cap == TB_SWITCH_CAP_VSE &&
+		    header.extended_short.vsec_id == vsec)
+			return offset;
+	} while (offset);
 
 	return -ENOENT;
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 786c313ce97c..cbd18cad9bcd 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -828,6 +828,7 @@ int tb_port_get_link_speed(struct tb_port *port);
 
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
+int tb_switch_next_cap(struct tb_switch *sw, unsigned int offset);
 int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap);
 int tb_port_next_cap(struct tb_port *port, unsigned int offset);
 bool tb_port_is_enabled(struct tb_port *port);
-- 
2.28.0

