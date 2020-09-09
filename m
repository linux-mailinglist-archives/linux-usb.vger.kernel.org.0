Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC55262D91
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 13:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgIILCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 07:02:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:60640 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbgIILBj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 07:01:39 -0400
IronPort-SDR: fFlH3BQ2lZk5sXS8qU+XYIZsBQP7vcODi6vPvo9rglOFm39sbmTyDCtEy10L6ozNVdzW3+Z409
 zYcqheF24h4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="219865926"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="219865926"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 04:00:04 -0700
IronPort-SDR: ahRLQnkdC1qYJ5S7zbAO6WJzeuQD5dLdrMda437ug1ICrv06fyTmq//syfPvRxMBXLJcC/GvGi
 13oEH+1jcNQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480420927"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2020 04:00:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 151B4291; Wed,  9 Sep 2020 14:00:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/7] thunderbolt: Allow KUnit tests to be built also when CONFIG_USB4=m
Date:   Wed,  9 Sep 2020 13:59:56 +0300
Message-Id: <20200909110001.71603-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
References: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds a bit more build coverage for the tests even though these are
not expected to be enabled by normal users and distros. In order to make
this working we need to open-code kunit_test_suite() and call the
relevant functions directly in the driver init/exit hook.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Kconfig  |  2 +-
 drivers/thunderbolt/Makefile |  3 +--
 drivers/thunderbolt/domain.c |  4 ++++
 drivers/thunderbolt/tb.h     |  8 ++++++++
 drivers/thunderbolt/test.c   | 13 ++++++++++++-
 5 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 2257c22f8ab3..afa3551633aa 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -28,5 +28,5 @@ config USB4_DEBUGFS_WRITE
 
 config USB4_KUNIT_TEST
 	bool "KUnit tests"
+	depends on USB4
 	depends on KUNIT=y
-	depends on USB4=y
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index 61d5dff445b6..571537371072 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -6,5 +6,4 @@ thunderbolt-objs += nvm.o retimer.o quirks.o
 
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
-
-obj-${CONFIG_USB4_KUNIT_TEST} += test.o
+thunderbolt-${CONFIG_USB4_KUNIT_TEST} += test.o
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index a0182bf5a5f8..f0de94f7acbf 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -827,6 +827,8 @@ int tb_domain_init(void)
 {
 	int ret;
 
+	tb_test_init();
+
 	tb_debugfs_init();
 	ret = tb_xdomain_init();
 	if (ret)
@@ -841,6 +843,7 @@ int tb_domain_init(void)
 	tb_xdomain_exit();
 err_debugfs:
 	tb_debugfs_exit();
+	tb_test_exit();
 
 	return ret;
 }
@@ -852,4 +855,5 @@ void tb_domain_exit(void)
 	tb_nvm_exit();
 	tb_xdomain_exit();
 	tb_debugfs_exit();
+	tb_test_exit();
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8b04a9deffc7..5687bcf38a9e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1030,4 +1030,12 @@ static inline void tb_switch_debugfs_init(struct tb_switch *sw) { }
 static inline void tb_switch_debugfs_remove(struct tb_switch *sw) { }
 #endif
 
+#ifdef CONFIG_USB4_KUNIT_TEST
+int tb_test_init(void);
+void tb_test_exit(void);
+#else
+static inline int tb_test_init(void) { return 0; }
+static inline void tb_test_exit(void) { }
+#endif
+
 #endif
diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index a4d78811f7e2..464c2d37b992 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -1623,4 +1623,15 @@ static struct kunit_suite tb_test_suite = {
 	.name = "thunderbolt",
 	.test_cases = tb_test_cases,
 };
-kunit_test_suite(tb_test_suite);
+
+static struct kunit_suite *tb_test_suites[] = { &tb_test_suite, NULL };
+
+int tb_test_init(void)
+{
+	return __kunit_test_suites_init(tb_test_suites);
+}
+
+void tb_test_exit(void)
+{
+	return __kunit_test_suites_exit(tb_test_suites);
+}
-- 
2.28.0

