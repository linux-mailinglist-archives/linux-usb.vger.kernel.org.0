Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BD8252C2C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgHZLHr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:18806 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728662AbgHZLHl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:41 -0400
IronPort-SDR: Y9RhEnNgEZhSB/pdKrbhDRqQhzEu8KsG0iSzTXVqdpC7r9dbO20RfJpo2W47fftTGzsoqnSLvP
 bngOeDJKsRHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="136333401"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="136333401"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:40 -0700
IronPort-SDR: Jjnm8nuXHkZxcPa9aM4CakKDYadU4Y4mnS0a/NgUswGB1zW+zaPFXbIu2BJ2nvyG4koBrnHhU1
 0JXKU/Y1W6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="339123431"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 26 Aug 2020 04:07:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id DB54B359; Wed, 26 Aug 2020 14:07:36 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/9] thunderbolt: Introduce tb_switch_next_cap()
Date:   Wed, 26 Aug 2020 14:07:30 +0300
Message-Id: <20200826110736.55186-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
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
---
 drivers/thunderbolt/cap.c | 83 +++++++++++++++++++++++++--------------
 drivers/thunderbolt/tb.h  |  1 +
 2 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/thunderbolt/cap.c b/drivers/thunderbolt/cap.c
index c45b3a488412..9af1b855e43b 100644
--- a/drivers/thunderbolt/cap.c
+++ b/drivers/thunderbolt/cap.c
@@ -132,6 +132,40 @@ int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap)
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
+	if (header.basic.cap == TB_SWITCH_CAP_VSE) {
+		if (!header.extended_short.length)
+			ret = header.extended_long.next;
+		else
+			ret = header.extended_short.next;
+	} else {
+		ret = header.basic.next;
+	}
+
+	return ret >= VSE_CAP_OFFSET_MAX ? 0 : ret;
+}
+
 /**
  * tb_switch_find_cap() - Find switch capability
  * @sw Switch to find the capability for
@@ -143,21 +177,23 @@ int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap)
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
@@ -174,37 +210,24 @@ int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap)
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
index 54e8fad78bee..a1d5de53a349 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -822,6 +822,7 @@ int tb_port_get_link_speed(struct tb_port *port);
 
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
+int tb_switch_next_cap(struct tb_switch *sw, unsigned int offset);
 int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap);
 int tb_port_next_cap(struct tb_port *port, unsigned int offset);
 bool tb_port_is_enabled(struct tb_port *port);
-- 
2.28.0

