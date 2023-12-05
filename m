Return-Path: <linux-usb+bounces-3752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A012B805F0F
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 21:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14621C21088
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 20:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DAD6A32E;
	Tue,  5 Dec 2023 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="i02+k13U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA60188;
	Tue,  5 Dec 2023 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701806764; x=1702411564; i=wahrenst@gmx.net;
	bh=LHPm3I7nooBOlcBz8F69INMnOtFEIJsNvnQM9Izw8DU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=i02+k13UtU7a0JHg5v+AD5moQwYjvQYphhOS6/AwRz8xyreW437vBeMjdrLOXRwP
	 T9B9NvIhopdLghJ6bbLBZIAU9BgHQbrxxtQFFXqNTMMMxFA3TJgIoEBX0J1EutLTq
	 FHQ3I2hQXrEW1b8AwxaNAixZTgyHfiZF3YmafdnYUDbJHIpBbWbeQJeiCcZ8MthGQ
	 VIdpwgHN3jrL/h8AHcIcqOYJMgScmeMGtcTFzlxJDpaQOcTQmWVvVmKyZF5e5wuyl
	 Tjk93SDCTEYRdGvDGnofem0XtPHv/Q2IBKMwlVWBTKZXrjFc8zlHZ+gAin+AH0+me
	 HIV7548YWWohEr3qVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWAOQ-1qlz973nBa-00Xfyl; Tue, 05
 Dec 2023 21:06:04 +0100
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
Subject: [PATCH V4 2/3] usb: xhci: xhci-plat: Add support for BCM2711
Date: Tue,  5 Dec 2023 21:05:30 +0100
Message-Id: <20231205200531.8232-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205200531.8232-1-wahrenst@gmx.net>
References: <20231205200531.8232-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:420IXGJA06Rwq+/YHyemwyWUyz+qWC9Im4mIVa8Z6lH5tMoyb0y
 LMFq9pmobXtyh21DasfvyvboZzzuowkB7xAuZLfSRQxd1PNovnq2p+2nXtpXZDw0XXY7vYz
 985I502A7J+I6BnJrSckgZnFAdeEjL0i6ZxIAtz44r4zFaE8UPsHw98A1pHD8meDPlxG/n5
 1P3NhyjI/RsA/et68HA2Q==
UI-OutboundReport: notjunk:1;M01:P0:p4MNwTApCds=;gjizWBuFKvcwqPTnqFsiloE4hba
 IhwEQiUXi2iW3G8K4H0Qe3T9stZ3jVtVRXqyL/ZhFyTpO+dvDkDp4K19Kc3i9GnPjcSuUDk+U
 6I9iZk/VQnQ6+4vojEWEPFzybUxYm9Dh76PFaap42KJpZIj90uiWCnYqFFjFPz8zcE9A0dCwH
 gz86Z/hJllYuevBDACAxQO/xmSW5XMMIVrBbaz5tuEdKKntd39aauG7S3RAjIHHDVaY4wn7Ep
 15Sw0cKKDQRPBHspoEIL2UBvMujlTR2PN2g9S3Ay6D1SUz+jQVKm6/KbtBGhn9bIuaY0ZUg9O
 0AarD9ibEvBvhSRCURraIgtXXVQsvtwQbhpEf9uWJWEjEvtRrr68PJpW+Wfdoa1Dn2KWcY4MV
 4NdzcfH7TRFi4R7qsjeyn+WmPBXB3G7wUoA7UqqWZnSLtGiSnFiG5Y++EzHQzw9fwz9LrH7jw
 qUcgWaLxPQpAYzO/AgytN9+a769kt9CUafy5au36+nWpTB6nENjJMTkfjlQzEjIqcYamUPy33
 DviJYbWkztF8EtYgci4WaFU549zuv2eBaUaQOici7pamQdaiaS3eCwJY0U/8vzK2UtzFpL+dp
 jCBHVLNdHzEoZ6XW2nWe0ea8igGCxhFv2HWUtI+J9BmgeLwp5J/aBf7Dir76kexIG/9SvOV8M
 6ON91YD/PxKEDyEtzhS0g6Sb0KM5JcRCUoI2STElIwhWzGqegANEUhyZ+G/gOgsHkL5uGKgxj
 r154V7x0FlUNxTqdJEW5UiIx2/PItJAZyLvqNbE5FHz59AOe7zHOyOiVFsORWONKQfYHQYGkQ
 gLz00vByNGpwCkPwqj/9d1g/q1DSYVoD2cp67ANiW2WLBok3adiuTjrOVnoZIGgOmFr4adoZp
 liOcePfB3wKF+JM+ktDwXiYvvSnXbKCBF5tfqaZuW7dDFhi/TPlDb4dNTTzjSXkUCB7hGe1yY
 mxiOCcjk8TjATrfABNZVqW8rDH4=

With the introduction of a BCM2711 specific compatible, this also
needs to be added to the xHCI driver.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b93161374293..bc5e8f4cdadf 100644
=2D-- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -129,6 +129,9 @@ static const struct of_device_id usb_xhci_of_match[] =
=3D {
 	}, {
 		.compatible =3D "brcm,xhci-brcm-v2",
 		.data =3D &xhci_plat_brcm,
+	}, {
+		.compatible =3D "brcm,bcm2711-xhci",
+		.data =3D &xhci_plat_brcm,
 	}, {
 		.compatible =3D "brcm,bcm7445-xhci",
 		.data =3D &xhci_plat_brcm,
=2D-
2.34.1


