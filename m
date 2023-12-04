Return-Path: <linux-usb+bounces-3654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD324803095
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E4A280FFD
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F83E2233E;
	Mon,  4 Dec 2023 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjOteVXV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F89E6
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686317; x=1733222317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=naIQkVDqBOFmYKcMnnwGT3WOCdW4ZZF8Y3zHbaDkIrE=;
  b=YjOteVXVvW9GRnJOjoteOGnC8Y46AmK1PpTYj7BaTQapR26YZjPbXlT3
   OIdzO88UTf4vea25DnAZYygQGZ6RTlwFULtx1l+Q2oKsr6RwSNaKU8wzQ
   Saq7/9lcY3hwhNHw3A6fO9sBuq95PMZSF1RzSKedcPNDYw6hMput+oTLQ
   zWVKs9LAkBjJToVaagVK6kZH8E0+uaUintEQT2ABlozNP5MpPb79tqxSE
   ZxGhPAp8iBKMPwoptFCz8qBA/SnbwRpP+iP9SLuAnwoJfjyfOiT16vQxS
   pC4hziisSB5DRtjMXXcEwbPukyYEfsgYcayRNj1cLEUhqvrhzEcpcZpBb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="424880791"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="424880791"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763904032"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="763904032"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 02:38:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id ACDB1A7D; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
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
Subject: [PATCH 08/11] thunderbolt: Improve logging when DisplayPort resource is added due to hotplug
Date: Mon,  4 Dec 2023 12:38:25 +0200
Message-ID: <20231204103828.1635531-9-mika.westerberg@linux.intel.com>
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

To allow us differentiate how DisplayPort resource is added to the
DisplayPort resources list make the debug log to append "hotplug" when
this was due to an actual hotplug.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 1308f7872f97..0a32e7ec4dc0 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1913,7 +1913,7 @@ static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
 			return;
 	}
 
-	tb_port_dbg(port, "DP %s resource available\n",
+	tb_port_dbg(port, "DP %s resource available after hotplug\n",
 		    tb_port_is_dpin(port) ? "IN" : "OUT");
 	list_add_tail(&port->list, &tcm->dp_resources);
 
-- 
2.42.0


