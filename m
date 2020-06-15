Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C931F9A29
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbgFOO36 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:29:58 -0400
Received: from mga14.intel.com ([192.55.52.115]:53903 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730529AbgFOO34 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:29:56 -0400
IronPort-SDR: Rtr/XI8PA2O3K60T15jKRLRZZHheKEicJt4UlwdqwPPuCyb17v5MAW0xbyg1QtpbTMprFm9pth
 cETg2Gs+Tv1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:54 -0700
IronPort-SDR: KE6dqrlUM8LLI1HlIn7fY0BrQWaMKu3O49F+weLFpSXxU+3IgsPj/iBygC0pK5wTGRx+wUwV9Z
 +6V43Q1KJj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="476033294"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2020 07:26:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5F62E8CA; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 17/17] thunderbolt: Add KUnit tests for tunneling
Date:   Mon, 15 Jun 2020 17:26:45 +0300
Message-Id: <20200615142645.56209-18-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We can test some parts of tunneling, like path allocation without access
to test hardware so add KUnit tests for PCIe, DP and USB3 tunneling.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/test.c | 398 +++++++++++++++++++++++++++++++++++++
 1 file changed, 398 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 9e60bab46d34..acb8b6256847 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -10,6 +10,7 @@
 #include <linux/idr.h>
 
 #include "tb.h"
+#include "tunnel.h"
 
 static int __ida_init(struct kunit_resource *res, void *context)
 {
@@ -1203,6 +1204,396 @@ static void tb_test_path_mixed_chain_reverse(struct kunit *test)
 	tb_path_free(path);
 }
 
+static void tb_test_tunnel_pcie(struct kunit *test)
+{
+	struct tb_switch *host, *dev1, *dev2;
+	struct tb_tunnel *tunnel1, *tunnel2;
+	struct tb_port *down, *up;
+
+	/*
+	 * Create PCIe tunnel between host and two devices.
+	 *
+	 *   [Host]
+	 *    1 |
+	 *    1 |
+	 *  [Device #1]
+	 *    5 |
+	 *    1 |
+	 *  [Device #2]
+	 */
+	host = alloc_host(test);
+	dev1 = alloc_dev_default(test, host, 0x1, true);
+	dev2 = alloc_dev_default(test, dev1, 0x501, true);
+
+	down = &host->ports[8];
+	up = &dev1->ports[9];
+	tunnel1 = tb_tunnel_alloc_pci(NULL, up, down);
+	KUNIT_ASSERT_TRUE(test, tunnel1 != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel1->type, (enum tb_tunnel_type)TB_TUNNEL_PCI);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->src_port, down);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->dst_port, up);
+	KUNIT_ASSERT_EQ(test, tunnel1->npaths, (size_t)2);
+	KUNIT_ASSERT_EQ(test, tunnel1->paths[0]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[0]->hops[0].in_port, down);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[0]->hops[1].out_port, up);
+	KUNIT_ASSERT_EQ(test, tunnel1->paths[1]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[1]->hops[0].in_port, up);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[1]->hops[1].out_port, down);
+
+	down = &dev1->ports[10];
+	up = &dev2->ports[9];
+	tunnel2 = tb_tunnel_alloc_pci(NULL, up, down);
+	KUNIT_ASSERT_TRUE(test, tunnel2 != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel2->type, (enum tb_tunnel_type)TB_TUNNEL_PCI);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->src_port, down);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->dst_port, up);
+	KUNIT_ASSERT_EQ(test, tunnel2->npaths, (size_t)2);
+	KUNIT_ASSERT_EQ(test, tunnel2->paths[0]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[0]->hops[0].in_port, down);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[0]->hops[1].out_port, up);
+	KUNIT_ASSERT_EQ(test, tunnel2->paths[1]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[1]->hops[0].in_port, up);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[1]->hops[1].out_port, down);
+
+	tb_tunnel_free(tunnel2);
+	tb_tunnel_free(tunnel1);
+}
+
+static void tb_test_tunnel_dp(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *in, *out;
+	struct tb_tunnel *tunnel;
+
+	/*
+	 * Create DP tunnel between Host and Device
+	 *
+	 *   [Host]
+	 *   1 |
+	 *   1 |
+	 *  [Device]
+	 */
+	host = alloc_host(test);
+	dev = alloc_dev_default(test, host, 0x3, true);
+
+	in = &host->ports[5];
+	out = &dev->ports[13];
+
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel->type, (enum tb_tunnel_type)TB_TUNNEL_DP);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->dst_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)3);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[1].out_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[1]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].in_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[1].out_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[2]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[0].in_port, out);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[1].out_port, in);
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_tunnel_dp_chain(struct kunit *test)
+{
+	struct tb_switch *host, *dev1, *dev4;
+	struct tb_port *in, *out;
+	struct tb_tunnel *tunnel;
+
+	/*
+	 * Create DP tunnel from Host DP IN to Device #4 DP OUT.
+	 *
+	 *           [Host]
+	 *            1 |
+	 *            1 |
+	 *         [Device #1]
+	 *       3 /   | 5  \ 7
+	 *      1 /    |     \ 1
+	 * [Device #2] |    [Device #4]
+	 *             | 1
+	 *         [Device #3]
+	 */
+	host = alloc_host(test);
+	dev1 = alloc_dev_default(test, host, 0x1, true);
+	alloc_dev_default(test, dev1, 0x301, true);
+	alloc_dev_default(test, dev1, 0x501, true);
+	dev4 = alloc_dev_default(test, dev1, 0x701, true);
+
+	in = &host->ports[5];
+	out = &dev4->ports[14];
+
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel->type, (enum tb_tunnel_type)TB_TUNNEL_DP);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->dst_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)3);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 3);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[2].out_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[1]->path_length, 3);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].in_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[2].out_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[2]->path_length, 3);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[0].in_port, out);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[2].out_port, in);
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_tunnel_dp_tree(struct kunit *test)
+{
+	struct tb_switch *host, *dev1, *dev2, *dev3, *dev5;
+	struct tb_port *in, *out;
+	struct tb_tunnel *tunnel;
+
+	/*
+	 * Create DP tunnel from Device #2 DP IN to Device #5 DP OUT.
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
+	host = alloc_host(test);
+	dev1 = alloc_dev_default(test, host, 0x3, true);
+	dev2 = alloc_dev_with_dpin(test, dev1, 0x303, true);
+	dev3 = alloc_dev_default(test, dev1, 0x503, true);
+	alloc_dev_default(test, dev1, 0x703, true);
+	dev5 = alloc_dev_default(test, dev3, 0x50503, true);
+
+	in = &dev2->ports[13];
+	out = &dev5->ports[13];
+
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel->type, (enum tb_tunnel_type)TB_TUNNEL_DP);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->dst_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)3);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 4);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[3].out_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[1]->path_length, 4);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].in_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[3].out_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[2]->path_length, 4);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[0].in_port, out);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[3].out_port, in);
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_tunnel_dp_max_length(struct kunit *test)
+{
+	struct tb_switch *host, *dev1, *dev2, *dev3, *dev4, *dev5, *dev6;
+	struct tb_switch *dev7, *dev8, *dev9, *dev10, *dev11, *dev12;
+	struct tb_port *in, *out;
+	struct tb_tunnel *tunnel;
+
+	/*
+	 * Creates DP tunnel from Device #6 to Device #12.
+	 *
+	 *          [Host]
+	 *         1 /  \ 3
+	 *        1 /    \ 1
+	 * [Device #1]   [Device #7]
+	 *     3 |           | 3
+	 *     1 |           | 1
+	 * [Device #2]   [Device #8]
+	 *     3 |           | 3
+	 *     1 |           | 1
+	 * [Device #3]   [Device #9]
+	 *     3 |           | 3
+	 *     1 |           | 1
+	 * [Device #4]   [Device #10]
+	 *     3 |           | 3
+	 *     1 |           | 1
+	 * [Device #5]   [Device #11]
+	 *     3 |           | 3
+	 *     1 |           | 1
+	 * [Device #6]   [Device #12]
+	 */
+	host = alloc_host(test);
+	dev1 = alloc_dev_default(test, host, 0x1, true);
+	dev2 = alloc_dev_default(test, dev1, 0x301, true);
+	dev3 = alloc_dev_default(test, dev2, 0x30301, true);
+	dev4 = alloc_dev_default(test, dev3, 0x3030301, true);
+	dev5 = alloc_dev_default(test, dev4, 0x303030301, true);
+	dev6 = alloc_dev_with_dpin(test, dev5, 0x30303030301, true);
+	dev7 = alloc_dev_default(test, host, 0x3, true);
+	dev8 = alloc_dev_default(test, dev7, 0x303, true);
+	dev9 = alloc_dev_default(test, dev8, 0x30303, true);
+	dev10 = alloc_dev_default(test, dev9, 0x3030303, true);
+	dev11 = alloc_dev_default(test, dev10, 0x303030303, true);
+	dev12 = alloc_dev_default(test, dev11, 0x30303030303, true);
+
+	in = &dev6->ports[13];
+	out = &dev12->ports[13];
+
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel->type, (enum tb_tunnel_type)TB_TUNNEL_DP);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->dst_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)3);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 13);
+	/* First hop */
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, in);
+	/* Middle */
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[6].in_port,
+			    &host->ports[1]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[6].out_port,
+			    &host->ports[3]);
+	/* Last */
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[12].out_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[1]->path_length, 13);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].in_port, in);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[6].in_port,
+			    &host->ports[1]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[6].out_port,
+			    &host->ports[3]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[12].out_port, out);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[2]->path_length, 13);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[0].in_port, out);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[6].in_port,
+			    &host->ports[3]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[6].out_port,
+			    &host->ports[1]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[12].out_port, in);
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_tunnel_usb3(struct kunit *test)
+{
+	struct tb_switch *host, *dev1, *dev2;
+	struct tb_tunnel *tunnel1, *tunnel2;
+	struct tb_port *down, *up;
+
+	/*
+	 * Create USB3 tunnel between host and two devices.
+	 *
+	 *   [Host]
+	 *    1 |
+	 *    1 |
+	 *  [Device #1]
+	 *          \ 7
+	 *           \ 1
+	 *         [Device #2]
+	 */
+	host = alloc_host(test);
+	dev1 = alloc_dev_default(test, host, 0x1, true);
+	dev2 = alloc_dev_default(test, dev1, 0x701, true);
+
+	down = &host->ports[12];
+	up = &dev1->ports[16];
+	tunnel1 = tb_tunnel_alloc_usb3(NULL, up, down, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel1 != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel1->type, (enum tb_tunnel_type)TB_TUNNEL_USB3);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->src_port, down);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->dst_port, up);
+	KUNIT_ASSERT_EQ(test, tunnel1->npaths, (size_t)2);
+	KUNIT_ASSERT_EQ(test, tunnel1->paths[0]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[0]->hops[0].in_port, down);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[0]->hops[1].out_port, up);
+	KUNIT_ASSERT_EQ(test, tunnel1->paths[1]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[1]->hops[0].in_port, up);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[1]->hops[1].out_port, down);
+
+	down = &dev1->ports[17];
+	up = &dev2->ports[16];
+	tunnel2 = tb_tunnel_alloc_usb3(NULL, up, down, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel2 != NULL);
+	KUNIT_EXPECT_EQ(test, tunnel2->type, (enum tb_tunnel_type)TB_TUNNEL_USB3);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->src_port, down);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->dst_port, up);
+	KUNIT_ASSERT_EQ(test, tunnel2->npaths, (size_t)2);
+	KUNIT_ASSERT_EQ(test, tunnel2->paths[0]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[0]->hops[0].in_port, down);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[0]->hops[1].out_port, up);
+	KUNIT_ASSERT_EQ(test, tunnel2->paths[1]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[1]->hops[0].in_port, up);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[1]->hops[1].out_port, down);
+
+	tb_tunnel_free(tunnel2);
+	tb_tunnel_free(tunnel1);
+}
+
+static void tb_test_tunnel_port_on_path(struct kunit *test)
+{
+	struct tb_switch *host, *dev1, *dev2, *dev3, *dev4, *dev5;
+	struct tb_port *in, *out, *port;
+	struct tb_tunnel *dp_tunnel;
+
+	/*
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
+	host = alloc_host(test);
+	dev1 = alloc_dev_default(test, host, 0x3, true);
+	dev2 = alloc_dev_with_dpin(test, dev1, 0x303, true);
+	dev3 = alloc_dev_default(test, dev1, 0x503, true);
+	dev4 = alloc_dev_default(test, dev1, 0x703, true);
+	dev5 = alloc_dev_default(test, dev3, 0x50503, true);
+
+	in = &dev2->ports[13];
+	out = &dev5->ports[13];
+
+	dp_tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	KUNIT_ASSERT_TRUE(test, dp_tunnel != NULL);
+
+	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, in));
+	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, out));
+
+	port = &host->ports[8];
+	KUNIT_EXPECT_FALSE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	port = &host->ports[3];
+	KUNIT_EXPECT_FALSE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	port = &dev1->ports[1];
+	KUNIT_EXPECT_FALSE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	port = &dev1->ports[3];
+	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	port = &dev1->ports[5];
+	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	port = &dev1->ports[7];
+	KUNIT_EXPECT_FALSE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	port = &dev3->ports[1];
+	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	port = &dev5->ports[1];
+	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	port = &dev4->ports[1];
+	KUNIT_EXPECT_FALSE(test, tb_tunnel_port_on_path(dp_tunnel, port));
+
+	tb_tunnel_free(dp_tunnel);
+}
+
 static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_path_basic),
 	KUNIT_CASE(tb_test_path_not_connected_walk),
@@ -1218,6 +1609,13 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_path_not_bonded_lane1_chain_reverse),
 	KUNIT_CASE(tb_test_path_mixed_chain),
 	KUNIT_CASE(tb_test_path_mixed_chain_reverse),
+	KUNIT_CASE(tb_test_tunnel_pcie),
+	KUNIT_CASE(tb_test_tunnel_dp),
+	KUNIT_CASE(tb_test_tunnel_dp_chain),
+	KUNIT_CASE(tb_test_tunnel_dp_tree),
+	KUNIT_CASE(tb_test_tunnel_dp_max_length),
+	KUNIT_CASE(tb_test_tunnel_port_on_path),
+	KUNIT_CASE(tb_test_tunnel_usb3),
 	{ }
 };
 
-- 
2.27.0.rc2

