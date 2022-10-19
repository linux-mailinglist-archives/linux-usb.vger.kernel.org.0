Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4470E604A45
	for <lists+linux-usb@lfdr.de>; Wed, 19 Oct 2022 17:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbiJSPCU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Oct 2022 11:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiJSPCF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Oct 2022 11:02:05 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465C31B8679
        for <linux-usb@vger.kernel.org>; Wed, 19 Oct 2022 07:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666191382; x=1697727382;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SJbDBIeDgAEEIfDcDA+mqFqKBIRESFBYYvf/x7mE/IU=;
  b=TMbxZCS8zbqc+FwIu4xSIKkwHNortYAWbcG26fFL+RuN+8aROPGq8oai
   aGIVN7yQhT+eVOi19UpgphbAAddprDrewTbmtLl1vgPIwrs9Qgcn+HII4
   XWM5rCoAqbIU/Nk1YRsLDVW8w11MyEFu/YPm9Sc6/hvWLdrf51Jg41+84
   GT3r2Ef/RSz5eZfx6jxPLrP8dOGZZvavN0aIZio9G2YuYwdJc68uPwJPH
   1j5r6yXz/TOlYGPQA9FrOrN7bmGCcXapbG5/P+hroDtNxy6xCPSXGt8B2
   U2S8xz64DMcXYf8A7aEe0t2R9epla6fuc8AFfV3DWKI7SJa2FGpwSCZio
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="304048682"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="304048682"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 07:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771822973"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="771822973"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 07:55:30 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: retimer: Use device type for matching
Date:   Wed, 19 Oct 2022 17:55:52 +0300
Message-Id: <20221019145552.32493-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Device name is not reliable so using the type instead in
retimer_fwnode_match().

This will also introduce is_typec_retimer() helper, and
remove the static keyword from the retimer device type. That
will make it accessible also in the main typec class.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/retimer.c | 16 ++--------------
 drivers/usb/typec/retimer.h |  4 ++++
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/retimer.c b/drivers/usb/typec/retimer.c
index ee94dbbe47453..3a4146ea6e7cf 100644
--- a/drivers/usb/typec/retimer.c
+++ b/drivers/usb/typec/retimer.c
@@ -17,21 +17,9 @@
 #include "class.h"
 #include "retimer.h"
 
-static bool dev_name_ends_with(struct device *dev, const char *suffix)
-{
-	const char *name = dev_name(dev);
-	const int name_len = strlen(name);
-	const int suffix_len = strlen(suffix);
-
-	if (suffix_len > name_len)
-		return false;
-
-	return strcmp(name + (name_len - suffix_len), suffix) == 0;
-}
-
 static int retimer_fwnode_match(struct device *dev, const void *fwnode)
 {
-	return device_match_fwnode(dev, fwnode) && dev_name_ends_with(dev, "-retimer");
+	return is_typec_retimer(dev) && device_match_fwnode(dev, fwnode);
 }
 
 static void *typec_retimer_match(struct fwnode_handle *fwnode, const char *id, void *data)
@@ -97,7 +85,7 @@ static void typec_retimer_release(struct device *dev)
 	kfree(to_typec_retimer(dev));
 }
 
-static const struct device_type typec_retimer_dev_type = {
+const struct device_type typec_retimer_dev_type = {
 	.name = "typec_retimer",
 	.release = typec_retimer_release,
 };
diff --git a/drivers/usb/typec/retimer.h b/drivers/usb/typec/retimer.h
index fa15951d48468..e34bd23323be5 100644
--- a/drivers/usb/typec/retimer.h
+++ b/drivers/usb/typec/retimer.h
@@ -12,4 +12,8 @@ struct typec_retimer {
 
 #define to_typec_retimer(_dev_) container_of(_dev_, struct typec_retimer, dev)
 
+const struct device_type typec_retimer_dev_type;
+
+#define is_typec_retimer(dev) ((dev)->type == &typec_retimer_dev_type)
+
 #endif /* __USB_TYPEC_RETIMER__ */
-- 
2.35.1

