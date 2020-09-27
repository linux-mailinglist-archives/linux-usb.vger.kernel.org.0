Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716D627A117
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 14:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgI0MtW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 08:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgI0MtU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 08:49:20 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C14CC0613D5
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 05:49:20 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id b12so7075035edz.11
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2lSGROVpoGDqKpQV7Vk31ZIPu0grmXKx5AXVK7t2aWA=;
        b=YSpL+toI4XwAP28Dttrl4q1k50ljTdnyLNBAwqDbE+imYCHhfDXj4o6jp33Yb8CxVU
         QSNRPOrNf3Wnk3CmXc3NmT187UW0E0fRQTRkc30lWPz6ZHTEbZx+aUeZByJcig66B9NE
         Uk28IerZkYoqLZBOt/tFpPJNTI48oSxgfP60U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lSGROVpoGDqKpQV7Vk31ZIPu0grmXKx5AXVK7t2aWA=;
        b=iLQxAcBkR0CQG7FhqKI/mVfTP2qbJbj8i5tItikbgqvdb6nbGaQxh6aqPGbduU4tBH
         tUf9pBj0d8a0ynA51KZCfm6ufoljlIC+EhcH9IIeRh0ujXfN13KMLEk+yKmuSmDguzA2
         hixTdz1gZ66lcEJQUZFrbmudh4kdTcXF5X1vfST13+uUtHKgQnsjNtJVlkGtZ/br65u9
         YiRj04FDc9ChC/b+72rhClfe7vpJEoaQLV9Mj5rysc+QUTQdAUyld2JirsLemXKkv/MV
         J5azMndaXzjhhmm1u8fcgjhBhlMPQ7oOF2irXVXqR7zCrsjl3N0IN3aDlfv7dz628b7t
         q27A==
X-Gm-Message-State: AOAM5332MgSQVWxLoTmbu9RvZ4VqZ+2HEJwsvPr3ICALgFVPJw//dUA/
        WmWZkkxZcdGcsQnxktqZbOTodQ==
X-Google-Smtp-Source: ABdhPJyxSaPGOBqQxH+Y/pTxrZfw1o2rmXjFy/PmXOqAuZT/2U3pYMsQlhZMvCMaW6Wxka5ynvPZ8Q==
X-Received: by 2002:a05:6402:50f:: with SMTP id m15mr11280382edv.41.1601210958742;
        Sun, 27 Sep 2020 05:49:18 -0700 (PDT)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id r16sm7234275edc.57.2020.09.27.05.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 05:49:18 -0700 (PDT)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     gregKH@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, davem@davemloft.net,
        netdev@vger.kernel.org, Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH RESEND v3 2/2] net: rtl8150: Use the new usb control message API.
Date:   Sun, 27 Sep 2020 15:49:09 +0300
Message-Id: <20200927124909.16380-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927124909.16380-1-petko.manolov@konsulko.com>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200927124909.16380-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The old usb_control_msg() let the caller handle the error and also did not
account for partial reads.  Since these are now considered harmful, move the
driver over to usb_control_msg_recv/send() calls.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/net/usb/rtl8150.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 733f120c852b..b3a0b188b1a1 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -152,36 +152,16 @@ static const char driver_name [] = "rtl8150";
 */
 static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
 {
-	void *buf;
-	int ret;
-
-	buf = kmalloc(size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
-			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
-			      indx, 0, buf, size, 500);
-	if (ret > 0 && ret <= size)
-		memcpy(data, buf, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_recv(dev->udev, 0, RTL8150_REQ_GET_REGS,
+				    RTL8150_REQT_READ, indx, 0, data, size,
+				    1000, GFP_NOIO);
 }
 
 static int set_registers(rtl8150_t * dev, u16 indx, u16 size, const void *data)
 {
-	void *buf;
-	int ret;
-
-	buf = kmemdup(data, size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0),
-			      RTL8150_REQ_SET_REGS, RTL8150_REQT_WRITE,
-			      indx, 0, buf, size, 500);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_send(dev->udev, 0, RTL8150_REQ_SET_REGS,
+				    RTL8150_REQT_WRITE, indx, 0, data, size,
+				    1000, GFP_NOIO);
 }
 
 static void async_set_reg_cb(struct urb *urb)
-- 
2.28.0

