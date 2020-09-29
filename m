Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4112827C28F
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 12:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgI2Klu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 06:41:50 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45224 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI2Klu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 06:41:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id z17so4882701lfi.12
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 03:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pgTQIlfJ1uDWcIBdlqsdKwk2q9yqJ4wRdLRdpk4kMLQ=;
        b=Zxs6Pck9oTAA1aE3mttulC6dd8cZTzhJN5SnT7m2OxEL6SVSb8axtELemvRV7oR9Sp
         0g3FD6ROTMPeqwdI+7MDWEuHMxDFKzLyQgzIyL+R1wDev/BAaqvTOTwmfuwNjnZ0eTmI
         A6TqD+QSCVMFu5nFIjrnHKOpJP1DCrUT2nH0IoPE/cg3omQhrV+nnQsEBKOeK/+JAjxy
         xlca5C/PTxegEXPB6fjynT5oDa47yvGWYrjpvjyJUH4kCdmgHYXEFbLa3eVB3UeEYjAT
         XZcRn7Bq3/fYhdXV73YA7ZukcB6yAx2BV7tQsHcbUqGmiMQ5yf/dnNzH56EKn0VHl/qz
         R5XA==
X-Gm-Message-State: AOAM532RPmEWwiAUFMSqC/pggJawaA/ev2cETEjfiyzMhu0uWelyjW13
        Bp3TucRNBNCOpNE7VaDtNs9S36yclxk=
X-Google-Smtp-Source: ABdhPJzo32bq/8cMHlM3KTWEdwNxqMl89cadpLKCKzGBuWhGJDLYJbxDBIUGUkQE1wOjHXo+pr/fbw==
X-Received: by 2002:ac2:4352:: with SMTP id o18mr909100lfl.496.1601376107182;
        Tue, 29 Sep 2020 03:41:47 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id z2sm3169603lfc.209.2020.09.29.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:41:46 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kND4n-0001rT-7X; Tue, 29 Sep 2020 12:41:41 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Mychaela N . Falconia" <falcon@freecalypso.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: ftdi_sio: clean up jtag quirks
Date:   Tue, 29 Sep 2020 12:41:16 +0200
Message-Id: <20200929104116.7107-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drivers should not assume that interface descriptors have been parsed in
any particular order so match on interface number instead when rejecting
JTAG interfaces.

Also use the interface struct device for notifications so that the
interface number is included.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 8d89a1650dad..12a4b74ca1f4 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2335,12 +2335,11 @@ static int ftdi_NDI_device_setup(struct usb_serial *serial)
  */
 static int ftdi_jtag_probe(struct usb_serial *serial)
 {
-	struct usb_device *udev = serial->dev;
-	struct usb_interface *interface = serial->interface;
+	struct usb_interface *intf = serial->interface;
+	int ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
 
-	if (interface == udev->actconfig->interface[0]) {
-		dev_info(&udev->dev,
-			 "Ignoring serial port reserved for JTAG\n");
+	if (ifnum == 0) {
+		dev_info(&intf->dev, "Ignoring interface reserved for JTAG\n");
 		return -ENODEV;
 	}
 
@@ -2372,12 +2371,11 @@ static int ftdi_8u2232c_probe(struct usb_serial *serial)
  */
 static int ftdi_stmclite_probe(struct usb_serial *serial)
 {
-	struct usb_device *udev = serial->dev;
-	struct usb_interface *interface = serial->interface;
+	struct usb_interface *intf = serial->interface;
+	int ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
 
-	if (interface == udev->actconfig->interface[0] ||
-	    interface == udev->actconfig->interface[1]) {
-		dev_info(&udev->dev, "Ignoring serial port reserved for JTAG\n");
+	if (ifnum < 2) {
+		dev_info(&intf->dev, "Ignoring interface reserved for JTAG\n");
 		return -ENODEV;
 	}
 
-- 
2.26.2

