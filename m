Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D11333D8BD
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 17:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238487AbhCPQI4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 12:08:56 -0400
Received: from bee.birch.relay.mailchannels.net ([23.83.209.14]:46301 "EHLO
        bee.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238485AbhCPQIg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 12:08:36 -0400
X-Sender-Id: dreamhost|x-authsender|smtp@contentfirst.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 15C0A540B08;
        Tue, 16 Mar 2021 16:08:24 +0000 (UTC)
Received: from pdx1-sub0-mail-a23.g.dreamhost.com (100-96-17-75.trex.outbound.svc.cluster.local [100.96.17.75])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 1A7A7541DF5;
        Tue, 16 Mar 2021 16:08:23 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|smtp@contentfirst.com
Received: from pdx1-sub0-mail-a23.g.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
        by 100.96.17.75 (trex/6.1.1);
        Tue, 16 Mar 2021 16:08:23 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|smtp@contentfirst.com
X-MailChannels-Auth-Id: dreamhost
X-Attack-Cooperative: 37225ae058bcc94d_1615910903762_2013249973
X-MC-Loop-Signature: 1615910903762:1786135020
X-MC-Ingress-Time: 1615910903762
Received: from pdx1-sub0-mail-a23.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a23.g.dreamhost.com (Postfix) with ESMTP id B1978801F9;
        Tue, 16 Mar 2021 09:08:22 -0700 (PDT)
Received: from industrynumbers.com (pool-100-15-209-187.washdc.fios.verizon.net [100.15.209.187])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: smtp@contentfirst.com)
        by pdx1-sub0-mail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 56A32866DA;
        Tue, 16 Mar 2021 09:08:21 -0700 (PDT)
Received: by industrynumbers.com (Postfix, from userid 1000)
        id B2E1D282ABB; Tue, 16 Mar 2021 12:08:20 -0400 (EDT)
X-DH-BACKEND: pdx1-sub0-mail-a23
From:   michaelk@IEEE.org
To:     michaelk@IEEE.org
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH V2 1/1] USB: serial: pl2303: TA & TB alternate divider
Date:   Tue, 16 Mar 2021 12:08:05 -0400
Message-Id: <20210316160805.937953-1-michaelk@IEEE.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Michael Katzmann <michaelk@IEEE.org>

Use an alternate clock divider algorithm and bit ordering for the TA and
TB versions of the pl2303. It was discovered that these variants do not
produce the correct baud rates with the existing scheme.

see https://lore.kernel.org/r/3aee5708-7961-f464-8c5f-6685d96920d6@IEEE.o=
rg

Signed-off-by: Michael G. Katzmann <michaelk@IEEE.org>
---
 drivers/usb/serial/pl2303.c | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 7208966891d0..bf5828579918 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -188,6 +188,7 @@ struct pl2303_type_data {
 	unsigned long quirks;
 	unsigned int no_autoxonxoff:1;
 	unsigned int no_divisors:1;
+	unsigned int alt_divisors:1;
 };
=20
 struct pl2303_serial_private {
@@ -217,10 +218,12 @@ static const struct pl2303_type_data pl2303_type_da=
ta[TYPE_COUNT] =3D {
 	[TYPE_TA] =3D {
 		.name			=3D "TA",
 		.max_baud_rate		=3D 6000000,
+		.alt_divisors		=3D true,
 	},
 	[TYPE_TB] =3D {
 		.name			=3D "TB",
 		.max_baud_rate		=3D 12000000,
+		.alt_divisors		=3D true,
 	},
 	[TYPE_HXD] =3D {
 		.name			=3D "HXD",
@@ -618,6 +621,46 @@ static speed_t pl2303_encode_baud_rate_divisor(unsig=
ned char buf[4],
 	return baud;
 }
=20
+static speed_t pl2303_encode_baud_rate_divisor_alt(unsigned char buf[4],
+                                                                speed_t =
baud)
+{
+        unsigned int baseline, mantissa, exponent;
+
+        /*
+         * Apparently, for the TA version the formula is:
+         *   baudrate =3D 12M * 32 / (mantissa * 2^exponent)
+         * where
+         *   mantissa =3D buf[10:0]
+         *   exponent =3D buf[15:13 16]
+         */
+        baseline =3D 12000000 * 32;
+        mantissa =3D baseline / baud;
+        if (mantissa =3D=3D 0)
+                mantissa =3D 1;   /* Avoid dividing by zero if baud > 32=
*12M. */
+        exponent =3D 0;
+        while (mantissa >=3D 2048) {
+                if (exponent < 15) {
+                        mantissa >>=3D 1; /* divide by 2 */
+                        exponent++;
+                } else {
+                        /* Exponent is maxed. Trim mantissa and leave. *=
/
+                        mantissa =3D 2047;
+                        break;
+                }
+        }
+
+        buf[3] =3D 0x80;
+        buf[2] =3D exponent & 0x01;
+        buf[1] =3D (exponent & ~0x01) << 4 | mantissa >> 8;
+        buf[0] =3D mantissa & 0xff;
+
+        /* Calculate and return the exact baud rate. */
+        baud =3D (baseline / mantissa) >> exponent;
+
+        return baud;
+}
+
+
 static void pl2303_encode_baud_rate(struct tty_struct *tty,
 					struct usb_serial_port *port,
 					u8 buf[4])
@@ -645,6 +688,8 @@ static void pl2303_encode_baud_rate(struct tty_struct=
 *tty,
=20
 	if (baud =3D=3D baud_sup)
 		baud =3D pl2303_encode_baud_rate_direct(buf, baud);
+	else if (spriv->type->alt_divisors)=20
+                baud =3D pl2303_encode_baud_rate_divisor_alt(buf, baud);
 	else
 		baud =3D pl2303_encode_baud_rate_divisor(buf, baud);
=20
--=20
2.30.2

