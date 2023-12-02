Return-Path: <linux-usb+bounces-3603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3370801FB3
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 00:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8AFB1F20FAB
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 23:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B436224EE;
	Sat,  2 Dec 2023 23:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kR/a0TT9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80830118;
	Sat,  2 Dec 2023 15:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701559375; x=1702164175; i=wahrenst@gmx.net;
	bh=BCpo5tuHoZciK4BX0GFd9b3qF9Y6KHB/u2hvsaUQTOk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=kR/a0TT981RvoGRWicKM5pmTfJtEa3uMXoFXn6Ox3gn13TIiVt+GlzrF96hz51Ov
	 /YI3luBzo3gE+rqz237fS3mTldsj6uUPbP/y2OCJCOAKR8QPiA0y/bGkonzfoiTC5
	 v7REN/Pm2IlGEx7d7MM42n+BOrBy5cHDIfCUjZ4LkFy90sRClA4QRd2zS5nFMHDey
	 zkMxny8qn2enBoZCx+DjfrDGy0A3LCEJmD5PCizi36KYUFGkRdEZhNahcGuzxQPmy
	 p8CbZwAfoPysL63GhjJVw17wIhVEfmniWdLYYe6ouiRa5nXfpfWi4IdtNi5PBS04g
	 eByj+QHghGzW7J+nFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzyya-1rW1tJ2znK-00x0PE; Sun, 03
 Dec 2023 00:22:55 +0100
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
Subject: [PATCH V3 0/3] ARM: dts: bcm2711: Add BCM2711 xHCI support
Date: Sun,  3 Dec 2023 00:22:14 +0100
Message-Id: <20231202232217.89652-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8n/wkLVVmr0wx6rXkhQjGhU+7R1ohZCIWNthzuk4gyQR/s1mnD9
 FjwiILbvc/+k8+HY9P5SbfdGBBpzgwXWzzuAD0BGieJHzGNckrS0rTb+sDy9EDeX7UVIfql
 MJy/HHOlbZw8tDaW+m2Mrs/rZ6Fwv4JaMNV1E9S5FexfFa0QIKfF0Y/zrE4vM3Dsxn9TlVq
 wqlsuheE/lkvZM+yhCaZA==
UI-OutboundReport: notjunk:1;M01:P0:KnPny017AyU=;OAsbnLSX7nVZBDqmjEzc6LJU5bg
 /NQdaq2S5Bl44YP6U+SJ/T5UjXQSkpFXxQkeIu0yF8lzWliVKFOucqeS/tWFDyoTjbTZ12BxF
 aOnUxHHOgd0bjNeq7L5nCeDvlRJ9cs7xP/y99HGlOL6yaTMiLKPv7tqAxem017tg7MVIAEO3k
 WGBNzxtVTvqfB5/xXFkAZEzuxJSLw+TMSiZ/K0fGJaAS2fc2X3T5bYP3xNeaxgEqXKp7Eywcc
 a0oBE0e/OseqzG9oof+QXdamwVj/JkQ77KopCidg798tV0anS3IrNJe6sq7fT9xRgoLwPH3Wq
 6Q8R95DUnT2pFyEgjkL0d92PiH+zOKIwyI07Y/WQ2geUorPxNdv/AHAfGf8SMzsJ+o56/vcQ1
 RIrEAnYAEuGsObc1Kqahvc19wkqWoZq1mlFV9FR3M/VjLFn8VOGjUnHrSoydN3K6AixAS0/aE
 Sb55XtQjfjE1+hZJU8htjls3Y3d8/SwDd5+9EgAV59PYlAVcnUlhrt2UbAm1h3uOnUTQ5qD3t
 pNftLFongnW5QUDJWsIU10YdPlhS2slpsJgpN03I1lFoApsqcmN0jxNkOwjz03whj5LCeOwc7
 S6GHS48x19Om8GpyMlnjrUx2UbjUJC0RI29FkorVP5Z0/rjWqIII6B7lhIExMMnB3ea44hbPN
 eaiBvJheDNzev7I51l9N3evfGan2kxFOZv99qfhrsBn+X5T8YhEHYuRm0A9LvK2nfs3dVV2Hl
 JqwguN/7twH4Dj4FvM+/PXSQ+q+fxi0V7JyzSYR5fckiEHV5Gao1LHvwybQR8yw7388HlEU5y
 lbfXpF87+rJRCzvhSfMdXXojZiYlVt8S1rsIHYvfuzMd9RtKL0JRBRU9DPkdxK/PLjm+AQdfb
 LHzuXRkHaQvz+YXMz2zjI/IjqoS1+QEu+is2X4ru5n8lu6TYd1VynB+FViNi/T8sX5smdBrxy
 K8pkgUmk3mQv104yQwpAIJmjZBk=

In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
does not have a VL805 USB 3.0 host controller, which is connected via
PCIe. Instead, the BCM2711 on the Compute Module provides the built-in
xHCI.

Changes in V3:
- introduce a new compatible for BCM2711 in order to make the
  power domain dependency SoC specific, which also results in
  a driver change

Changes in V2:
- adjust xHCI compatible as suggested by Justin & Florian
- keep xHCI disabled in order to let the bootloader decide which
  USB block should be enabled, which result in a drop of patch 3

Stefan Wahren (3):
  dt-bindings: usb: xhci: add support for BCM2711
  usb: xhci: xhci-plat: Add support for BCM2711
  ARM: dts: bcm2711: Add BCM2711 xHCI support

 .../devicetree/bindings/usb/generic-xhci.yaml | 21 ++++++++++++++++---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |  5 +++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi       | 14 +++++++++++++
 drivers/usb/host/xhci-plat.c                  |  3 +++
 4 files changed, 40 insertions(+), 3 deletions(-)

=2D-
2.34.1


