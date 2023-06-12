Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2C172BB52
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjFLIxp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjFLIxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:08 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18CAD2D6B
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559946; x=1718095946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XOcR5/HkZsASAT2fR8RTSQnuONlrym90djJLiM3VzKg=;
  b=iDTNR8Dxok+h2EIWkWczwYmUs7PY7QdDHLKQAcmHIHxDP20K4aEwwQli
   u0Di93GZsAoy9MH5dNfPwFF9Urwkog0pLbV4ssLi2Sw8cyuLT35kvFxC8
   SbBuPQHj5V9uLe+PNCZwtwZJZNg4duhXunIvkv3a0WXTdRmG289mkeTQu
   T+xTYGLAxCAQfgmxlqbdma4wt0u/VXAvQxyuuKS9g/lQJvXZwvVb5tnx0
   sJRwvAwSJiMoHS8WEFkWFijGS2DQa+Q1hhC/Uq+VH8Wf0yaC9DDiVhqxn
   AhqK1Mwqy1voHs6dZ/cKG0lK1mR4BkjszsmnkrzicylVievvBNvQPxc5h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627289"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627289"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247756"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247756"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id AA8266D3; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 09/20] thunderbolt: Add two additional double words for adapters TMU for USB4 v2 routers
Date:   Mon, 12 Jun 2023 11:21:34 +0300
Message-Id: <20230612082145.62218-10-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

For USB4 v2 routers, the adapters's TMU capability has two additional
double words. Include them in the debugfs register dump.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 40b59e662ee3..48aaba17d1db 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -19,7 +19,8 @@
 #define PORT_CAP_LANE_LEN	3
 #define PORT_CAP_USB3_LEN	5
 #define PORT_CAP_DP_LEN		8
-#define PORT_CAP_TMU_LEN	8
+#define PORT_CAP_TMU_V1_LEN	8
+#define PORT_CAP_TMU_V2_LEN	10
 #define PORT_CAP_BASIC_LEN	9
 #define PORT_CAP_USB4_LEN	20
 
@@ -1161,7 +1162,10 @@ static void port_cap_show(struct tb_port *port, struct seq_file *s,
 		break;
 
 	case TB_PORT_CAP_TIME1:
-		length = PORT_CAP_TMU_LEN;
+		if (usb4_switch_version(port->sw) < 2)
+			length = PORT_CAP_TMU_V1_LEN;
+		else
+			length = PORT_CAP_TMU_V2_LEN;
 		break;
 
 	case TB_PORT_CAP_POWER:
-- 
2.39.2

