Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444FE50FBEC
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 13:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349518AbiDZL2y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 07:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236771AbiDZL2w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 07:28:52 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A120C15725
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650972345; x=1682508345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m11dKeme3P2DhkuylIoMXOq+40TPqN8pZVRxH7ehsXc=;
  b=C4OnG5aEXZlTc3PNh0Y+9oZma0urhbfE8P7HuIsRfkIXhV8DToSXI6Qd
   YYk4q+2S73iD+GfeRqXZb8SbspmqMVDtm0DoktN0WIWXggexv6VkR5rkx
   I4HzicB903hqNvnOZ1fwLNGCmV9SSxaBsNqKKnhE7iWrjCWK4PtM7GYqt
   79TQWQIQ83wKRLaMXc/1XelToMWSIWqqZURAh2SEPDro2FKwrX8NiRpdt
   MDC3l1sR9usRinEigdzWd0ZU7mAfBIPXzlY1rY+bsZdu/K0x58j24nLyD
   ltCAGVZRO/jtWIaFlBIqc8pXZuRDdb7nmmv6TN4U3X6mMaGqqZvl0CmLT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="351988561"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="351988561"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 04:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="650158831"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2022 04:25:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5ECD8179; Tue, 26 Apr 2022 14:25:40 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/5] thunderbolt: Add debug logging when lane is enabled/disabled
Date:   Tue, 26 Apr 2022 14:25:36 +0300
Message-Id: <20220426112540.6053-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
References: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is useful when debugging possible issues.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ac87e8b50e52..2d8a0fd3469c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -693,8 +693,14 @@ static int __tb_port_enable(struct tb_port *port, bool enable)
 	else
 		phy |= LANE_ADP_CS_1_LD;
 
-	return tb_port_write(port, &phy, TB_CFG_PORT,
-			     port->cap_phy + LANE_ADP_CS_1, 1);
+
+	ret = tb_port_write(port, &phy, TB_CFG_PORT,
+			    port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	tb_port_dbg(port, "lane %sabled\n", enable ? "en" : "dis");
+	return 0;
 }
 
 /**
-- 
2.35.1

