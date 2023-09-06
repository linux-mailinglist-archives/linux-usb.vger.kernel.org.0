Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02CAB793667
	for <lists+linux-usb@lfdr.de>; Wed,  6 Sep 2023 09:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbjIFHi6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Sep 2023 03:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233744AbjIFHi5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Sep 2023 03:38:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEB4E50
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 00:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693985929; x=1725521929;
  h=from:to:cc:subject:date:message-id;
  bh=6O3RflWchEcxcVenxbQFXiPl46B7zjn5PHan2WSqq6s=;
  b=AbcXpCO0T7SZkjPKS/3/7zkpRGkRasrgOyzX4TZWgbtda/GrpL0LQ6vA
   lxYyenu97ytLD7ozSnX0XwgPZqtCDjz7cgvf2HoTZzX5mRnjyd/tmuZnu
   cxULrgxW/7DanK4Pw10l0SzaoH3n5uWMv0EjALiSzeCKUpx187lSBaY1r
   a2v85cfmvZnunvj/N/Pyq6lluGrpHXGU9dbv7Fv9YnZ2+UomDiOgRXcWJ
   gFhLlIfk+ppLJgLEHMzFu0Rt0Mk2fqTOWdGF5lsMB8Aer6F+L2uko51y0
   YE6XI+zcxMc3B8tgty8cmQ8J+Ti9Kh5gX8eU3VXXt3Au4d4cicJvW727B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380801581"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="380801581"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 00:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811551171"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="811551171"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.53])
  by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2023 00:38:37 -0700
From:   Uday M Bhat <uday.m.bhat@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com
Subject: [PATCH v3] usb: typec: intel_pmc_mux: enable sysfs usb role access
Date:   Wed,  6 Sep 2023 12:57:17 +0530
Message-Id: <20230906072717.32485-1-uday.m.bhat@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
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
Changes from v1:
- Included Reviewed-by in commit message that was missed in v1
Changes from v2:
- Included missing change log
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

