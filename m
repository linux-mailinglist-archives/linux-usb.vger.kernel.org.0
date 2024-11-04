Return-Path: <linux-usb+bounces-17005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCD9BAE90
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB5CD1F20F23
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 08:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B151ABEA5;
	Mon,  4 Nov 2024 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eetZvepl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4932D1AB6FA
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 08:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710268; cv=none; b=SqE23fO6ujd/o0/nypYapMQIeXkZlD9FiVhCP9od6ZxI8FBvYS7n0YffCKhQSoJ0z+WBB4M1n+EPAEIpwl5C42NJ7wJlD3PIUn33/g/M1AAbrIryEdl3pnMjJAKgpv1WFiCgF/ghTgvsXB3Wkr5+LeZyIGv8NXzFd1aBApTp2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710268; c=relaxed/simple;
	bh=A91MbdDS+1kabBRq7Ccz+n2IfT7FWdueW/mL96uoEAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GLfsOpajR5fS+zAqvxradgxF8VWmTmqt+CKUMSVEb2vo2YvCQkM6/SCaeGbKMCcz8qRJyegREl0p+hV08OA7cUTAcViS24xqBynhARR+STwMocSbN6ulYjuEsw7Uy0WfeKamfS/5Crg97hHMhchmELewsvcOhDW6/gQAHS6MsNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eetZvepl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730710267; x=1762246267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A91MbdDS+1kabBRq7Ccz+n2IfT7FWdueW/mL96uoEAs=;
  b=eetZveplIhWF2WQYLTBFM2AH4KmTQtsPxIAmUO93RZSwCtbyfyt4nvLd
   sr1Nf1lRVBn0UK0U1+U1hYDzhQ1B6GMCHCjPeqq++1HfdJhDFsu/btpjK
   2p4nLX/Fx9UHnRi2IE1kV3EXwPoJUCjFn3mHqKIG5yLwjcd0gHdDIdvIg
   H0BF6Yin8R8HiNNL2KuSE0Bz2dX8g+6X9xIt157JaaiWq/y6diI4U9v0z
   szBm1IJkD+CQTTqGGtB9oWyhfMpK8HcLZlZ5rn4HOcZ1XlgWDmEJ34Glg
   EKlzzaJ1yNsmXGvWtI1hpg6pJthnOleeKQQkYnX0zxoXU6mpE4zwiHOP0
   Q==;
X-CSE-ConnectionGUID: cfA9gpw5Qz6fekAIBLU5+g==
X-CSE-MsgGUID: UTAK2WnwRmaBPZGtYQOnrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30343064"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30343064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:51:07 -0800
X-CSE-ConnectionGUID: lXiLAGw1R1aqbWXHZbJYRQ==
X-CSE-MsgGUID: Vb+JW7P3QSSoBFCN6pPx9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88097832"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:51:06 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 3/3] usb: misc: ljca: print firmware version
Date: Mon,  4 Nov 2024 09:50:56 +0100
Message-Id: <20241104085056.652294-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For diagnostics purposes read firmware version from device
and print it to dmesg during initialization.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/usb/misc/usb-ljca.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 062b7fb47114..0f8751c51bf6 100644
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
@@ -694,6 +702,24 @@ static int ljca_reset_handshake(struct ljca_adapter *adap)
 	return 0;
 }
 
+static void ljca_print_fw_version(struct ljca_adapter *adap)
+{
+	struct ljca_fw_version version = {};
+	int ret;
+
+	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_GET_VERSION, NULL, 0,
+			(u8 *)&version, sizeof(version), true, LJCA_WRITE_ACK_TIMEOUT_MS);
+
+	if (ret != sizeof(version)) {
+		dev_err(adap->dev, "Get version failed, ret: %d\n", ret);
+		return;
+	}
+
+	dev_info(adap->dev, "Firmware version: %d.%d.%d.%d\n",
+		 version.major, version.minor,
+		 le16_to_cpu(version.patch), le16_to_cpu(version.build));
+}
+
 static int ljca_enumerate_clients(struct ljca_adapter *adap)
 {
 	struct ljca_client *client, *next;
@@ -810,6 +836,8 @@ static int ljca_probe(struct usb_interface *interface,
 	if (ret)
 		goto err_free;
 
+	ljca_print_fw_version(adap);
+
 	pm_runtime_set_autosuspend_delay(&usb_dev->dev, 10);
 	usb_enable_autosuspend(usb_dev);
 
-- 
2.34.1


