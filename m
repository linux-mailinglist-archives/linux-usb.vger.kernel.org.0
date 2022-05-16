Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCF3528100
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 11:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbiEPJry (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 05:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239105AbiEPJrq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 05:47:46 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880BA34BAD
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652694463; x=1684230463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5aBSh5NNsmM6Y+Erkw3alDpuMf7gN9xnpmUH4vMUUHg=;
  b=WUybIePvztXiVv77rIz05drcv4/yioBe3A3rdvQhkwmFaRGU27EKp4OA
   wQqqPWrrhuqTVv200JPOfwcWPclz9WZAPcUwj3zJtxM1dcK/YDxHiVAiU
   OB8FwpjUHfq9OCetAJF11wT2kTvaCvb/DqCkNMUu2NhDAhvTKhYeyofM3
   KqH2ixRw5HVl+YzAzw05DQocomaBu6GSrzV3QAg+gcMECYl+CHW8ljd+q
   WWwm/0d0jJAPMlM2lAjiMTX2S7zf0+1eIPO1HtHeZSeYt1O4+KLmaWPBC
   JOnegfaX+oD3tNhmY2D45LcPR54xOhnKGTp6GzaXMckWSLb1YI4SuEfRN
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="252854299"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="252854299"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 02:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="816313233"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga006.fm.intel.com with ESMTP; 16 May 2022 02:47:39 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/1] xhci: Don't defer primary roothub registration if there is only one roothub
Date:   Mon, 16 May 2022 12:48:50 +0300
Message-Id: <20220516094850.19788-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516094850.19788-1-mathias.nyman@linux.intel.com>
References: <20220516094850.19788-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The support for xHCI controllers with only one roothub, and the code
to defer primary roothub registation until second roothub got merged
to usb-next for 5.19 at the same time.

commit 873f323618c2 ("xhci: prepare for operation w/o shared hcd")
commit b7a4f9b5d0e4 ("xhci: Set HCD flag to defer primary roothub
registration")

These got merged in such a way that the flag to defer primary roothub
registration is set even for xHC controllers with just one roothub.

Fix this by setting the defer flag in a codepath taken only if we have
two roothubs

Fixes: 873f323618c2 ("xhci: prepare for operation w/o shared hcd")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d957eac59ab3..f0ab63138016 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -696,8 +696,6 @@ int xhci_run(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Finished %s for main hcd", __func__);
 
-	set_bit(HCD_FLAG_DEFER_RH_REGISTER, &hcd->flags);
-
 	xhci_create_dbc_dev(xhci);
 
 	xhci_debugfs_init(xhci);
@@ -705,6 +703,8 @@ int xhci_run(struct usb_hcd *hcd)
 	if (xhci_has_one_roothub(xhci))
 		return xhci_run_finished(xhci);
 
+	set_bit(HCD_FLAG_DEFER_RH_REGISTER, &hcd->flags);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_run);
-- 
2.25.1

