Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F22F2C8F47
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 21:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgK3Ufc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 15:35:32 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:52635 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726716AbgK3Ufc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 15:35:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606768506; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=r4LK1+iLv+Ptnfnd1qdCMafEKs/cmIojnQ0/6LFEBtE=; b=Xpa2UO69/WdO475vKP5yBUpaGGcM9vFle/naaUCr7l0OEc9WnnsoZe7nYTVO9BtHE/6fTU0y
 Jg5oeDwDg7k71Gv9CQXzHduH+oFj+Th2GPi674+94EZgcuaGIVdrnOC3dvpCW9CG9j8p6wUn
 bsu4p9GvLH6i6Xrd4ESLgcrq4Y4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fc5577991ec4b75c27be7a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 20:35:05
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2248FC43462; Mon, 30 Nov 2020 20:35:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 102B8C433ED;
        Mon, 30 Nov 2020 20:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 102B8C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Vamsi Krishna Samavedam <vskrishn@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: gadget: f_fs: Use local copy of descriptors for userspace copy
Date:   Mon, 30 Nov 2020 12:34:53 -0800
Message-Id: <20201130203453.28154-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>

The function may be unbound causing the ffs_ep and its descriptors
to be freed while userspace is in the middle of an ioctl requesting
the same descriptors. Avoid dangling pointer reference by first
making a local copy of desctiptors before releasing the spinlock.

Fixes: c559a3534109 ("usb: gadget: f_fs: add ioctl returning ep descriptor")
Signed-off-by: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/function/f_fs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 046f770a76da..c727cb5de871 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1324,7 +1324,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	case FUNCTIONFS_ENDPOINT_DESC:
 	{
 		int desc_idx;
-		struct usb_endpoint_descriptor *desc;
+		struct usb_endpoint_descriptor desc1, *desc;
 
 		switch (epfile->ffs->gadget->speed) {
 		case USB_SPEED_SUPER:
@@ -1336,10 +1336,12 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 		default:
 			desc_idx = 0;
 		}
+
 		desc = epfile->ep->descs[desc_idx];
+		memcpy(&desc1, desc, desc->bLength);
 
 		spin_unlock_irq(&epfile->ffs->eps_lock);
-		ret = copy_to_user((void __user *)value, desc, desc->bLength);
+		ret = copy_to_user((void __user *)value, &desc1, desc1.bLength);
 		if (ret)
 			ret = -EFAULT;
 		return ret;
-- 
2.24.0

