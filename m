Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314FF4CBC2D
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 12:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbiCCLIa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 06:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbiCCLI3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 06:08:29 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CF855210
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 03:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646305664; x=1677841664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iQ/YV/TqRG9910eZ3a/U/TfxeBZRExu8F6yQfLablsg=;
  b=KTFGpGoL0hUsUlpA71kjH8Jb1G+eSFomwQPWbN0EqgS8ra1Arfmlln0E
   2hAuey1L5QZfeHPs8tPPgqqg0FG7jlCjLQ2uHM0nYlfBp/u15K5XN0eA/
   oVA3MgUaiN1He0g6/B+oCLzDUX3U+L6UZlERaCCQURZCa9Lsrga6PA5by
   SbSLb/BIWwc9lel1VHqijGJnz6naao+9pCxRVhlMUPN5BNeJvbFNzbuW4
   VOu5dI6+JNHHRwyHnIlELixdEuxkYuZJytSRlkO0wC2iqbJIrcSEgto29
   apNjnbDZgJYVtL1FSnRnsVJrybmTHzi+fL5PJM1vLo3NVITjg1TWqB9WC
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251219920"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="251219920"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 03:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576452417"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2022 03:07:42 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 8/9] usb: host: xhci: add blank line in xhci_halt()
Date:   Thu,  3 Mar 2022 13:09:02 +0200
Message-Id: <20220303110903.1662404-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303110903.1662404-1-mathias.nyman@linux.intel.com>
References: <20220303110903.1662404-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

