Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C383F38CC68
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 19:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbhEURmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 13:42:01 -0400
Received: from m.b4.vu ([203.16.231.148]:50810 "EHLO m.b4.vu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233682AbhEURlw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 13:41:52 -0400
Received: by m.b4.vu (Postfix, from userid 1000)
        id A27DB612FB2E; Sat, 22 May 2021 03:10:27 +0930 (ACST)
Date:   Sat, 22 May 2021 03:10:27 +0930
From:   "Geoffrey D. Bennett" <g@b4.vu>
To:     USB mailing list <linux-usb@vger.kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v2] USB: usbfs: remove double evaluation of usb_sndctrlpipe()
Message-ID: <20210521174027.GA116484@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_sndctrlpipe() is evaluated in do_proc_control(), saved in a
variable, then evaluated again. Use the saved variable instead, to
match the use of usb_rcvctrlpipe().

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
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

