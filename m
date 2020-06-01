Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF901EA15D
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 11:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgFAJ4m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 05:56:42 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:11760 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgFAJ4m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jun 2020 05:56:42 -0400
Date:   Mon, 01 Jun 2020 09:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1591005400;
        bh=l+BzO1Y1A8gaXjDbi90x/KmNbS1CR38bHsjNIj9ik9g=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=cVNLhbJb+MGrqaI3edmD3PAulBIAJEpfKYH2uc2wApUz25syZ+EdkBNnWJx9jTlTs
         uFYgJQihQ2pALI5QWLA1ZPGXGC1mjA1SAcFthoorvM0XtvDbc55I3+edPJLN121P4z
         SOnME/Rcn61SXsKXwQGLD8hnBNdYAQMyRtuqET/U=
To:     linux-usb@vger.kernel.org
From:   Rob Gill <rrobgill@protonmail.com>
Cc:     Rob Gill <rrobgill@protonmail.com>
Reply-To: Rob Gill <rrobgill@protonmail.com>
Subject: [PATCH] USB: core: additional Device Classes to debug/usb/devices
Message-ID: <20200601095615.22966-1-rrobgill@protonmail.com>
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

Several newer USB Device classes are not presently reported individually at
/sys/kernel/debug/usb/devices, (reported as "unk."). This patch adds the
following classes: 0fh (Personal Healthcare devices), 10h (USB Type-C combi=
ned
Audio/Video devices) 11h (USB billboard), 12h (USB Type-C Bridge). As defin=
ed
at [https://www.usb.org/defined-class-codes]

Corresponding classes defined in include/linux/usb/ch9.h.

Signed-off-by: Rob Gill <rrobgill@protonmail.com>
---
 drivers/usb/core/devices.c   | 4 ++++
 include/uapi/linux/usb/ch9.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/core/devices.c b/drivers/usb/core/devices.c
index 44f28a114..2ef50a1d4 100644
--- a/drivers/usb/core/devices.c
+++ b/drivers/usb/core/devices.c
@@ -133,6 +133,10 @@ static const struct class_info clas_info[] =3D {
 =09{USB_CLASS_CSCID,=09=09"scard"},
 =09{USB_CLASS_CONTENT_SEC,=09=09"c-sec"},
 =09{USB_CLASS_VIDEO,=09=09"video"},
+=09{USB_CLASS_PERSONAL_HEALTHCARE,=09"perhc"},
+=09{USB_CLASS_AUDIO_VIDEO,=09=09"av"},
+=09{USB_CLASS_BILLBOARD,=09=09"blbrd"},
+=09{USB_CLASS_USB_TYPE_C_BRIDGE,=09"bridg"}
 =09{USB_CLASS_WIRELESS_CONTROLLER,=09"wlcon"},
 =09{USB_CLASS_MISC,=09=09"misc"},
 =09{USB_CLASS_APP_SPEC,=09=09"app."},
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 2b623f36a..456ab0c2b 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -326,6 +326,10 @@ struct usb_device_descriptor {
 #define USB_CLASS_CONTENT_SEC=09=090x0d=09/* content security */
 #define USB_CLASS_VIDEO=09=09=090x0e
 #define USB_CLASS_WIRELESS_CONTROLLER=090xe0
+#define USB_CLASS_PERSONAL_HEALTHCARE=090x0f
+#define USB_CLASS_AUDIO_VIDEO=09=090x10
+#define USB_CLASS_BILLBOARD=09=090x11
+#define USB_CLASS_USB_TYPE_C_BRIDGE=090x12
 #define USB_CLASS_MISC=09=09=090xef
 #define USB_CLASS_APP_SPEC=09=090xfe
 #define USB_CLASS_VENDOR_SPEC=09=090xff
--=20
2.17.1


