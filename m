Return-Path: <linux-usb+bounces-26870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F049DB26B78
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 17:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07325A06EDD
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B82C1F8AC8;
	Thu, 14 Aug 2025 15:43:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0863515E8B
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.186.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186232; cv=none; b=bNYg/l7X5gq7j7DKxz0GUBjaTu0WfCSRMZFh3Jg6HwCheXnMnWXpKmXuuJem0KJ4pr++jpasCGoL9YPHmum0mSY6LkTZ+GRmQnAOrXXf1vAlVZD3WuDojSOUQt/rbK2AMAaMF4qABQ4f3447yfYCDzfVmeFRHXLqIkRb1ggibMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186232; c=relaxed/simple;
	bh=w3zq/1k9GyYvJOZbhj2W/kM/5cur7L6LHbOKR7YEiLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B5xeT3roqAir1/3ktsaqBzv7c3AyCNx1TCvHV4NOpsTd5PyvyShL2tME2TmeB4nDz9hDgYdZwUcmoOMQdiZvWJRUzWRnQCcNHtn/Mofq6UwQRwZkd7cr8dODLgkvf6z2vDNSXadXc/wj6tvIZ5n/67tSCvbJGM40qwv5g48Zj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk; spf=pass smtp.mailfrom=v3.sk; arc=none smtp.client-ip=167.172.186.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=v3.sk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 8B99BE0DE4
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 15:34:16 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id hA0hNPvMLJWH; Thu, 14 Aug 2025 15:34:15 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id C6847E0DBC;
	Thu, 14 Aug 2025 15:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mCE1iQu91H6J; Thu, 14 Aug 2025 15:34:15 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
	by zimbra.v3.sk (Postfix) with ESMTPSA id 96D0AE0DBB;
	Thu, 14 Aug 2025 15:34:15 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: linux-usb@vger.kernel.org
Cc: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] rndis_host: Flag Telit RNDIS modems as WWAN devices
Date: Thu, 14 Aug 2025 17:43:28 +0200
Message-ID: <20250814154328.250269-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Set FLAG_WWAN instead of FLAG_ETHERNET for RNDIS interfaces on Telit
RNDIS Modems, as opposed to regular Ethernet adapters.

Note that this matches on vendor ID, because Class=3Dmisc, SubClass=3D4,
Protocol=3D1 also appears to be used by some phones while USB tethering.
Previous attempt to fix the problem, commit 67d1a8956d2d ("rndis_host: Fl=
ag
RNDIS modems as WWAN devices") didn't do that, and it turned out to be
too ham-fisted and ended up reverted.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220002
Link: https://bugs.gentoo.org/953555
Fixes: 63ba395cd7a5 ("rndis_host: support Novatel Verizon USB730L")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
 drivers/net/usb/rndis_host.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
index 7b3739b29c8f..df205dbea89c 100644
--- a/drivers/net/usb/rndis_host.c
+++ b/drivers/net/usb/rndis_host.c
@@ -630,6 +630,16 @@ static const struct driver_info	zte_rndis_info =3D {
 	.tx_fixup =3D	rndis_tx_fixup,
 };
=20
+static const struct driver_info	wwan_rndis_info =3D {
+	.description =3D	"Mobile Broadband RNDIS device",
+	.flags =3D	FLAG_WWAN | FLAG_POINTTOPOINT | FLAG_FRAMING_RN | FLAG_NO_SE=
TINT,
+	.bind =3D		rndis_bind,
+	.unbind =3D	rndis_unbind,
+	.status =3D	rndis_status,
+	.rx_fixup =3D	rndis_rx_fixup,
+	.tx_fixup =3D	rndis_tx_fixup,
+};
+
 /*----------------------------------------------------------------------=
---*/
=20
 static const struct usb_device_id	products [] =3D {
@@ -666,7 +676,15 @@ static const struct usb_device_id	products [] =3D {
 	USB_INTERFACE_INFO(USB_CLASS_WIRELESS_CONTROLLER, 1, 3),
 	.driver_info =3D (unsigned long) &rndis_info,
 }, {
-	/* Novatel Verizon USB730L */
+	/* Telit Mobile Broadband Modem, such as FN990A (RNDIS) */
+	USB_VENDOR_AND_INTERFACE_INFO(0x1bc7,
+				      USB_CLASS_MISC, 4, 1),
+	.driver_info =3D (unsigned long)&wwan_rndis_info,
+}, {
+	/* Novatel Verizon USB730L, USB tethering in various phones,
+	 * including Fairphone 4 5G, Xiaomi Redmi Note 12 and perhaps
+	 * others.
+	 */
 	USB_INTERFACE_INFO(USB_CLASS_MISC, 4, 1),
 	.driver_info =3D (unsigned long) &rndis_info,
 },
--=20
2.50.1


