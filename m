Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69E31F9A13
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730436AbgFOO0u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:50 -0400
Received: from mga11.intel.com ([192.55.52.93]:39942 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730111AbgFOO0t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:49 -0400
IronPort-SDR: 4UsMNSGmILWWgZCWH6mGpOBqgT8bI6ZHUp/zUgr+c9ZzLNqyViuhZ5dwcH9Z/lMxVDeZDoZVu4
 Wv9EIOQ3B4+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:49 -0700
IronPort-SDR: m/gwxkfInxKzGEI0RWEJFECNFrm8VKHg4dEn7yfCjrqg9cMlqQ55dCK8tYDpfkUrdUGN1Jb1k/
 JRqh0dOc2SNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="261801668"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 15 Jun 2020 07:26:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CA91A298; Mon, 15 Jun 2020 17:26:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 03/17] thunderbolt: Make tb_path_alloc() work with tree topologies
Date:   Mon, 15 Jun 2020 17:26:31 +0300
Message-Id: <20200615142645.56209-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With USB4, topologies are not limited to daisy-chains anymore so when
calculating how many hops are between two ports we need to walk the
whole path instead.

Add helper function tb_for_each_port_on_path() that can be used to walk
over each port on a path and make tb_path_alloc() to use it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c | 12 ++++++------
 drivers/thunderbolt/tb.h   | 12 ++++++++++++
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index ad58559ea88e..77abb1fa80c0 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -239,12 +239,12 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 	if (!path)
 		return NULL;
 
-	/*
-	 * Number of hops on a path is the distance between the two
-	 * switches plus the source adapter port.
-	 */
-	num_hops = abs(tb_route_length(tb_route(src->sw)) -
-		       tb_route_length(tb_route(dst->sw))) + 1;
+	i = 0;
+	tb_for_each_port_on_path(src, dst, in_port)
+		i++;
+
+	/* Each hop takes two ports */
+	num_hops = i / 2;
 
 	path->hops = kcalloc(num_hops, sizeof(*path->hops), GFP_KERNEL);
 	if (!path->hops) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 2eb2bcd3cca3..6916168e2c76 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -741,6 +741,18 @@ void tb_port_release_out_hopid(struct tb_port *port, int hopid);
 struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 				     struct tb_port *prev);
 
+/**
+ * tb_for_each_port_on_path() - Iterate over each port on path
+ * @src: Source port
+ * @dst: Destination port
+ * @p: Port used as iterator
+ *
+ * Walks over each port on path from @src to @dst.
+ */
+#define tb_for_each_port_on_path(src, dst, p)				\
+	for ((p) = tb_next_port_on_path((src), (dst), NULL); (p);	\
+	     (p) = tb_next_port_on_path((src), (dst), (p)))
+
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
 int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap);
-- 
2.27.0.rc2

