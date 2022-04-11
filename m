Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09914FBCB4
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 15:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346334AbiDKNDQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 09:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346318AbiDKNDM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 09:03:12 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DAF27FE7
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649682058; x=1681218058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RinVWMSAMfLXUIEiMy6OWdKgga6uVSUGl9anc1CGrfY=;
  b=N291M0wHgL6U16t0/9KlAwAZBINBz1TyOqjDXHa9fMwtE9GvmV/1UWoY
   UjMPcarQPpYGJBt14SecX2EjR2qIf0X7kpptik+m7hc4KplRx7lzBx59/
   zXFOCJFlD4il3Gd0heQT41vuDnp5hFR50Km50WW900A59zIa0hMzVCVor
   igF31dG/FQEtTsa9wjdSnkMzMWC+RBMvSJg7qEde0VLwwJAmi/58V+3S+
   lo9R9ifyjGWGQiEoVIRy4ysVaj/TInCd+vDjSzdEZu+DvCEmKMUH7qzcq
   8PM9IqGWNZyrUVavIjGgt+FnfBi7u9tJ5znn3TcLu5rluybrlDoU4coH9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="242695528"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="242695528"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 06:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="572116726"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 11 Apr 2022 06:00:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6D4B0449; Mon, 11 Apr 2022 16:00:49 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Brad Campbell <lists2009@fnarfbargle.com>
Subject: [PATCH 4/4] thunderbolt: Use different lane for second DisplayPort tunnel
Date:   Mon, 11 Apr 2022 16:00:49 +0300
Message-Id: <20220411130049.53656-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
References: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Brad reported that on Apple hardware with Light Ridge or Falcon Ridge
controller, plugging in a chain of Thunderbolt displays (Light Ridge
based controllers) causes all kinds of tearing and flickering. The
reason for this is that on Thunderbolt 1 hardware there is no lane
bonding so we have two independent 10 Gb/s lanes, and currently Linux
tunnels both displays through the lane 1. This makes the displays to
share the 10 Gb/s bandwidth which may not be enough for higher
resolutions.

For this reason make the second tunnel go through the lane 0 instead.
This seems to match what the macOS connection manager is also doing.

Reported-by: Brad Campbell <lists2009@fnarfbargle.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     | 19 +++++++++++++++++--
 drivers/thunderbolt/test.c   | 16 ++++++++--------
 drivers/thunderbolt/tunnel.c | 11 ++++++-----
 drivers/thunderbolt/tunnel.h |  4 ++--
 4 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 9beb47b31c75..44d04b651a8b 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -867,7 +867,7 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 
 static void tb_tunnel_dp(struct tb *tb)
 {
-	int available_up, available_down, ret;
+	int available_up, available_down, ret, link_nr;
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_port *port, *in, *out;
 	struct tb_tunnel *tunnel;
@@ -912,6 +912,20 @@ static void tb_tunnel_dp(struct tb *tb)
 		return;
 	}
 
+	/*
+	 * This is only applicable to links that are not bonded (so
+	 * when Thunderbolt 1 hardware is involved somewhere in the
+	 * topology). For these try to share the DP bandwidth between
+	 * the two lanes.
+	 */
+	link_nr = 1;
+	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+		if (tb_tunnel_is_dp(tunnel)) {
+			link_nr = 0;
+			break;
+		}
+	}
+
 	/*
 	 * DP stream needs the domain to be active so runtime resume
 	 * both ends of the tunnel.
@@ -943,7 +957,8 @@ static void tb_tunnel_dp(struct tb *tb)
 	tb_dbg(tb, "available bandwidth for new DP tunnel %u/%u Mb/s\n",
 	       available_up, available_down);
 
-	tunnel = tb_tunnel_alloc_dp(tb, in, out, available_up, available_down);
+	tunnel = tb_tunnel_alloc_dp(tb, in, out, link_nr, available_up,
+				    available_down);
 	if (!tunnel) {
 		tb_port_dbg(out, "could not allocate DP tunnel\n");
 		goto err_reclaim;
diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 1f69bab236ee..66b6e665e96f 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -1348,7 +1348,7 @@ static void tb_test_tunnel_dp(struct kunit *test)
 	in = &host->ports[5];
 	out = &dev->ports[13];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
 	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1394,7 +1394,7 @@ static void tb_test_tunnel_dp_chain(struct kunit *test)
 	in = &host->ports[5];
 	out = &dev4->ports[14];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
 	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1444,7 +1444,7 @@ static void tb_test_tunnel_dp_tree(struct kunit *test)
 	in = &dev2->ports[13];
 	out = &dev5->ports[13];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
 	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1509,7 +1509,7 @@ static void tb_test_tunnel_dp_max_length(struct kunit *test)
 	in = &dev6->ports[13];
 	out = &dev12->ports[13];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
 	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1627,7 +1627,7 @@ static void tb_test_tunnel_port_on_path(struct kunit *test)
 	in = &dev2->ports[13];
 	out = &dev5->ports[13];
 
-	dp_tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	dp_tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
 	KUNIT_ASSERT_TRUE(test, dp_tunnel != NULL);
 
 	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, in));
@@ -2009,7 +2009,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	in = &host->ports[5];
 	out = &dev->ports[14];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
 	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
 	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)3);
 
@@ -2245,7 +2245,7 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL1(struct kunit *test,
 
 	in = &host->ports[5];
 	out = &dev->ports[13];
-	dp_tunnel1 = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	dp_tunnel1 = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
 	KUNIT_ASSERT_TRUE(test, dp_tunnel1 != NULL);
 	KUNIT_ASSERT_EQ(test, dp_tunnel1->npaths, (size_t)3);
 
@@ -2282,7 +2282,7 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL2(struct kunit *test,
 
 	in = &host->ports[6];
 	out = &dev->ports[14];
-	dp_tunnel2 = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	dp_tunnel2 = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
 	KUNIT_ASSERT_TRUE(test, dp_tunnel2 != NULL);
 	KUNIT_ASSERT_EQ(test, dp_tunnel2->npaths, (size_t)3);
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 118742ec93ed..8ccd70920b6a 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -858,6 +858,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
  * @tb: Pointer to the domain structure
  * @in: DP in adapter port
  * @out: DP out adapter port
+ * @link_nr: Preferred lane adapter when the link is not bonded
  * @max_up: Maximum available upstream bandwidth for the DP tunnel (%0
  *	    if not limited)
  * @max_down: Maximum available downstream bandwidth for the DP tunnel
@@ -869,8 +870,8 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
  * Return: Returns a tb_tunnel on success or NULL on failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
-				     struct tb_port *out, int max_up,
-				     int max_down)
+				     struct tb_port *out, int link_nr,
+				     int max_up, int max_down)
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path **paths;
@@ -894,21 +895,21 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	paths = tunnel->paths;
 
 	path = tb_path_alloc(tb, in, TB_DP_VIDEO_HOPID, out, TB_DP_VIDEO_HOPID,
-			     1, "Video");
+			     link_nr, "Video");
 	if (!path)
 		goto err_free;
 	tb_dp_init_video_path(path);
 	paths[TB_DP_VIDEO_PATH_OUT] = path;
 
 	path = tb_path_alloc(tb, in, TB_DP_AUX_TX_HOPID, out,
-			     TB_DP_AUX_TX_HOPID, 1, "AUX TX");
+			     TB_DP_AUX_TX_HOPID, link_nr, "AUX TX");
 	if (!path)
 		goto err_free;
 	tb_dp_init_aux_path(path);
 	paths[TB_DP_AUX_PATH_OUT] = path;
 
 	path = tb_path_alloc(tb, out, TB_DP_AUX_RX_HOPID, in,
-			     TB_DP_AUX_RX_HOPID, 1, "AUX RX");
+			     TB_DP_AUX_RX_HOPID, link_nr, "AUX RX");
 	if (!path)
 		goto err_free;
 	tb_dp_init_aux_path(path);
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 03e56076b5bc..bb4d1f1d6d0b 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -71,8 +71,8 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 					bool alloc_hopid);
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
-				     struct tb_port *out, int max_up,
-				     int max_down);
+				     struct tb_port *out, int link_nr,
+				     int max_up, int max_down);
 struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 				      struct tb_port *dst, int transmit_path,
 				      int transmit_ring, int receive_path,
-- 
2.35.1

