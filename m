Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E9D32D339
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 13:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240938AbhCDMdx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 07:33:53 -0500
Received: from mga01.intel.com ([192.55.52.88]:37604 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240813AbhCDMdU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Mar 2021 07:33:20 -0500
IronPort-SDR: elbyKQhL8eVKT7XP1exYRC1Yoj4SJju+xSBZZAMZCnhAAEtOsRrlg7JG5PDckh5Jlb5Ky+4QLZ
 s4rj5kxmyiMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="207113158"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="207113158"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:31:32 -0800
IronPort-SDR: v9oNlzWy1RaNG8A9AqnAFqc3Zf0nq532l4zRfXP042y3xmQw8jFvcLmXEUbang2mZ/9hZnkcrD
 /JQdexYETMOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="406837354"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Mar 2021 04:31:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8DAAC487; Thu,  4 Mar 2021 14:31:26 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Subject: [PATCH 10/18] thunderbolt: Add support for maxhopid XDomain property
Date:   Thu,  4 Mar 2021 15:31:17 +0300
Message-Id: <20210304123125.43630-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
References: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 inter-domain spec mandates that the compatible hosts expose a new
property "maxhopid" that tells the connection manager on the other side
what is the maximum supported input HopID over the connection. Since
this is depend on the lane adapter the cable is connected it needs to be
filled in dynamically.

For this reason we take a copy of the global properties and fill then
for each XDomain connection upon first connect, and then keep updating
it if the generation changes as services are being added/removed. We
also take advantage of this copy to fill in the hostname.

We also expose this maxhopid as an attribute under each XDomain device.

While there drop kernel-doc entry for property_lock which seems to be
left there when the structure was originally introduced.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         |   7 +
 drivers/thunderbolt/xdomain.c                 | 206 ++++++++++--------
 include/linux/thunderbolt.h                   |  19 +-
 3 files changed, 138 insertions(+), 94 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index bfa4ca6f3fc1..c41c68f64693 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -134,6 +134,13 @@ Contact:	thunderbolt-software@lists.01.org
 Description:	This attribute contains name of this device extracted from
 		the device DROM.
 
+What:		/sys/bus/thunderbolt/devices/.../maxhopid
+Date:		Jul 2021
+KernelVersion:	5.13
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	Only set for XDomains. The maximum HopID the other host
+		supports as its input HopID.
+
 What:		/sys/bus/thunderbolt/devices/.../rx_speed
 Date:		Jan 2020
 KernelVersion:	5.5
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index ffa9cc9e0e7d..ab56757d7c24 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -24,6 +24,7 @@
 #define XDOMAIN_PROPERTIES_RETRIES		10
 #define XDOMAIN_PROPERTIES_CHANGED_RETRIES	10
 #define XDOMAIN_BONDING_WAIT			100  /* ms */
+#define XDOMAIN_DEFAULT_MAX_HOPID		15
 
 struct xdomain_request_work {
 	struct work_struct work;
@@ -35,13 +36,15 @@ static bool tb_xdomain_enabled = true;
 module_param_named(xdomain, tb_xdomain_enabled, bool, 0444);
 MODULE_PARM_DESC(xdomain, "allow XDomain protocol (default: true)");
 
-/* Serializes access to the properties and protocol handlers below */
+/*
+ * Serializes access to the properties and protocol handlers below. If
+ * you need to take both this lock and the struct tb_xdomain lock, take
+ * this one first.
+ */
 static DEFINE_MUTEX(xdomain_lock);
 
 /* Properties exposed to the remote domains */
 static struct tb_property_dir *xdomain_property_dir;
-static u32 *xdomain_property_block;
-static u32 xdomain_property_block_len;
 static u32 xdomain_property_block_gen;
 
 /* Additional protocol handlers */
@@ -386,8 +389,7 @@ static int tb_xdp_properties_request(struct tb_ctl *ctl, u64 route,
 }
 
 static int tb_xdp_properties_response(struct tb *tb, struct tb_ctl *ctl,
-	u64 route, u8 sequence, const uuid_t *src_uuid,
-	const struct tb_xdp_properties *req)
+	struct tb_xdomain *xd, u8 sequence, const struct tb_xdp_properties *req)
 {
 	struct tb_xdp_properties_response *res;
 	size_t total_size;
@@ -399,39 +401,39 @@ static int tb_xdp_properties_response(struct tb *tb, struct tb_ctl *ctl,
 	 * protocol supports forwarding, though which we might add
 	 * support later on.
 	 */
-	if (!uuid_equal(src_uuid, &req->dst_uuid)) {
-		tb_xdp_error_response(ctl, route, sequence,
+	if (!uuid_equal(xd->local_uuid, &req->dst_uuid)) {
+		tb_xdp_error_response(ctl, xd->route, sequence,
 				      ERROR_UNKNOWN_DOMAIN);
 		return 0;
 	}
 
-	mutex_lock(&xdomain_lock);
+	mutex_lock(&xd->lock);
 
-	if (req->offset >= xdomain_property_block_len) {
-		mutex_unlock(&xdomain_lock);
+	if (req->offset >= xd->local_property_block_len) {
+		mutex_unlock(&xd->lock);
 		return -EINVAL;
 	}
 
-	len = xdomain_property_block_len - req->offset;
+	len = xd->local_property_block_len - req->offset;
 	len = min_t(u16, len, TB_XDP_PROPERTIES_MAX_DATA_LENGTH);
 	total_size = sizeof(*res) + len * 4;
 
 	res = kzalloc(total_size, GFP_KERNEL);
 	if (!res) {
-		mutex_unlock(&xdomain_lock);
+		mutex_unlock(&xd->lock);
 		return -ENOMEM;
 	}
 
-	tb_xdp_fill_header(&res->hdr, route, sequence, PROPERTIES_RESPONSE,
+	tb_xdp_fill_header(&res->hdr, xd->route, sequence, PROPERTIES_RESPONSE,
 			   total_size);
-	res->generation = xdomain_property_block_gen;
-	res->data_length = xdomain_property_block_len;
+	res->generation = xd->local_property_block_gen;
+	res->data_length = xd->local_property_block_len;
 	res->offset = req->offset;
-	uuid_copy(&res->src_uuid, src_uuid);
+	uuid_copy(&res->src_uuid, xd->local_uuid);
 	uuid_copy(&res->dst_uuid, &req->src_uuid);
-	memcpy(res->data, &xdomain_property_block[req->offset], len * 4);
+	memcpy(res->data, &xd->local_property_block[req->offset], len * 4);
 
-	mutex_unlock(&xdomain_lock);
+	mutex_unlock(&xd->lock);
 
 	ret = __tb_xdomain_response(ctl, res, total_size,
 				    TB_CFG_PKG_XDOMAIN_RESP);
@@ -513,52 +515,63 @@ void tb_unregister_protocol_handler(struct tb_protocol_handler *handler)
 }
 EXPORT_SYMBOL_GPL(tb_unregister_protocol_handler);
 
-static int rebuild_property_block(void)
+static void update_property_block(struct tb_xdomain *xd)
 {
-	u32 *block, len;
-	int ret;
-
-	ret = tb_property_format_dir(xdomain_property_dir, NULL, 0);
-	if (ret < 0)
-		return ret;
-
-	len = ret;
-
-	block = kcalloc(len, sizeof(u32), GFP_KERNEL);
-	if (!block)
-		return -ENOMEM;
+	mutex_lock(&xdomain_lock);
+	mutex_lock(&xd->lock);
+	/*
+	 * If the local property block is not up-to-date, rebuild it now
+	 * based on the global property template.
+	 */
+	if (!xd->local_property_block ||
+	    xd->local_property_block_gen < xdomain_property_block_gen) {
+		struct tb_property_dir *dir;
+		int ret, block_len;
+		u32 *block;
+
+		dir = tb_property_copy_dir(xdomain_property_dir);
+		if (!dir) {
+			dev_warn(&xd->dev, "failed to copy properties\n");
+			goto out_unlock;
+		}
 
-	ret = tb_property_format_dir(xdomain_property_dir, block, len);
-	if (ret) {
-		kfree(block);
-		return ret;
-	}
+		/* Fill in non-static properties now */
+		tb_property_add_text(dir, "deviceid", utsname()->nodename);
+		tb_property_add_immediate(dir, "maxhopid", xd->local_max_hopid);
 
-	kfree(xdomain_property_block);
-	xdomain_property_block = block;
-	xdomain_property_block_len = len;
-	xdomain_property_block_gen++;
+		ret = tb_property_format_dir(dir, NULL, 0);
+		if (ret < 0) {
+			dev_warn(&xd->dev, "local property block creation failed\n");
+			tb_property_free_dir(dir);
+			goto out_unlock;
+		}
 
-	return 0;
-}
+		block_len = ret;
+		block = kcalloc(block_len, sizeof(*block), GFP_KERNEL);
+		if (!block) {
+			tb_property_free_dir(dir);
+			goto out_unlock;
+		}
 
-static void finalize_property_block(void)
-{
-	const struct tb_property *nodename;
+		ret = tb_property_format_dir(dir, block, block_len);
+		if (ret) {
+			dev_warn(&xd->dev, "property block generation failed\n");
+			tb_property_free_dir(dir);
+			kfree(block);
+			goto out_unlock;
+		}
 
-	/*
-	 * On first XDomain connection we set up the the system
-	 * nodename. This delayed here because userspace may not have it
-	 * set when the driver is first probed.
-	 */
-	mutex_lock(&xdomain_lock);
-	nodename = tb_property_find(xdomain_property_dir, "deviceid",
-				    TB_PROPERTY_TYPE_TEXT);
-	if (!nodename) {
-		tb_property_add_text(xdomain_property_dir, "deviceid",
-				     utsname()->nodename);
-		rebuild_property_block();
+		tb_property_free_dir(dir);
+		/* Release the previous block */
+		kfree(xd->local_property_block);
+		/* Assign new one */
+		xd->local_property_block = block;
+		xd->local_property_block_len = block_len;
+		xd->local_property_block_gen = xdomain_property_block_gen;
 	}
+
+out_unlock:
+	mutex_unlock(&xd->lock);
 	mutex_unlock(&xdomain_lock);
 }
 
@@ -569,6 +582,7 @@ static void tb_xdp_handle_request(struct work_struct *work)
 	const struct tb_xdomain_header *xhdr = &pkg->xd_hdr;
 	struct tb *tb = xw->tb;
 	struct tb_ctl *ctl = tb->ctl;
+	struct tb_xdomain *xd;
 	const uuid_t *uuid;
 	int ret = 0;
 	u32 sequence;
@@ -590,19 +604,21 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		goto out;
 	}
 
-	finalize_property_block();
-
 	tb_dbg(tb, "%llx: received XDomain request %#x\n", route, pkg->type);
 
+	xd = tb_xdomain_find_by_route_locked(tb, route);
+	if (xd)
+		update_property_block(xd);
+
 	switch (pkg->type) {
 	case PROPERTIES_REQUEST:
-		ret = tb_xdp_properties_response(tb, ctl, route, sequence, uuid,
-			(const struct tb_xdp_properties *)pkg);
+		if (xd) {
+			ret = tb_xdp_properties_response(tb, ctl, xd, sequence,
+				(const struct tb_xdp_properties *)pkg);
+		}
 		break;
 
-	case PROPERTIES_CHANGED_REQUEST: {
-		struct tb_xdomain *xd;
-
+	case PROPERTIES_CHANGED_REQUEST:
 		ret = tb_xdp_properties_changed_response(ctl, route, sequence);
 
 		/*
@@ -610,17 +626,11 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		 * the xdomain related to this connection as well in
 		 * case there is a change in services it offers.
 		 */
-		xd = tb_xdomain_find_by_route_locked(tb, route);
-		if (xd) {
-			if (device_is_registered(&xd->dev)) {
-				queue_delayed_work(tb->wq, &xd->get_properties_work,
-						   msecs_to_jiffies(50));
-			}
-			tb_xdomain_put(xd);
+		if (xd && device_is_registered(&xd->dev)) {
+			queue_delayed_work(tb->wq, &xd->get_properties_work,
+					   msecs_to_jiffies(50));
 		}
-
 		break;
-	}
 
 	case UUID_REQUEST_OLD:
 	case UUID_REQUEST:
@@ -633,6 +643,8 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		break;
 	}
 
+	tb_xdomain_put(xd);
+
 	if (ret) {
 		tb_warn(tb, "failed to send XDomain response for %#x\n",
 			pkg->type);
@@ -814,7 +826,7 @@ static int remove_missing_service(struct device *dev, void *data)
 	if (!svc)
 		return 0;
 
-	if (!tb_property_find(xd->properties, svc->key,
+	if (!tb_property_find(xd->remote_properties, svc->key,
 			      TB_PROPERTY_TYPE_DIRECTORY))
 		device_unregister(dev);
 
@@ -874,7 +886,7 @@ static void enumerate_services(struct tb_xdomain *xd)
 	device_for_each_child_reverse(&xd->dev, xd, remove_missing_service);
 
 	/* Then re-enumerate properties creating new services as we go */
-	tb_property_for_each(xd->properties, p) {
+	tb_property_for_each(xd->remote_properties, p) {
 		if (p->type != TB_PROPERTY_TYPE_DIRECTORY)
 			continue;
 
@@ -931,6 +943,14 @@ static int populate_properties(struct tb_xdomain *xd,
 		return -EINVAL;
 	xd->vendor = p->value.immediate;
 
+	p = tb_property_find(dir, "maxhopid", TB_PROPERTY_TYPE_VALUE);
+	/*
+	 * USB4 inter-domain spec suggests using 15 as HopID if the
+	 * other end does not announce it in a property. This is for
+	 * TBT3 compatibility.
+	 */
+	xd->remote_max_hopid = p ? p->value.immediate : XDOMAIN_DEFAULT_MAX_HOPID;
+
 	kfree(xd->device_name);
 	xd->device_name = NULL;
 	kfree(xd->vendor_name);
@@ -1072,7 +1092,7 @@ static void tb_xdomain_get_properties(struct work_struct *work)
 	mutex_lock(&xd->lock);
 
 	/* Only accept newer generation properties */
-	if (xd->properties && gen <= xd->property_block_gen)
+	if (xd->remote_properties && gen <= xd->remote_property_block_gen)
 		goto err_free_block;
 
 	dir = tb_property_parse_dir(block, ret);
@@ -1088,13 +1108,13 @@ static void tb_xdomain_get_properties(struct work_struct *work)
 	}
 
 	/* Release the existing one */
-	if (xd->properties) {
-		tb_property_free_dir(xd->properties);
+	if (xd->remote_properties) {
+		tb_property_free_dir(xd->remote_properties);
 		update = true;
 	}
 
-	xd->properties = dir;
-	xd->property_block_gen = gen;
+	xd->remote_properties = dir;
+	xd->remote_property_block_gen = gen;
 
 	tb_xdomain_update_link_attributes(xd);
 
@@ -1180,6 +1200,15 @@ device_name_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(device_name);
 
+static ssize_t maxhopid_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct tb_xdomain *xd = container_of(dev, struct tb_xdomain, dev);
+
+	return sprintf(buf, "%d\n", xd->remote_max_hopid);
+}
+static DEVICE_ATTR_RO(maxhopid);
+
 static ssize_t vendor_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
@@ -1238,6 +1267,7 @@ static DEVICE_ATTR(tx_lanes, 0444, lanes_show, NULL);
 static struct attribute *xdomain_attrs[] = {
 	&dev_attr_device.attr,
 	&dev_attr_device_name.attr,
+	&dev_attr_maxhopid.attr,
 	&dev_attr_rx_lanes.attr,
 	&dev_attr_rx_speed.attr,
 	&dev_attr_tx_lanes.attr,
@@ -1263,7 +1293,8 @@ static void tb_xdomain_release(struct device *dev)
 
 	put_device(xd->dev.parent);
 
-	tb_property_free_dir(xd->properties);
+	kfree(xd->local_property_block);
+	tb_property_free_dir(xd->remote_properties);
 	ida_destroy(&xd->service_ids);
 
 	kfree(xd->local_uuid);
@@ -1355,6 +1386,7 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 
 	xd->tb = tb;
 	xd->route = route;
+	xd->local_max_hopid = down->config.max_in_hop_id;
 	ida_init(&xd->service_ids);
 	mutex_init(&xd->lock);
 	INIT_DELAYED_WORK(&xd->get_uuid_work, tb_xdomain_get_uuid);
@@ -1824,11 +1856,7 @@ int tb_register_property_dir(const char *key, struct tb_property_dir *dir)
 	if (ret)
 		goto err_unlock;
 
-	ret = rebuild_property_block();
-	if (ret) {
-		remove_directory(key, dir);
-		goto err_unlock;
-	}
+	xdomain_property_block_gen++;
 
 	mutex_unlock(&xdomain_lock);
 	update_all_xdomains();
@@ -1854,7 +1882,7 @@ void tb_unregister_property_dir(const char *key, struct tb_property_dir *dir)
 
 	mutex_lock(&xdomain_lock);
 	if (remove_directory(key, dir))
-		ret = rebuild_property_block();
+		xdomain_property_block_gen++;
 	mutex_unlock(&xdomain_lock);
 
 	if (!ret)
@@ -1873,7 +1901,8 @@ int tb_xdomain_init(void)
 	 * directories. Those will be added by service drivers
 	 * themselves when they are loaded.
 	 *
-	 * We also add node name later when first connection is made.
+	 * Rest of the properties are filled dynamically based on these
+	 * when the P2P connection is made.
 	 */
 	tb_property_add_immediate(xdomain_property_dir, "vendorid",
 				  PCI_VENDOR_ID_INTEL);
@@ -1887,6 +1916,5 @@ int tb_xdomain_init(void)
 
 void tb_xdomain_exit(void)
 {
-	kfree(xdomain_property_block);
 	tb_property_free_dir(xdomain_property_dir);
 }
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 003a9ad29168..3e0ce654d60c 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -180,6 +180,8 @@ void tb_unregister_property_dir(const char *key, struct tb_property_dir *dir);
  * @route: Route string the other domain can be reached
  * @vendor: Vendor ID of the remote domain
  * @device: Device ID of the demote domain
+ * @local_max_hopid: Maximum input HopID of this host
+ * @remote_max_hopid: Maximum input HopID of the remote host
  * @lock: Lock to serialize access to the following fields of this structure
  * @vendor_name: Name of the vendor (or %NULL if not known)
  * @device_name: Name of the device (or %NULL if not known)
@@ -193,9 +195,11 @@ void tb_unregister_property_dir(const char *key, struct tb_property_dir *dir);
  * @receive_path: HopID which we expect the remote end to transmit
  * @receive_ring: Local ring (hop) where incoming packets arrive
  * @service_ids: Used to generate IDs for the services
- * @properties: Properties exported by the remote domain
- * @property_block_gen: Generation of @properties
- * @properties_lock: Lock protecting @properties.
+ * @local_property_block: Local block of properties
+ * @local_property_block_gen: Generation of @local_property_block
+ * @local_property_block_len: Length of the @local_property_block in dwords
+ * @remote_properties: Properties exported by the remote domain
+ * @remote_property_block_gen: Generation of @remote_properties
  * @get_uuid_work: Work used to retrieve @remote_uuid
  * @uuid_retries: Number of times left @remote_uuid is requested before
  *		  giving up
@@ -225,6 +229,8 @@ struct tb_xdomain {
 	u64 route;
 	u16 vendor;
 	u16 device;
+	unsigned int local_max_hopid;
+	unsigned int remote_max_hopid;
 	struct mutex lock;
 	const char *vendor_name;
 	const char *device_name;
@@ -237,8 +243,11 @@ struct tb_xdomain {
 	u16 receive_path;
 	u16 receive_ring;
 	struct ida service_ids;
-	struct tb_property_dir *properties;
-	u32 property_block_gen;
+	u32 *local_property_block;
+	u32 local_property_block_gen;
+	u32 local_property_block_len;
+	struct tb_property_dir *remote_properties;
+	u32 remote_property_block_gen;
 	struct delayed_work get_uuid_work;
 	int uuid_retries;
 	struct delayed_work get_properties_work;
-- 
2.30.1

