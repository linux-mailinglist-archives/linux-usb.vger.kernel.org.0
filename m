Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3EC6937C8
	for <lists+linux-usb@lfdr.de>; Sun, 12 Feb 2023 15:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjBLOmC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Feb 2023 09:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjBLOmB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Feb 2023 09:42:01 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72206D533
        for <linux-usb@vger.kernel.org>; Sun, 12 Feb 2023 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676212920; x=1707748920;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ic7bU55gho/XKBi1NyFWZdUlqc2WjSRkxd8wp7v/oPM=;
  b=TK6QrVsZmYt5BDAnOA/+6/t8ScZ9mhG1Sx0+xJVZkvTOWbdp4qZLDExi
   BA+BCpM1oXtqeGx8ktwet/jIjQlleVJy1kfBuK7Jk/P8g0pCc3qA9IbR4
   GTp2w4S/0D3mnNpKgqQyVRbABUt/cL0BGnT0nUSlSsYZ2Kyt18Jho5Ug/
   1VlqCs7GPgVfCFcJ9iKsmSBbwNaHG7aslhVr0gSHom/Gq/SCQFTMDYT7f
   W0J2EnjQNNGwwGNEG9NWSek7L8J0Sy5kl/wQgl1Z559g7ZIPSKdix09Qb
   WWFdUdv2GUHHNjMDpKoWUoJK+DjdmNwSMzb+/tCUmSGdlBy3sJSZt7SK+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="329349265"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="329349265"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 06:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="842507467"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="842507467"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.107.70])
  by orsmga005.jf.intel.com with ESMTP; 12 Feb 2023 06:41:57 -0800
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        Saranya Gopal <saranya.gopal@intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: [PATCH] usb: typec: pd: Add higher_capability sysfs for sink PDO
Date:   Sun, 12 Feb 2023 20:18:38 +0530
Message-Id: <20230212144838.128595-1-saranya.gopal@intel.com>
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

As per USB PD specification, 28th bit of sink fixed power supply
PDO represents higher capability. If this bit is set, it indicates
that the sink needs more than vsafe5V to provide full functionality.
This patch replaces usb_suspend_supported sysfs with higher_capability
sysfs for sink PDO.

Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Type-C")
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
 .../ABI/testing/sysfs-class-usb_power_delivery         | 10 +++++++++-
 drivers/usb/typec/pd.c                                 |  9 ++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
index ce2b1b563cb3..59757118b6a3 100644
--- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
+++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
@@ -69,7 +69,7 @@ Description:
 		This file contains boolean value that tells does the device
 		support both source and sink power roles.
 
-What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/usb_suspend_supported
+What:		/sys/class/usb_power_delivery/.../source-capabilities/1:fixed_supply/usb_suspend_supported
 Date:		May 2022
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
@@ -78,6 +78,14 @@ Description:
 		will follow the USB 2.0 and USB 3.2 rules for suspend and
 		resume.
 
+What:		/sys/class/usb_power_delivery/.../sink-capabilities/1:fixed_supply/higher_capability
+Date:		February 2023
+Contact:	Saranya Gopal <saranya.gopal@linux.intel.com>
+Description:
+		This file shows the value of the Higher capability bit in vsafe5V Fixed Supply Object.
+		If the bit is set, then the sink needs more than vsafe5V(eg. 12 V) to provide
+		full functionality.
+
 What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/unconstrained_power
 Date:		May 2022
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index dc72005d68db..59c537a5e600 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -48,6 +48,13 @@ usb_suspend_supported_show(struct device *dev, struct device_attribute *attr, ch
 }
 static DEVICE_ATTR_RO(usb_suspend_supported);
 
+static ssize_t
+higher_capability_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & PDO_FIXED_HIGHER_CAP));
+}
+static DEVICE_ATTR_RO(higher_capability);
+
 static ssize_t
 unconstrained_power_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -161,7 +168,7 @@ static struct device_type source_fixed_supply_type = {
 
 static struct attribute *sink_fixed_supply_attrs[] = {
 	&dev_attr_dual_role_power.attr,
-	&dev_attr_usb_suspend_supported.attr,
+	&dev_attr_higher_capability.attr,
 	&dev_attr_unconstrained_power.attr,
 	&dev_attr_usb_communication_capable.attr,
 	&dev_attr_dual_role_data.attr,
-- 
2.25.1

