Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5028346DC34
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 20:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbhLHTa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 14:30:58 -0500
Received: from mxout02.lancloud.ru ([45.84.86.82]:52062 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236216AbhLHTa5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 14:30:57 -0500
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Dec 2021 14:30:56 EST
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 8F54D20C089D
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 06/10] usb: host: ehci-sh: fix deferred probing
Date:   Wed, 8 Dec 2021 22:21:14 +0300
Message-ID: <20211208192118.7483-7-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211208192118.7483-1-s.shtylyov@omp.ru>
References: <20211208192118.7483-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver overrides the error codes and IRQ0 returned by platform_get_irq()
to -ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
permanently instead of the deferred probing. Switch to propagating the error
codes upstream. IRQ0 is no longer returned by platform_get_irq(), so we now
can safely ignore it...

Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
Changes in version 2:
- removed the check for IRQ0, updated the patch description accordingly.

 drivers/usb/host/ehci-sh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
index c25c51d26f26..882231b5c382 100644
--- a/drivers/usb/host/ehci-sh.c
+++ b/drivers/usb/host/ehci-sh.c
@@ -82,8 +82,8 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		ret = -ENODEV;
+	if (irq < 0) {
+		ret = irq;
 		goto fail_create_hcd;
 	}
 
-- 
2.26.3

