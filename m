Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C75E72BB56
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbjFLIxn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbjFLIxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:08 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B9D2D7F
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559946; x=1718095946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rJB2w0kMN/N3XT8QbpWu4FSXjbg/3Oo5m4DDAPUZ+eA=;
  b=ek0gkUFuODuU0y/yvU5y97wKRGcHujBbZ+j1vDqdu8Q1f4byP1DOQYXq
   rMbFmoYCxj9xq0qxAFYA0TYK8bibg2WOHcKoU64kIeZ5/GxPLZAMrLEkd
   5i8AgjqjrHzPFowEF9mdnfUD2Q7mJ9vhABM0v8uu4AF/nufobDXEsTQ8Z
   47GNw7y6vUVwqRuPSdqZQy3AWHD06f5gR92VeXjVeijFRk2mNsc4YSbZ1
   5+iGHlQEt0f6UOOrcpeHxCrLsEQwm347wwWqse8JbdBjbv+go+lkecksI
   AfBDkYfqlAwyev9mBLOOc9BuA9BlkrIEkasba6WDAWGyB5rbK2QUbBky7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627292"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247761"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247761"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BD15F911; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 10/20] thunderbolt: Fix DisplayPort IN adapter capability length for USB4 v2 routers
Date:   Mon, 12 Jun 2023 11:21:35 +0300
Message-Id: <20230612082145.62218-11-mika.westerberg@linux.intel.com>
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

For USB4 v2 routers, the DisplayPort IN adapter capability length is
longer. Display the correct capability length in the debugfs register
dump.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 48aaba17d1db..78bcf77831fe 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -18,7 +18,8 @@
 #define PORT_CAP_POWER_LEN	2
 #define PORT_CAP_LANE_LEN	3
 #define PORT_CAP_USB3_LEN	5
-#define PORT_CAP_DP_LEN		8
+#define PORT_CAP_DP_V1_LEN	9
+#define PORT_CAP_DP_V2_LEN	14
 #define PORT_CAP_TMU_V1_LEN	8
 #define PORT_CAP_TMU_V2_LEN	10
 #define PORT_CAP_BASIC_LEN	9
@@ -1175,11 +1176,13 @@ static void port_cap_show(struct tb_port *port, struct seq_file *s,
 	case TB_PORT_CAP_ADAP:
 		if (tb_port_is_pcie_down(port) || tb_port_is_pcie_up(port)) {
 			length = PORT_CAP_PCIE_LEN;
-		} else if (tb_port_is_dpin(port) || tb_port_is_dpout(port)) {
-			if (usb4_dp_port_bw_mode_supported(port))
-				length = PORT_CAP_DP_LEN + 1;
+		} else if (tb_port_is_dpin(port)) {
+			if (usb4_switch_version(port->sw) < 2)
+				length = PORT_CAP_DP_V1_LEN;
 			else
-				length = PORT_CAP_DP_LEN;
+				length = PORT_CAP_DP_V2_LEN;
+		} else if (tb_port_is_dpout(port)) {
+			length = PORT_CAP_DP_V1_LEN;
 		} else if (tb_port_is_usb3_down(port) ||
 			   tb_port_is_usb3_up(port)) {
 			length = PORT_CAP_USB3_LEN;
-- 
2.39.2

