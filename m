Return-Path: <linux-usb+bounces-3646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AC803088
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939AE1F2122E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFC9224D0;
	Mon,  4 Dec 2023 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdIoO6he"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C859EAC
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686312; x=1733222312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g8JBvicfwDiK3ZwFe+4ka66Y2GSK0p5hbTrOQEoEDdo=;
  b=ZdIoO6heZPoyVfNBD1guUQYgayflYrUjj6eu/kYvKDz3Bvv/FphiZawW
   Yw6GR3LH+X2AXRhCnKJUAqIKY1AuxY5Ey0WAXdK0TvlFFS4yrlWNGvQrj
   83V2N5+BaBVrFhDTQDp2N0Skem/nMFgbztGfynYO8xnj/pluuEkRhgIvp
   Qid8kS7CzuHo/JzvPnSC+U/j/hTXg8DoSwmhN5Xk4cZYC/H8jjucdZEPZ
   QoXq5+yK+ZTWwLM75AlGxfi0gdL2TAhoRs6hQjLXEiSkEp75hO4wTLFWl
   8J3Pj8uyMo0K1OfGVGbKyCzsu4Gd8T6VDzpdGXUC2EFNSF7gv4P4OgZ09
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="424880764"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="424880764"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763904016"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="763904016"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 02:38:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5617C268; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
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
Subject: [PATCH 01/11] thunderbolt: Unwind TMU configuration if tb_switch_set_tmu_mode_params() fails
Date: Mon,  4 Dec 2023 12:38:18 +0200
Message-ID: <20231204103828.1635531-2-mika.westerberg@linux.intel.com>
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

Dan reported that the kernel test robot found an issue with the TMU code
namely in tb_switch_tmu_change_mode() where we should actually go back
to the previous mode in case of failure instead of just returning back
the error. Fix this by unwinding the configuration as we do with the
other error paths in this function.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202311030814.AXtCk7PO-lkp@intel.com/
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 11f2aec2a5d3..9a259c72e5a7 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -894,7 +894,7 @@ static int tb_switch_tmu_change_mode(struct tb_switch *sw)
 
 	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.mode_request);
 	if (ret)
-		return ret;
+		goto out;
 
 	/* Program the new mode and the downstream router lane adapter */
 	switch (sw->tmu.mode_request) {
-- 
2.42.0


