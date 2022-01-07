Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2AEB487EF8
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 23:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbiAGWe3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 17:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiAGWe2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jan 2022 17:34:28 -0500
X-Greylist: delayed 240 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 07 Jan 2022 14:34:28 PST
Received: from mail.he1.boomer41.net (mail.he1.boomer41.net [IPv6:2a01:4f8:13b:aaf:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546D1C061574
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 14:34:28 -0800 (PST)
Message-ID: <1e424713710d318a76b00d9ff40f4005204dd60b.camel@stephan-brunner.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stephan-brunner.net;
        s=mail; t=1641594624;
        bh=qIwxz0RtxxqkGWOusR11OhIM91jr95CfrjaZxfAHWP8=;
        h=Subject:From:To:Cc:Date;
        b=E/FlXZOSYNumYKvsJR789P45G73bZ3aRSr1Z0+jilYZiD4BX1HAoMAz0Caj4PnMVC
         QWEmnP3iWmcHR/EVswEe2SrrVMS45n8TVReJjUZjwmBKpQ+1B7994viCqJlJ+DpvUR
         gsTFE8QQZff1MLp7PBBv9j81gc8q3746JGxqDicx/hrzOurOr00EVnC/gTOiW1+vas
         A/sjw2Cv19WwbbBCkRcOpLMfZi0+lG+CKQi8mTnB4MJDYKhym1uejvbpT8OItjcqjA
         tp4oQnAPdSyNBBZMadt+RPXChUfshPzxlLHwG4RSx/WbsXHsFxu6LuHouysHa7viUm
         F+VP5jPbJUz7fneRSCU92f/4ST7NB9krZnSzUcS+k1z9iPnl3Xzrv8NP6WvEjLBin3
         OsC8tqwMb3Z1UZhPIcXO0XvW9VXaYHnPgVQcaoT6VA0DtR9MnpvY8EYUO4eHKewgJt
         1jN8u601ZH4pfGEwgnN8bk8qGvQ8ARY3+7FREHGslXXBArRrZPVJ5iU+puARoMZuPn
         ozKgbP9JR1FyORRxzQan6xzYcS+qpcY3Z8ABpaJHgU/V5K/xq1BbH3Y8jW2qD7BB6g
         peAcBPtmZiqwECjpOKEKISeX9jHSF5O6Y5kjNfeSciG8vUyfcaa6rXnl/QOlFNcgw9
         uEZNPEA/vxEFhNbmUiSj4tcE=
Subject: [PATCH] USB: serial: ch341: Add support for GW Instek USB2.0-Serial
 devices
From:   Stephan Brunner <s.brunner@stephan-brunner.net>
To:     linux-usb@vger.kernel.org
Cc:     johan@kernel.org, s.brunner@stephan-brunner.net
Date:   Fri, 07 Jan 2022 23:30:25 +0100
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Programmable lab power supplies made by GW Instek, such as the
GPP-2323, have a USB port exposing a serial port to control the device.

Stringing the supplied Windows driver, references to the ch341 chip are
found. Binding the existing ch341 driver to the VID/PID of the GPP-2323
("GW Instek USB2.0-Serial" as per the USB product name) works out of
the box, communication and control of the device is now possible.

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
+       { USB_DEVICE(0x2184, 0x0057) }, /* GW Instek USB2.0-Serial */
        { },
 };
 MODULE_DEVICE_TABLE(usb, id_table);
-- 
2.34.1

