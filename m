Return-Path: <linux-usb+bounces-3320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7B7F9113
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 03:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68EFA2813C3
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 02:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8419C20FD;
	Sun, 26 Nov 2023 02:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="POHAHN5i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B331CC;
	Sat, 25 Nov 2023 18:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700967406; x=1701572206; i=wahrenst@gmx.net;
	bh=GwMSMRIBl0dS8/lr+DIi4fvWG05hs5Pe5BAgEXP3KdI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=POHAHN5iKuPk8flVakGqtuxPLfV0a0u+9BtXMEwAjokdvmXn0LcHuD7oZF9A9AG8
	 r7s8lYq7AfU45HCAvHoYe5uf3vPltF3kcpodMZe1WkJh5RgZp7IelQEjeHlQCTvg6
	 7/18ayU/EUwZ/u1MPKaQPr3VHYkmpsqS8xqzkma4HI0UMqo61lipUnc2YTFeWpOXE
	 9kYEr38AHW8FOOXrKRxRca7Nn9ptQK3sgd2bMmEb9fa6I52UsWlfV7e9HzOCeQqE2
	 +QiDddZbGbkPk380Zam2Q/AmUZs5hQRuA/IirtExwVGderkQ8rbHYoz76m8NUIwpM
	 Y4Bxmexq6s7pTRoHkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacOW-1rhniW2tqc-00cDfJ; Sun, 26
 Nov 2023 03:56:46 +0100
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
Subject: [PATCH 1/3] dt-bindings: usb: xhci: Add optional power-domains
Date: Sun, 26 Nov 2023 03:56:10 +0100
Message-Id: <20231126025612.12522-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:iSo8/g+H5fPCw0tSM30SDy2cubTX8GNjZIYrnrYYNVTssytWFnk
 smAx6MnxgUNPFXV18NAfiOVeLS3O+1QhrdpCBS0Ug4AF1rEjvpedKgGoWc0oF4T8gKPaD/b
 /r/9W52TNkHNRbK+qQwwQqy4ea/o6s3mza7/ml4MDyyIyMy1zB+4wN6xs4uq13jiwk8W1+p
 mPqx5Q0H7m5fNwlmOQoww==
UI-OutboundReport: notjunk:1;M01:P0:iF0hMRn/lnk=;bMhP748PEEMNePd3NvI6YNN9K+V
 Go72gVc0XOHsLyGUa/Cm8ZeH5mtGpZIhflmLFv3Zocp+bRqPqsrVQj8LmAE9i5Jtp7ZmC3YC/
 9nmUhhDbcl7Q1RJvguW+20Mlz9idlHIisFvGWVHdg7kAcv8VLTi3tq4DSW3t68yfsd+f66z29
 DcMfERFsgRkmNh7kFwD9OelM6MWiyXSjULe5vuan5IZbSioIMwY/LW8tUxUjqO9DPQ8tFQ83H
 frEtMFb16atg/5MV2BI9a7/g9Pxnz3bBwEt4aZSj0o21kIVt7ttAiIReWWv1hNhQWdsxCfJ+Y
 FibfN43/smy2nTwjgYcysm8NPUiQNKV8MPW/PJVPh9Qqaz98r2FwgP4QYpk+COPltBO3ugaBF
 OEs4AVe+ftJAp/CxQEdchR0Vb2FaJJqNTTaONuNqvXzpVl/LE/yvhfVzr5JpDfBHX9LHXjRgT
 nPqzTlO0mK7ixuSYJaqA/BlF5KpJpSnl9moQiLjRW5sWFbgPEgeTrnSciBcM2fDxCYXRvLWic
 9ge2/gRfGMxtzJTD+/OUin3ugKn76mLwnXHiC7lXAUYdVULECYEiFiJnuA4iS1ONxGe6Y3i0c
 3aJztaeezy4INZo11DgdjcDxXoqla1hooOOZZvOQ2ESXfegVe1Is/dcTG60Og+GNqkH8goEiQ
 MN7JHnk1JnI9QIoicY+cFLoNo/kFPhLeRhHXETXCLzR0XBh08tzRopOm5B8jvFWMhcWcJH0DY
 7fn+pjmLHrpiDaRwxv+KFzxnOLwjKN2dWVCgC60PeybdbpnvWQ8geXlhJg2GckPzrdKi3KXIl
 c7cq9JTN18zSkw+KjjaTkElIcfcjAGTIS5lHjiLYuUO69dzBrfNyQqhvz2ZEJ2FOQzd4pjYK/
 CUVCrUpg9zvAfNVUWOxv27YHNI/QtcLTHFkjTvFfPX26OG6+PI3IYB1qvbIR8j+ujhaKnIlNR
 Jk+Dbkx3eXMpudexctbKqhbSlhA=

BCM2711 SoC use a power domain for the xHCI. So allow supplying this
domain in bindings.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 Documentation/devicetree/bindings/usb/generic-xhci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Doc=
umentation/devicetree/bindings/usb/generic-xhci.yaml
index 594ebb3ee432..e48beaff7d0d 100644
=2D-- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
@@ -49,6 +49,9 @@ properties:
       - const: core
       - const: reg

+  power-domains:
+    maxItems: 1
+
 unevaluatedProperties: false

 required:
=2D-
2.34.1


