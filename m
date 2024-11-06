Return-Path: <linux-usb+bounces-17217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C499BE97D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 13:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486CE1F23EBA
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 12:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2356F1DFE12;
	Wed,  6 Nov 2024 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGXIhO3V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1291DFD90
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730896484; cv=none; b=IT9Ab55FKL4LZmKu4gOSPbFXWOj1kXh6CnD+08YsPhykgxMhDvi3YIThb8O4F2YPzqD1o0xzH5b/P6wqarEb/k+XW1nA79dI1Rhu041GzRX1DcrcuO7WFc9gIQ+hyDmvv3b1lVv6NcHMLqFOPhUdkXJMKbROP6pJlhNv1PF4UqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730896484; c=relaxed/simple;
	bh=Wj8ynEqftScmjq5jRn5C6iWEcFuZteoFPDg+ntmxLoU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mCQN0ShwGWwrg0iMlIFFuL4H6MQldGT441+jXPCmb95H5597xxneR8/fW8xahnnRRvC6FUY/TeEtWUCYx51pkgpqwkTZRVfcAxPQd1sDI77Ls943Y/cO/oXiSsjXS8Go6B6jva1LCItW4wQhXnHUaDg3b79+CZeFKnaHu9TCQ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGXIhO3V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730896483; x=1762432483;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wj8ynEqftScmjq5jRn5C6iWEcFuZteoFPDg+ntmxLoU=;
  b=JGXIhO3VsvO8GYQvqLprqkAh0x7oKrruaWV0/LRIGC6xgFSJ5892tdi/
   UJ/gRHfH73taiHiORk2WY7UFSXs3F17zqq7nyrNAxg2m+lwR4nHx7Bm0z
   SMq7y5ljlUjfr16T5fWAAC0gbX8xkLP5ZGH0v/SapqykfeAzA57o2F+OQ
   ekPdlNuNTRn61MG/fH52wjJKmwvVVeFTST2PUd+7F4KDs1mjv+pjHqD3A
   8nXMUxBJwmXdegjespoHZcNb+A30ghSjJYjYn5PyY8Vh3OFA3gINHVAif
   oiaddhuKaqSENgzpp+1x1pfmNpGRLR0sePBciJoCNHbBSMKe1mhFwrnWn
   Q==;
X-CSE-ConnectionGUID: 7PGtWZCQTfmtucr92DLG0Q==
X-CSE-MsgGUID: v56Y/TFfREKariOMMkOtWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42071818"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42071818"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:34:42 -0800
X-CSE-ConnectionGUID: JHMH4+JJS0WbyhQCSLRPZw==
X-CSE-MsgGUID: IBhOQy7zQX+c3hqzLSlJtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84061815"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:34:41 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 1/3] usb: misc: ljca: move usb_autopm_put_interface() after wait for response
Date: Wed,  6 Nov 2024 13:34:36 +0100
Message-Id: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not mark interface as ready to suspend when we are still waiting
for response messages from the device.

Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
Cc: stable@vger.kernel.org
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/usb/misc/usb-ljca.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 01ceafc4ab78..8056c65e4548 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -332,14 +332,11 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
 
 	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
 			   msg_len, &transferred, LJCA_WRITE_TIMEOUT_MS);
-
-	usb_autopm_put_interface(adap->intf);
-
 	if (ret < 0)
-		goto out;
+		goto out_put;
 	if (transferred != msg_len) {
 		ret = -EIO;
-		goto out;
+		goto out_put;
 	}
 
 	if (ack) {
@@ -347,11 +344,14 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
 						  timeout);
 		if (!ret) {
 			ret = -ETIMEDOUT;
-			goto out;
+			goto out_put;
 		}
 	}
 	ret = adap->actual_length;
 
+out_put:
+	usb_autopm_put_interface(adap->intf);
+
 out:
 	spin_lock_irqsave(&adap->lock, flags);
 	adap->ex_buf = NULL;
-- 
2.34.1


