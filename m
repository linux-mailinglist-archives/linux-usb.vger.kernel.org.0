Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B79E1A4E6C
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2020 08:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgDKG40 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Apr 2020 02:56:26 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:19787 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgDKG40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Apr 2020 02:56:26 -0400
Received: from localhost.localdomain ([93.22.135.18])
        by mwinf5d37 with ME
        id RJwP2200Q0Pz5GD03JwPpl; Sat, 11 Apr 2020 08:56:24 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 11 Apr 2020 08:56:24 +0200
X-ME-IP: 93.22.135.18
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        jaswinder.singh@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] usb: gadget: max3420: Add a missing '\n' in a log message
Date:   Sat, 11 Apr 2020 08:56:21 +0200
Message-Id: <20200411065621.7744-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 48ba02b2e2b1 ("usb: gadget: add udc driver for max3420")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/max3420_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 8fbc083b6732..23f33946d80c 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -901,7 +901,7 @@ static int max3420_thread(void *dev_id)
 	}
 
 	set_current_state(TASK_RUNNING);
-	dev_info(udc->dev, "SPI thread exiting");
+	dev_info(udc->dev, "SPI thread exiting\n");
 	return 0;
 }
 
-- 
2.20.1

