Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD62595A35
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 13:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbiHPLcx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 07:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234672AbiHPLch (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 07:32:37 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144104E60E
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 03:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660647103; x=1692183103;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CK4yw6jHA3yojNgAHDPn4qC/iLD3XVRLGFIbMHQCGA8=;
  b=ksvE2vGV8YVpRHux+Xz+fCjrokErVtuNzIG+NciSf6gsU7UeDREY+tpx
   tLzZ6WnFkTYdsyUObdm3PwMQTxMC+4Yn2lOA1rft7XKETQN0Sp49lI6xo
   WRGGUAQSLQtzPtmX5D6JoPeVj2z38lkhqFu6uzogg/zsxROoRjrj47QdZ
   YzuBR4peB8NzNqc3WwmrG2BQIxRx6/2dbyendIkK52JZ3gYgQY9tCweGh
   PCOVIIQ7r8/hNb/mx3+PwHUSwQzW/FZxcso82fTA9gypJuDeRCYz58JV/
   d+7dojPpzLGzTtfDFgZAlpciSkINpFmgOeH2EoI80NpFVACbdsyezyfWj
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="275240207"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="275240207"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 03:51:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="603481308"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 16 Aug 2022 03:51:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BFACD2F6; Tue, 16 Aug 2022 13:51:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        utkarsh.h.patel@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Add comment where Thunderbolt 4 PCI IDs start
Date:   Tue, 16 Aug 2022 13:51:45 +0300
Message-Id: <20220816105146.72098-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This makes it consistent with the previous generations. No functional
impact.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index cb8c9c4ae93a..8b8b5a8bd9b2 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1398,6 +1398,7 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	/* Thunderbolt 4 */
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI0),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI1),
-- 
2.35.1

