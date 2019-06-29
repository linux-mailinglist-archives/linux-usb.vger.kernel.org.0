Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E61C65A943
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2019 08:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfF2GSs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jun 2019 02:18:48 -0400
Received: from mail-m973.mail.163.com ([123.126.97.3]:34542 "EHLO
        mail-m973.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbfF2GSr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jun 2019 02:18:47 -0400
X-Greylist: delayed 909 seconds by postgrey-1.27 at vger.kernel.org; Sat, 29 Jun 2019 02:18:46 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=r8Ahf
        3itYiMvesnwtSCC1KhiEljtsiotj8MY3HhpYd8=; b=iH0yCudP96xatNcF8Tk5m
        dG/rIoQmOCFJhnBTDYBuCrmlM1eX3SnV0T3GjKTdg5q+aJXQwUk9deLLaRA7X5sR
        H0Rp9gjWXu/zKx3cjtNHZJ/BV4x1a4+/LKxUbNMh2LB3+DJU8u3QkGi/UAxJnf9w
        b6yC9fTHa7w/0cY/QMJon8=
Received: from localhost.localdomain (unknown [222.65.47.109])
        by smtp3 (Coremail) with SMTP id G9xpCgAnR6c1_xZdu5KvAA--.111S2;
        Sat, 29 Jun 2019 14:03:35 +0800 (CST)
From:   yuan linyu <cugyly@163.com>
To:     linux-usb@vger.kernel.org
Cc:     yuan linyu <cugyly@163.com>
Subject: [PATCH] usb: core: message: remove memset in usb_get_descriptor()
Date:   Sat, 29 Jun 2019 14:03:14 +0800
Message-Id: <20190629060314.7352-1-cugyly@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: G9xpCgAnR6c1_xZdu5KvAA--.111S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr1kCFWxWw45KF1UCFW7urg_yoW3AFc_Cr
        10vwnrCFyI9a47GF4vkw1ayr4Fvw1Ivry8Wa9Ik3s3JFn0k3WUZryxXrZ8ur17Xr4jyrnx
        G348Jr18ur1rWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeWmh5UUUUU==
X-Originating-IP: [222.65.47.109]
X-CM-SenderInfo: pfxj5zr16rljoofrz/1tbiRRbi41l9r3U1jAAAsV
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

in the loop, if get a descriptor which is not desired type,
the buf will be not clean.
caller check return length to decide success or not.

Signed-off-by: yuan linyu <cugyly@163.com>
---
 drivers/usb/core/message.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index e844bb7b5676..03425e6b3da9 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -640,8 +640,6 @@ int usb_get_descriptor(struct usb_device *dev, unsigned char type,
 	int i;
 	int result;
 
-	memset(buf, 0, size);	/* Make sure we parse really received data */
-
 	for (i = 0; i < 3; ++i) {
 		/* retry on length 0 or error; some devices are flakey */
 		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-- 
2.17.1

