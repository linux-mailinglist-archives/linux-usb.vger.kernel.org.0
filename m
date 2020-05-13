Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510A21D212E
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 23:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbgEMVgi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 17:36:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51050 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729413AbgEMVgg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 17:36:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04DLaZao037591
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 16:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589405795;
        bh=4Uwo9+q8rBh4O5RXcZCu6XFwX681ZgA1nUiH/x8aBs4=;
        h=From:To:CC:Subject:Date;
        b=g5EKNk2QeaKLBMKnIBSnru3tP9KjdWEOodFuHWAWtqSOgHfHTQ0EsRdtc2ENfoWS3
         yYnpBfIwCVx+E47sijm+Z3SEY6YhyY0jXlf3G3EwU9ZIP/Gmo/FFHc1o+T+8BepYL0
         nNUxptTZn4Lnw2s9WqcirTlp50vP6FLJp3HWtZ18=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04DLaZOi067887
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 16:36:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 13
 May 2020 16:36:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 13 May 2020 16:36:35 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DLaZlG112342;
        Wed, 13 May 2020 16:36:35 -0500
From:   Bin Liu <b-liu@ti.com>
To:     <linux-usb@vger.kernel.org>
CC:     Bin Liu <b-liu@ti.com>
Subject: [PATCH] usb: musb: start session in resume for host port
Date:   Wed, 13 May 2020 16:36:35 -0500
Message-ID: <20200513213635.21599-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 17539f2f4f0b ("usb: musb: fix enumeration after resume") replaced
musb_start() in musb_resume() to not override softconnect bit, but it
doesn't restart the session for host port which was done in musb_start().
The session could be disabled in musb_suspend(), which leads the host
port doesn't stay in host mode.

So let's start the session specifically for host port in musb_resume().

Fixes: 17539f2f4f0b ("usb: musb: fix enumeration after resume")

Cc: stable@vger.kernel.org
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index d590110539ab..48178aeccf5b 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2877,6 +2877,13 @@ static int musb_resume(struct device *dev)
 	musb_enable_interrupts(musb);
 	musb_platform_enable(musb);
 
+	/* session might be disabled in suspend */
+	if (musb->port_mode == MUSB_HOST &&
+	    !(musb->ops->quirks & MUSB_PRESERVE_SESSION)) {
+		devctl |= MUSB_DEVCTL_SESSION;
+		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
+	}
+
 	spin_lock_irqsave(&musb->lock, flags);
 	error = musb_run_resume_work(musb);
 	if (error)
-- 
2.17.1

