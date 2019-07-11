Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B742265421
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2019 11:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbfGKJsG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 05:48:06 -0400
Received: from lisa.dawes.za.net ([178.63.77.189]:53106 "EHLO
        lisa.dawes.za.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfGKJsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Jul 2019 05:48:06 -0400
X-Greylist: delayed 472 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Jul 2019 05:48:05 EDT
Received: by lisa.dawes.za.net (Postfix, from userid 1000)
        id 934BB1405A1; Thu, 11 Jul 2019 11:40:12 +0200 (SAST)
Date:   Thu, 11 Jul 2019 11:40:12 +0200
From:   Rogan Dawes <rogan@dawes.za.net>
To:     linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: option: add D-Link DWM-222 device ID
Message-ID: <20190711094012.GA16316@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add device id for D-Link DWM-222.

Cc: stable@vger.kernel.org
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a0aaf0635359..018a9772b869 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1951,6 +1951,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e35, 0xff),			/* D-Link DWM-222 */
 	  .driver_info = RSVD(4) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e36, 0xff),			/* D-Link DWM-222 A2 */
+	  .driver_info = RSVD(4) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e01, 0xff, 0xff, 0xff) },	/* D-Link DWM-152/C1 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e02, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/C1 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/A3 */
-- 
2.17.1

