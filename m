Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F09969628B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 12:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbjBNLjD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 06:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbjBNLjC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 06:39:02 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D282068B
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 03:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676374742; x=1707910742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JLM5RoDVtAG1TyANE1OW6xxl2eCxeJYkhrfp15oL7HY=;
  b=e+xFb3no/bnGvKWr9tz9YXvcUi7R3g42MSa1ul2hTEyPwsH1awCFAcnQ
   E0/edxTSzfTKCwnquLRFsHWW5+aQW62DdQmomHG3DYCIfZSMkvGrbhdOP
   2tNu3yeSLDTFFh1sdBLIdHysRNRQpS6pU3lhc9LmXzfboxdbbzbUXKVoE
   /mATLgeIXh1X+nf0RytyvK/CABsl8LlsJ5td95Qmx3ZeDt6ViATALBw+t
   6Q6sXWo7+mAsG9ybvfZMC1Pf+JxT54Tpxw1rfX6BPjcFSw+WypFe08uvu
   SWnLHe2dUxu1TKFj/cnvPRvFp5/xkgD19x3bag4wUDZr0DHtlUQBRLjLN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="331138188"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="331138188"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 03:39:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="793085072"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="793085072"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.107.70])
  by orsmga004.jf.intel.com with ESMTP; 14 Feb 2023 03:38:59 -0800
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        rajaram.regupathy@intel.com,
        Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH v3 2/2] usb: typec: pd: Add higher capability sysfs for sink PDO
Date:   Tue, 14 Feb 2023 17:15:43 +0530
Message-Id: <20230214114543.205103-2-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214114543.205103-1-saranya.gopal@intel.com>
References: <20230214114543.205103-1-saranya.gopal@intel.com>
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

28th bit of fixed supply sink PDO represents higher capability.
When this bit is set, the sink device needs more than vsafe5V
(eg: 12 V) to provide full functionality. This patch adds
this higher capability sysfs interface for sink PDO.
28th bit of fixed supply source PDO represents usb_suspend_supported
attribute. This usb_suspend_supported sysfs is already exposed for
source PDOs. This patch adds 'source-capabilities' in
usb_suspend_supported sysfs documentation for additional clarity.

Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
Changes from v2:
 - Patch was split into 2 and this one adds new sysfs for sink PDO
Changes from v1:
 - Wrapped the description within 80 characters
 - Added valid values for the new sysfs

 .../ABI/testing/sysfs-class-usb_power_delivery        | 11 ++++++++++-
 drivers/usb/typec/pd.c                                |  8 ++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
index ce2b1b563cb3..1bf9d1d7902c 100644
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
@@ -78,6 +78,15 @@ Description:
 		will follow the USB 2.0 and USB 3.2 rules for suspend and
 		resume.
 
+What:		/sys/class/usb_power_delivery/.../sink-capabilities/1:fixed_supply/higher_capability
+Date:		February 2023
+Contact:	Saranya Gopal <saranya.gopal@linux.intel.com>
+Description:
+		This file shows the value of the Higher capability bit in
+		vsafe5V Fixed Supply Object. If the bit is set, then the sink
+		needs more than vsafe5V(eg. 12 V) to provide full functionality.
+		Valid values: 0, 1
+
 What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/unconstrained_power
 Date:		May 2022
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index b5ab26422c34..59c537a5e600 100644
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
@@ -161,6 +168,7 @@ static struct device_type source_fixed_supply_type = {
 
 static struct attribute *sink_fixed_supply_attrs[] = {
 	&dev_attr_dual_role_power.attr,
+	&dev_attr_higher_capability.attr,
 	&dev_attr_unconstrained_power.attr,
 	&dev_attr_usb_communication_capable.attr,
 	&dev_attr_dual_role_data.attr,
-- 
2.25.1

