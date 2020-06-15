Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675461F9A18
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730526AbgFOO0y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:39942 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730313AbgFOO0t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:49 -0400
IronPort-SDR: m5Y+FpKF6zOKgLvAKInM5KPzgPyxW7AvKrR1Ot2qm9dFqIx7FyptJ13WkRqpwWt9P5fHxg6WUm
 3Xwr8TODUBPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:49 -0700
IronPort-SDR: zOVqO3I7/ddN8oY1eSmUoJhHf9PZlYCJE8VfpzhlBcHw1jZS0vx/d84jy7OXLDNExVqfMmyikN
 njcCaxAyfrfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="261801670"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 15 Jun 2020 07:26:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D20EC4D9; Mon, 15 Jun 2020 17:26:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 04/17] thunderbolt: Check that both ports are reachable when allocating path
Date:   Mon, 15 Jun 2020 17:26:32 +0300
Message-Id: <20200615142645.56209-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add sanity check that given src and dst ports are reachable through path
walk before allocating a path. If they are not then bail out early.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 77abb1fa80c0..854ff3412161 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -229,7 +229,7 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 			      struct tb_port *dst, int dst_hopid, int link_nr,
 			      const char *name)
 {
-	struct tb_port *in_port, *out_port;
+	struct tb_port *in_port, *out_port, *first_port, *last_port;
 	int in_hopid, out_hopid;
 	struct tb_path *path;
 	size_t num_hops;
@@ -239,9 +239,20 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 	if (!path)
 		return NULL;
 
+	first_port = last_port = NULL;
 	i = 0;
-	tb_for_each_port_on_path(src, dst, in_port)
+	tb_for_each_port_on_path(src, dst, in_port) {
+		if (!first_port)
+			first_port = in_port;
+		last_port = in_port;
 		i++;
+	}
+
+	/* Check that src and dst are reachable */
+	if (first_port != src || last_port != dst) {
+		kfree(path);
+		return NULL;
+	}
 
 	/* Each hop takes two ports */
 	num_hops = i / 2;
-- 
2.27.0.rc2

