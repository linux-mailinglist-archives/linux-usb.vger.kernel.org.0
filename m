Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77D99787FFE
	for <lists+linux-usb@lfdr.de>; Fri, 25 Aug 2023 08:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbjHYGg3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Aug 2023 02:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbjHYGgD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Aug 2023 02:36:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163CA1BDB
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 23:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692945362; x=1724481362;
  h=from:to:cc:subject:date:message-id;
  bh=GmMcgoA341g2jxDa1Xx/EoRtrh8NQ2r8EZ2sgM8zDxo=;
  b=b7UtmyWuEd6dKnpsc/wVGycdhwDWDmfmRv4Nj6PhrQERbd3f4HyrgnO7
   cISJbibJK3isiTMIzBwxLp8hhvGVZawtHJDG/h3UyH5L5lzEqavCa08sT
   jYtvB70pk8jq2ieB6rCSgp5HvIaUSngesLPjBlowQIKZ4fFehXGiC3jah
   I5/zhtgCHUiuPbmamEm2MwAQVO8o5iINKx8WCM0ZOhC//XC0aVFWZ8emY
   DepfoFG/WcQcXqaaTyNFtAYab84iJEaBkkKDQxn2l4TwMgE5DSGMe1HLJ
   ww4mT5szEmCAU4x4wvXDTdrTZAWEqAdSqVjcH2GHgz8Dq3Rq6gQtaBN/r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364840639"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364840639"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 23:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881066998"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.53])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 23:33:08 -0700
From:   Uday M Bhat <uday.m.bhat@intel.com>
To:     gregkh@linuxfoundation.org
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: typec: intel_pmc_mux: enable sysfs usb role access
Date:   Fri, 25 Aug 2023 11:51:57 +0530
Message-Id: <20230825062157.14820-1-uday.m.bhat@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The OS, such as ChromeOS, uses Android Runtime to run Android applications.
This necessitates supporting tools, for example, Android Debugger (ADB).
On host to host setup xHC.DbC shall support ADB with USB. This requires
user space to control USB roles.

Enable user space control to modify the USB Type-C role. At run time
it will create a role attribute in /sys/class/usb_role/<switch>/.
Attribute can be modified based on the values suggested in the
Documentation/ABI/testing/sysfs-class-usb_role.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 60ed1f809130..12a4f49e870e 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -599,6 +599,7 @@ static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
 	desc.driver_data = port;
 	desc.name = fwnode_get_name(fwnode);
 	desc.set = pmc_usb_set_role;
+	desc.allow_userspace_control = true;
 
 	port->usb_sw = usb_role_switch_register(pmc->dev, &desc);
 	if (IS_ERR(port->usb_sw)) {
-- 
2.17.1

