Return-Path: <linux-usb+bounces-17111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E69BCA78
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 11:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25574B21AAC
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 10:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40371C7609;
	Tue,  5 Nov 2024 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNP+zWdv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421561D14EC
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802726; cv=none; b=tIFkBOoFZwVzpuWPc64DPsTkZhr7fyO6yMbNtIg+0G0wBJcvZxd5Gft0gpbhybrZvQh+VlZCBYecmBci8GoP39xobUfTNw2tMYm7zrk31kG7p07EhkuBQEqRAqBz8Cp+0ZMCjZUDa80lYVDJeuPw69L0LspIQZjKtqfZEHMvabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802726; c=relaxed/simple;
	bh=7vCxNX5CQAe9D1tDIJNhvGWOF6HU5Kdtv7rIt0sDmEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPNhk1xDJqpioFd9UmoUh0dp6jvh9wMrMBj0+inyQlOm0EJ+A+zsTB++Gb+Eez8IfKpnsbjDYw9GvHnaTQpsZ7Z5ixzyRcBaOnFYj7/ljRGEXgX2Yc0xnDtR/l1/G7lK8oVmzpTftnAjsl3hOj12tw2lAQtMqPrn9TcuRLRYPiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNP+zWdv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730802724; x=1762338724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7vCxNX5CQAe9D1tDIJNhvGWOF6HU5Kdtv7rIt0sDmEg=;
  b=eNP+zWdvzqrCtyq0KZCEwB7rWcUQHi25rbGa+tzdbCgByfZ4gMbLRX7l
   luHHn+05pQlFZv0xua6xuianb3Itov6RmME05itxy08VMbVzcFWpLHb/9
   TdpiHwYCeA8VpwhoJChV4jJNWBpo/waq2d8CADOhOur9Y5IRFNS307k5H
   YTbpc8JnwEqpJ8e+Av1c1vfiHX0jC6VeX37dvzIKdRHXH89/VKkGidgy3
   8zS3F36btEbpNs5bsnEITgd+r9quFQn5h8cuNUoDwVEptaN5d0XFekrfF
   eerBWBKHnzrhuTozCdHhl+t59IWu2otBNAdqtx89UrOTJXdTUlcv6NCaC
   A==;
X-CSE-ConnectionGUID: fL8kI+2SSxuKyJhvFKItxg==
X-CSE-MsgGUID: qVuoc1I2TT21uleTMsxZ7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41644129"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41644129"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:32:03 -0800
X-CSE-ConnectionGUID: AJJ7nDPFThaeyo77SBENmQ==
X-CSE-MsgGUID: J52xlbSYR6GHtKV5jjRsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83621394"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2024 02:31:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 413B41E0; Tue, 05 Nov 2024 12:31:58 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sanath.S@amd.com,
	christian@heusel.eu,
	fabian@fstab.de,
	gregkh@linuxfoundation.org,
	regressions@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2] thunderbolt: Fix connection issue with Pluggable UD-4VPD dock
Date: Tue,  5 Nov 2024 12:31:57 +0200
Message-ID: <20241105103157.526823-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rick reported that his Pluggable USB4 dock does not work anymore after
upgrading to v6.10 kernel.

It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
access polling delay") makes the device router enumeration happen later
than what might be expected by the dock (although there is no such limit
in the USB4 spec) which probably makes it assume there is something
wrong with the high-speed link and reset it. After the link is reset the
same issue happens again and again.

For this reason lower the sideband access delay from 5ms to 1ms. This
seems to work fine according to Rick's testing.

Reported-by: Rick Lahaye <rick@581238.xyz>
Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
Tested-by: Rick Lahaye <rick@581238.xyz>
Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
v1: https://lore.kernel.org/linux-usb/20241105085301.524312-1-mika.westerberg@linux.intel.com/

Changes from v1:
  *  Reword the commit message to use mainline kernel version (v6.10)
     instead.

 drivers/thunderbolt/usb4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 0a9b4aeb3fa1..402fdf8b1cde 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -48,7 +48,7 @@ enum usb4_ba_index {
 
 /* Delays in us used with usb4_port_wait_for_bit() */
 #define USB4_PORT_DELAY			50
-#define USB4_PORT_SB_DELAY		5000
+#define USB4_PORT_SB_DELAY		1000
 
 static int usb4_native_switch_op(struct tb_switch *sw, u16 opcode,
 				 u32 *metadata, u8 *status,
-- 
2.45.2


