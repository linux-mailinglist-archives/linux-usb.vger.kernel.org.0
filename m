Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64995252C27
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgHZLHk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:18806 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728605AbgHZLHk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:40 -0400
IronPort-SDR: xxxUN7c7ODGiwSrfTzAKpCR8jQ7F+/cme/Ls9molDvzb4MGL8AlZh2lgYqpYdp89B6A7az0L1e
 9unnQp/q3gcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="136333399"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="136333399"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:39 -0700
IronPort-SDR: cwE2FuYQA7wUBluc5SAsfjdlOa7PRdLjYq45CxLOlYvEcZ1WzthiLen+8tQsEsTYWUxo79y+qi
 qYdoXWrqboUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="339123429"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 26 Aug 2020 04:07:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D602F3D3; Wed, 26 Aug 2020 14:07:36 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/9] thunderbolt: Introduce tb_port_next_cap()
Date:   Wed, 26 Aug 2020 14:07:29 +0300
Message-Id: <20200826110736.55186-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This function is useful for walking port config space (adapter)
capability lists. Convert the tb_port_find_cap() to use this as well.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/cap.c | 35 +++++++++++++++++++++++++++++++----
 drivers/thunderbolt/tb.h  |  1 +
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/cap.c b/drivers/thunderbolt/cap.c
index 1582e4ebac56..c45b3a488412 100644
--- a/drivers/thunderbolt/cap.c
+++ b/drivers/thunderbolt/cap.c
@@ -59,23 +59,50 @@ static void tb_port_dummy_read(struct tb_port *port)
 	}
 }
 
+/**
+ * tb_port_next_cap() - Return next capability in the linked list
+ * @port: Port to find the capability for
+ * @offset: Previous capability offset (%0 for start)
+ *
+ * Returns dword offset of the next capability in port config space
+ * capability list and returns it. Passing %0 returns the first entry in
+ * the capability list. If no next capability is found returns %0. In case
+ * of failure returns negative errno.
+ */
+int tb_port_next_cap(struct tb_port *port, unsigned int offset)
+{
+	struct tb_cap_any header;
+	int ret;
+
+	if (!offset)
+		return port->config.first_cap_offset;
+
+	ret = tb_port_read(port, &header, TB_CFG_PORT, offset, 1);
+	if (ret)
+		return ret;
+
+	return header.basic.next;
+}
+
 static int __tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap)
 {
-	u32 offset = 1;
+	int offset = 0;
 
 	do {
 		struct tb_cap_any header;
 		int ret;
 
+		offset = tb_port_next_cap(port, offset);
+		if (offset < 0)
+			return offset;
+
 		ret = tb_port_read(port, &header, TB_CFG_PORT, offset, 1);
 		if (ret)
 			return ret;
 
 		if (header.basic.cap == cap)
 			return offset;
-
-		offset = header.basic.next;
-	} while (offset);
+	} while (offset > 0);
 
 	return -ENOENT;
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 7754c690addc..54e8fad78bee 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -823,6 +823,7 @@ int tb_port_get_link_speed(struct tb_port *port);
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
 int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap);
+int tb_port_next_cap(struct tb_port *port, unsigned int offset);
 bool tb_port_is_enabled(struct tb_port *port);
 
 bool tb_usb3_port_is_enabled(struct tb_port *port);
-- 
2.28.0

