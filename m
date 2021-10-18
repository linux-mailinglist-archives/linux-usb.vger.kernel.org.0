Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35AF4326A5
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 20:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhJRSlw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 14:41:52 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:52890 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbhJRSls (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 14:41:48 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 37C31205DEE8
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        <openbmc@lists.ozlabs.org>
Subject: [PATCH 03/22] usb: host: ehci-npcm7xx: deny IRQ0
Date:   Mon, 18 Oct 2021 21:39:11 +0300
Message-ID: <20211018183930.8448-4-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018183930.8448-1-s.shtylyov@omp.ru>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: df44831ee2dd ("USB host: Add USB ehci support for nuvoton npcm7xx platform")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/ehci-npcm7xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
index 6b5a7a873e01..aff3d906ced5 100644
--- a/drivers/usb/host/ehci-npcm7xx.c
+++ b/drivers/usb/host/ehci-npcm7xx.c
@@ -114,6 +114,10 @@ static int npcm7xx_ehci_hcd_drv_probe(struct platform_device *pdev)
 		retval = irq;
 		goto fail;
 	}
+	if (!irq) {
+		retval = -EINVAL;
+		goto fail;
+	}
 
 	/*
 	 * Right now device-tree probed devices don't get dma_mask set.
-- 
2.26.3

