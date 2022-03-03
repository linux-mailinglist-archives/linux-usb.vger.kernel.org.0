Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145644CBB4D
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 11:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbiCCK0X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 05:26:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbiCCK0W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 05:26:22 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DADC179A1B
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 02:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303137; x=1677839137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iQ/YV/TqRG9910eZ3a/U/TfxeBZRExu8F6yQfLablsg=;
  b=AWHRAOJjTMNNT25lHwC+VDR+RZRzeXu0cLMk7Vgb1jIP/o0rgSeymAQL
   aD/he4SIcU06IALVGDSbbXtasFh9o+z5V7H9MMCaoqBEY9yx/NgDi1Ho/
   Gky6jeEg2YTAYOUM5JsT0SBqlU1fDG9H5ZKrhU5pjzu5Q73JoIvqIhWTa
   1O2iGdjgx+Wi+KYvV+IsAAPxX/tMBmcAZ3UFdJE4PNHXlhjb278BKPZMN
   r2jHv/U+WnVI0p17XLVJqrFUuQMwg7bBmW0E2ZXxyagIvlvg9xbSTyq1y
   nPDYFZKcLFlR3gwV84CXx69FPVkTEygbiXHj1pa5ZGaC0spsPSY2QMt8J
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253567153"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253567153"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535773357"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 02:25:35 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 8/9] usb: host: xhci: add blank line in xhci_halt()
Date:   Thu,  3 Mar 2022 12:26:55 +0200
Message-Id: <20220303102656.1661407-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303102656.1661407-1-mathias.nyman@linux.intel.com>
References: <20220303102656.1661407-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Linyu Yuan <quic_linyyuan@quicinc.com>

It is more readable to add blank lines.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e17eef88e5d7..1aa10db23fbb 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -110,6 +110,7 @@ void xhci_quiesce(struct xhci_hcd *xhci)
 int xhci_halt(struct xhci_hcd *xhci)
 {
 	int ret;
+
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "// Halt the HC");
 	xhci_quiesce(xhci);
 
@@ -119,8 +120,10 @@ int xhci_halt(struct xhci_hcd *xhci)
 		xhci_warn(xhci, "Host halt failed, %d\n", ret);
 		return ret;
 	}
+
 	xhci->xhc_state |= XHCI_STATE_HALTED;
 	xhci->cmd_ring_state = CMD_RING_STATE_STOPPED;
+
 	return ret;
 }
 
-- 
2.25.1

