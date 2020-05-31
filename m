Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF311E977D
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2020 14:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgEaMXK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 May 2020 08:23:10 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:53615 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgEaMXK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 31 May 2020 08:23:10 -0400
Date:   Sun, 31 May 2020 12:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1590927787;
        bh=egPvcPe1XWwAh4CmFwzZbIH3e9JrY02XTGo7gFf/t6Q=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=BFCTuExlS5m4ovMAe/w1foXHNFdA7B90mcKkbpMq1G1IutrvIsDRAzsBF1paU6ry5
         UpRXmiP6mRbxQNM8dQTNyPDKQJnvnqno6p08uWDBaOMZK3sALmsi+/vq8+KalHXa6G
         YrXyLr8Ihr3OjybCDy76gAnHBimP2JlM2PIq9m3A=
To:     linux-usb@vger.kernel.org
From:   Rob Gill <rrobgill@protonmail.com>
Cc:     Rob Gill <rrobgill@protonmail.com>
Reply-To: Rob Gill <rrobgill@protonmail.com>
Subject: [PATCH] usb : Report additional USB classes
Message-ID: <20200531122226.23570-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changelog : Add #defines and strings for additional USB classes

0fh (Personal Healthcare), 10h (USB Type-C combined audio/video devices), 1=
1h (USB billboard), 12h (USB Type-C bridge). [https://www.usb.org/defined-c=
lass-codes]

Signed-off-by: Rob Gill <rrobgill@protonmail.com>
---
 drivers/usb/core/devices.c   | 4 ++++
 include/uapi/linux/usb/ch9.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/core/devices.c b/drivers/usb/core/devices.c
index 44f28a114..dda791e5b 100644
--- a/drivers/usb/core/devices.c
+++ b/drivers/usb/core/devices.c
@@ -133,6 +133,10 @@ static const struct class_info clas_info[] =3D {
 =09{USB_CLASS_CSCID,=09=09"scard"},
 =09{USB_CLASS_CONTENT_SEC,=09=09"c-sec"},
 =09{USB_CLASS_VIDEO,=09=09"video"},
+=09{USB_CLASS_PERSONAL_HEALTHCARE,=09"phlth"},
+=09{USB_CLASS_AUDIO_VIDEO,=09=09"av"},
+=09{USB_CLASS_BILLBOARD,=09=09"blbrd"},
+=09{USB_CLASS_USB_TYPE_C_BRIDGE,=09"bridg"},
 =09{USB_CLASS_WIRELESS_CONTROLLER,=09"wlcon"},
 =09{USB_CLASS_MISC,=09=09"misc"},
 =09{USB_CLASS_APP_SPEC,=09=09"app."},
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 2b623f36a..90f63f55b 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -325,6 +325,10 @@ struct usb_device_descriptor {
 #define USB_CLASS_CSCID=09=09=090x0b=09/* chip+ smart card */
 #define USB_CLASS_CONTENT_SEC=09=090x0d=09/* content security */
 #define USB_CLASS_VIDEO=09=09=090x0e
+#define USB_CLASS_PERSONAL_HEALTHCARE=090x0f
+#define USB_CLASS_AUDIO_VIDEO=09=090x10
+#define USB_CLASS_BILLBOARD=09=090x11
+#define USB_CLASS_USB_TYPE_C_BRIDGE=090x12
 #define USB_CLASS_WIRELESS_CONTROLLER=090xe0
 #define USB_CLASS_MISC=09=09=090xef
 #define USB_CLASS_APP_SPEC=09=090xfe
--=20
2.17.1


