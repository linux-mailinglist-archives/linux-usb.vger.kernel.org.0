Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C78E5A9E3
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2019 11:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfF2JoU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jun 2019 05:44:20 -0400
Received: from mail-m974.mail.163.com ([123.126.97.4]:56854 "EHLO
        mail-m974.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfF2JoU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jun 2019 05:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jqcuh
        vhWip0gL7QvPk3pthhtouaeyuAJ1eltkDeHyN8=; b=Ae+F/hPoehpepjJYjFDhI
        cMpwvQviegk5J0bgfc1T/R3rvnX8LsQSPsiIL8rQ0tv4Hy+r0BX/DEZwBQeor0ep
        tU+GCh99LCQBmcG4QaueoTQH/R0IbXez5PjHNTYZEoNpaGM1+YWHUzijNIQk+Ovg
        5bkzzdV/IZcMwYMp7ScFzU=
Received: from localhost.localdomain (unknown [222.65.47.109])
        by smtp4 (Coremail) with SMTP id HNxpCgDn7sbtMhddIqOoAA--.31S2;
        Sat, 29 Jun 2019 17:44:13 +0800 (CST)
From:   yuan linyu <cugyly@163.com>
To:     linux-usb@vger.kernel.org
Cc:     yuan linyu <cugyly@163.com>
Subject: [PATCH v3] usb: core: message: remove memset in usb_get_descriptor()
Date:   Sat, 29 Jun 2019 17:44:10 +0800
Message-Id: <20190629094410.9106-1-cugyly@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: HNxpCgDn7sbtMhddIqOoAA--.31S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw13Zr4DurW5Xry7Xr1kKrg_yoWfZrb_Cr
        1UZr17CFy09Fy7CF97CwsxZrWFv3WI9ry8Wasavr93AFn0k3W5ZryIvrZ2kr15X3WjyF9r
        Gw1kJr1rurnY9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUe3rc3UUUUU==
X-Originating-IP: [222.65.47.109]
X-CM-SenderInfo: pfxj5zr16rljoofrz/xtbBEQ3i41aD5oAnsQAAs4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

there is no need to clean buf at beginning of function,
when below condition occur, the buf will be dirty again.
if (result > 1 && ((u8 *)buf)[1] != type) {
	result = -ENODATA;
	continue;
}

return negative result means buf is not valid.

Signed-off-by: yuan linyu <cugyly@163.com>
---
v3: enhance comment
v2: enhance comment
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

