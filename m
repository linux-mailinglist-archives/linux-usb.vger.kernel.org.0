Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7DB932D33B
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 13:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240946AbhCDMdz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 07:33:55 -0500
Received: from mga12.intel.com ([192.55.52.136]:64847 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240809AbhCDMd3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Mar 2021 07:33:29 -0500
IronPort-SDR: UCdShMzxMrfuJvJyufYiGMvK0y22vlBI60KuGNi08/XWA+oVASEA1ydrCSX4dQJshavFw84RFw
 02FuzShtNXhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="166662662"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="166662662"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:31:34 -0800
IronPort-SDR: PA852FyUm4SUbJIq7xAA+wPYsrycDVwjww+1UEcjDPAetqfagp/wR7aE5kXbMwnAo54PEqL+4e
 JzXcP0IZToKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="435785761"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Mar 2021 04:31:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C853B5CC; Thu,  4 Mar 2021 14:31:26 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Subject: [PATCH 15/18] thunderbolt: Add KUnit tests for XDomain properties
Date:   Thu,  4 Mar 2021 15:31:22 +0300
Message-Id: <20210304123125.43630-16-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
References: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds KUnit tests for parsing, formatting and copying of XDomain
properties.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/test.c | 252 +++++++++++++++++++++++++++++++++++++
 1 file changed, 252 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 464c2d37b992..4e1e7ae2d90d 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -1594,6 +1594,255 @@ static void tb_test_tunnel_port_on_path(struct kunit *test)
 	tb_tunnel_free(dp_tunnel);
 }
 
+static const u32 root_directory[] = {
+	0x55584401,	/* "UXD" v1 */
+	0x00000018,	/* Root directory length */
+	0x76656e64,	/* "vend" */
+	0x6f726964,	/* "orid" */
+	0x76000001,	/* "v" R 1 */
+	0x00000a27,	/* Immediate value, ! Vendor ID */
+	0x76656e64,	/* "vend" */
+	0x6f726964,	/* "orid" */
+	0x74000003,	/* "t" R 3 */
+	0x0000001a,	/* Text leaf offset, (“Apple Inc.”) */
+	0x64657669,	/* "devi" */
+	0x63656964,	/* "ceid" */
+	0x76000001,	/* "v" R 1 */
+	0x0000000a,	/* Immediate value, ! Device ID */
+	0x64657669,	/* "devi" */
+	0x63656964,	/* "ceid" */
+	0x74000003,	/* "t" R 3 */
+	0x0000001d,	/* Text leaf offset, (“Macintosh”) */
+	0x64657669,	/* "devi" */
+	0x63657276,	/* "cerv" */
+	0x76000001,	/* "v" R 1 */
+	0x80000100,	/* Immediate value, Device Revision */
+	0x6e657477,	/* "netw" */
+	0x6f726b00,	/* "ork" */
+	0x44000014,	/* "D" R 20 */
+	0x00000021,	/* Directory data offset, (Network Directory) */
+	0x4170706c,	/* "Appl" */
+	0x6520496e,	/* "e In" */
+	0x632e0000,	/* "c." ! */
+	0x4d616369,	/* "Maci" */
+	0x6e746f73,	/* "ntos" */
+	0x68000000,	/* "h" */
+	0x00000000,	/* padding */
+	0xca8961c6,	/* Directory UUID, Network Directory */
+	0x9541ce1c,	/* Directory UUID, Network Directory */
+	0x5949b8bd,	/* Directory UUID, Network Directory */
+	0x4f5a5f2e,	/* Directory UUID, Network Directory */
+	0x70727463,	/* "prtc" */
+	0x69640000,	/* "id" */
+	0x76000001,	/* "v" R 1 */
+	0x00000001,	/* Immediate value, Network Protocol ID */
+	0x70727463,	/* "prtc" */
+	0x76657273,	/* "vers" */
+	0x76000001,	/* "v" R 1 */
+	0x00000001,	/* Immediate value, Network Protocol Version */
+	0x70727463,	/* "prtc" */
+	0x72657673,	/* "revs" */
+	0x76000001,	/* "v" R 1 */
+	0x00000001,	/* Immediate value, Network Protocol Revision */
+	0x70727463,	/* "prtc" */
+	0x73746e73,	/* "stns" */
+	0x76000001,	/* "v" R 1 */
+	0x00000000,	/* Immediate value, Network Protocol Settings */
+};
+
+static const uuid_t network_dir_uuid =
+	UUID_INIT(0xc66189ca, 0x1cce, 0x4195,
+		  0xbd, 0xb8, 0x49, 0x59, 0x2e, 0x5f, 0x5a, 0x4f);
+
+static void tb_test_property_parse(struct kunit *test)
+{
+	struct tb_property_dir *dir, *network_dir;
+	struct tb_property *p;
+
+	dir = tb_property_parse_dir(root_directory, ARRAY_SIZE(root_directory));
+	KUNIT_ASSERT_TRUE(test, dir != NULL);
+
+	p = tb_property_find(dir, "foo", TB_PROPERTY_TYPE_TEXT);
+	KUNIT_ASSERT_TRUE(test, !p);
+
+	p = tb_property_find(dir, "vendorid", TB_PROPERTY_TYPE_TEXT);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+	KUNIT_EXPECT_STREQ(test, p->value.text, "Apple Inc.");
+
+	p = tb_property_find(dir, "vendorid", TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+	KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0xa27);
+
+	p = tb_property_find(dir, "deviceid", TB_PROPERTY_TYPE_TEXT);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+	KUNIT_EXPECT_STREQ(test, p->value.text, "Macintosh");
+
+	p = tb_property_find(dir, "deviceid", TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+	KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0xa);
+
+	p = tb_property_find(dir, "missing", TB_PROPERTY_TYPE_DIRECTORY);
+	KUNIT_ASSERT_TRUE(test, !p);
+
+	p = tb_property_find(dir, "network", TB_PROPERTY_TYPE_DIRECTORY);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+
+	network_dir = p->value.dir;
+	KUNIT_EXPECT_TRUE(test, uuid_equal(network_dir->uuid, &network_dir_uuid));
+
+	p = tb_property_find(network_dir, "prtcid", TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+	KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0x1);
+
+	p = tb_property_find(network_dir, "prtcvers", TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+	KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0x1);
+
+	p = tb_property_find(network_dir, "prtcrevs", TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+	KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0x1);
+
+	p = tb_property_find(network_dir, "prtcstns", TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_TRUE(test, p != NULL);
+	KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0x0);
+
+	p = tb_property_find(network_dir, "deviceid", TB_PROPERTY_TYPE_VALUE);
+	KUNIT_EXPECT_TRUE(test, !p);
+	p = tb_property_find(network_dir, "deviceid", TB_PROPERTY_TYPE_TEXT);
+	KUNIT_EXPECT_TRUE(test, !p);
+
+	tb_property_free_dir(dir);
+}
+
+static void tb_test_property_format(struct kunit *test)
+{
+	struct tb_property_dir *dir;
+	ssize_t block_len;
+	u32 *block;
+	int ret, i;
+
+	dir = tb_property_parse_dir(root_directory, ARRAY_SIZE(root_directory));
+	KUNIT_ASSERT_TRUE(test, dir != NULL);
+
+	ret = tb_property_format_dir(dir, NULL, 0);
+	KUNIT_ASSERT_EQ(test, ret, (int)ARRAY_SIZE(root_directory));
+
+	block_len = ret;
+
+	block = kunit_kzalloc(test, block_len * sizeof(u32), GFP_KERNEL);
+	KUNIT_ASSERT_TRUE(test, block != NULL);
+
+	ret = tb_property_format_dir(dir, block, block_len);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	for (i = 0; i < ARRAY_SIZE(root_directory); i++)
+		KUNIT_EXPECT_EQ(test, root_directory[i], block[i]);
+
+	tb_property_free_dir(dir);
+}
+
+static void compare_dirs(struct kunit *test, struct tb_property_dir *d1,
+			 struct tb_property_dir *d2)
+{
+	struct tb_property *p1, *p2, *tmp;
+	int n1, n2, i;
+
+	if (d1->uuid) {
+		KUNIT_ASSERT_TRUE(test, d2->uuid != NULL);
+		KUNIT_ASSERT_TRUE(test, uuid_equal(d1->uuid, d2->uuid));
+	} else {
+		KUNIT_ASSERT_TRUE(test, d2->uuid == NULL);
+	}
+
+	n1 = 0;
+	tb_property_for_each(d1, tmp)
+		n1++;
+	KUNIT_ASSERT_NE(test, n1, 0);
+
+	n2 = 0;
+	tb_property_for_each(d2, tmp)
+		n2++;
+	KUNIT_ASSERT_NE(test, n2, 0);
+
+	KUNIT_ASSERT_EQ(test, n1, n2);
+
+	p1 = NULL;
+	p2 = NULL;
+	for (i = 0; i < n1; i++) {
+		p1 = tb_property_get_next(d1, p1);
+		KUNIT_ASSERT_TRUE(test, p1 != NULL);
+		p2 = tb_property_get_next(d2, p2);
+		KUNIT_ASSERT_TRUE(test, p2 != NULL);
+
+		KUNIT_ASSERT_STREQ(test, &p1->key[0], &p2->key[0]);
+		KUNIT_ASSERT_EQ(test, p1->type, p2->type);
+		KUNIT_ASSERT_EQ(test, p1->length, p2->length);
+
+		switch (p1->type) {
+		case TB_PROPERTY_TYPE_DIRECTORY:
+			KUNIT_ASSERT_TRUE(test, p1->value.dir != NULL);
+			KUNIT_ASSERT_TRUE(test, p2->value.dir != NULL);
+			compare_dirs(test, p1->value.dir, p2->value.dir);
+			break;
+
+		case TB_PROPERTY_TYPE_DATA:
+			KUNIT_ASSERT_TRUE(test, p1->value.data != NULL);
+			KUNIT_ASSERT_TRUE(test, p2->value.data != NULL);
+			KUNIT_ASSERT_TRUE(test,
+				!memcmp(p1->value.data, p2->value.data,
+					p1->length * 4)
+			);
+			break;
+
+		case TB_PROPERTY_TYPE_TEXT:
+			KUNIT_ASSERT_TRUE(test, p1->value.text != NULL);
+			KUNIT_ASSERT_TRUE(test, p2->value.text != NULL);
+			KUNIT_ASSERT_STREQ(test, p1->value.text, p2->value.text);
+			break;
+
+		case TB_PROPERTY_TYPE_VALUE:
+			KUNIT_ASSERT_EQ(test, p1->value.immediate,
+					p2->value.immediate);
+			break;
+		default:
+			KUNIT_FAIL(test, "unexpected property type");
+			break;
+		}
+	}
+}
+
+static void tb_test_property_copy(struct kunit *test)
+{
+	struct tb_property_dir *src, *dst;
+	u32 *block;
+	int ret, i;
+
+	src = tb_property_parse_dir(root_directory, ARRAY_SIZE(root_directory));
+	KUNIT_ASSERT_TRUE(test, src != NULL);
+
+	dst = tb_property_copy_dir(src);
+	KUNIT_ASSERT_TRUE(test, dst != NULL);
+
+	/* Compare the structures */
+	compare_dirs(test, src, dst);
+
+	/* Compare the resulting property block */
+	ret = tb_property_format_dir(dst, NULL, 0);
+	KUNIT_ASSERT_EQ(test, ret, (int)ARRAY_SIZE(root_directory));
+
+	block = kunit_kzalloc(test, sizeof(root_directory), GFP_KERNEL);
+	KUNIT_ASSERT_TRUE(test, block != NULL);
+
+	ret = tb_property_format_dir(dst, block, ARRAY_SIZE(root_directory));
+	KUNIT_EXPECT_TRUE(test, !ret);
+
+	for (i = 0; i < ARRAY_SIZE(root_directory); i++)
+		KUNIT_EXPECT_EQ(test, root_directory[i], block[i]);
+
+	tb_property_free_dir(dst);
+	tb_property_free_dir(src);
+}
+
 static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_path_basic),
 	KUNIT_CASE(tb_test_path_not_connected_walk),
@@ -1616,6 +1865,9 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_tunnel_dp_max_length),
 	KUNIT_CASE(tb_test_tunnel_port_on_path),
 	KUNIT_CASE(tb_test_tunnel_usb3),
+	KUNIT_CASE(tb_test_property_parse),
+	KUNIT_CASE(tb_test_property_format),
+	KUNIT_CASE(tb_test_property_copy),
 	{ }
 };
 
-- 
2.30.1

