Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE7850FBEB
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 13:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349535AbiDZL2y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 07:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347622AbiDZL2u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 07:28:50 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D3117AAF
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650972343; x=1682508343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nlfldrBp4ouD2kjSLLMOC6xsGpyWhGtH32Gs5kcyX58=;
  b=IqTYnnOQAk26yElkMDGHn7TzPB5fbobs4CqsoBsMMNyf6YwZyhSCeAgU
   q8XzY8iErjsjiqD16awX7m8vm4L6NF75gcAqx8eYntBZNO+d0R/zL9a0/
   mxCXRHYJ9BF64ledfG6CKbXffsOm7td4s/tjJOu8aOsZsnTp4Jz7bTKsk
   YOYy/wjNJVcJKetNRDfnzC/oQALGPZR/Y2NO+IaEKtrFi/Q54HPvpitn6
   RhkhpuniEuW30BHyTf2aVfhoVAadjiD7BehJNw7JuO7ZAhxq+QsHwXrap
   WomY0yYavMjOzD0ABt7ULXCSwoTD1/sm7Byr+ayU3fpA5YBGTLix6zBAL
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="247476825"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="247476825"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 04:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="660623088"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2022 04:25:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7629662E; Tue, 26 Apr 2022 14:25:40 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/5] thunderbolt: Ignore port locked error in tb_port_wait_for_link_width()
Date:   Tue, 26 Apr 2022 14:25:39 +0300
Message-Id: <20220426112540.6053-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
References: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sometimes when polling for the port after target link width is changed
we get back port locked notification (because the link actually was
reset and then re-trained). Instead of bailing out we can ignore these
when polling for the width change as this is expected.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 525be2aa3ad9..561e1d77240e 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1168,10 +1168,17 @@ int tb_port_wait_for_link_width(struct tb_port *port, int width,
 
 	do {
 		ret = tb_port_get_link_width(port);
-		if (ret < 0)
-			return ret;
-		else if (ret == width)
+		if (ret < 0) {
+			/*
+			 * Sometimes we get port locked error when
+			 * polling the lanes so we can ignore it and
+			 * retry.
+			 */
+			if (ret != -EACCES)
+				return ret;
+		} else if (ret == width) {
 			return 0;
+		}
 
 		usleep_range(1000, 2000);
 	} while (ktime_before(ktime_get(), timeout));
-- 
2.35.1

