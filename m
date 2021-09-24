Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32A9416E1C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 10:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244640AbhIXIkf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 04:40:35 -0400
Received: from smtpbguseast3.qq.com ([54.243.244.52]:40585 "EHLO
        smtpbguseast3.qq.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244768AbhIXIke (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Sep 2021 04:40:34 -0400
X-Greylist: delayed 2371 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 Sep 2021 04:40:34 EDT
X-QQ-mid: bizesmtp41t1632472735th7m4bpc
Received: from localhost.localdomain (unknown [111.207.172.18])
        by esmtp6.qq.com (ESMTP) with 
        id ; Fri, 24 Sep 2021 16:38:54 +0800 (CST)
X-QQ-SSF: 0140000000200080C000000E0000000
X-QQ-FEAT: ZHWZeLXy+8dkrRm/3PJ6hy+rHJf3bjPDkoqKy6wQBgDZG/isyZdt3lbsaTwfP
        Zqd8vR6j1dCSQ/l30w7PdrOZZ1JhiI2c/x7Dq4SvgrQAriMnvm1fQbZA8AhF+QhtnQVkyxH
        9kh0Obf3ia4U4gHm95PK7Ucsk/QtHRLDPGLgrXb+t54tkGwMhFn0HI3vYaDv4vrRc1gpbTr
        C+1OWZd9cnhS8VgdqGx9jjhx9eds5zcx1zVoBBFlkmcPvQNAxtvyidsfu1d8ky92lCSMOzk
        RHZt+vJvdIJwlxAEibiMYGvptIFTkdHCWzKWTTMTGj1FtjdgSdASOsdyJLIpXLSah7a/snF
        crpAyddv9snNJcaru+XyyQNg3FlV36+lENhevv+
X-QQ-GoodBg: 1
From:   Zhiwei Yang <yangzhiwei@uniontech.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Zhiwei Yang <yangzhiwei@uniontech.com>
Subject: [PATCH] USB: phy: tahvo:remove unnecessary debug log
Date:   Fri, 24 Sep 2021 16:38:52 +0800
Message-Id: <20210924083852.6029-1-yangzhiwei@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove the debug info which should be instead with ftrace

Signed-off-by: Zhiwei Yang <yangzhiwei@uniontech.com>
---
 drivers/usb/phy/phy-tahvo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
index 5dc600fadc5f..468151496d23 100644
--- a/drivers/usb/phy/phy-tahvo.c
+++ b/drivers/usb/phy/phy-tahvo.c
@@ -194,8 +194,6 @@ static int tahvo_usb_set_host(struct usb_otg *otg, struct usb_bus *host)
 	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
 					    phy);
 
-	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, host);
-
 	mutex_lock(&tu->serialize);
 
 	if (host == NULL) {
@@ -224,8 +222,6 @@ static int tahvo_usb_set_peripheral(struct usb_otg *otg,
 	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
 					    phy);
 
-	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, gadget);
-
 	mutex_lock(&tu->serialize);
 
 	if (!gadget) {
-- 
2.20.1



