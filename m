Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2E8B63D194
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 10:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbiK3JSX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 04:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbiK3JSR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 04:18:17 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751CE45A17
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 01:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669799895; x=1701335895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fJQn3D72sF42Pp4iqj6Q9yeVh0aYs2iEo1400Wtpams=;
  b=Tqg4UwZwAw2G8LBtHCtHAMzF7NGX2yFMZHeNChegQHvZy6e6ZyyIH+fI
   8LKtwSK0aVRdr22NnhPhwM9f60vECGJzQFJYhfTZBKE0nVZOHRzsEhory
   8scNr5sebeFhe4Csj0BGRD61ctBlZGNsWVoAKoerGRFD6wahS1CVuZWxz
   0smiKsu0Yo2hikE+beYiK8y+tSvi0mQrq89GKAv60D5sSwfG8bn439EMb
   tIKDDj5ZjTNdQmg/PiebS1s60zPStrIEw7HnqXvY0p4U7c4QueGcd8gVv
   NdfmT0u+I1NU/z05kr2R5dbt5fCNJm0R8o/8LDhau/qRKDWk8tdB1Cqnh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295711258"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="295711258"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 01:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="674962686"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="674962686"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 30 Nov 2022 01:18:13 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Longfang Liu <liulongfang@huawei.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/6] xhci: print warning when HCE was set
Date:   Wed, 30 Nov 2022 11:19:39 +0200
Message-Id: <20221130091944.2171610-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
References: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Longfang Liu <liulongfang@huawei.com>

When HCE(Host Controller Error) is set, it means that the xhci hardware
controller has an error at this time, but the current xhci driver
software does not log this event.

By adding an HCE event detection in the xhci interrupt processing
interface, a warning log is output to the system, which is convenient
for system device status tracking.

Signed-off-by: Longfang Liu <liulongfang@huawei.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ad81e9a508b1..f6af479188e8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3031,6 +3031,11 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	if (!(status & STS_EINT))
 		goto out;
 
+	if (status & STS_HCE) {
+		xhci_warn(xhci, "WARNING: Host Controller Error\n");
+		goto out;
+	}
+
 	if (status & STS_FATAL) {
 		xhci_warn(xhci, "WARNING: Host System Error\n");
 		xhci_halt(xhci);
-- 
2.25.1

