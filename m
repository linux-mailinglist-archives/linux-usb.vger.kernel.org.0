Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7326387AB5
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349806AbhEROLH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:07 -0400
Received: from mga11.intel.com ([192.55.52.93]:35580 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349803AbhEROLE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:04 -0400
IronPort-SDR: soxXnFe+aDkH2xgKlMem2FjzR+fWzsH/i2N7KzQzjWr7Euj0WCTixOc9amJ5Sx/XYP3uzkqNE+
 h03JxlOutqSQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197633019"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="197633019"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:46 -0700
IronPort-SDR: ZgdswECWlsBg6/ut9PAd0nGexpdN8SIPw1UNefRZpFE2Cq6Pw+r0ekqdJFzZbug8IzEAbJV5iX
 P3NDvFubWK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="627076867"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 18 May 2021 07:09:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C79E48F2; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 8/8] thunderbolt: Add KUnit tests for credit allocation
Date:   Tue, 18 May 2021 17:10:02 +0300
Message-Id: <20210518141002.63616-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds a couple of KUnit tests for USB4 credit allocation.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/test.c | 545 +++++++++++++++++++++++++++++++++++++
 1 file changed, 545 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 5ff5a03bc9ce..cf34c1ecf5d5 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -87,22 +87,30 @@ static struct tb_switch *alloc_host(struct kunit *test)
 	sw->ports[1].config.type = TB_TYPE_PORT;
 	sw->ports[1].config.max_in_hop_id = 19;
 	sw->ports[1].config.max_out_hop_id = 19;
+	sw->ports[1].total_credits = 60;
+	sw->ports[1].ctl_credits = 2;
 	sw->ports[1].dual_link_port = &sw->ports[2];
 
 	sw->ports[2].config.type = TB_TYPE_PORT;
 	sw->ports[2].config.max_in_hop_id = 19;
 	sw->ports[2].config.max_out_hop_id = 19;
+	sw->ports[2].total_credits = 60;
+	sw->ports[2].ctl_credits = 2;
 	sw->ports[2].dual_link_port = &sw->ports[1];
 	sw->ports[2].link_nr = 1;
 
 	sw->ports[3].config.type = TB_TYPE_PORT;
 	sw->ports[3].config.max_in_hop_id = 19;
 	sw->ports[3].config.max_out_hop_id = 19;
+	sw->ports[3].total_credits = 60;
+	sw->ports[3].ctl_credits = 2;
 	sw->ports[3].dual_link_port = &sw->ports[4];
 
 	sw->ports[4].config.type = TB_TYPE_PORT;
 	sw->ports[4].config.max_in_hop_id = 19;
 	sw->ports[4].config.max_out_hop_id = 19;
+	sw->ports[4].total_credits = 60;
+	sw->ports[4].ctl_credits = 2;
 	sw->ports[4].dual_link_port = &sw->ports[3];
 	sw->ports[4].link_nr = 1;
 
@@ -143,6 +151,25 @@ static struct tb_switch *alloc_host(struct kunit *test)
 	return sw;
 }
 
+static struct tb_switch *alloc_host_usb4(struct kunit *test)
+{
+	struct tb_switch *sw;
+
+	sw = alloc_host(test);
+	if (!sw)
+		return NULL;
+
+	sw->generation = 4;
+	sw->credit_allocation = true;
+	sw->max_usb3_credits = 32;
+	sw->min_dp_aux_credits = 1;
+	sw->min_dp_main_credits = 0;
+	sw->max_pcie_credits = 64;
+	sw->max_dma_credits = 14;
+
+	return sw;
+}
+
 static struct tb_switch *alloc_dev_default(struct kunit *test,
 					   struct tb_switch *parent,
 					   u64 route, bool bonded)
@@ -164,44 +191,60 @@ static struct tb_switch *alloc_dev_default(struct kunit *test,
 	sw->ports[1].config.type = TB_TYPE_PORT;
 	sw->ports[1].config.max_in_hop_id = 19;
 	sw->ports[1].config.max_out_hop_id = 19;
+	sw->ports[1].total_credits = 60;
+	sw->ports[1].ctl_credits = 2;
 	sw->ports[1].dual_link_port = &sw->ports[2];
 
 	sw->ports[2].config.type = TB_TYPE_PORT;
 	sw->ports[2].config.max_in_hop_id = 19;
 	sw->ports[2].config.max_out_hop_id = 19;
+	sw->ports[2].total_credits = 60;
+	sw->ports[2].ctl_credits = 2;
 	sw->ports[2].dual_link_port = &sw->ports[1];
 	sw->ports[2].link_nr = 1;
 
 	sw->ports[3].config.type = TB_TYPE_PORT;
 	sw->ports[3].config.max_in_hop_id = 19;
 	sw->ports[3].config.max_out_hop_id = 19;
+	sw->ports[3].total_credits = 60;
+	sw->ports[3].ctl_credits = 2;
 	sw->ports[3].dual_link_port = &sw->ports[4];
 
 	sw->ports[4].config.type = TB_TYPE_PORT;
 	sw->ports[4].config.max_in_hop_id = 19;
 	sw->ports[4].config.max_out_hop_id = 19;
+	sw->ports[4].total_credits = 60;
+	sw->ports[4].ctl_credits = 2;
 	sw->ports[4].dual_link_port = &sw->ports[3];
 	sw->ports[4].link_nr = 1;
 
 	sw->ports[5].config.type = TB_TYPE_PORT;
 	sw->ports[5].config.max_in_hop_id = 19;
 	sw->ports[5].config.max_out_hop_id = 19;
+	sw->ports[5].total_credits = 60;
+	sw->ports[5].ctl_credits = 2;
 	sw->ports[5].dual_link_port = &sw->ports[6];
 
 	sw->ports[6].config.type = TB_TYPE_PORT;
 	sw->ports[6].config.max_in_hop_id = 19;
 	sw->ports[6].config.max_out_hop_id = 19;
+	sw->ports[6].total_credits = 60;
+	sw->ports[6].ctl_credits = 2;
 	sw->ports[6].dual_link_port = &sw->ports[5];
 	sw->ports[6].link_nr = 1;
 
 	sw->ports[7].config.type = TB_TYPE_PORT;
 	sw->ports[7].config.max_in_hop_id = 19;
 	sw->ports[7].config.max_out_hop_id = 19;
+	sw->ports[7].total_credits = 60;
+	sw->ports[7].ctl_credits = 2;
 	sw->ports[7].dual_link_port = &sw->ports[8];
 
 	sw->ports[8].config.type = TB_TYPE_PORT;
 	sw->ports[8].config.max_in_hop_id = 19;
 	sw->ports[8].config.max_out_hop_id = 19;
+	sw->ports[8].total_credits = 60;
+	sw->ports[8].ctl_credits = 2;
 	sw->ports[8].dual_link_port = &sw->ports[7];
 	sw->ports[8].link_nr = 1;
 
@@ -265,9 +308,13 @@ static struct tb_switch *alloc_dev_default(struct kunit *test,
 	if (bonded) {
 		/* Bonding is used */
 		port->bonded = true;
+		port->total_credits *= 2;
 		port->dual_link_port->bonded = true;
+		port->dual_link_port->total_credits = 0;
 		upstream_port->bonded = true;
+		upstream_port->total_credits *= 2;
 		upstream_port->dual_link_port->bonded = true;
+		upstream_port->dual_link_port->total_credits = 0;
 	}
 
 	return sw;
@@ -294,6 +341,27 @@ static struct tb_switch *alloc_dev_with_dpin(struct kunit *test,
 	return sw;
 }
 
+static struct tb_switch *alloc_dev_usb4(struct kunit *test,
+					struct tb_switch *parent,
+					u64 route, bool bonded)
+{
+	struct tb_switch *sw;
+
+	sw = alloc_dev_default(test, parent, route, bonded);
+	if (!sw)
+		return NULL;
+
+	sw->generation = 4;
+	sw->credit_allocation = true;
+	sw->max_usb3_credits = 14;
+	sw->min_dp_aux_credits = 1;
+	sw->min_dp_main_credits = 18;
+	sw->max_pcie_credits = 32;
+	sw->max_dma_credits = 14;
+
+	return sw;
+}
+
 static void tb_test_path_basic(struct kunit *test)
 {
 	struct tb_port *src_port, *dst_port, *p;
@@ -1829,6 +1897,475 @@ static void tb_test_tunnel_dma_match(struct kunit *test)
 	tb_tunnel_free(tunnel);
 }
 
+static void tb_test_credit_alloc_legacy_not_bonded(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *up, *down;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host(test);
+	dev = alloc_dev_default(test, host, 0x1, false);
+
+	down = &host->ports[8];
+	up = &dev->ports[9];
+	tunnel = tb_tunnel_alloc_pci(NULL, up, down);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 16U);
+
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 16U);
+
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_credit_alloc_legacy_bonded(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *up, *down;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host(test);
+	dev = alloc_dev_default(test, host, 0x1, true);
+
+	down = &host->ports[8];
+	up = &dev->ports[9];
+	tunnel = tb_tunnel_alloc_pci(NULL, up, down);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
+
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
+
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_credit_alloc_pcie(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *up, *down;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	down = &host->ports[8];
+	up = &dev->ports[9];
+	tunnel = tb_tunnel_alloc_pci(NULL, up, down);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
+
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 64U);
+
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_credit_alloc_dp(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *in, *out;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	in = &host->ports[5];
+	out = &dev->ports[14];
+
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)3);
+
+	/* Video (main) path */
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 12U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 18U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 0U);
+
+	/* AUX TX */
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	/* AUX RX */
+	path = tunnel->paths[2];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_credit_alloc_usb3(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *up, *down;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	down = &host->ports[12];
+	up = &dev->ports[16];
+	tunnel = tb_tunnel_alloc_usb3(NULL, up, down, 0, 0);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
+
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_credit_alloc_dma(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *nhi, *port;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	nhi = &host->ports[7];
+	port = &dev->ports[3];
+
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	/* DMA RX */
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	/* DMA TX */
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	tb_tunnel_free(tunnel);
+}
+
+static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
+{
+	struct tb_tunnel *tunnel1, *tunnel2, *tunnel3;
+	struct tb_switch *host, *dev;
+	struct tb_port *nhi, *port;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	nhi = &host->ports[7];
+	port = &dev->ports[3];
+
+	/*
+	 * Create three DMA tunnels through the same ports. With the
+	 * default buffers we should be able to create two and the last
+	 * one fails.
+	 *
+	 * For default host we have following buffers for DMA:
+	 *
+	 *   120 - (2 + 2 * (1 + 0) + 32 + 64 + spare) = 20
+	 *
+	 * For device we have following:
+	 *
+	 *  120 - (2 + 2 * (1 + 18) + 14 + 32 + spare) = 34
+	 *
+	 * spare = 14 + 1 = 15
+	 *
+	 * So on host the first tunnel gets 14 and the second gets the
+	 * remaining 1 and then we run out of buffers.
+	 */
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	KUNIT_ASSERT_TRUE(test, tunnel1 != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel1->npaths, (size_t)2);
+
+	path = tunnel1->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = tunnel1->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	KUNIT_ASSERT_TRUE(test, tunnel2 != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel2->npaths, (size_t)2);
+
+	path = tunnel2->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	path = tunnel2->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	KUNIT_ASSERT_TRUE(test, tunnel3 == NULL);
+
+	/*
+	 * Release the first DMA tunnel. That should make 14 buffers
+	 * available for the next tunnel.
+	 */
+	tb_tunnel_free(tunnel1);
+
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	KUNIT_ASSERT_TRUE(test, tunnel3 != NULL);
+
+	path = tunnel3->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = tunnel3->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	tb_tunnel_free(tunnel3);
+	tb_tunnel_free(tunnel2);
+}
+
+static void tb_test_credit_alloc_all(struct kunit *test)
+{
+	struct tb_port *up, *down, *in, *out, *nhi, *port;
+	struct tb_tunnel *pcie_tunnel, *dp_tunnel1, *dp_tunnel2, *usb3_tunnel;
+	struct tb_tunnel *dma_tunnel1, *dma_tunnel2;
+	struct tb_switch *host, *dev;
+	struct tb_path *path;
+
+	/*
+	 * Create PCIe, 2 x DP, USB 3.x and two DMA tunnels from host to
+	 * device. Expectation is that all these can be established with
+	 * the default credit allocation found in Intel hardware.
+	 */
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	down = &host->ports[8];
+	up = &dev->ports[9];
+	pcie_tunnel = tb_tunnel_alloc_pci(NULL, up, down);
+	KUNIT_ASSERT_TRUE(test, pcie_tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, pcie_tunnel->npaths, (size_t)2);
+
+	path = pcie_tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
+
+	path = pcie_tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 64U);
+
+	in = &host->ports[5];
+	out = &dev->ports[13];
+
+	dp_tunnel1 = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	KUNIT_ASSERT_TRUE(test, dp_tunnel1 != NULL);
+	KUNIT_ASSERT_EQ(test, dp_tunnel1->npaths, (size_t)3);
+
+	path = dp_tunnel1->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 12U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 18U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 0U);
+
+	path = dp_tunnel1->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	path = dp_tunnel1->paths[2];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	in = &host->ports[6];
+	out = &dev->ports[14];
+
+	dp_tunnel2 = tb_tunnel_alloc_dp(NULL, in, out, 0, 0);
+	KUNIT_ASSERT_TRUE(test, dp_tunnel2 != NULL);
+	KUNIT_ASSERT_EQ(test, dp_tunnel2->npaths, (size_t)3);
+
+	path = dp_tunnel2->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 12U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 18U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 0U);
+
+	path = dp_tunnel2->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	path = dp_tunnel2->paths[2];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	down = &host->ports[12];
+	up = &dev->ports[16];
+	usb3_tunnel = tb_tunnel_alloc_usb3(NULL, up, down, 0, 0);
+	KUNIT_ASSERT_TRUE(test, usb3_tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, usb3_tunnel->npaths, (size_t)2);
+
+	path = usb3_tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = usb3_tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
+
+	nhi = &host->ports[7];
+	port = &dev->ports[3];
+
+	dma_tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	KUNIT_ASSERT_TRUE(test, dma_tunnel1 != NULL);
+	KUNIT_ASSERT_EQ(test, dma_tunnel1->npaths, (size_t)2);
+
+	path = dma_tunnel1->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = dma_tunnel1->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	dma_tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	KUNIT_ASSERT_TRUE(test, dma_tunnel2 != NULL);
+	KUNIT_ASSERT_EQ(test, dma_tunnel2->npaths, (size_t)2);
+
+	path = dma_tunnel2->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	path = dma_tunnel2->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	tb_tunnel_free(dma_tunnel2);
+	tb_tunnel_free(dma_tunnel1);
+	tb_tunnel_free(usb3_tunnel);
+	tb_tunnel_free(dp_tunnel2);
+	tb_tunnel_free(dp_tunnel1);
+	tb_tunnel_free(pcie_tunnel);
+}
+
 static const u32 root_directory[] = {
 	0x55584401,	/* "UXD" v1 */
 	0x00000018,	/* Root directory length */
@@ -2105,6 +2642,14 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_tunnel_dma_tx),
 	KUNIT_CASE(tb_test_tunnel_dma_chain),
 	KUNIT_CASE(tb_test_tunnel_dma_match),
+	KUNIT_CASE(tb_test_credit_alloc_legacy_not_bonded),
+	KUNIT_CASE(tb_test_credit_alloc_legacy_bonded),
+	KUNIT_CASE(tb_test_credit_alloc_pcie),
+	KUNIT_CASE(tb_test_credit_alloc_dp),
+	KUNIT_CASE(tb_test_credit_alloc_usb3),
+	KUNIT_CASE(tb_test_credit_alloc_dma),
+	KUNIT_CASE(tb_test_credit_alloc_dma_multiple),
+	KUNIT_CASE(tb_test_credit_alloc_all),
 	KUNIT_CASE(tb_test_property_parse),
 	KUNIT_CASE(tb_test_property_format),
 	KUNIT_CASE(tb_test_property_copy),
-- 
2.30.2

