Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA9352060F
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 22:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiEIUnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 16:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiEIUnc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 16:43:32 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6E4285AE7
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652128777; x=1683664777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aj8OXXl8wbmEI/H4les34JnK8XHXh5KHzkg5YxKs5Uo=;
  b=AaKyrXznaOq7bGVByNgf6cVj1ViURSC4ILlBcHmF0GQUtH0DSu/nL1CM
   x2m7Kl9X2SyOyiZOiGqnZCa8AcW+qxnQH0bg7lGuqLVyyb9Sos9XJwf+Y
   s7s9bzVPp6g/g5s268uIid6uPhXZ1eCuNN7P4mq8t7YnfWJu5pNozrFtR
   ahzmqnDAgqAjo6MIYeZmv8xwZdBrAWrXGqoTxyIe3d/tQM89dAtgk09YR
   APgrQiyCq+1v2Xx5y1YPINBKAdutgbYS+iHBVNLW8e80PsDONHcBJifXQ
   41tAwLzxAidMRV1kB6RFxR9dgjVC1XXGKZkXhxIhEL6EDQvJlkEiWbMoQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269301524"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="269301524"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 13:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="738339152"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga005.jf.intel.com with ESMTP; 09 May 2022 13:39:35 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 2/2] thunderbolt: Add KUnit test for buffer allocation for device without DisplayPort adaptors
Date:   Mon,  9 May 2022 23:49:04 +0300
Message-Id: <20220509204904.8936-3-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220509204904.8936-1-gil.fine@intel.com>
References: <20220509204904.8936-1-gil.fine@intel.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here we add KUnit test to test the buffer allocation for device without DP adaptors.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/test.c | 92 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 66b6e665e96f..99b30f2624fc 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -341,6 +341,47 @@ static struct tb_switch *alloc_dev_with_dpin(struct kunit *test,
 	return sw;
 }
 
+static struct tb_switch *alloc_dev_without_dp(struct kunit *test,
+					      struct tb_switch *parent,
+					      u64 route, bool bonded)
+{
+	struct tb_switch *sw;
+	int i;
+
+	sw = alloc_dev_default(test, parent, route, bonded);
+	if (!sw)
+		return NULL;
+	/*
+	 * Device with:
+	 * 2x USB4 Adapters (adapters 1,2 and 3,4),
+	 * 1x PCIe Upstream (adapter 9),
+	 * 1x PCIe Downstream (adapter 10),
+	 * 1x USB3 Upstream (adapter 16),
+	 * 1x USB3 Downstream (adapter 17)
+	 */
+	for (i = 5; i <= 8; i++)
+		sw->ports[i].disabled = true;
+
+	for (i = 11; i <= 14; i++)
+		sw->ports[i].disabled = true;
+
+	sw->ports[13].cap_adap = 0;
+	sw->ports[14].cap_adap = 0;
+
+	for (i = 18; i <= 19; i++)
+		sw->ports[i].disabled = true;
+
+	sw->generation = 4;
+	sw->credit_allocation = true;
+	sw->max_usb3_credits = 109;
+	sw->min_dp_aux_credits = 0;
+	sw->min_dp_main_credits = 0;
+	sw->max_pcie_credits = 30;
+	sw->max_dma_credits = 1;
+
+	return sw;
+}
+
 static struct tb_switch *alloc_dev_usb4(struct kunit *test,
 					struct tb_switch *parent,
 					u64 route, bool bonded)
@@ -1996,6 +2037,56 @@ static void tb_test_credit_alloc_pcie(struct kunit *test)
 	tb_tunnel_free(tunnel);
 }
 
+static void tb_test_credit_alloc_without_dp(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *up, *down;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_without_dp(test, host, 0x1, true);
+
+	/*
+	 * The device has no DP therefore baMinDPmain = baMinDPaux = 0
+	 *
+	 * Create PCIe path with buffers less than baMaxPCIe.
+	 *
+	 * For a device with buffers configurations:
+	 * baMaxUSB3 = 109
+	 * baMinDPaux = 0
+	 * baMinDPmain = 0
+	 * baMaxPCIe = 30
+	 * baMaxHI = 1
+	 * Remaining Buffers = Total - (CP + DP) = 120 - (2 + 0) = 118
+	 * PCIe Credits = Max(6, Min(baMaxPCIe, Remaining Buffers - baMaxUSB3)
+	 *		= Max(6, Min(30, 9) = 9
+	 */
+	down = &host->ports[8];
+	up = &dev->ports[9];
+	tunnel = tb_tunnel_alloc_pci(NULL, up, down);
+	KUNIT_ASSERT_TRUE(test, tunnel != NULL);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	/* PCIe downstream path */
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 9U);
+
+	/* PCIe upstream path */
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
 static void tb_test_credit_alloc_dp(struct kunit *test)
 {
 	struct tb_switch *host, *dev;
@@ -2709,6 +2800,7 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_credit_alloc_legacy_not_bonded),
 	KUNIT_CASE(tb_test_credit_alloc_legacy_bonded),
 	KUNIT_CASE(tb_test_credit_alloc_pcie),
+	KUNIT_CASE(tb_test_credit_alloc_without_dp),
 	KUNIT_CASE(tb_test_credit_alloc_dp),
 	KUNIT_CASE(tb_test_credit_alloc_usb3),
 	KUNIT_CASE(tb_test_credit_alloc_dma),
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

