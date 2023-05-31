Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF6B717B43
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbjEaJHx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235384AbjEaJHe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:34 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97281E72
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524046; x=1717060046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rJB2w0kMN/N3XT8QbpWu4FSXjbg/3Oo5m4DDAPUZ+eA=;
  b=KD04ssCcFPBnfIvVg6OGmiStrZP6LIjSHFIfO5BFkEmAUlkS7NdJkCMJ
   THWzCmNmJ5ARUBa93F9ZaqfCDYRLVBvg9xxXo+vDAVJSFmYMom0/ZlYDB
   JKCe7PFj2RNURPBP0ViAgnOXWhc93x4O7vIm04qI828HGT4rRfqTWZ6tb
   XYHNFZUBF/KCXjhJ8Uq1QMzSGytnQhDMVcv58gBmrIg/D+SGnkL/+UKB/
   Uf/Ni/MYyDjfNRZudTDYy3NaQD6BBRqEsNUNcHZIrvSRKCBMZqdGEE2pW
   A+RlGS44W5k6E8rrjFehr3pk5QoTPA6phkfOIQDYbRlaj5EJ41hbZU8Ml
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027671"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027671"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247251"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247251"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4BB9DA11; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/20] thunderbolt: Fix DisplayPort IN adapter capability length for USB4 v2 routers
Date:   Wed, 31 May 2023 12:06:35 +0300
Message-Id: <20230531090645.5573-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
References: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

