Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B25338C74D
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 14:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhEUNAV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 09:00:21 -0400
Received: from m.b4.vu ([203.16.231.148]:50780 "EHLO m.b4.vu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230196AbhEUNAU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 09:00:20 -0400
Received: by m.b4.vu (Postfix, from userid 1000)
        id 72411612FB20; Fri, 21 May 2021 22:28:56 +0930 (ACST)
From:   "Geoffrey D. Bennett" <g@b4.vu>
To:     USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "Geoffrey D. Bennett" <g@b4.vu>
Subject: [PATCH] USB: usbfs: remove double evaluation of usb_sndctrlpipe()
Date:   Fri, 21 May 2021 22:28:56 +0930
Message-Id: <20210521125856.116349-1-g@b4.vu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_sndctrlpipe() is evaluated in do_proc_control(), saved in a
variable, then evaluated again. Use the saved variable instead, to
match the use of usb_rcvctrlpipe().

Fixes: 4c6e8971cbe0 ("USB: make the "usbfs_snoop" log more pertinent")
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 drivers/usb/core/devio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 533236366a03..4a8ec136460c 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1162,7 +1162,7 @@ static int do_proc_control(struct usb_dev_state *ps,
 			tbuf, ctrl->wLength);
 
 		usb_unlock_device(dev);
-		i = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), ctrl->bRequest,
+		i = usb_control_msg(dev, pipe, ctrl->bRequest,
 				    ctrl->bRequestType, ctrl->wValue, ctrl->wIndex,
 				    tbuf, ctrl->wLength, tmo);
 		usb_lock_device(dev);
-- 
2.31.1

