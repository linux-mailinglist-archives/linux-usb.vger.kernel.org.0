Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD3869478D
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 14:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjBMN7F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 08:59:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjBMN7E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 08:59:04 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6646F1969F
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 05:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676296743; x=1707832743;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PuWA/XT1VhXSkbq5nnKCwxOEV94chD1bJNVM/n7Zgzc=;
  b=P6JxuJqoBP92Ky4YxPCmrBIL75wLb/5WYV1cKMt/yA9Uz34rcu6Ugmhb
   JhSJ62GBtvZdWpJITN4GNKpZRiMRgAzhH7j2H58rEr0SDGCXnents88na
   JDfFJdnNnDk5FG1SJKd+JDMZmGtocrXqMvLKRdgQvSlntrZfOqYg4yXkB
   z+2Xy83qcONeG4QaRNdcv/oyU71bNBwGSd3G5iRb41blFIdSEdWRkMWjz
   wJH8QuZOZ+2yPf/abL9Qx62MQ8U7wq9AdFW3RZe8JZXJvPCiuogKoXySY
   Q7IJibcHDF0EXubxnQiAegi5JItHAkpQb38/mh8c3pjFmCqkTy6kjH1PP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="330899074"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="330899074"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 05:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="662189741"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="662189741"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.107.70])
  by orsmga007.jf.intel.com with ESMTP; 13 Feb 2023 05:58:36 -0800
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org,
        Saranya Gopal <saranya.gopal@intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: [PATCH v2] usb: typec: pd: Add higher_capability sysfs for sink PDO
Date:   Mon, 13 Feb 2023 19:35:22 +0530
Message-Id: <20230213140522.171578-1-saranya.gopal@intel.com>
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
Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
Changed from v1:
 - Added the valid values for the sysfs
 - Wrapped the description alone to 80 characters

 .../ABI/testing/sysfs-class-usb_power_delivery        | 11 ++++++++++-
 drivers/usb/typec/pd.c                                |  9 ++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

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

