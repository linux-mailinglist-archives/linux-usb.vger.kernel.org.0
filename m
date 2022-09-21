Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A37525BFDFD
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 14:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiIUMdy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 08:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbiIUMdm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 08:33:42 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A62B85A8E
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 05:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663763621; x=1695299621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ONuKV2yLwKOThv/Ew9CFGPHNg7XL86muxyJ4gW2I6DA=;
  b=CywNwtKc2B3tCs5/IWs5i1Xvxa+0qfC6e6FP9yqMJZZMI99V5qrj/OJJ
   HqBjHgqHhf6Wiz2NOSjxWwTxBhqXxlK7DGLdKILwqqi9zz8dXX7Ef3jeB
   S28epn+tPkzQeUSDZkY7MsGr1wIaCVn2ZkjCPeU48YtTdA5AAJ8G8bNzw
   U9u6SnH15OdixBp/E2hVDwRHxMuL/Jd8zTmKC8q0yaz7DMNUegcvw0It9
   kjcKLOh/j+DJ5dPxralUjcu8HPcyZVp7wWAqOu5wEYbK54HLGQUiLfGFm
   mT0xMM18xJp7mL7nmzE+Fr5QTigK5JOTTi2R43zXLml/6R2fHbW0Z4+oN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="363965116"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="363965116"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 05:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="708429481"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2022 05:33:38 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/6] xhci: remove unused command member from struct xhci_hcd struct
Date:   Wed, 21 Sep 2022 15:34:49 +0300
Message-Id: <20220921123450.671459-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
References: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
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

The u32 command was added to struct xhci_hcd over 10 years ago in
commit 9777e3ce907d ("USB: xHCI: bus power management implementation")

It wasn't even used back then, so remove it.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7caa0db5e826..fa352fb24867 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1827,7 +1827,6 @@ struct xhci_hcd {
 	/* Host controller watchdog timer structures */
 	unsigned int		xhc_state;
 	unsigned long		run_graceperiod;
-	u32			command;
 	struct s3_save		s3;
 /* Host controller is dying - not responding to commands. "I'm not dead yet!"
  *
-- 
2.25.1

