Return-Path: <linux-usb+bounces-3321-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90927F9114
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 03:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9438C2814B3
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 02:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F5023C1;
	Sun, 26 Nov 2023 02:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Xz+Q6Xfs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979D811F;
	Sat, 25 Nov 2023 18:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700967407; x=1701572207; i=wahrenst@gmx.net;
	bh=eZ6xuOR9KsJjzE9TJhEPlzg6rY8M8dZ0jHI2v3+5O8Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Xz+Q6XfseVYGkViydcymyPEtm345vJxqxYIJT/fWE75QRinYiIISoHmvf60jZrTc
	 cZH9U0xrxm+G1ItcAZVlo+hzTW2XS1h7Z5jUv4JSc7T/AZTNQ72ITnp0hvkIF0ezc
	 fegTU/CUaspueg9//fyKRJS/dYc94S7RNspZAiIgLQ5gdj6diFuqMC2YEPUFMs/Ud
	 0hs37+y7PjzDppXd97A7uxJjO8D67Ew0UV4HBoWY4vszRFVFfBvWSEs19G5D06W1M
	 LAPhJ8qYBAA+t7Ghrl+dZnPGGjoas+TUTG/Z25iSwrpHGuib/VOZY76Bpe5Sq/ISZ
	 pqy7JU2uEX4hF4FMSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrhQ6-1rcnVL2XY4-00nhbX; Sun, 26
 Nov 2023 03:56:47 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Cyril Brulebois <kibi@debian.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 3/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Date: Sun, 26 Nov 2023 03:56:12 +0100
Message-Id: <20231126025612.12522-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126025612.12522-1-wahrenst@gmx.net>
References: <20231126025612.12522-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SW6X2kYT944c4hEQnaNDU2UYHD7RGQ8PiLdBSZKTTcz9xFxb4Fu
 YEZV9dorpXbXIGJ1TD5vSF8J9wWOeVCt+GI60DcccHVsUZSMYUxIxjtCOcgQ5t49tcaRnjO
 0LtALyhA/m8ZrHol3VIqqleOtllZPO8yVTn3Km6FXqpBvna7LqMVHgkEZ41m4bG0V4qxFjc
 uzxsh27/bywsu+RzB6dEQ==
UI-OutboundReport: notjunk:1;M01:P0:V8ZDdUFvExM=;sdtdBO52CinYSAYGoFpWO+1TAHy
 KusDi0LIxEx6SpFoGdsOuOqTa6m6oS5luXOZneGeL/Dug0nm+JhAzAYRxjfj3e0SmxZXns366
 hM85SIoU4s4+Y0hwG2vllv29nkx0HVBJGjyRyswNSNJ+/2pYAPxfoLUcWrg19NHI2dSgqQBVx
 0lDmFUE4gBk8RW9o7toAmMN6ywathaNqaVeGVAtbjEE/fIOSp4h/Ymtog1zZnDynE31tlMkWB
 KPRaSfl6JJksoBEiU77MF789fP0hxZzlpDPLl1bDaBwihwW0YQh/jEj/Vmj8ZserH3bMIqnPe
 4cObHWpbb8JliRYqNDsGyiYgz91MJcZNe870XD/rMDavQgDjEs/ip5JoW1nYjWqA4rWtA8cdH
 AEcmaybrPk73e3A5aUeVvtew0PffA4ice3Q5MvTP+vWk9xhYCXibjRhWB8N8reXzysQ/4rviw
 XlYoy9kuRjjexV1QPmPAjQ8iHIhQE4wD7FB7VRPJvU5E+1eub0X4xbF9pmFAGXx1XQIHagMFo
 K0TdwWtEuakXv4UjyHKcPz1g7Ycst9BNtRLPqsnPtP8bBH+h1VoCi3/ri7EOpYWPVYvg06KlR
 DZ+Z/XGceZC5tojOGFJANzFUB9I8SwbQquV2j09B9/UF8wgv2+KddOEvt7gyljjzZvF0Fo6Uv
 DfobAWLsAWxrfK05ysVUD04sga2zpUq5W5EZu5WNm525hUD+HIKipfJ6VhRsTFwWMAQIKRW08
 /8OKGw8ICAdban8irFFCuhNobeZIR3u3jh9ooohUqUYi9ytPnM1MTc0FH0HF25/lmcjcfUGFC
 sS9LgDSwVgiZLO/1KBP9uX6QPgawkoJjsdEa/HAn7/ftlr4KxNBtoeNgWwDbsU1HbTBMjaLh4
 3/seX1z3IyFylsKwtULPhqNCI15bE0Hpqf0LGUD1Q6g9LAUYwmyH0cdRvkHw7esTlJCZUkGjG
 Ki407bhAH/lCmisFhulWMLH4lX8=

The initial version of the bcm2711-rpi-cm4-io based on the
false assumption, that the USB host interface was connected to
the DWC2 IP. So replace it with the xHCI and get the USB host
running.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/=
boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index d7ba02f586d3..17e7c2235d09 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -2,7 +2,6 @@
 /dts-v1/;
 #include "bcm2711-rpi-cm4.dtsi"
 #include "bcm283x-rpi-led-deprecated.dtsi"
-#include "bcm283x-rpi-usb-host.dtsi"

 / {
 	model =3D "Raspberry Pi Compute Module 4 IO Board";
@@ -130,6 +129,10 @@ &pixelvalve4 {
 	status =3D "okay";
 };

+&usb {
+	status =3D "disabled";
+};
+
 &vc4 {
 	status =3D "okay";
 };
@@ -137,3 +140,7 @@ &vc4 {
 &vec {
 	status =3D "disabled";
 };
+
+&xhci {
+	status =3D "okay";
+};
=2D-
2.34.1


