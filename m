Return-Path: <linux-usb+bounces-3088-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 881937F2BFF
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 12:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B40281794
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 11:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A23487AA;
	Tue, 21 Nov 2023 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1h248p5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9FB100
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 03:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700567218; x=1732103218;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bvV7C40MlcxRq7/S6J5qRKcWppKUHTa67+HaaIdoT54=;
  b=D1h248p5umr9vyk00bNLGe5bxMDLjai/JoKhVsngkBG7ccF4l0GxKEUw
   B4rK7dMQeQOpvbOB8VM4DwGl8UbI3lEIGZPD0kp+YjAWDopU/jIwWWR6v
   zGvVd5pGfEWnbt0X1SeljWZOtQfkBpCnHXrpOJWMPhgtd/9qwg4o/4Smq
   6YpYxXjFaKM3jTsLHHvg2321mbgRgabkqaWwFGpzxjfpbxPDkeNrjPWRF
   meKew7UbbanPgu9U19bUdwSocUUSXH1/dPzo+5efurz2k3iyOSzuNO1qx
   XZdcWbkvxXrDKiLPzBtkWREdmnpQwY+AaGzLKVIZeOxJYpCVs0ca5ru/x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="456159795"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="456159795"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 03:46:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="910424762"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="910424762"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2023 03:46:48 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abdel Alkuor <abdelalkuor@geotab.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: tipd: Supply also I2C driver data
Date: Tue, 21 Nov 2023 13:46:47 +0200
Message-ID: <20231121114647.2005011-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If there is no fwnode, device_get_match_data() does not
return anything making the probe to always fail. Using
i2c_get_match_data() when there is no fwnode to fix that.

Fixes: 5bd4853da049 ("USB: typec: tps6598x: Add device data to of_device_id")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/tipd/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 0e867f531d34..fbb649c7d30e 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1226,7 +1226,10 @@ static int tps6598x_probe(struct i2c_client *client)
 			TPS_REG_INT_PLUG_EVENT;
 	}
 
-	tps->data = device_get_match_data(tps->dev);
+	if (dev_fwnode(tps->dev))
+		tps->data = device_get_match_data(tps->dev);
+	else
+		tps->data = i2c_get_match_data(client);
 	if (!tps->data)
 		return -EINVAL;
 
@@ -1425,7 +1428,7 @@ static const struct of_device_id tps6598x_of_match[] = {
 MODULE_DEVICE_TABLE(of, tps6598x_of_match);
 
 static const struct i2c_device_id tps6598x_id[] = {
-	{ "tps6598x" },
+	{ "tps6598x", (kernel_ulong_t)&tps6598x_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tps6598x_id);
-- 
2.42.0


