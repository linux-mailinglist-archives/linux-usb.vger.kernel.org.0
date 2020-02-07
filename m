Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD4B155C33
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 17:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgBGQxX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 11:53:23 -0500
Received: from cable.insite.cz ([84.242.75.189]:36389 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727009AbgBGQxX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Feb 2020 11:53:23 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 3D340A1A40B08;
        Fri,  7 Feb 2020 17:53:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581094400; bh=q37Nyz2tvXE40/8WJyZV8zxGiILRR1k4E8iR7culNQw=;
        h=From:Subject:To:Date:From;
        b=LmPv35v06xb28fJhyYcXj4XOhwTIzGWX5U+e4RbTJd1oRB8oQPSyB4ZDKbdNGlmUn
         znnbLRIstbVDbw7cZHzDI3BolOLYHcOWIwJqYxTT+0YAyiDSoUHJY7W8sSIyvWQvQJ
         NzX/Z9L6+nwi2oyaXVOOuVBCIklieat/yjMaQ8Fc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uqMGGFeSGf7A; Fri,  7 Feb 2020 17:53:20 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 1207BA1A40B05;
        Fri,  7 Feb 2020 17:53:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581094400; bh=q37Nyz2tvXE40/8WJyZV8zxGiILRR1k4E8iR7culNQw=;
        h=From:Subject:To:Date:From;
        b=LmPv35v06xb28fJhyYcXj4XOhwTIzGWX5U+e4RbTJd1oRB8oQPSyB4ZDKbdNGlmUn
         znnbLRIstbVDbw7cZHzDI3BolOLYHcOWIwJqYxTT+0YAyiDSoUHJY7W8sSIyvWQvQJ
         NzX/Z9L6+nwi2oyaXVOOuVBCIklieat/yjMaQ8Fc=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH] usb: gadget: f_uac2: EP OUT adaptive instead of async
To:     Greg KH <gregkh@linuxfoundation.org>,
        Linux USB <linux-usb@vger.kernel.org>
Message-ID: <2bd4ac94-f7c3-41d6-27a7-352f3319bda7@ivitera.com>
Date:   Fri, 7 Feb 2020 17:53:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The existing UAC2 implementation presents its EP OUT as
USB_ENDPOINT_SYNC_ASYNC.

However:
1) f_uac2 does not define any feedback endpoint

2) IMO in reality it is adaptive - the USB host is the one which sets
the pace of data.

Changing USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE for the FS
and HS output endpoints corrects the config to reflect real functionality.

Also, the change makes the UAC2 gadget recognized and working
in MS Windows.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c
b/drivers/usb/gadget/function/f_uac2.c
index db2d498..e8c9dd1 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -273,7 +273,7 @@ enum {
 	.bDescriptorType = USB_DT_ENDPOINT,

 	.bEndpointAddress = USB_DIR_OUT,
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE,
 	.wMaxPacketSize = cpu_to_le16(1023),
 	.bInterval = 1,
 };
@@ -282,7 +282,7 @@ enum {
 	.bLength = USB_DT_ENDPOINT_SIZE,
 	.bDescriptorType = USB_DT_ENDPOINT,

-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE,
 	.wMaxPacketSize = cpu_to_le16(1024),
 	.bInterval = 4,
 };
-- 
1.9.1
