Return-Path: <linux-usb+bounces-37241-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIclDDGvAWrXiAEAu9opvQ
	(envelope-from <linux-usb+bounces-37241-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC73550BE06
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFC96301A2A7
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C27E3D75D5;
	Mon, 11 May 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QH+qandi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126303CA4A8
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495272; cv=none; b=dJjZi4dyquLJRIRPXrvkghjZX+/4LCbT2IW24TH7dBSEsDI7pqFYZbPUtdYYKbMsEejdU5wWsky47fn7KmGAlLuFPMv2JHEki/HsCOxT2T3tlnABdM23c0soUDjxTd96i3E7AuDqvKSmok8eZEJOQrbbgtT3eBhKzaLwgckv24A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495272; c=relaxed/simple;
	bh=r+B/thzkNXyzFYtme/OIZkWSrnFaUmpj2YxmWtsupAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t41iAxs/Gd5iHIY6B+uJ4XkpMZAn0LtiMdg5fyFFMVuuyWuidIhP8ueLodjKewrH9jh9LVFTHARvtHo8BdI48ffIq3p6kxOSuGta8QxbOm35PIYu7hvKFRuwERTCPsf9aakKZhyGWoTgDLusKaez+LUZroolUDYojSytCczxriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QH+qandi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495271; x=1810031271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r+B/thzkNXyzFYtme/OIZkWSrnFaUmpj2YxmWtsupAw=;
  b=QH+qandihyrzHp5zhEe+MJLdaQuI2eOc7RdYSgRP+y+LTPLBtqm0z/Vv
   wc+zlL6P+WDvWydaDB2BKDBuHCmb6Bv/OnNBizqfIyC+rZJQqkKKksriz
   PBGjTrgOZDfmYL5Utb1msn6voke/4wIxdhCb7OfgsQvFqP7ZMjxKsCwdM
   WDq0bhkdm//Ps9Qmys3byyyoe+BMnp+KGwmLkeqP8wkqjAT4LtKi+5yD9
   N760gvfZke79+1EixxBbYvPANa+Szz4uxK1Ra/PvihsKoev5xmvHf8Meo
   rD50n899WQknkcPMJpew+N0d/87W30YzAuMP9cqqWE1CjPqRGtjas9x5N
   w==;
X-CSE-ConnectionGUID: 0+2M4UlAQ/y7MuRboDgymA==
X-CSE-MsgGUID: iMKtokj3SQOxGSy/I4Jhug==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79479077"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79479077"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:48 -0700
X-CSE-ConnectionGUID: QzMK5Bu3Qk+C3qGcUpM62A==
X-CSE-MsgGUID: ALQtcIggSw2FCWb6G7TcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234358530"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 03:27:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9485A9B; Mon, 11 May 2026 12:27:44 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 03/10] thunderbolt: Allow service drivers to specify their own properties
Date: Mon, 11 May 2026 12:27:37 +0200
Message-ID: <20260511102744.1867485-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DC73550BE06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,lunn.ch,lwn.net,linuxfoundation.org,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37241-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

The XDomain properties can be useful for service drivers, for example to
implement a registry for the services they expose. So far there has been
no need for service drivers to specify these but with the USB4STREAM
driver that we are going to use them.

This adds remote and local side properties that the service drivers have
access to. Remote side is read-only but the local side can be changed by
a service driver. Also provide a mechanism to notify the remote side
that there are changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 95 ++++++++++++++++++++++++++++++-----
 include/linux/thunderbolt.h   | 12 +++++
 2 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 6e83f93eee83..781d88d06b93 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -640,6 +640,32 @@ void tb_unregister_protocol_handler(struct tb_protocol_handler *handler)
 }
 EXPORT_SYMBOL_GPL(tb_unregister_protocol_handler);
 
+static int update_service_properties(struct device *dev, void *data)
+{
+	struct tb_property_dir *root = data;
+	struct tb_service *svc;
+	struct tb_property *p;
+
+	svc = tb_to_service(dev);
+	if (!svc)
+		return 0;
+
+	guard(mutex)(&svc->lock);
+
+	/*
+	 * Replace the static service properties with the dynamic one.
+	 * Typically this is the same but service drivers can add their
+	 * own dynamic properties here too.
+	 */
+	p = tb_property_find(root, svc->key, TB_PROPERTY_TYPE_DIRECTORY);
+	if (!p)
+		return 0;
+	if (svc->local_properties)
+		return tb_property_merge_dir(p->value.dir,
+					     svc->local_properties, false);
+	return 0;
+}
+
 static void update_property_block(struct tb_xdomain *xd)
 {
 	mutex_lock(&xdomain_lock);
@@ -664,6 +690,9 @@ static void update_property_block(struct tb_xdomain *xd)
 		tb_property_add_text(dir, "deviceid", utsname()->nodename);
 		tb_property_add_immediate(dir, "maxhopid", xd->local_max_hopid);
 
+		/* Add service specific dynamic properties */
+		device_for_each_child(&xd->dev, dir, update_service_properties);
+
 		ret = tb_property_format_dir(dir, NULL, 0);
 		if (ret < 0) {
 			dev_warn(&xd->dev, "local property block creation failed\n");
@@ -936,6 +965,40 @@ void tb_unregister_service_driver(struct tb_service_driver *drv)
 }
 EXPORT_SYMBOL_GPL(tb_unregister_service_driver);
 
+static int update_xdomain(struct device *dev, void *data)
+{
+	struct tb_xdomain *xd;
+
+	xd = tb_to_xdomain(dev);
+	if (xd) {
+		queue_delayed_work(xd->tb->wq, &xd->properties_changed_work,
+				   msecs_to_jiffies(50));
+	}
+
+	return 0;
+}
+
+/**
+ * tb_service_properties_changed() - Notify the other host about changes
+ * @svc: Service whose properties changed
+ *
+ * Notifies the other host that service properties may have been
+ * changed. This should be called whenever @svc->local_properties is
+ * updated.
+ */
+void tb_service_properties_changed(struct tb_service *svc)
+{
+	struct tb_xdomain *xd = tb_service_parent(svc);
+
+	if (xd->is_unplugged)
+		return;
+
+	scoped_guard(mutex, &xdomain_lock)
+		xdomain_property_block_gen++;
+	update_xdomain(&xd->dev, NULL);
+}
+EXPORT_SYMBOL_GPL(tb_service_properties_changed);
+
 static ssize_t key_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
@@ -1035,6 +1098,7 @@ static void tb_service_release(struct device *dev)
 	struct tb_service *svc = container_of(dev, struct tb_service, dev);
 	struct tb_xdomain *xd = tb_service_parent(svc);
 
+	tb_property_free_dir(svc->remote_properties);
 	ida_free(&xd->service_ids, svc->id);
 	kfree(svc->key);
 	kfree(svc);
@@ -1049,6 +1113,16 @@ const struct device_type tb_service_type = {
 };
 EXPORT_SYMBOL_GPL(tb_service_type);
 
+static void update_service(struct tb_service *svc, struct tb_property *property)
+{
+	struct tb_property_dir *dir = property->value.dir;
+
+	guard(mutex)(&svc->lock);
+	tb_property_free_dir(svc->remote_properties);
+	svc->remote_properties = tb_property_copy_dir(dir);
+	kobject_uevent(&svc->dev.kobj, KOBJ_CHANGE);
+}
+
 static void __unregister_service(struct device *dev)
 {
 	struct tb_service *svc = tb_to_service(dev);
@@ -1109,6 +1183,12 @@ static int populate_service(struct tb_service *svc,
 	if (!svc->key)
 		return -ENOMEM;
 
+	svc->remote_properties = tb_property_copy_dir(dir);
+	if (!svc->remote_properties) {
+		kfree(svc->key);
+		return -ENOMEM;
+	}
+
 	return 0;
 }
 
@@ -1133,6 +1213,7 @@ static void enumerate_services(struct tb_xdomain *xd)
 		/* If the service exists already we are fine */
 		dev = device_find_child(&xd->dev, p, find_service);
 		if (dev) {
+			update_service(tb_to_service(dev), p);
 			put_device(dev);
 			continue;
 		}
@@ -1156,6 +1237,7 @@ static void enumerate_services(struct tb_xdomain *xd)
 		svc->dev.bus = &tb_bus_type;
 		svc->dev.type = &tb_service_type;
 		svc->dev.parent = get_device(&xd->dev);
+		mutex_init(&svc->lock);
 		dev_set_name(&svc->dev, "%s.%d", dev_name(&xd->dev), svc->id);
 
 		tb_service_debugfs_init(svc);
@@ -2549,19 +2631,6 @@ bool tb_xdomain_handle_request(struct tb *tb, enum tb_cfg_pkg_type type,
 	return ret > 0;
 }
 
-static int update_xdomain(struct device *dev, void *data)
-{
-	struct tb_xdomain *xd;
-
-	xd = tb_to_xdomain(dev);
-	if (xd) {
-		queue_delayed_work(xd->tb->wq, &xd->properties_changed_work,
-				   msecs_to_jiffies(50));
-	}
-
-	return 0;
-}
-
 static void update_all_xdomains(void)
 {
 	bus_for_each_dev(&tb_bus_type, NULL, NULL, update_xdomain);
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index e98d569779f9..f60e3a1aecae 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -397,6 +397,10 @@ void tb_unregister_protocol_handler(struct tb_protocol_handler *handler);
  * @prtcvers: Protocol version from the properties directory
  * @prtcrevs: Protocol software revision from the properties directory
  * @prtcstns: Protocol settings mask from the properties directory
+ * @lock: Protects this structure
+ * @local_properties: Properties owned by the service driver
+ * @remote_properties: Properties read from the remote service. These
+ *		       are read-only.
  * @debugfs_dir: Pointer to the service debugfs directory. Always created
  *		 when debugfs is enabled. Can be used by service drivers to
  *		 add their own entries under the service.
@@ -404,6 +408,9 @@ void tb_unregister_protocol_handler(struct tb_protocol_handler *handler);
  * Each domain exposes set of services it supports as collection of
  * properties. For each service there will be one corresponding
  * &struct tb_service. Service drivers are bound to these.
+ *
+ * Service drivers can add their own dynamic properties to
+ * @local_properties but whenever they do so @lock must be held.
  */
 struct tb_service {
 	struct device dev;
@@ -413,6 +420,9 @@ struct tb_service {
 	u32 prtcvers;
 	u32 prtcrevs;
 	u32 prtcstns;
+	struct mutex lock;
+	struct tb_property_dir *local_properties;
+	struct tb_property_dir *remote_properties;
 	struct dentry *debugfs_dir;
 };
 
@@ -481,6 +491,8 @@ static inline struct tb_xdomain *tb_service_parent(struct tb_service *svc)
 	return tb_to_xdomain(svc->dev.parent);
 }
 
+void tb_service_properties_changed(struct tb_service *svc);
+
 /**
  * struct tb_nhi - thunderbolt native host interface
  * @lock: Must be held during ring creation/destruction. Is acquired by
-- 
2.50.1


