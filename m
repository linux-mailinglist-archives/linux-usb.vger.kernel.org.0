Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8792A9663
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 00:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbfIDW1S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 18:27:18 -0400
Received: from mout.gmx.net ([212.227.17.21]:45181 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728008AbfIDW1S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 18:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1567636034;
        bh=vAryvW+pefoCrLy3Qh08VuWFZtfZw6PRqvzPl8aCHC4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Mm6oMITImjzu0LzZKsx6vx27J61lySZ3DfE7r3VVU529mgAwWBOVs1ho/cz9ramG5
         e1m35mg0cNeNuGIFIrB1UqnW/mdgtIBMdrwelQe/xvtS4S7zAiZXKPXQZPdBWf0Otb
         IPZ2kQdX2N9FQhKNifLuAgRv4uLR3BZcx3VgFcU4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([212.51.155.56]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M6UZl-1i3gsK47o1-006uql; Thu, 05 Sep 2019 00:27:14 +0200
From:   beni.mahler@gmx.net
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org, Beni Mahler <beni.mahler@gmx.net>
Subject: [PATCH] USB: serial: FTDI: Add device IDs for Sienna and Echelon PL-20
Date:   Thu,  5 Sep 2019 00:26:20 +0200
Message-Id: <20190904222620.23618-1-beni.mahler@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EXQ8ow8iW01FsesnbFoMjzIySEBZxlD9o4Z95lytkw44P05oio8
 xPMzzfYB5i//zzgvVOzaHPzarwhGyfdNDA6ohApzcl2jUwmmhA6Fl5LJMKB+0RFW4/9WzD/
 YJS3sNgC1Z3WFBT/LVVmtBPEokvoyC67mGR9W3o3+DxdjZ1l3nMUVGj/ndvteCSEnY0M7Qy
 2m+nDr0kuxA1HMDVhS4Qw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xjjoQCdZSCE=:fVviWa6YRjl3+hOgbdd2x9
 2Fnu5gMsFbDn6iNWcOkTDP5V1yRIxghUMwkbSf0E9joqAtX4QQwjCDwV3qmV6KlIc+K8rgcRi
 sYLzr5ah3qMD0zslzLVueL3+TOug1ycFdPm22QoYTqvKWPpuwMIa/gdo4VWsQmCN8jZjlnOEd
 4tKw1C57rT/OKFrnjYacWQQwq3Xgyk+tgh5gUn60xvN4SqZlLyGsWeV1jjcrJtqsxeGiwgIfK
 VM4/kamGQzl6Ykx78uIVpVH5rprB/Lw1Sq5ks6JlF6M+AS+MbRJslFF8eF7vMSJwRD88kxk8K
 Qn9UPJB2iocxyib+vnCYlXeq2sKVuLLsComffRchfY7RiIGG83vWHYlkHaECkbCUqr0NjZIWu
 wh7GC75jXTPTQh20FP14UPo/KdJfD17DiIZOswpLqOiTzcKLnSCuDcvlxFD6wr2HUEYFCZIZX
 FvQ+zWqkcG1zNTxEfEEpSLtfWBZYq9gkQS8pFMj1wNIAKnOZFK3kRUIA2qP4+eQLE/w+nucQz
 9fXuWlSu+yD9Htbrn3dfUhL8bNsVGvG8jzy+yUW7n241O7vP77zgF/3OrhKLOyVttBpEwwe/1
 CZFwQqbp585dhKeSgYWjkuO84hILaCiBg1VVuqCwVgme0RKdb0k/HwkaCJbWy+vwKdLQKYCm4
 b2WIciOXAlHeLpu7cOeMBu1uzay72+VM4CX9v8XHqSTBsHIzaNLb55HzxhPuIksImSOXfrF2C
 jmyv3ox+HQIfEg4uoN/u019a7jP92LRFMEshHs0SHcZpcBRtuLTj4MovnPIfTnfI1psU78pIy
 nHAqaASLJtQ5Foz0kpX3sAUa6cx0sBXQWw8QwQmYWAa3+zfJ51YdTL2NJjSAIA1ugj6ELaIXE
 tPRWPgZlpeiDZW//64JS4RKnscP/5cU+qFSoRjwOs5YRN9xbgnLkZnoXcnxLTDKIqOMyey6BF
 TyubE5BMCWelYQq9Kbv7VhUZQ4h8HTWMNeDU5kSq36B26SU2kQTNbVpvS07M+qL28vgaeFA/S
 S1uDjb3UyOergjdMXap7e9obSOPfDVsLVrV3kDLzrosb2l5UYoe1AjHQK6IavzxZvCiBHWroU
 9BOwOrPOt0+2kY+pfo/L3OaHg98eZKrs4DkP7geaxcjBaszp9uBYGw5vWMNqwNAD7XxUHo1jD
 k/XJI6Wr0AJLaxs79mo5BMFJhsjccs0fRca8XssxXGhwOHngYR9sfTujgHpzvIwl17nJ+OvnY
 k7/Z3iLk8LZPPJ0VH
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Beni Mahler <beni.mahler@gmx.net>

Both devices added here have a FTDI chip inside. The device from Echelon
is called 'Network Interface' it is actually a LON network gateway.

 ID 0403:8348 Future Technology Devices International, Ltd
 https://www.eltako.com/fileadmin/downloads/de/datenblatt/Datenblatt_PL-SW=
-PROF.pdf

 ID 0920:7500 Network Interface
 https://www.echelon.com/products/u20-usb-network-interface

Signed-off-by: Beni Mahler <beni.mahler@gmx.net>
=2D--
 drivers/usb/serial/ftdi_sio.c     | 3 +++
 drivers/usb/serial/ftdi_sio_ids.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 4b3a049561f3..e25352932ba7 100644
=2D-- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1030,6 +1030,9 @@ static const struct usb_device_id id_table_combined[=
] =3D {
 	/* EZPrototypes devices */
 	{ USB_DEVICE(EZPROTOTYPES_VID, HJELMSLUND_USB485_ISO_PID) },
 	{ USB_DEVICE_INTERFACE_NUMBER(UNJO_VID, UNJO_ISODEBUG_V1_PID, 1) },
+	/* Sienna devices */
+	{ USB_DEVICE(FTDI_VID, FTDI_SIENNA_PID) },
+	{ USB_DEVICE(ECHELON_VID, ECHELON_U20_PID) },
 	{ }					/* Terminating entry */
 };

diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_s=
io_ids.h
index f12d806220b4..22d66217cb41 100644
=2D-- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -39,6 +39,9 @@

 #define FTDI_LUMEL_PD12_PID	0x6002

+/* Sienna Serial Interface by Secyourit GmbH */
+#define FTDI_SIENNA_PID		0x8348
+
 /* Cyber Cortex AV by Fabulous Silicon (http://fabuloussilicon.com) */
 #define CYBER_CORTEX_AV_PID	0x8698

@@ -688,6 +691,12 @@
 #define BANDB_TTL3USB9M_PID	0xAC50
 #define BANDB_ZZ_PROG1_USB_PID	0xBA02

+/*
+ * Echelon USB Serial Interface
+ */
+#define ECHELON_VID		0x0920
+#define ECHELON_U20_PID		0x7500
+
 /*
  * Intrepid Control Systems (http://www.intrepidcs.com/) ValueCAN and Neo=
VI
  */
=2D-
2.20.1

