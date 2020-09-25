Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24ADB278D7F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 18:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgIYQCY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 12:02:24 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33466 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727324AbgIYQCX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 12:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BKmEhz1bX2kIJMiI59Sio5+hLY0OHAc8uJFV9UaTADg=; b=NDUHKFUPGzvcBLuwTwuLF+EFfO
        D1OO6IoOIw+su7ZxbpaEFSCiAaEqD+MaznBc0GOxrLDXyiV895SFV0NRvbZII0mH2aRi73Uu1SSfh
        3FamqqkregWIkAnxBpf9lP2+4UrO9Qhha3X/5CI/0iSCTSmuTXLwOBvFVdqk5IuqCIYg=;
Received: from [94.26.108.4] (helo=carbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kLqAu-00024z-Ek; Fri, 25 Sep 2020 19:02:20 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, oneukum@suse.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH 2/2] net: rtl8150: convert control messages to the new send/recv scheme.
Date:   Fri, 25 Sep 2020 19:02:00 +0300
Message-Id: <20200925160200.4364-3-petkan@nucleusys.com>
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
    Petko Manolov <petko.manolov@konsulko.com> --- drivers/net/usb/rtl8150.c
   | 32 ++++++ 1 file changed, 6 insertions(+), 26 deletions(-) 
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
 drivers/net/usb/rtl8150.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 733f120c852b..f76d20d290d9 100644
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
+	ret = usb_control_msg_recv(dev->udev, 0, RTL8150_REQ_GET_REGS,
+				   RTL8150_REQT_READ, indx, 0, data, size,
+				   1000, GFP_NOIO);
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
+	ret = usb_control_msg_send(dev->udev, 0, RTL8150_REQ_SET_REGS,
+				   RTL8150_REQT_WRITE, indx, 0, data, size,
+				   1000, GFP_NOIO);
 }
 
 static void async_set_reg_cb(struct urb *urb)
-- 
2.28.0

