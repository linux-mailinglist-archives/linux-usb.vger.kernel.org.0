Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 467CF523FE7
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348457AbiEKWDt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348430AbiEKWDs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:48 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEADBE3B
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306627; x=1683842627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oJSqMfpLpc6oA8C+i3h0PJgXNgUNPcDJ++6lg91E7L0=;
  b=eBjjHCrtePLWgq+3c0XTH5EDeoH2/+J7M4rwX7VhkRtOxdyYxPpeweEP
   cPJjMtnPcEOzh49JIXwk2Ym1Pu8BbNIJlxWgN3EZtoQ57w0Z6Sqwolp9F
   BEUmEdMrbAK2wZkgL83fgX2IBVWMuMPs/oowsZOTQQzenZkdpcV61Zn9+
   Znp3fwh6rl+8skd9nkIzadjbo2RLU395mVTkuVNjQ3XHc8KVuNWftvaOT
   ymHH93FAV0pImqwafrsJn5DCwGJihXSuneP7SkDgE8JYkRVLZZNet0qh+
   IMO5n32s1bCyGqGLygaMSuGa6MNOb6c7H2OUIbBulzeJeDtebHQslvgAc
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427454"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427454"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496236"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:45 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/9] usb: host: xhci-plat: omit shared hcd if either root hub has no ports
Date:   Thu, 12 May 2022 01:04:46 +0300
Message-Id: <20220511220450.85367-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
References: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>

Activate the just added extension for xhci-plat and omit the shared
hcd if either of the root hubs has no ports.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c512ec2148ae..044855818cb1 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -245,6 +245,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	xhci = hcd_to_xhci(hcd);
 
+	xhci->allow_single_roothub = 1;
+
 	/*
 	 * Not all platforms have clks so it is not an error if the
 	 * clock do not exist.
-- 
2.25.1

