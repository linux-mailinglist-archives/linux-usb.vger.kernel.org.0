Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9577C787FAF
	for <lists+linux-usb@lfdr.de>; Fri, 25 Aug 2023 08:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjHYGSQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Aug 2023 02:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjHYGRw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Aug 2023 02:17:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1FC124
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 23:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692944270; x=1724480270;
  h=from:to:cc:subject:date:message-id;
  bh=jjnm7VHmj9zwH1Trn2FbXPmQJGGhFkD/pSFbuoH2zYo=;
  b=axoTDMKoeXNQ8Wi4CtUavtBFULs74AHxJJILkVx+d+sKcHB9Vkj2Dqhy
   5sWDiOqJ8TJ7x4Y3kAjjVoWX0Jobpm4ntKa4KNS+A/ZSzxNG5NVdkTjea
   lBT5CJXJwQK3Zr6dgcZAjN2CpzuoWplCYmqsN0997oxBU+eY56soEt1gH
   Uopkg06RVwa9tCB+PalBExFqm9AEXcD4yJxQqTSwFQqGWwgDPHCMvf9D2
   AXHJPqqkhm/uGfBFN5qg7eEGV4LCNZLo8Bq99Jg/ntf6uHSWciticCu9H
   6jGwX8JrEi4f+h+liQZHhkFdbGTnECxwDCPy0VJBvqpufNQXrmSzGwcCN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374617462"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374617462"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 23:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="911186001"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="911186001"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.53])
  by orsmga005.jf.intel.com with ESMTP; 24 Aug 2023 23:17:31 -0700
From:   Uday M Bhat <uday.m.bhat@intel.com>
To:     gregkh@linuxfoundation.org
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: intel_pmc_mux: enable sysfs usb role access
Date:   Fri, 25 Aug 2023 11:36:24 +0530
Message-Id: <20230825060624.14502-1-uday.m.bhat@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
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

