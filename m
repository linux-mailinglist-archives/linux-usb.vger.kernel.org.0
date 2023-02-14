Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C572269628A
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 12:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjBNLjB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 06:39:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjBNLjA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 06:39:00 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199572312F
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 03:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676374740; x=1707910740;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ymH6UOnrnPekfDWdJvAR30TCGLJ/KrewHy4Uq3ZiCI4=;
  b=myEVGoHrdycFtN9Pn6tpbkmQY4z682abQV85eYKFO51Wp+iDlTpl+dWe
   IUvFzMyGr83FPymNJuBaVuCndm2EaapqsCw8KEtMoxgJ18l5adKPv32Sy
   YGSkBYkm3UE1pnE18gXF54D0cKJg68msx8vmtSSwzEAgJo+Mfao++6c4+
   RK4wTPcyqqsOa+J4JQjOflA6DS23hcyS1MtU4EmmCaFlpnXVBcFOeDab0
   V2xuC5qrjetVX05oDv9wLgAZ2mEs7OFTE1AtANMrxFKBWlQLEUkmOnXiE
   FLG+zD6MYFtnH5zunn7AG/VGG9sqbhJrCwjxVac7/6Azqs3L+qfJLNVy9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="331138184"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="331138184"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 03:38:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="793085067"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="793085067"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.107.70])
  by orsmga004.jf.intel.com with ESMTP; 14 Feb 2023 03:38:57 -0800
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        rajaram.regupathy@intel.com,
        Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH v3 1/2] usb: typec: pd: Remove usb_suspend_supported sysfs from sink PDO
Date:   Tue, 14 Feb 2023 17:15:42 +0530
Message-Id: <20230214114543.205103-1-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As per USB PD specification, 28th bit of fixed supply sink PDO
represents "higher capability" attribute and not "usb suspend
supported" attribute. So, this patch removes the usb_suspend_supported
attribute from sink PDO.

Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Type-C")
Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
Changes from v2:
 - Patch was split into 2
 - This patch only removes usb_suspend_supported attribute for sink PDOs

 drivers/usb/typec/pd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index dc72005d68db..b5ab26422c34 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -161,7 +161,6 @@ static struct device_type source_fixed_supply_type = {
 
 static struct attribute *sink_fixed_supply_attrs[] = {
 	&dev_attr_dual_role_power.attr,
-	&dev_attr_usb_suspend_supported.attr,
 	&dev_attr_unconstrained_power.attr,
 	&dev_attr_usb_communication_capable.attr,
 	&dev_attr_dual_role_data.attr,
-- 
2.25.1

