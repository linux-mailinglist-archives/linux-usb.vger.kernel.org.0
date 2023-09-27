Return-Path: <linux-usb+bounces-633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422197B0278
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 13:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 59D8F1C2090B
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 11:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9622629D;
	Wed, 27 Sep 2023 11:10:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9E1C690
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 11:10:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A170F180
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695813034; x=1727349034;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xBvRdIgKu3A3HiXRQFhsEEoLb0/zyRJmxTa8BDb9Sz4=;
  b=VIpVL3ROMvu6Ef/NyLH5WiJDeSr9uoUZcVXWpi1eUQJHknIyVANcS7j7
   tVS0h5FzVNrEpkZjIGevkKrQEKTe5Pjf99fDdJmxVg1zW0m20KwGV1nRH
   JGwGG2wC9diMbdajf685NlNbZbjh56mH9pzKpohwsWGt8VjoFjOYa+imr
   QcN1FrkcsFTd/3gBFssz6QT5R5CIwuYK0FIyfAbZ8BYH2CARkOzoUjr7n
   E8iXUYUNW2pxhkixkbLHE/l3shInCjV/pNQzBOt/EcSjvASVxo/OLWote
   9kmX2qNXJDtZ5QT7i/u5Ww4I2BSr0SM80AjEQ4IXVIWDVTNsn+gVEzEwE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361185336"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="361185336"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 04:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892562806"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="892562806"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2023 04:09:25 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-usb@vger.kernel.org,
	Douglas Gilbert <dgilbert@interlog.com>
Subject: [PATCH] usb: pd: Exposing the Peak Current value of Fixed Supplies to user space
Date: Wed, 27 Sep 2023 14:10:31 +0300
Message-Id: <20230927111031.1059096-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/usb/typec/pd.c | 10 ++++------
 include/linux/usb/pd.h |  1 +
 2 files changed, 5 insertions(+), 6 deletions(-)

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


