Return-Path: <linux-usb+bounces-690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF17B18CE
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 12:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 829502822CB
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 10:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A720C358AC;
	Thu, 28 Sep 2023 10:59:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB425358A0
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 10:59:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AFE126
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695898788; x=1727434788;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jn0qsPMVnNbgAecFjLhsjF+84whx0+cKVYctDVWQfQA=;
  b=j6V1uzD4ve1R3d7X032bXO/8GUAg51ityxnhSQ8kTGRqheLk3rZPItLr
   xwfNnMG4xHBZBnnC5KvI1dfeas7uYyYh6qms+zQuVACN907Ar3TG7zmnA
   /PX/5GP1aCJPccfpeBsTH3d5ACFu6LgEpbPYE9hIZBlxYOGY4cJzi01MW
   YIKSUuoBt5265AAFXhtRjrCx5jpJMGscnyRnQLGCL3hWUsII9h5kMMlSS
   BA7Az4lHHtfYJpX9x3odsd/WKzr598vFfEsVRpvo7U//f3/ttqCSEnruF
   3tfPLtROZP77iJR88N6iE8SRUGbkpFRz+jRGXUwZtPakUvAOVb9njEKjQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="362274069"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="362274069"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 03:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892982176"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="892982176"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2023 03:58:35 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-usb@vger.kernel.org,
	Douglas Gilbert <dgilbert@interlog.com>
Subject: [PATCH v2] usb: pd: Exposing the Peak Current value of Fixed Supplies to user space
Date: Thu, 28 Sep 2023 13:59:44 +0300
Message-Id: <20230928105944.1718897-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Exposing the value of the field as is.

The Peak Current value has to be interpreted as described
in Table 6-10 (Fixed Power Source Peak Current Capability)
of the USB Power Delivery Specification, but that
interpretation will be done in user space, not in kernel.

Suggested-by: Douglas Gilbert <dgilbert@interlog.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
v2: Include ABI documentation.

---
 .../testing/sysfs-class-usb_power_delivery    | 31 +++++++++++++++++++
 drivers/usb/typec/pd.c                        | 10 +++---
 include/linux/usb/pd.h                        |  1 +
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
index 1bf9d1d7902c..4b0708af4a41 100644
--- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
+++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
@@ -124,6 +124,37 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		The voltage the supply supports in millivolts.
 
+What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:fixed_supply/peak_current
+Date:		October 2023
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Fixed Power Source Peak Current Capability
+		(IOC: Negotiated current as defined in IEC 63002):
+		==  ===========================================================
+		0   Peak current equals IOC (default)
+		1   Overload Capabilities:
+		    1. Peak current equals 150% IOC for 1ms @ 5% duty cycle
+		       (low current equals 97% IOC for 19ms)
+		    2. Peak current equals 125% IOC for 2ms @ 10% duty cycle
+		       (low current equals 97% IOC for 18ms)
+		    3. Peak current equals 110% IOC for 10ms @ 50% duty cycle
+		       (low current equals 90% IOC for 10ms)
+		2   Overload Capabilities:
+		    1. Peak current equals 200% IOC for 1ms @ 5% duty cycle
+		       (low current equals 95% IOC for 19ms)
+		    2. Peak current equals 150% IOC for 2ms @ 10% duty cycle
+		       (low current equals 94% IOC for 18ms)
+		    3. Peak current equals 125% IOC for 10ms @ 50% duty cycle
+		       (low current equals 75% IOC for 10ms)
+		3   Overload Capabilities:
+		    1. Peak current equals 200% IOC for 1ms @ 5% duty cycle
+		       (low current equals 95% IOC for 19ms)
+		    2. Peak current equals 175% IOC for 2ms @ 10% duty cycle
+		       (low current equals 92% IOC for 18ms)
+		    3. Peak current equals 150% IOC for 10ms @ 50% duty cycle
+		       (low current equals 50% IOC for 10ms)
+		==  ===========================================================
+
 What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:fixed_supply/maximum_current
 Date:		May 2022
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index 8cc66e4467c4..85d015cdbe1f 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -83,14 +83,12 @@ unchunked_extended_messages_supported_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(unchunked_extended_messages_supported);
 
-/*
- * REVISIT: Peak Current requires access also to the RDO.
 static ssize_t
 peak_current_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	...
+	return sysfs_emit(buf, "%u\n", (to_pdo(dev)->pdo >> PDO_FIXED_PEAK_CURR_SHIFT) & 3);
 }
-*/
+static DEVICE_ATTR_RO(peak_current);
 
 static ssize_t
 fast_role_swap_current_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -135,7 +133,7 @@ static struct attribute *source_fixed_supply_attrs[] = {
 	&dev_attr_usb_communication_capable.attr,
 	&dev_attr_dual_role_data.attr,
 	&dev_attr_unchunked_extended_messages_supported.attr,
-	/*&dev_attr_peak_current.attr,*/
+	&dev_attr_peak_current.attr,
 	&dev_attr_voltage.attr,
 	&maximum_current_attr.attr,
 	NULL
@@ -144,7 +142,7 @@ static struct attribute *source_fixed_supply_attrs[] = {
 static umode_t fixed_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
 {
 	if (to_pdo(kobj_to_dev(kobj))->object_position &&
-	    /*attr != &dev_attr_peak_current.attr &&*/
+	    attr != &dev_attr_peak_current.attr &&
 	    attr != &dev_attr_voltage.attr &&
 	    attr != &maximum_current_attr.attr &&
 	    attr != &operational_current_attr.attr)
diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index c59fb79a42e8..eb626af0e4e7 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -228,6 +228,7 @@ enum pd_pdo_type {
 #define PDO_FIXED_UNCHUNK_EXT		BIT(24) /* Unchunked Extended Message supported (Source) */
 #define PDO_FIXED_FRS_CURR_MASK		(BIT(24) | BIT(23)) /* FR_Swap Current (Sink) */
 #define PDO_FIXED_FRS_CURR_SHIFT	23
+#define PDO_FIXED_PEAK_CURR_SHIFT	20
 #define PDO_FIXED_VOLT_SHIFT		10	/* 50mV units */
 #define PDO_FIXED_CURR_SHIFT		0	/* 10mA units */
 
-- 
2.40.1


