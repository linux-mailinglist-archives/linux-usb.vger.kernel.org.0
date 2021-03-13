Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488FC339B60
	for <lists+linux-usb@lfdr.de>; Sat, 13 Mar 2021 03:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhCMCrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 21:47:22 -0500
Received: from mail-m17635.qiye.163.com ([59.111.176.35]:56768 "EHLO
        mail-m17635.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbhCMCrD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Mar 2021 21:47:03 -0500
X-Greylist: delayed 313 seconds by postgrey-1.27 at vger.kernel.org; Fri, 12 Mar 2021 21:47:03 EST
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 03811400105;
        Sat, 13 Mar 2021 10:41:47 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] usb: cdns3: delete repeated clear operations
Date:   Sat, 13 Mar 2021 10:41:43 +0800
Message-Id: <1615603303-14518-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZTh4fGUxNHh5PSkkaVkpNSk5NS0hIS0NJTkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxw6Ijo5OT8TKVE9KE4NKgMB
        LhcKChlVSlVKTUpOTUtISEtDTkNPVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFKT0pKNwY+
X-HM-Tid: 0a7829761695d991kuws03811400105
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dma_alloc_coherent already zeroes out memory, so memset is not needed.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/usb/cdns3/cdnsp-mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 7a84e92..1d1b9a4
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -1231,7 +1231,6 @@ int cdnsp_mem_init(struct cdnsp_device *pdev)
 	if (!pdev->dcbaa)
 		return -ENOMEM;
 
-	memset(pdev->dcbaa, 0, sizeof(*pdev->dcbaa));
 	pdev->dcbaa->dma = dma;
 
 	cdnsp_write_64(dma, &pdev->op_regs->dcbaa_ptr);
-- 
2.7.4

