Return-Path: <linux-usb+bounces-17286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C49BFF36
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 08:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2D1283580
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 07:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3C11CC16A;
	Thu,  7 Nov 2024 07:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHKJI4dK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6C19F120
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965051; cv=none; b=jte3qqkF2RxjN5/9fqCQ6g0LHpBOWX18gRvPvSeNwQFMI8AfXarP3858JTF4hfpHt1O+u8fHOabijBgAZjKOcDJQa/yZ/C/ZJTodJZSPvYfLMWbFiUA7aNykeSRdeniYJdQLKrQImWOudEeHEykccCcFi6Ei3xLC0Pm4AtXYBfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965051; c=relaxed/simple;
	bh=kGZmf33Z4DffRLkdoRhuakHaBHAsP1JaSugPYaX8aAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pmgdUEsgOXMcnEViOmDAIEHsa/+0o2pcua/FE68LN7v0wAl2LUHwLGcCzLi4crkjDUr7zf9LyOBcxwoMifDYpX0ddZ3AG2UHAD0PrLORnmQIPxw2l1gtwuEaGNhPqwkYCtX+SsW8BHVHpFzXt+CIcQfXBNgCkLY2WWEp/fh6XwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHKJI4dK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730965050; x=1762501050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kGZmf33Z4DffRLkdoRhuakHaBHAsP1JaSugPYaX8aAU=;
  b=YHKJI4dKvI7xU8dhD17rg1PrN1AbhvMPwYJhkVK+3T1Ias5wHRI6EAFJ
   ws6ru/gb3CN9UHWhZ8+mJVDuEcvr9VT4qsCjUlJnuasYbpKb5gTuxnlm1
   vpM8YRhN6L6E2yIzF+Jub8rh+ES2zANKh93wR72a6he0SY0wHcJKRMFiO
   1sYqyKae9hJmONkTK+vmc/4UF0jB21m1VkEOWXyNnGWcNI3PsDpOpOuZe
   U5t79phNSGz3ERvenIoeqRiheTpoOc2rjqcgryVlgYnDABGoTwtPYlNyW
   BgfnzWD3riFajFinlPj88JOqyVjSXOsLzSOgDTo2W8l7FAfaqe4sKdBgs
   g==;
X-CSE-ConnectionGUID: YE3HKaV5QNOxmn53k7GQ1g==
X-CSE-MsgGUID: t8+xBacfRDmWEexR6c9XBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34490733"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34490733"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:37:30 -0800
X-CSE-ConnectionGUID: n46/zdrFQlqLYxYk6oME0w==
X-CSE-MsgGUID: baK308H9QvGwGVd9auB+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="122477435"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.36])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:37:28 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 3/3] usb: misc: ljca: print firmware version
Date: Thu,  7 Nov 2024 08:37:18 +0100
Message-Id: <20241107073718.405208-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For diagnostics purposes read firmware version from device
and print it to dmesg during initialization.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v2: 80-chars line wrap
v3: use dev_dbg for printing the firmware version

 drivers/usb/misc/usb-ljca.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index d9c21f783055..9a44acc48898 100644
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
@@ -695,6 +703,25 @@ static int ljca_reset_handshake(struct ljca_adapter *adap)
 	return 0;
 }
 
+static void ljca_print_fw_version(struct ljca_adapter *adap)
+{
+	struct ljca_fw_version version = {};
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
+	dev_dbg(adap->dev, "Firmware version: %d.%d.%d.%d\n",
+		version.major, version.minor,
+		le16_to_cpu(version.patch), le16_to_cpu(version.build));
+}
+
 static int ljca_enumerate_clients(struct ljca_adapter *adap)
 {
 	struct ljca_client *client, *next;
@@ -811,6 +838,8 @@ static int ljca_probe(struct usb_interface *interface,
 	if (ret)
 		goto err_free;
 
+	ljca_print_fw_version(adap);
+
 	/*
 	 * This works around problems with ov2740 initialization on some
 	 * Lenovo platforms. The autosuspend delay, has to be smaller than
-- 
2.34.1


