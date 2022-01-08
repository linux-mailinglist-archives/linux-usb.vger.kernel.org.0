Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F30488384
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jan 2022 13:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbiAHMAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jan 2022 07:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiAHMAX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jan 2022 07:00:23 -0500
Received: from mail.he1.boomer41.net (mail.he1.boomer41.net [IPv6:2a01:4f8:13b:aaf:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F68C061574
        for <linux-usb@vger.kernel.org>; Sat,  8 Jan 2022 04:00:22 -0800 (PST)
Message-ID: <4a47b864-0816-6f6a-efee-aa20e74bcdc6@stephan-brunner.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stephan-brunner.net;
        s=mail; t=1641643219;
        bh=IJSv1xkv/BmPzSdFwTxzUrEOjI2yflIawbwo9o5P9to=;
        h=Date:From:Subject:To:Cc:References:In-Reply-To;
        b=OEmC0KLUfcFxt30oLEDpwWMVK0Zx3QZroCr57c7NmAmR48hO4LsDXDY4MVBHRpnQ5
         N/Qf+KS6HGw1MCaRutTVlF4/UcJxqywRFo6eCePzxlHO8QR/imseWJLLKvW+rhLqru
         nMyezDG9iu/KulZMqE3iEKiuqzrlIwJKkanLhpdyDoqC43ey4yNdPipU8uMqYGTGH0
         k0LizNWFWWsFeHt7c3QEPcxkRb5AfhRmCkzjBNFnm60og9pU1GPaHkhkR1ONibzsga
         4UccOKxF9y5tSAv1Kwrk5jr2T7aI39xHWmnZOs7+EYeLwxmIaB2Q1W1kZDoBWU6Iku
         CcqG0KqWwaJaXu7Z/pobLHgdnhQVPyS/zTTs+78APZL53tSibuul+PHSbsbOL3ZRfn
         3MT6CwkYO8gEJx46cxUAOrhqP14TzyoUEVe/Et+Uyl6Jjhosj2nePHhq5eWLdy1nT+
         4OFpZi9A17Tm/+qkpPo3WhaUsgCeEzKUiKbmI3yxq561TocLb0qzhO4GJ4WGpsOuMo
         pJsg4i5BvI+Kz7+zML6NbZnWHrYJb+E1gvQ4cDyhJ1rJWfObExKylH6agYJcREOOpP
         NZRRIzcJEmoLUUseXcwKGdCGCSIw3NWSV578k4tnGsynbFtTQHib5/BGv/kbogaBvI
         ShSucCgCerDmBjaceGYTkV9Q=
Date:   Sat, 8 Jan 2022 13:00:20 +0100
MIME-Version: 1.0
From:   Stephan Brunner <s.brunner@stephan-brunner.net>
Subject: [PATCH v2 1/1] USB: serial: ch341: Add support for GW Instek
 USB2.0-Serial devices
To:     linux-usb@vger.kernel.org
Cc:     johan@kernel.org, s.brunner@stephan-brunner.net
References: <1e424713710d318a76b00d9ff40f4005204dd60b.camel@stephan-brunner.net>
 <cover.1641643125.git.s.brunner@stephan-brunner.net>
Content-Language: de-DE
In-Reply-To: <cover.1641643125.git.s.brunner@stephan-brunner.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Programmable lab power supplies made by GW Instek, such as the
GPP-2323, have a USB port exposing a serial port to control the device.

Stringing the supplied Windows driver, references to the ch341 chip are
found. Binding the existing ch341 driver to the VID/PID of the GPP-2323
("GW Instek USB2.0-Serial" as per the USB product name) works out of the
box, communication and control is now possible.

This patch should work with any GPP series power supply due to
similarities in the product line.

Signed-off-by: Stephan Brunner <s.brunner@stephan-brunner.net>
---
 drivers/usb/serial/ch341.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 29f4b87a9e74..c871fc905140 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -87,6 +87,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x1a86, 0x7523) },
 	{ USB_DEVICE(0x4348, 0x5523) },
 	{ USB_DEVICE(0x9986, 0x7523) },
+	{ USB_DEVICE(0x2184, 0x0057) }, /* GW Instek USB2.0-Serial */
 	{ },
 };
 MODULE_DEVICE_TABLE(usb, id_table);
-- 
2.34.1

