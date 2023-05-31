Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270C1717B37
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbjEaJHa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbjEaJHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:11 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF01E1709
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524005; x=1717060005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2spGKKJuYNiuA8qKZX/i0/6rIr2eqb7O4rNsuJf0POc=;
  b=auueb6RxQf/Lvrb0qa+7e038JlTSfBZf4SyGzZKfp52gMGf3jbs/Skck
   +SaIqgjxT24xG7uvur4Ek/+b1b3Gv3mJmtm0/k+CkBZ2xMR9DWoZOw3TU
   fltw9ZhltKNvIhuvDsQuJArNhV8++lN/H6HhpP7NH41ldEyy0W2NmZqzI
   pQpgpbpXrzjspun87e5tVDc0gUx/0at3fOwuv+x87KYWT+PtWJ09O5/OJ
   2GsbrwsnWRhW/wxlAakI4xhJn2as2p0WerLh8JQcPcReMHAQb2MZZDMT+
   Crvg3Yr4OIVGwVL0SeaGmzxJliR7UwiEFL9IxD3I1hCCGjAVT+0kF3z+r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027614"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027614"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247208"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247208"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 089BF589; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/20] thunderbolt: Do not touch lane 1 adapter path config space
Date:   Wed, 31 May 2023 12:06:27 +0300
Message-Id: <20230531090645.5573-3-mika.westerberg@linux.intel.com>
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

It is not required to be implemented at all because USB4 does not use
lane 1 for tunneling except when aggregated with lane 0. For this reason
do not try to read the path config space of USB4 lane 1 adapters.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 0c11caec7e8e..47961afdcc73 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -723,7 +723,7 @@ static int tb_init_port(struct tb_port *port)
 		 * can be read from the path config space. Legacy
 		 * devices we use hard-coded value.
 		 */
-		if (tb_switch_is_usb4(port->sw)) {
+		if (port->cap_usb4) {
 			struct tb_regs_hop hop;
 
 			if (!tb_port_read(port, &hop, TB_CFG_HOPS, 0, 2))
-- 
2.39.2

