Return-Path: <linux-usb+bounces-3648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8911A80308B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B95151C20A51
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7EC224FB;
	Mon,  4 Dec 2023 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2hA6uGi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7FFC3
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686314; x=1733222314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kyk42/sYDXNIFXM27h5eHjUXg2sb3xQOMwTMoOLdphA=;
  b=f2hA6uGiappG7aaxpom5MdY/ez3ao8ypdZqQ+C/lGUjpid+rrTwLWlmu
   owfZPuBdYM9Z7ueoabERa/5y/IemeNQ8HFUXv6FPKQamNPZB/bXxdkZre
   syRlNUwZ3CLuwdIjZHe2Risxzr79MFOtny3jNw/u7UZPX4z4zpnxQ8HFq
   oMV+DY67aDBQf9iAtZ/FeLwjWUhrwYvt1EACqbGGvlH0a4XqXX9NqKZKp
   348tQv5xHxrXKYyD49TiZw5DL/XUmNKVBv4HejAZrdDX/DVfVQjpdS4bn
   V/oioFB+LrP0Z7yrw4c9fu5PJrjYiGAzS5CxChDNT4pcrIM8CACrUWBal
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384116741"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="384116741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="804861259"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="804861259"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Dec 2023 02:38:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7666B72F; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/11] thunderbolt: Log XDomain link speed and width
Date: Mon,  4 Dec 2023 12:38:21 +0200
Message-ID: <20231204103828.1635531-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
References: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

In the same way we do for routers. This is useful for debugging
purposes.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 0a885ee5788d..9495742913d5 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1462,6 +1462,11 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 				tb_port_disable(port->dual_link_port);
 		}
 
+		dev_dbg(&xd->dev, "current link speed %u.0 Gb/s\n",
+			xd->link_speed);
+		dev_dbg(&xd->dev, "current link width %s\n",
+			tb_width_name(xd->link_width));
+
 		if (device_add(&xd->dev)) {
 			dev_err(&xd->dev, "failed to add XDomain device\n");
 			return -ENODEV;
-- 
2.42.0


