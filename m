Return-Path: <linux-usb+bounces-1020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F349A7B65B1
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id A59CC282210
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728AF1BDF5;
	Tue,  3 Oct 2023 09:40:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DFD1D548
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B1BB7
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326016; x=1727862016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fzA/QajefGoOsg98Zej9OffyVaWiw+EiqR51xZ77OTo=;
  b=a33lmfEjMIshysfSsn47Cwri46w7+Y8SZWmMlvBvPmN/Ma4TxyxIRHwz
   BSVMm+v/jsg/k8BSfTMmh6rRyb4w1uxl4lOTeu4R7L64XTW/UYsm1VqjZ
   zq798tuT0nPLBY/+HqTpUKFc5oVd8jnarZnO3d96pDOstSN25PmI+RCxd
   pCg3ngBO5UNIOX9W7EBPw8jMWZXC6Ip7CFr6MLKAhmuEQ51j0UpBOISY2
   pZWhNr+J100Kn4SA57IolFWzx8kQeL7rod7QtIDJtSvoN5R91/08UesTR
   OHkV9xOKG1GjTTLClZD7Zcyl3PDdDAaj5vgzuO1aNMTQ8JSen2FQYCRBH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362204864"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="362204864"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="727558517"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="727558517"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DBC8518DE; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 13/13] thunderbolt: Add DP IN added last in the head of the list of DP resources
Date: Tue,  3 Oct 2023 12:40:05 +0300
Message-Id: <20231003094005.2676823-14-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Gil Fine <gil.fine@linux.intel.com>

If DP IN on device router exist, position it at the beginning of the DP
resources list, so that it is used before DP IN on host router. This way
external GPU will be prioritized when pairing DP IN and DP OUT for
DisplayPort tunnel setup.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 238156358849..4d957e1f2c7a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -190,7 +190,7 @@ static void tb_add_dp_resources(struct tb_switch *sw)
 		if (!tb_switch_query_dp_resource(sw, port))
 			continue;
 
-		list_add_tail(&port->list, &tcm->dp_resources);
+		list_add(&port->list, &tcm->dp_resources);
 		tb_port_dbg(port, "DP IN resource available\n");
 	}
 }
-- 
2.40.1


