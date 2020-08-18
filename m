Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E44E24837E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 13:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgHRLEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 07:04:49 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:34715 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgHRLEt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 07:04:49 -0400
Received: from localhost.localdomain (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5C83D200006;
        Tue, 18 Aug 2020 11:04:46 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v8 1/3] USB: Also match device drivers using the ->match vfunc
Date:   Tue, 18 Aug 2020 13:04:43 +0200
Message-Id: <20200818110445.509668-1-hadess@hadess.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We only ever used the ID table matching before, but we should also support
open-coded match functions.

Fixes: 88b7381a939de ("USB: Select better matching USB drivers when available")
Signed-off-by: Bastien Nocera <hadess@hadess.net>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes since v7:
- Reword commit subject

Changes since v2:
- Added Alan's ack

Changes since v1:
- Fixed typo in commit message


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
-- 
2.26.2

