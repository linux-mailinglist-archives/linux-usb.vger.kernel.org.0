Return-Path: <linux-usb+bounces-17219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7863A9BE98C
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 13:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FAB21F2160C
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 12:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA231E0DF0;
	Wed,  6 Nov 2024 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCXvHF/W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C2C1E00B1
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730896491; cv=none; b=NvIWYbvYecTLtrYXYm2oXKRiCLaltA/D5a7dAbjCYw14U+JjxV+3fr5J8YbIVox8xTuMgKTflCYYHORLtAUXv1oPvAXxHYOz9SwzyEbPW/PaDFKRJw1e/MLPtvJKXf5Sv1u8ASdMWnIya7XuFgnotiEkKuwSpFra4RRm4/tTQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730896491; c=relaxed/simple;
	bh=ufdTnFBLz28bhLVxNkqtpDIXx6I/eqxQe0s9Vzy7oSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ifhSjFi3Aa7dsEjS3Mp68qkqqtSEfsZWoI92s8lbUkkrMjnKYMMR2Y25lMz1vtTqWJhl6FJn8fDlON9ERRqfnttCIV8CwNhKSvPtu/5OR1Bvzm6Gesmi9tqy070XITwP++dtc2TS9jEJDLyj0YHFTnZYsB3UOzZgbolriSZagXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCXvHF/W; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730896490; x=1762432490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ufdTnFBLz28bhLVxNkqtpDIXx6I/eqxQe0s9Vzy7oSQ=;
  b=GCXvHF/WfuYrCSFWou8gM96ydMtLZ9tWhnq+JBjWsNI9wOIAoAYS6Zjn
   oLf1AVkWmQ+IKnWOOA57zNNp9eo1ouNTx2cC2nk5AN21HGPT6kuOAygdD
   k3pmDHc16lqljFIayv7OhtQoLbAUVUFuMBYtLOlQPLY66kL4MixYDIwev
   g0RI7jaeKILuA8QJi1U0NG3RG6njVgayIJoEf16+Ped8jt6sSuzJgYLN9
   swydN9MZ2hkjoNJqlGejWBIE6SYC1H/6p5v1YWK41+ucUo/4UU03SYor0
   FybuhuKKjVOWUsYM30J8fT2UITq0cP+eoxYnsetvJR2K/aw3mr7mQvPdB
   A==;
X-CSE-ConnectionGUID: +IAoBrMeQUSXKKVxj7SEhw==
X-CSE-MsgGUID: ahPDXwVjSoC2bB7BqSZZuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42071832"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42071832"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:34:49 -0800
X-CSE-ConnectionGUID: kGEjZbhKTy++0rMgM2Vqgg==
X-CSE-MsgGUID: AyxAEU7JSpWk6xDhGour6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84061839"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:34:48 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 3/3] usb: misc: ljca: print firmware version
Date: Wed,  6 Nov 2024 13:34:38 +0100
Message-Id: <20241106123438.337117-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
References: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
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
 drivers/usb/misc/usb-ljca.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index d9c21f783055..e698a1075a40 100644
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
+	dev_info(adap->dev, "Firmware version: %d.%d.%d.%d\n",
+		 version.major, version.minor,
+		 le16_to_cpu(version.patch), le16_to_cpu(version.build));
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


