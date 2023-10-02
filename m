Return-Path: <linux-usb+bounces-929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA67B54DE
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 8DD5C1C209AC
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 14:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721BF1A27A;
	Mon,  2 Oct 2023 14:22:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650C199AF
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 14:22:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14EBA4
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696256564; x=1727792564;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YbWXFvzQZoqXdqd/6sX/f9t0eK5BwQKXDGFlF8bdmPw=;
  b=nxYLcj1NXH1U7dTeg+eqZybFQKYlNm5qDCsBeuksRJi6c4cbXzdyz6PI
   idoja/TZfOgtEVhBQpuugZNMU96DsPVI1Ikh4iwMMdBI1JpUgi76psZXm
   tmyLoNV4a7UE40s4SPSSHERTw3t3D0XLtNsm+UPMceyPLOwvIGf4lAqyB
   28W0w30vqOo+rNUH6Crrlksq55maAhdYVvcPkkY/fWVq+OiGvfgr20+0I
   bUtb5BoXTzKpbCQgXjNLH1bdYsmO3svXLjFAR0tBQN/lc8x7e9+CQN3Xl
   qieFLOHQ2p39KJAeRrUZa5TrqJ0NZSQ+Yo0Ei3toEkYtP5wSa03WXk2iS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="413563270"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="413563270"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 07:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="894143281"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="894143281"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2023 07:21:20 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-usb@vger.kernel.org,
	Douglas Gilbert <dgilbert@interlog.com>
Subject: [PATCH v3] usb: pd: Exposing the Peak Current value of Fixed Supplies to user space
Date: Mon,  2 Oct 2023 17:22:40 +0300
Message-Id: <20231002142240.2641962-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Exposing the value of the field as is.

The Peak Current value has to be interpreted as described
in Table 6-10 (Fixed Power Source Peak Current Capability)
of the USB Power Delivery Specification, but that
interpretation will be done in user space, not in kernel.

Suggested-by: Douglas Gilbert <dgilbert@interlog.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
v3: There was something wrong with my reStructuredText style table. While
    attempting to fix it, I realised that in the latest USB PD specification
    there are some small changes in the Table 6-10, so I'm skipping that table
    from the documentation, and just giving a general explanation for the sysfs
    file instead.

    I took the liberty of including Reviewed-by tag from Guenter in any case.
    The code has not changed.

---
 .../ABI/testing/sysfs-class-usb_power_delivery         |  7 +++++++
 drivers/usb/typec/pd.c                                 | 10 ++++------
 include/linux/usb/pd.h                                 |  1 +
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
index 1bf9d1d7902c..61d233c320ea 100644
--- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
+++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
@@ -124,6 +124,13 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		The voltage the supply supports in millivolts.
 
+What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:fixed_supply/peak_current
+Date:		October 2023
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file shows the value of the Fixed Power Source Peak Current
+		Capability field.
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


