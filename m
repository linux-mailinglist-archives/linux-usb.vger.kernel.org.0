Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE7C4FBCAE
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 15:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346321AbiDKNDP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 09:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346331AbiDKNDM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 09:03:12 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE171BEAB
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649682057; x=1681218057;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GEb4tiamGofVY4xPXxg4RpuXf0QK2/hb7uAd9n4xN+Q=;
  b=Ipns+Xe9sVNhlE60ZhppJlNdUJVxHebS1Pncu6NiwCozbZ3uw+pnymfv
   C1pcLcUZWfYztoM9IFjZ4+pCPoKl+Rm4JDZj9IEFfVF5DmaYjgWDDdtSM
   l9JPaopoFOKKAju8mwnTZBXBxEfAJikWzBWD2xYpRtTsos22/uc+mN+Gl
   VmzAQZUCIgcnLoRKZxW/lvk0Pr+6qHoNXahg/wK3KbVQwYIMoUM4xtB9f
   oI8zODYates8d6lek8q7AJO5lzNg3ygEhmX0DT0HpDOWLvBIRhbtEM0QE
   ztlJInmnJN9s70ODiSSPA55EdHraM08AzEYFozXhMuUVZHMlmy8VhZDIj
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="242695525"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="242695525"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 06:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="558889995"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 11 Apr 2022 06:00:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4F6DA18E; Mon, 11 Apr 2022 16:00:49 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Brad Campbell <lists2009@fnarfbargle.com>
Subject: [PATCH 1/4] thunderbolt: Fix typo in comment
Date:   Mon, 11 Apr 2022 16:00:46 +0300
Message-Id: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Should be 'in' instead of 'bin'. Fix it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 4a582183f675..6221ca4ea287 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1207,7 +1207,7 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	nhi->pdev = pdev;
 	nhi->ops = (const struct tb_nhi_ops *)id->driver_data;
-	/* cannot fail - table is allocated bin pcim_iomap_regions */
+	/* cannot fail - table is allocated in pcim_iomap_regions */
 	nhi->iobase = pcim_iomap_table(pdev)[0];
 	nhi->hop_count = ioread32(nhi->iobase + REG_HOP_COUNT) & 0x3ff;
 	dev_dbg(&pdev->dev, "total paths: %d\n", nhi->hop_count);
-- 
2.35.1

