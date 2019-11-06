Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F10F1181
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 09:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfKFIzS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 03:55:18 -0500
Received: from mail-m974.mail.163.com ([123.126.97.4]:57322 "EHLO
        mail-m974.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfKFIzS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 03:55:18 -0500
X-Greylist: delayed 938 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 03:55:16 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=+JzU+esi7fl0h4YK8N
        PHkxPWloJ5wIl06K/wPnc/A2k=; b=L6xaRbUAJMTvsW09nge/+GKrTTCh43e6VO
        OSswfOX+OhhilUA4bHqozbqprvxu7fxm7mTUpPgGFyqG2f+1jzHNCdrDBuDY9ZXg
        aiCUKSIZSw9UTB4Jy1CcGxULHabKQP3rG/Ttoavt0yEO/D1/C4ALXy0Azd31k+py
        373MrR5Mg=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by smtp4 (Coremail) with SMTP id HNxpCgDHZtOBhsJdCHKDBQ--.289S3;
        Wed, 06 Nov 2019 16:38:35 +0800 (CST)
From:   Pan Bian <bianpan2016@163.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chuhong Yuan <hslester96@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pan Bian <bianpan2016@163.com>
Subject: [PATCH] usb: gadget: pch_udc: fix use after free
Date:   Wed,  6 Nov 2019 16:38:23 +0800
Message-Id: <1573029503-18369-1-git-send-email-bianpan2016@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: HNxpCgDHZtOBhsJdCHKDBQ--.289S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWUXr43Wr1UuF1kKF13twb_yoWfurcEk3
        yjgFnrWryYq3Z8Kr4fJry3Ar4293ZYqan3uFnaqrZ3Z3y5Way5Xr18ZF9Y93y7uw47GF93
        u3yqqFyYgF4S9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1jNt3UUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/1tbiDgtlclXluaTJ2AAAsu
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The next field of the DMA descriptor is written after releasing the
descriptor, which may result in a use-after-free issue. Set the value of
the field before it is released to fix the bug.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/usb/gadget/udc/pch_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 265dab2bbfac..c5b8ec908aab 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1518,8 +1518,8 @@ static void pch_udc_free_dma_chain(struct pch_udc_dev *dev,
 		/* do not free first desc., will be done by free for request */
 		td = phys_to_virt(addr);
 		addr2 = (dma_addr_t)td->next;
-		dma_pool_free(dev->data_requests, td, addr);
 		td->next = 0x00;
+		dma_pool_free(dev->data_requests, td, addr);
 		addr = addr2;
 	}
 	req->chain_len = 1;
-- 
2.7.4

