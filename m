Return-Path: <linux-usb+bounces-17456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A82909C503A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 09:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18F4FB22451
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 07:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC9920B212;
	Tue, 12 Nov 2024 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GT8AvXFM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EAF20B1FD
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731398147; cv=none; b=jckWL0CSjeu7pbTe5GENRvVolMtdJwnfc3H4OW+n5dJqHbNL6xXTAVBMmGbOnDWVrUG4rK+f9iMjm/hlfSgL8dL7YutTOZK99joq6FxvJoU7se2OhvM+dHf7qivnA8/6YgTGPAOqZf7Dkaa0MKfj8sul8TzbfJnkilqCXZL8NJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731398147; c=relaxed/simple;
	bh=RDhleBrsFBrHe9APLakRu2zYjwhLAEuSM7P9rH/TNm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z6Z38dUwXTeJhVVYacRmPwzmRVddKp9SebqBrK9H5A2wxqZAOvRbKYiXO+MuRTRhg4hGCAKaVJclK9h7mhUyaY66DIhTwhnqcj/zXcJI5rULwskEAbQGscL+uzBwk4Z1LPoN+awFVWdyJrH7dwn4spW1zBvcQEe6Bp6/Soa9vdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GT8AvXFM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731398146; x=1762934146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RDhleBrsFBrHe9APLakRu2zYjwhLAEuSM7P9rH/TNm4=;
  b=GT8AvXFMikVlSG9MwxIoStbHSWJPtFDE8m47qdq2ypRbVo2q1pS9R0hv
   gDbPYNIYrD7oUKsbdMR03JswQxAmnTPc/kntpyoz0Ji9snFWj4K2xdC8F
   J5+Iy8O6cgV7eUmLYxhd990J9z0g8ijrEXMT01TvI83FQxNHuSdkb/LNp
   5Rn4Np8erLtkuZgDCjdbGr8eOHjF78FRYaaXlVMCNONKuw6j65Oy2Jt0e
   x+aSQYBncCGOsvcpBG+v5MDLBtyOdwJj99xjlPJDP43v1QLMjmzK4WuMl
   /MTtL/Qf2d4JiSoRXylOl/nb3LVq3byYjrYfnVEgrX/4QKmJZN7OkgnJ7
   A==;
X-CSE-ConnectionGUID: gUHiPw1WQv++gK1+E2h2jQ==
X-CSE-MsgGUID: nCNrRrWmTYa59M7qLUaurg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31092759"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="31092759"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:55:45 -0800
X-CSE-ConnectionGUID: JyYEpu4IRQibmV+hwatwDg==
X-CSE-MsgGUID: hK5AYeOhRXWWzBJ7HmmnMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87215394"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:55:28 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 3/3] usb: misc: ljca: add firmware version sysfs attribute
Date: Tue, 12 Nov 2024 08:55:14 +0100
Message-Id: <20241112075514.680712-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
References: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For diagnostics purpose read firmware version during probe and add
sysfs attribute to make that information available.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v3->v4: use sysfs attribute to provide firmware version,
	drop tags from Hans since the code changed
v2->v3: use dev_dbg() for printing the firmware version
v1->v2: fix 80-chars line wrap

 .../ABI/testing/sysfs-bus-usb-devices-ljca    |  9 ++++
 drivers/usb/misc/usb-ljca.c                   | 53 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca

diff --git a/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
new file mode 100644
index 000000000000..f5eb38bf99a8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
@@ -0,0 +1,9 @@
+What:		/sys/bus/usb/devices/.../ljca_version
+Date:		November 2024
+KernelVersion:	6.13
+Contact:	Sakari Ailus <sakari.ailus@linux.intel.com>
+Description:
+		Provides the firmware version of LJCA device.
+		The format is Major.Minor.Patch.Build, where
+		Major, Minor, Patch, and Build are decimal numbers.
+		For example: 1.0.0.256
diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index d9c21f783055..4b5bd5b27b2a 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -43,6 +43,7 @@ enum ljca_client_type {
 
 /* MNG client commands */
 enum ljca_mng_cmd {
+	LJCA_MNG_GET_VERSION = 1,
 	LJCA_MNG_RESET = 2,
 	LJCA_MNG_ENUM_GPIO = 4,
 	LJCA_MNG_ENUM_I2C = 5,
@@ -68,6 +69,13 @@ struct ljca_msg {
 	u8 data[] __counted_by(len);
 } __packed;
 
+struct ljca_fw_version {
+	u8 major;
+	u8 minor;
+	__le16 patch;
+	__le16 build;
+} __packed;
+
 struct ljca_i2c_ctr_info {
 	u8 id;
 	u8 capacity;
@@ -152,8 +160,10 @@ struct ljca_adapter {
 	struct mutex mutex;
 
 	struct list_head client_list;
+	struct ljca_fw_version fw_version;
 
 	bool disconnect;
+	bool fw_version_valid;
 
 	u32 reset_id;
 };
@@ -740,6 +750,24 @@ static int ljca_enumerate_clients(struct ljca_adapter *adap)
 	return ret;
 }
 
+static void ljca_read_fw_version(struct ljca_adapter *adap)
+{
+	struct ljca_fw_version version;
+	int ret;
+
+	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_GET_VERSION, NULL, 0,
+			(u8 *)&version, sizeof(version), true,
+			LJCA_WRITE_ACK_TIMEOUT_MS);
+
+	if (ret != sizeof(version)) {
+		dev_err(adap->dev, "Get version failed, ret: %d\n", ret);
+		return;
+	}
+
+	adap->fw_version = version;
+	adap->fw_version_valid = true;
+}
+
 static int ljca_probe(struct usb_interface *interface,
 		      const struct usb_device_id *id)
 {
@@ -811,6 +839,8 @@ static int ljca_probe(struct usb_interface *interface,
 	if (ret)
 		goto err_free;
 
+	ljca_read_fw_version(adap);
+
 	/*
 	 * This works around problems with ov2740 initialization on some
 	 * Lenovo platforms. The autosuspend delay, has to be smaller than
@@ -874,6 +904,28 @@ static int ljca_resume(struct usb_interface *interface)
 	return usb_submit_urb(adap->rx_urb, GFP_KERNEL);
 }
 
+static ssize_t ljca_version_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct ljca_adapter *adap = usb_get_intfdata(intf);
+	struct ljca_fw_version ver = adap->fw_version;
+
+	if (!adap->fw_version_valid)
+		return -ENODATA;
+
+	return sysfs_emit(buf, "%d.%d.%d.%d\n", ver.major, ver.minor,
+			  le16_to_cpu(ver.patch), le16_to_cpu(ver.build));
+}
+
+static DEVICE_ATTR_RO(ljca_version);
+
+static struct attribute *ljca_attrs[] = {
+	&dev_attr_ljca_version.attr,
+};
+
+ATTRIBUTE_GROUPS(ljca);
+
 static const struct usb_device_id ljca_table[] = {
 	{ USB_DEVICE(0x8086, 0x0b63) },
 	{ /* sentinel */ }
@@ -888,6 +940,7 @@ static struct usb_driver ljca_driver = {
 	.suspend = ljca_suspend,
 	.resume = ljca_resume,
 	.supports_autosuspend = 1,
+	.dev_groups = ljca_groups,
 };
 module_usb_driver(ljca_driver);
 
-- 
2.34.1


