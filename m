Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAFDF72BB54
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbjFLIxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233773AbjFLIxL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:11 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAAA30D2
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559947; x=1718095947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mtVaF8FBbmCvY3tO9Dra+v8+HXVgN+/DBdtdtcFzQMY=;
  b=GEsIGDLOb9bxtBJwPeJAIrWZIJqmk0e/1lbIL7mBW1R7mDGuIAd0iBzX
   QvYvgTENYcsRVVPJO9tALsymE2P0pYjNPF87BavilXukQ+trL7Xd58rAu
   L+3ABq0zDLDu1naUD57kLIFXzdfB+ydy8LdHU/JlvThkwpvXnM2ItZk32
   yRCqoQ7+BaQ/HWW068FURhG3Eucw0RAZ+hS058kfyGk/6cIgiw/8+3cyW
   pvbGKiVb2Pcpqo1qHD5+zhYjHW9INtmvDzlB+tlMw7yQQWVsJCeaow3zr
   +kYKyAs7rhIYI7Zv4/IUswEMrylR74NY1pxN2BMX8RjKIOnfFL3qaPKUs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627322"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627322"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247785"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247785"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 26882BE1; Mon, 12 Jun 2023 11:21:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 20/20] thunderbolt: Add test case for 3 DisplayPort tunnels
Date:   Mon, 12 Jun 2023 11:21:45 +0300
Message-Id: <20230612082145.62218-21-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
References: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Barlow Ridge Thunderbolt controller has 3 DP IN adapters. This
allows 3 simultaneus DisplayPort tunnels through either one or two USB4
downstream ports (in any possible configuration). Add test case for
this.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/test.c | 83 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 24c06e7354cd..9475c6698c7d 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -170,6 +170,23 @@ static struct tb_switch *alloc_host_usb4(struct kunit *test)
 	return sw;
 }
 
+static struct tb_switch *alloc_host_br(struct kunit *test)
+{
+	struct tb_switch *sw;
+
+	sw = alloc_host_usb4(test);
+	if (!sw)
+		return NULL;
+
+	sw->ports[10].config.type = TB_TYPE_DP_HDMI_IN;
+	sw->ports[10].config.max_in_hop_id = 9;
+	sw->ports[10].config.max_out_hop_id = 9;
+	sw->ports[10].cap_adap = -1;
+	sw->ports[10].disabled = false;
+
+	return sw;
+}
+
 static struct tb_switch *alloc_dev_default(struct kunit *test,
 					   struct tb_switch *parent,
 					   u64 route, bool bonded)
@@ -1583,6 +1600,71 @@ static void tb_test_tunnel_dp_max_length(struct kunit *test)
 	tb_tunnel_free(tunnel);
 }
 
+static void tb_test_tunnel_3dp(struct kunit *test)
+{
+	struct tb_switch *host, *dev1, *dev2, *dev3, *dev4, *dev5;
+	struct tb_port *in1, *in2, *in3, *out1, *out2, *out3;
+	struct tb_tunnel *tunnel1, *tunnel2, *tunnel3;
+
+	/*
+	 * Create 3 DP tunnels from Host to Devices #2, #5 and #4.
+	 *
+	 *          [Host]
+	 *           3 |
+	 *           1 |
+	 *         [Device #1]
+	 *       3 /   | 5  \ 7
+	 *      1 /    |     \ 1
+	 * [Device #2] |    [Device #4]
+	 *             | 1
+	 *         [Device #3]
+	 *             | 5
+	 *             | 1
+	 *         [Device #5]
+	 */
+	host = alloc_host_br(test);
+	dev1 = alloc_dev_default(test, host, 0x3, true);
+	dev2 = alloc_dev_default(test, dev1, 0x303, true);
+	dev3 = alloc_dev_default(test, dev1, 0x503, true);
+	dev4 = alloc_dev_default(test, dev1, 0x703, true);
+	dev5 = alloc_dev_default(test, dev3, 0x50503, true);
+
+	in1 = &host->ports[5];
+	in2 = &host->ports[6];
+	in3 = &host->ports[10];
+
+	out1 = &dev2->ports[13];
+	out2 = &dev5->ports[13];
+	out3 = &dev4->ports[14];
+
+	tunnel1 = tb_tunnel_alloc_dp(NULL, in1, out1, 1, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel1 != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel1->type, TB_TUNNEL_DP);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->src_port, in1);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->dst_port, out1);
+	KUNIT_ASSERT_EQ(test, tunnel1->npaths, 3);
+	KUNIT_ASSERT_EQ(test, tunnel1->paths[0]->path_length, 3);
+
+	tunnel2 = tb_tunnel_alloc_dp(NULL, in2, out2, 1, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel2 != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel2->type, TB_TUNNEL_DP);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->src_port, in2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->dst_port, out2);
+	KUNIT_ASSERT_EQ(test, tunnel2->npaths, 3);
+	KUNIT_ASSERT_EQ(test, tunnel2->paths[0]->path_length, 4);
+
+	tunnel3 = tb_tunnel_alloc_dp(NULL, in3, out3, 1, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel3 != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel3->type, TB_TUNNEL_DP);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel3->src_port, in3);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel3->dst_port, out3);
+	KUNIT_ASSERT_EQ(test, tunnel3->npaths, 3);
+	KUNIT_ASSERT_EQ(test, tunnel3->paths[0]->path_length, 3);
+
+	tb_tunnel_free(tunnel2);
+	tb_tunnel_free(tunnel1);
+}
+
 static void tb_test_tunnel_usb3(struct kunit *test)
 {
 	struct tb_switch *host, *dev1, *dev2;
@@ -2790,6 +2872,7 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_tunnel_dp_chain),
 	KUNIT_CASE(tb_test_tunnel_dp_tree),
 	KUNIT_CASE(tb_test_tunnel_dp_max_length),
+	KUNIT_CASE(tb_test_tunnel_3dp),
 	KUNIT_CASE(tb_test_tunnel_port_on_path),
 	KUNIT_CASE(tb_test_tunnel_usb3),
 	KUNIT_CASE(tb_test_tunnel_dma),
-- 
2.39.2

