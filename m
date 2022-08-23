Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18B1E59E4AA
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 15:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239933AbiHWNt4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 09:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240362AbiHWNtg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 09:49:36 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE0E21007E
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661252104; x=1692788104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XFp/2CjMgiyAxx3ImjX3yhfY9GON3ifAOSKb8kFByYE=;
  b=H23dpxD1NoKK8gXQziKNJs6FBX3FYz8hHcJhLvzd/TfcsKmOzPoX3JEj
   kC4yNOAy4hbi8YkJ6fPtxrYMGkI1L+4uv7V5qb5NzscV0q9pGI+3cTmoa
   7mtuIdCpJDT+KPm5InjXLOSLgjgIkRofgK6Blp0viiLcA9QwruUMCNXfw
   KmmB7Gm2NwNJ7MzmoexA6qOe5SHO2ejvyyo8wWaVgDCAukpGnJlPTREt1
   sGEQ16RcZ5mgHOQ5kU/vcGcMgNQLHhxC37JPe9rHgHoca1BmMmimKW4Dv
   w2Nc/jJbviGg8MiIVhd9ePsh42yimt7TH2AkUXM8qwO4JuWJg8TjKYpC+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="355385334"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="355385334"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 03:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="698638103"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2022 03:53:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1A288AD; Tue, 23 Aug 2022 13:53:53 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/4] thunderbolt: Move tb_xdomain_parent() to tb.h
Date:   Tue, 23 Aug 2022 13:53:49 +0300
Message-Id: <20220823105352.56306-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
References: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
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

We are going to need this for lane margining support so make it
available outside of xdomain.c.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h      | 5 +++++
 drivers/thunderbolt/xdomain.c | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 5db76de40cc1..8291cabd2e92 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1132,6 +1132,11 @@ void tb_xdomain_remove(struct tb_xdomain *xd);
 struct tb_xdomain *tb_xdomain_find_by_link_depth(struct tb *tb, u8 link,
 						 u8 depth);
 
+static inline struct tb_switch *tb_xdomain_parent(struct tb_xdomain *xd)
+{
+	return tb_to_switch(xd->dev.parent);
+}
+
 int tb_retimer_scan(struct tb_port *port, bool add);
 void tb_retimer_remove_all(struct tb_port *port);
 
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index c31c0d94d8b3..e4bbc4cb5f97 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1131,11 +1131,6 @@ static int populate_properties(struct tb_xdomain *xd,
 	return 0;
 }
 
-static inline struct tb_switch *tb_xdomain_parent(struct tb_xdomain *xd)
-{
-	return tb_to_switch(xd->dev.parent);
-}
-
 static int tb_xdomain_update_link_attributes(struct tb_xdomain *xd)
 {
 	bool change = false;
-- 
2.35.1

