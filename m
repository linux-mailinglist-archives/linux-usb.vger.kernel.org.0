Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B78722D659
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 11:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgGYJOL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 05:14:11 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:34533 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGYJOJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 05:14:09 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AAD9440004;
        Sat, 25 Jul 2020 09:14:07 +0000 (UTC)
Message-ID: <25f9d978b791d25583b18f4b5d0a929e031fec1f.camel@hadess.net>
Subject: [PATCH 2/3] USB: Also check for ->match
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Sat, 25 Jul 2020 11:14:07 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We only ever used a the ID table matching before, but we should probably
also support an open-coded match function.

Fixes: 88b7381a939de ("USB: Select better matching USB drivers when available")
Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index b6f2d4b44754..2b2f1ab6e36a 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -205,8 +205,9 @@ static int __check_usb_generic(struct device_driver *drv, void *data)
 	udrv = to_usb_device_driver(drv);
 	if (udrv == &usb_generic_driver)
 		return 0;
-
-	return usb_device_match_id(udev, udrv->id_table) != NULL;
+	if (usb_device_match_id(udev, udrv->id_table) != NULL)
+		return 1;
+	return (udrv->match && udrv->match(udev));
 }
 
 static bool usb_generic_driver_match(struct usb_device *udev)

