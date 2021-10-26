Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623A143B865
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 19:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237919AbhJZRmW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 13:42:22 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:56842 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237855AbhJZRmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 13:42:15 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru E338520A74C3
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     Vladimir Zapolskiy <vz@mleia.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 11/22] usb: host: ohci-nxp: deny IRQ0
Date:   Tue, 26 Oct 2021 20:39:32 +0300
Message-ID: <20211026173943.6829-12-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211026173943.6829-1-s.shtylyov@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: 60bbfc84b6d9 ("USB OHCI controller support for PNX4008")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in version 2:
- fixed the subject to match the patch;
- added Alan's ACK.

 drivers/usb/host/ohci-nxp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
index 85878e8ad331..afb9c2fc85c3 100644
--- a/drivers/usb/host/ohci-nxp.c
+++ b/drivers/usb/host/ohci-nxp.c
@@ -215,6 +215,10 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 		ret = -ENXIO;
 		goto fail_resource;
 	}
+	if (!irq) {
+		ret = -EINVAL;
+		goto fail_resource;
+	}
 
 	ohci_nxp_start_hc();
 	platform_set_drvdata(pdev, hcd);
-- 
2.26.3

