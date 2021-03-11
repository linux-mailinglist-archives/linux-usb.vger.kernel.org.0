Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B413378FD
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 17:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbhCKQPK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 11:15:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:51298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234520AbhCKQPB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 11:15:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C3D764F97;
        Thu, 11 Mar 2021 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615479300;
        bh=hFcDse+HNyVQ6fnuGbcZvi9Bv47uK4v68afgAutxoyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KrTaFXOgxKnPrx1/r/uiHICCjWWveyHRwfAgN9DyL0S8hoxZs3WOfIm++nknXGQmW
         iCoQUxVrpOuFYdfuBv0gpwfKEVu2swu6gCKmbRKw13CuQ69GID/XZI4HIblnLY4a9n
         mwtkcJyEhGwRjeeF26TOTU3liPG8YHKPiBngj21sJfyZgNrpWpHRXPAJR3+tGdE5aK
         IOVij7sribp0Mh3v3SoJRmOWamB8HymJ2Fo4oXzkpfQn/vRl+BO3Ks4QaN2JlLIz8+
         B0r8zY2UbwuVOiMzcffkJO1UGUteHdGq1ANiA5F+G8efBwKcaAbAISrW0/DtXgnvgw
         ebatyNG48zQVg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lKNxw-0000PX-4t; Thu, 11 Mar 2021 17:15:12 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Michael G. Katzmann" <michaelk@IEEE.org>,
        Charles Yeh <charlesyeh522@gmail.com>,
        =?UTF-8?q?Yeh=2ECharles=20=5B=E8=91=89=E6=A6=AE=E9=91=AB=5D?= 
        <charles-yeh@prolific.com.tw>, Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/5] USB: serial: pl2303: tighten type HXN (G) detection
Date:   Thu, 11 Mar 2021 17:14:50 +0100
Message-Id: <20210311161451.1496-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311161451.1496-1-johan@kernel.org>
References: <20210311161451.1496-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tighten the detection of the new HXN (G) type instead of assuming that
every device which doesn't support the old read request is an HXN.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/pl2303.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index cd2acd8c5246..e742187c8a7f 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -374,12 +374,22 @@ static int pl2303_calc_num_ports(struct usb_serial *serial,
 	return 1;
 }
 
+static bool pl2303_supports_hx_status(struct usb_serial *serial)
+{
+	int ret;
+	u8 buf;
+
+	ret = usb_control_msg_recv(serial->dev, 0, VENDOR_READ_REQUEST,
+			VENDOR_READ_REQUEST_TYPE, PL2303_READ_TYPE_HX_STATUS,
+			0, &buf, 1, 100, GFP_KERNEL);
+
+	return ret == 0;
+}
+
 static int pl2303_detect_type(struct usb_serial *serial)
 {
 	struct usb_device_descriptor *desc = &serial->dev->descriptor;
 	u16 bcdDevice, bcdUSB;
-	int ret;
-	u8 buf;
 
 	/*
 	 * Legacy PL2303H, variants 0 and 1 (difference unknown).
@@ -394,20 +404,18 @@ static int pl2303_detect_type(struct usb_serial *serial)
 		return TYPE_H;		/* variant 0 */
 	}
 
-	/*
-	 * Assume it's an HXN-type if the device doesn't support the old read
-	 * request value.
-	 */
-	ret = usb_control_msg_recv(serial->dev, 0, VENDOR_READ_REQUEST,
-			VENDOR_READ_REQUEST_TYPE, PL2303_READ_TYPE_HX_STATUS,
-			0, &buf, 1, 100, GFP_KERNEL);
-	if (ret)
-		return TYPE_HXN;
-
 	bcdDevice = le16_to_cpu(desc->bcdDevice);
 	bcdUSB = le16_to_cpu(desc->bcdUSB);
 
 	switch (bcdDevice) {
+	case 0x100:
+		/*
+		 * Assume it's an HXN-type if the device doesn't support the old read
+		 * request value.
+		 */
+		if (bcdUSB == 0x200 && !pl2303_supports_hx_status(serial))
+			return TYPE_HXN;
+		break;
 	case 0x300:
 		if (bcdUSB == 0x200)
 			return TYPE_TA;
-- 
2.26.2

