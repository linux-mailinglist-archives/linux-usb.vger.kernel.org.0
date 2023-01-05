Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E3B65EA09
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbjAELgB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjAELfp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:45 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131933E0E4
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918545; x=1704454545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bjh96GhDblTGAjzmY5AtdZd9tH8OuAmObS+AaNoa6hs=;
  b=aKEyED5BZJf5jAl2VlOm+S8L8q425EeDnvth1wAh4BWrmkffGGubb/kU
   ewYfVb4beiLeCxJ23WFyUHBP/Pan8UnRqS/UFfKlfe61FYB7qf0AQem+J
   myz6ABpiBhTyhhtLDFRFC3eYIlkjdXx/vyXLgjCAXQu/uEfWWGcNeG0Ww
   bPW/2MedqQaUZV1AGv996KxbzIrpL3g3czgXmvwaSczxOJCiLxOQ18lT1
   Mjh3Ow8czTARbqEKHj6NaIC+VUOLZnf/q8qbLZw50jqnVVQPbPPHIIJLS
   O1tFhEldmDz0g/lwOZa9YnSUgI2+AAD2NGVIdHmKceKMGK09nzDrxznOG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="302551919"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="302551919"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="900903388"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="900903388"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jan 2023 03:35:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C99322AD; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 7/8] thunderbolt: Include the additional DP IN double word in debugfs dump
Date:   Thu,  5 Jan 2023 13:35:58 +0200
Message-Id: <20230105113559.68531-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When DisplayPort bandwidth allocation mode is supported by the DP IN
adapter it has an extra double word in the adapter config space. Include
this in the debugfs register dump.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 834bcad42e9f..4339e706cc3a 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -1159,7 +1159,10 @@ static void port_cap_show(struct tb_port *port, struct seq_file *s,
 		if (tb_port_is_pcie_down(port) || tb_port_is_pcie_up(port)) {
 			length = PORT_CAP_PCIE_LEN;
 		} else if (tb_port_is_dpin(port) || tb_port_is_dpout(port)) {
-			length = PORT_CAP_DP_LEN;
+			if (usb4_dp_port_bw_mode_supported(port))
+				length = PORT_CAP_DP_LEN + 1;
+			else
+				length = PORT_CAP_DP_LEN;
 		} else if (tb_port_is_usb3_down(port) ||
 			   tb_port_is_usb3_up(port)) {
 			length = PORT_CAP_USB3_LEN;
-- 
2.35.1

