Return-Path: <linux-usb+bounces-3601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847E801FAF
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 00:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446B9280F6E
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 23:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76D8224CF;
	Sat,  2 Dec 2023 23:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="XtJce6lW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3ECEB;
	Sat,  2 Dec 2023 15:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701559376; x=1702164176; i=wahrenst@gmx.net;
	bh=LHPm3I7nooBOlcBz8F69INMnOtFEIJsNvnQM9Izw8DU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=XtJce6lWzCvVKTYiPbVMXRWKM1yu3ah7RMzdQVdKXnkWStdvjnmaEPyrbULtVi4C
	 ZwjWvHgC1G5r7zbds5D4rLCZLBnh6T1jcj1TIk7OBGy9fQfdV0HYgg2Nrhhj6Tlfg
	 wqO1AKUFPmAjT0YXKlxFQM6RvZfWQ1Kr4ETSUoXl0qEluJVUG9SavRolqqJMsok7P
	 iJi1PJVV6P21fc9+NOzNohbQSCTQehRGLg+kHU0CT6VuYLRkMbI+TrjmT3B3nqM38
	 EVWIMr7xuWAvAzVy2I/4fRJ8VR2Xixk/YKjUqTcl9FYIJ92mMaa2SvqwfTQrEMqQm
	 yHXgzSLGwFQDQPBK+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowKi-1rcWA22qSs-00qW9U; Sun, 03
 Dec 2023 00:22:56 +0100
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
Subject: [PATCH V3 2/3] usb: xhci: xhci-plat: Add support for BCM2711
Date: Sun,  3 Dec 2023 00:22:16 +0100
Message-Id: <20231202232217.89652-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231202232217.89652-1-wahrenst@gmx.net>
References: <20231202232217.89652-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jkod35pfP6IVT1yPHy/ubfhNbuOWfZ6zrF8jvxn8h1WGUukJjJY
 vq/WkDTfelW1I6VKTTJWrECtAyZnWCgqYbF2h9p6ZzseuHAO7DSTR26Xhe+BLpAmarmg/u7
 S789n7ALXaerBd8jmUqeqbuTYrkrXlWQqRSw1hlIXFr7kxio1q9Lo9qL1ghDnpeAjjz7GEr
 bUn2YlJ8P++b3o3Vk3PnQ==
UI-OutboundReport: notjunk:1;M01:P0:fqSH4xPEJco=;Gtr7IbXbVd8KI02Gb8IvHelltEh
 uM+CpcK/K/V6VUyupxnebvUXT0k4OONrj48Wfr6VZItTdb7AT+xpLlXA8c9WJIsR4BCQX6Syj
 peopkFD5eWD9v5TchOkFo4aWbkB9tIdfS+mMAp8yFNpN1oxcxdaWYqxVdWRA8iSPb1YRybXs2
 OcPHg3dSfUA7LTDRV3Bj0eaZHMSHM3KHkHRQ6nZZTqX/SmdNRMTP7Rt0dzq/5Ry/Ksiak/vA0
 gTL1pSG0K3AWHSWjBNqU0qkhxYEq+oQuRMCmEo+pHNZtWATCAC+nVuF1+LxAh+nHfJ3ePVvYm
 3Kkeuv+pfNk8nDldDtzwcrJXTA8DSvd49axfK5+m8csSyNi6YS7OekFt8ktyWL0SHoWfVhUej
 woHjnQ/QfmZwXj1HfpLd9rbHIAnuyXb7uHsdJW1i6IO7EK988D/snJPKh7AB+HzQp2+9ulBpm
 vfQvKvTWSYdGBKFkOrOk2Rtriu8sWD2fYlHH4GGmVHnIQQLK81hWkvGqKAUTmQLaH81gr4JNb
 Q+QU4kZmSMYfTyLlM/s8AvZ6lrUbpfMaqwc0tRuvrAvr6jfpjwKvPsIXHn+cjgiVEfdSWhz8j
 JcU405pS4OE9PLKXasz2LvKczU1OxqldzIUrNgZnQjv1yIxPsRhDto4G0lLgI8ryj7EAc1nfJ
 /Q6F1eOoS4bMmFZP9Gdr9kS4Dem5YxaIL3dAtw2BWAUsyrWPiKGTmnvo3I62TovYS7d+Ng7YA
 5V/MW9BSkZHOO7oCk7WeBPwDocEPkwS/0qIyUfKcDcrM2T3hdlsBF8ZIsYuEDrFD2zsZqMjw8
 JxKUASRpY+jGeNGOQ2LqC8liy0sXhjRzl7kHUKBjhaOJiRZRxdqYsroFTRyEW92ulpQ3AbNGk
 jogubfreDDxBfpfHuiwi1D176LcrruClt8Sw57ZdvIvXpdyeke4pDPgbVw2d3G7xjZbC3O3V0
 qVKNoA==

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


