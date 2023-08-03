Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47FAA76E4EE
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjHCJul (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234427AbjHCJuh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:50:37 -0400
Received: from mgamail.intel.com (unknown [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7773F35B5
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056234; x=1722592234;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lI8dBmWrztJk1GLxE9Ujr+uI7FvkJIRGnoKJtldB3Cc=;
  b=jv6oW9prIuRctLFx5JJEw8unVSLxvcY2CU8dutD8TONXSZdhMxAMYpJ0
   7GDe22yhp8RcRmCoGzQS8PBjtp6kypq5R9yLs6POmpr5ioHBQuQkkuWoq
   jAXMk5MBtp/8uC43YGycR3BS22qOfw1gcckPYSJEGgeHnGKi7or5+V5Fe
   wZf8NvxQTOX/SKizxYBCPB4dZTYe4dzLCepFuH9VhzraTM1o+zo4EWKmB
   KoZ/VooDdhpFBBnW1lSnz3sF9o1aWrjwlMZEAm74jD8HXdAir4HW0FN5P
   XE3Se/eCwQV/cicRpd0w8bm3x9ZhCSczVTH2Oz56906Ws041A68raWMGB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="456207151"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="456207151"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="903312554"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="903312554"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 03 Aug 2023 02:50:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5156713F; Thu,  3 Aug 2023 12:50:42 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Fix memory leak in tb_handle_dp_bandwidth_request()
Date:   Thu,  3 Aug 2023 12:50:42 +0300
Message-Id: <20230803095042.54743-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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

The memory allocated in tb_queue_dp_bandwidth_request() needs to be
released once the request is handled to avoid leaking it.

Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 62b26b7998fd..3fb4553a6442 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1964,6 +1964,8 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 	pm_runtime_mark_last_busy(&tb->dev);
 	pm_runtime_put_autosuspend(&tb->dev);
+
+	kfree(ev);
 }
 
 static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port)
-- 
2.40.1

