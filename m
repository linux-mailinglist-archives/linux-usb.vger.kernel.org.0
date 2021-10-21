Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF30436B29
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 21:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhJUTRC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 15:17:02 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:52552 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbhJUTQ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 15:16:59 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 21B8020CDA54
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 06/10] usb: host: ehci-sh: fix deferred probing
Date:   Thu, 21 Oct 2021 22:14:33 +0300
Message-ID: <20211021191437.8737-7-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211021191437.8737-1-s.shtylyov@omp.ru>
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver overrides the error codes (and also IRQ0) returned by
platform_get_irq() to -ENODEV, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream -- that means we have to explicitly
filter out IRQ0 as bad since usb_add_hcd() doesn't quite like it... :-)

Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/ehci-sh.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
index c25c51d26f26..8ce880610212 100644
--- a/drivers/usb/host/ehci-sh.c
+++ b/drivers/usb/host/ehci-sh.c
@@ -82,8 +82,12 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		ret = -ENODEV;
+	if (irq < 0) {
+		ret = irq;
+		goto fail_create_hcd;
+	}
+	if (!irq) {
+		ret = -EINVAL;
 		goto fail_create_hcd;
 	}
 
-- 
2.26.3

