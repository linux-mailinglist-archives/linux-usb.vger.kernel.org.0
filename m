Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37271278D7D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 18:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgIYQCW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 12:02:22 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33456 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727201AbgIYQCW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 12:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Pzgsjorgx6FRad29C5+ECwe1Fu2IT+OQkXCVxAqlxjg=; b=KlO3vm6qoTtKNvePamnNr/NM0K
        +jzp6mBCG3am4EdbPpNY4R3shgM7QThoHD3LDYUlg9cCafJcW0kmjQMLCrBHqIn6m/AqaZxCNl82w
        3YCbavR649sw5JBQI9y+AmvhdkVWaA951a7tEtNjcf35d+LiZJ8VjSJ1op/hHk/dD1p8=;
Received: from [94.26.108.4] (helo=carbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kLqAt-00024z-Cg; Fri, 25 Sep 2020 19:02:19 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, oneukum@suse.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH 1/2] net: pegasus: convert control messages to the new send/recv scheme.
Date:   Fri, 25 Sep 2020 19:01:59 +0300
Message-Id: <20200925160200.4364-2-petkan@nucleusys.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925160200.4364-1-petkan@nucleusys.com>
References: <20200925143730.GA3111407@kroah.com>
 <20200925160200.4364-1-petkan@nucleusys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software, running on the system "zztop.nucleusys.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Petko Manolov <petko.manolov@konsulko.com> Move all
   control transfers to safer usb_control_msg_send/recv() API. Signed-off-by:
    Petko Manolov <petko.manolov@konsulko.com> --- drivers/net/usb/pegasus.c
   | 56 +++++++ 1 file changed, 9 insertions(+), 47 deletions(-) 
 Content analysis details:   (-1.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Petko Manolov <petko.manolov@konsulko.com>

Move all control transfers to safer usb_control_msg_send/recv() API.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/net/usb/pegasus.c | 56 +++++++--------------------------------
 1 file changed, 9 insertions(+), 47 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index e92cb51a2c77..0ecc1eb2e71b 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -124,62 +124,24 @@ static void async_ctrl_callback(struct urb *urb)
 
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
+				    PEGASUS_REQT_READ, 0, indx, data, size,
+				    1000, GFP_NOIO);
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
+			      PEGASUS_REQT_WRITE, 0, indx, data, size, 1000,
+			      GFP_NOIO);
 }
 
 static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
 {
-	u8 *buf;
-	int ret;
-
-	buf = kmemdup(&data, 1, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
-			      PEGASUS_REQ_SET_REG, PEGASUS_REQT_WRITE, data,
-			      indx, buf, 1, 1000);
-	if (ret < 0)
-		netif_dbg(pegasus, drv, pegasus->net,
-			  "%s returned %d\n", __func__, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REG,
+			            PEGASUS_REQT_WRITE, data, indx, &data, 1,
+				    1000, GFP_NOIO);
 }
 
 static int update_eth_regs_async(pegasus_t *pegasus)
-- 
2.28.0

