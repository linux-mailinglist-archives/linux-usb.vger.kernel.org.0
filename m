Return-Path: <linux-usb+bounces-12506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3593E4DD
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jul 2024 13:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56EBB1C212A2
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jul 2024 11:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178F33B78D;
	Sun, 28 Jul 2024 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Xu5kWRqV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34033612D;
	Sun, 28 Jul 2024 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722167148; cv=none; b=J1zES183+Sf9I6VAv9L0MLrFPq6NmcnBoGVVsgvhfawjWfoqTUj2+YNY8BCy7/1oyjJMXnOOxvtu1z+Xt1kSNaTF08mF2XbqAWWinacBDzN1MmmDUUiwSoVj995dai/VxTVYWyPCZGGJ0GXGl6xV232PA4d+POoTrub4onN+riQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722167148; c=relaxed/simple;
	bh=ISxvk9rwuZkzXR9ajw4RF54PD3mU7vO9Bu+n4+PU2l0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lf1KPmhs0X+1omMkrOGmViQEUEJoOZasBGCaT5dvNFKgixFtQxN7bt2fsNwGuuErpjuGXOpNXlaWQwC3t4ITwHQ8dXdrRLQwRgFbi9kDhRNvfR4incmyDYU4S5Z+GSojc+5FFj0yCd7zTaAUJJUsXLpddyn3zMsMgre6DxR8fJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Xu5kWRqV; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722167115; x=1722771915; i=wahrenst@gmx.net;
	bh=4q82fafFyhWuE8D9fKAnSbhAEbmOAflZeVN6dmlZRD0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Xu5kWRqVwRMEHm/f8hCDK1d+uoV2kYeXxQv8i9nSnyXZfHNWFFcUhtvRmypUy3+i
	 WupDtA3vBAqyx7dlVQDHQ9dInJSmfOmYyI6hLBBT3xcCAuvbNSonBHVBxWxyz2vU8
	 CBxfxJTqgs/L1B91WKf8of3Mxbbba5zbH9CFeGsqUe38mtEi6tbeHORu9o1sng5j8
	 6rLdGvCEYg6f/Lbkh47qmwH0fOCtTCWE4LGx14jTDCQrtIt934dTBaa0sdZ6SfbOE
	 0AlfOHKBzJ8MeonceBt1D/LE9MTYqSrckUGZ+ezRG4x/vQaE5gRsjvhaMi1mNjlCV
	 nuFyjM0qgyERE0Baqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1rzVnY3Ecw-00laEe; Sun, 28
 Jul 2024 13:45:14 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lukas Wunner <lukas@wunner.de>,
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	dri-devel@lists.freedesktop.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 03/16] pmdomain: raspberrypi-power: Adjust packet definition
Date: Sun, 28 Jul 2024 13:41:47 +0200
Message-Id: <20240728114200.75559-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728114200.75559-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ww2ImHiANw1KUG0kC6NCMNYw2JJ6/w2TlLV8iCX0cp1WhqnY1gf
 Lrt7Rel1WCNivDng91th4RxlDGK+MD84bbpqap26he9//LsKj8FW02IehVq7aIM7RY1iuQd
 5HxfVCxyLYAZflwkRNBYrC7kl0sMXN6RZClcV2ykSweCLdnMcrZtHDg1BiC88GRPcaQxwv4
 iKPV35Fj2K4jIbxgLcw4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xHBFILp2AVM=;AtBau9kAHDzAQN2vi/Rlk8IGZWV
 HgOSGiCxZyBnPoCAlxISFVgPBz4nxSq8OgmABAa56QPjAFV41F/7zbdYbcOdX7pDcpPz4noVk
 VIz2j7OsZJyAdhfoPPDcUTfT79NqmuCsn4Rz4k39rSIb+WQaggJLNgd8l+V9sxVtwhv1UBfjQ
 klXTFlTEHhh43Fu1lMDa2TsOCU0ffl3sSurCuLLfmb8jBe3Yz5RH2bAh/GB93DqNnpzYTa/rs
 GaS5DOcIuEaB3M0QKAWhPVaoj0BMuan8fTJKJIm841XXARfe2kOAUXcMvtnwS2d7aw3wX0POb
 inEwmjYM7EVFTIWZdsAvBj7w1L+jT3k1fIOnGFJitBe/RbumOGuxtRx+3ZHOA/TrwxRoK55JR
 CZdyQzLMxsxg51fctS9EbO8Kf/zt2Lcx8Z1AOXmmKLkjMNEfKjw3Kz2jnvAN0NarF9AUpsbxU
 S2BYtUj6VblFqAKhYpM2TdYLnwTHeqBKFsoL4qrNNO6XLaFezRc4W7pCX9VWBLaq0mIgMJHLx
 IPjQp/NoLL8lGLUlo80cxqU+Id6dJlcCrFaWZHN2ro1dDBYTgyLPhNJd0sWdJM47QFarEUQf3
 chte7qnERjYvtg98tk7rvr6ayaS21nsuex3SHfOLU3QZJiJDBdYakBWG5k3o5nUl4LYR07wmE
 zWWHCJNtTm37OfQM//ty6qfLLiD6PSu6kTUv0k+Py27HAqbL9W7CfY2/nc/MeI2v0a8Q8/4qL
 0VHWMOe+qhaP5wIavkG6eaM8V72d65aa+EK7dsYcLXTqlNaugjzqnw1D6Ts+PTs63XAhvzb24
 Y7s9H8wvrvMMjvWUUPaTDyow==

According to the official Mailbox property interface the second part
of RPI_FIRMWARE_SET_POWER_STATE ( and so on ...) is named state because
it represent u32 flags and just the lowest bit is for on/off. So rename it
to align with documentation and prepare the driver for further changes.

Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interf=
ace
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 drivers/pmdomain/bcm/raspberrypi-power.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/b=
cm/raspberrypi-power.c
index 06196ebfe03b..39d9a52200c3 100644
=2D-- a/drivers/pmdomain/bcm/raspberrypi-power.c
+++ b/drivers/pmdomain/bcm/raspberrypi-power.c
@@ -41,7 +41,7 @@ struct rpi_power_domains {
  */
 struct rpi_power_domain_packet {
 	u32 domain;
-	u32 on;
+	u32 state;
 };

 /*
@@ -53,7 +53,7 @@ static int rpi_firmware_set_power(struct rpi_power_domai=
n *rpi_domain, bool on)
 	struct rpi_power_domain_packet packet;

 	packet.domain =3D rpi_domain->domain;
-	packet.on =3D on;
+	packet.state =3D on;
 	return rpi_firmware_property(rpi_domain->fw,
 				     rpi_domain->old_interface ?
 				     RPI_FIRMWARE_SET_POWER_STATE :
@@ -142,13 +142,13 @@ rpi_has_new_domain_support(struct rpi_power_domains =
*rpi_domains)
 	int ret;

 	packet.domain =3D RPI_POWER_DOMAIN_ARM;
-	packet.on =3D ~0;
+	packet.state =3D ~0;

 	ret =3D rpi_firmware_property(rpi_domains->fw,
 				    RPI_FIRMWARE_GET_DOMAIN_STATE,
 				    &packet, sizeof(packet));

-	return ret =3D=3D 0 && packet.on !=3D ~0;
+	return ret =3D=3D 0 && packet.state !=3D ~0;
 }

 static int rpi_power_probe(struct platform_device *pdev)
=2D-
2.34.1


