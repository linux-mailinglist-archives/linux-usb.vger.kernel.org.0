Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F7727A114
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 14:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgI0MtV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 08:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgI0MtT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 08:49:19 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E980EC0613CE
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 05:49:18 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id a12so7061307eds.13
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NDPhIefhnly1S9Y7P2oJIAz1qGyr+mMVBvietpnTvjY=;
        b=XaFqJ0uDXzuLvoDhbzvyGlkRvF3+6HO5NNFE0oUCCRI0LtApsCkv/Zo/Ed537nAiWy
         FQuKoKIy/unl7JjgucNkY/hTWb8VQFiZ5CqOJxlnVj2taNY//3/zj65sQZMdnGeGKfAd
         2eUrFZoOxOj6D5dDFuOkQxSXp02ymtEi1Ft7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDPhIefhnly1S9Y7P2oJIAz1qGyr+mMVBvietpnTvjY=;
        b=pFzi1Jh0Th+3l8em+hMwFFPma1Kw17476csDvOpSEx63dhMUGu2u9lA/KtlI0lgQhA
         OV633i7noBtmcGsj+ZL1fKcC415Nc22mDUQTtHY1BLGXv+BaKB/tn2+dqC0eFV7rJWIm
         EI/E89thWYhmWgmYTdqv+jrMkt7ek/UcUOJ6x2sQaMqSJTJPRol1RjFzYu6W5OxJuABL
         +XfZFIHS69W9FlYp3jUhI1I61JO9MfudshxSpd5DXgHaAP9qwBvllu6BYieL+BuyjeIp
         xhlIvIE5EZeZB4uUGrHaV4yOBaySxG/ZyUEJzrE+4nK4morg9JgP2Ap3891Gt7ZcKOSM
         II4Q==
X-Gm-Message-State: AOAM532Ex3+dY35Lg4jQiquhsYiss57vbE0NrO5E1EMLgET2D5Q+oljT
        CJgAG+/3/LsZbOhjSs5nxZPcsQ==
X-Google-Smtp-Source: ABdhPJzN4OEV8wFxmWfiCB2uJNGsbgKpyAK69Ammi4HhIZ5mk/5pxYkHqhpGV/DxbmYgM+C3zM71IA==
X-Received: by 2002:aa7:d593:: with SMTP id r19mr11126017edq.331.1601210957574;
        Sun, 27 Sep 2020 05:49:17 -0700 (PDT)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id r16sm7234275edc.57.2020.09.27.05.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 05:49:17 -0700 (PDT)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     gregKH@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, davem@davemloft.net,
        netdev@vger.kernel.org, Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH RESEND v3 1/2] net: pegasus: Use the new usb control message API.
Date:   Sun, 27 Sep 2020 15:49:08 +0300
Message-Id: <20200927124909.16380-2-petko.manolov@konsulko.com>
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

Added small note about why set_registers() can't be used to substitute
set_register().

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/net/usb/pegasus.c | 61 ++++++++++-----------------------------
 1 file changed, 15 insertions(+), 46 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index e92cb51a2c77..26b4e48bf91f 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -124,62 +124,31 @@ static void async_ctrl_callback(struct urb *urb)
 
 static int get_registers(pegasus_t *pegasus, __u16 indx, __u16 size, void *data)
 {
-	u8 *buf;
-	int ret;
-
-	buf = kmalloc(size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(pegasus->usb, usb_rcvctrlpipe(pegasus->usb, 0),
-			      PEGASUS_REQ_GET_REGS, PEGASUS_REQT_READ, 0,
-			      indx, buf, size, 1000);
-	if (ret < 0)
-		netif_dbg(pegasus, drv, pegasus->net,
-			  "%s returned %d\n", __func__, ret);
-	else if (ret <= size)
-		memcpy(data, buf, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_recv(pegasus->usb, 0, PEGASUS_REQ_GET_REGS,
+				   PEGASUS_REQT_READ, 0, indx, data, size,
+				   1000, GFP_NOIO);
 }
 
 static int set_registers(pegasus_t *pegasus, __u16 indx, __u16 size,
 			 const void *data)
 {
-	u8 *buf;
-	int ret;
-
-	buf = kmemdup(data, size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
-			      PEGASUS_REQ_SET_REGS, PEGASUS_REQT_WRITE, 0,
-			      indx, buf, size, 100);
-	if (ret < 0)
-		netif_dbg(pegasus, drv, pegasus->net,
-			  "%s returned %d\n", __func__, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REGS,
+				    PEGASUS_REQT_WRITE, 0, indx, data, size,
+				    1000, GFP_NOIO);
 }
 
+/*
+ * There is only one way to write to a single ADM8511 register and this is via
+ * specific control request.  'data' is ignored by the device, but it is here to
+ * not break the API.
+ */
 static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
 {
-	u8 *buf;
-	int ret;
-
-	buf = kmemdup(&data, 1, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
+	void *buf = &data;
 
-	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
-			      PEGASUS_REQ_SET_REG, PEGASUS_REQT_WRITE, data,
-			      indx, buf, 1, 1000);
-	if (ret < 0)
-		netif_dbg(pegasus, drv, pegasus->net,
-			  "%s returned %d\n", __func__, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REG,
+				    PEGASUS_REQT_WRITE, data, indx, buf, 1,
+				    1000, GFP_NOIO);
 }
 
 static int update_eth_regs_async(pegasus_t *pegasus)
-- 
2.28.0

