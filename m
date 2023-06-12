Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7A772BB42
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbjFLIx3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbjFLIw6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:52:58 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5BA1BF0
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559940; x=1718095940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2spGKKJuYNiuA8qKZX/i0/6rIr2eqb7O4rNsuJf0POc=;
  b=dEwD7MVsVOvLgRO5TV/l9j1Md7mJLmbGlokHADY+Xb1Powm2oksxGk9E
   D/u35hwr/rEr26CBjNKH60ela8v6y0FTdy6H6/qhiuBPE4Q7cauJAHskK
   vY5ED9ZJrB/aEhfo8glljr4v3iXFDXrjQkiCbgi2Q64y5NE+VTpnz3P5w
   1NtQqLuj3TW6/qx5ydTHLb0CqQnxx6QItlC2+WWw6tqusHklzQ/WKdawP
   K41A0ni6CsfPDIQUc0fioJ9+myn5iq7kY4TjwBWT8Bm/gbW7BFy8tRaFz
   Uawh90aiDGTwfC0ZlzsCC75cRBYcCkiWQ64VAHt4h7/oAibG7iSUpekwQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627242"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627242"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247721"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247721"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 58129358; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 02/20] thunderbolt: Do not touch lane 1 adapter path config space
Date:   Mon, 12 Jun 2023 11:21:27 +0300
Message-Id: <20230612082145.62218-3-mika.westerberg@linux.intel.com>
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

