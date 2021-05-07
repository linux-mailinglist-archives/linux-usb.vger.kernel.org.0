Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B42376984
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 19:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbhEGRbH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 13:31:07 -0400
Received: from alln-iport-8.cisco.com ([173.37.142.95]:12765 "EHLO
        alln-iport-8.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhEGRbG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 May 2021 13:31:06 -0400
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 May 2021 13:31:06 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1096; q=dns/txt; s=iport;
  t=1620408607; x=1621618207;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KjImhc2JK0NRVqEqrRGVolZxLwQomaHya3mNXQjmMGo=;
  b=bEGb8UQrOqxgWD8UmO5moRr9ninxjwQJtI4Ee1LJeIqMxHqO+8oTKDC9
   VSv3UjtFisnuUwTXJ3PgF7iXkfeI4z9ZWysVAHOYpkQVdAF6mWQBNMCsO
   lEPNiTpQExrH7f18L5qbDSYS9bdmWJ4LpBMvuIEg9knAnkMjPwYKK44QQ
   s=;
X-IronPort-AV: E=Sophos;i="5.82,281,1613433600"; 
   d="scan'208";a="708116664"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 May 2021 17:23:01 +0000
Received: from zorba.cisco.com ([10.24.22.254])
        by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTP id 147HN07c022761;
        Fri, 7 May 2021 17:23:00 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     HEMANT RAMDASI <hramdasi@cisco.com>,
        Christian Engelmayer <christian.engelmayer@frequentis.com>,
        Gopalakrishnan Santhanam <gsanthan@cisco.com>,
        xe-linux-external@cisco.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fsl-usb: add need_oc_pp_cycle flag for 85xx also
Date:   Fri,  7 May 2021 10:23:00 -0700
Message-Id: <20210507172300.3075939-1-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.22.254, [10.24.22.254]
X-Outbound-Node: rcdn-core-9.cisco.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gopalakrishnan Santhanam <gsanthan@cisco.com>

Commit e6604a7fd71f9 ("EHCI: Quirk flag for port power handling on overcurrent.")
activated the quirks handling (flag need_oc_pp_cycle) for Freescale 83xx
based boards.
Activate same for 85xx based boards as well.

Cc: xe-linux-external@cisco.com
Signed-off-by: Gopalakrishnan Santhanam <gsanthan@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 drivers/usb/host/ehci-fsl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 6f7bd6641694..c7d74c1a23f5 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -387,7 +387,7 @@ static int ehci_fsl_setup(struct usb_hcd *hcd)
 	/* EHCI registers start at offset 0x100 */
 	ehci->caps = hcd->regs + 0x100;
 
-#ifdef CONFIG_PPC_83xx
+#if defined(CONFIG_PPC_83xx) || defined(CONFIG_PPC_85xx)
 	/*
 	 * Deal with MPC834X that need port power to be cycled after the power
 	 * fault condition is removed. Otherwise the state machine does not
-- 
2.25.1

