Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333E15A12EF
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 16:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234778AbiHYOEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 10:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240638AbiHYOEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 10:04:21 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA90B6014
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661436251; x=1692972251;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1cK+9SxPYNZV4dLKgcmEvxjOmc6XkHw/SpIppWBBeTc=;
  b=KWnK8jBIaFvhX1C1nc5ssOiY2vvjSItvj3ZOFp9aaidGd2I5gDPgKZ2E
   utQz3jtp7KP6juiDPwxgFWyQqgCN92EV3TH8tbYU48XhyHnwCJs6OvAYx
   yHtVn3TsFy/epzCFF9e2zQsLUpLElokAWmK3BqhAhRRnrkw7vmxC5I3CH
   JU/JnVFpVWtZILyt5irxu8UGiU+gkxFyPnjMsrj9/dmv4BvOgLlXafES0
   YrcKejXV2psf/iWc0crNislniyKr1t4AE+O8WxsSZmcxlurOJuqW+RPvt
   x9JzH953ceVn+yMg+GxMV6FgpRpiwjzbmOu9RTruJMSNKtTSNsUq/7xPu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="358209860"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="358209860"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 07:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="752492806"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2022 07:03:56 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: Remove retimers properly
Date:   Thu, 25 Aug 2022 17:04:11 +0300
Message-Id: <20220825140411.10743-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Retimer device class is left dangling when the typec module
is unloaded. Attempts to reload the module failed with warning:

        "sysfs: cannot create duplicate filename '/class/retimer'"

Fixing the issue by unregistering the class properly.

Fixes: ddaf8d96f93b ("usb: typec: Add support for retimers")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index ebc29ec20e3fb..bd5e5dd704313 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2346,6 +2346,7 @@ static void __exit typec_exit(void)
 	ida_destroy(&typec_index_ida);
 	bus_unregister(&typec_bus);
 	class_unregister(&typec_mux_class);
+	class_unregister(&retimer_class);
 }
 module_exit(typec_exit);
 
-- 
2.35.1

