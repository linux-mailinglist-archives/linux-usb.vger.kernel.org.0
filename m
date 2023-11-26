Return-Path: <linux-usb+bounces-3319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7693C7F9110
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 03:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A87AC1C20AE9
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 02:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECBE186F;
	Sun, 26 Nov 2023 02:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oeVDF4oC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213BCAF;
	Sat, 25 Nov 2023 18:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700967406; x=1701572206; i=wahrenst@gmx.net;
	bh=J1gJcLMyXZ+FsOhBrNIdq8Ve8lUdV033prPLll8RRVg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=oeVDF4oChzX9TAVC0IgL2df7f7ZS/jTbE9rKV1cC79SBdU4LZ7vwBIIIx9ZJHYBR
	 4g8NICrcNyu1Re6FgJkWWXt2VhUBC/Gc2kUBMF6xS0q4fQY3YIEQET35ywWUBGU/M
	 203vyAn26lJ+X4MCKTJSREC1ga+0vhh0kuIp+o5vcTH9bt71otsqcn8La6jY2zON3
	 g+p7goh1mCEdRVP0+v5jxrloRoBcbR94eOYrQBdmIH5Nw5nt4solL6gmRfh3begaj
	 GvBKJKcCIg5upfepxE/dnpmaigtf39VFa1Z2Xu6LB3LlZxAjG7vQU5ABNXdw3C/DR
	 se/wV+g3GtpcACovDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw7V-1rX24b0tiV-00j3Ii; Sun, 26
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
Subject: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Date: Sun, 26 Nov 2023 03:56:09 +0100
Message-Id: <20231126025612.12522-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DbvfE6OS0wsWi/hPWyTyC8xb1OdJsIz+l8oKXEuXIAQstgFWCdb
 06XG05hErGWv0uFmQa/R7ZPVLHrkLAdHVpHZAJCNNpCuh9L/6docqFo0H60UxqMOE7qApm0
 RYzqzYxjtr82OYCvMXyFMzwDpNFFrbr7d1TWSzRlT1BCyABeakt9zCB2hJAW5wH8ACrkhXw
 5TapLmAu/FhkzrqrZ5gTA==
UI-OutboundReport: notjunk:1;M01:P0:M4FnxJ4ExmU=;A+iRm20MfmFSiYQtY7jVUlLzSe8
 gOPmgaOblLAtLF+e745WZYo+rFCpK7SRtcWBt7XmhM3rlaNUIE1SDY4riajM+9V3m6LnSyIXE
 4G1+YkP6wZSgEb2OF3TOMckvTeDXrKRM4OXJPhmj7Yw7VhP3CDpV2meWrNxLsC0LBzCG81OpJ
 jJcIRboUYLIPr6+yvzpdT4YoNQHfnT0CNL2/J6ADfXVk8Vc5mkxiUP3X7BAvvNgNPBtXlkASv
 6Barcqi08qDP9xR7ithRc0JzVvFAOigwd11qHgPCjaQvZbOlnN1WYbvJeL5c0l3ibQlUOGf7V
 3I2tfrMKELNrFICOuf/zMCJK0oFoDVPIFSPbBH/V0woUchHE0PxLcX0gLALOtpiGZmhwUyUDz
 Oh583YI1rcScbo/3AoYNWZhJZzHP5j6/ugb7jXSqTVUoB48hl03i4tCWk7F/Zp1DmjJjXi/ZU
 /lq4JEy1DPvgWFvxUqspoCHUy/lq6ZjUa18ByBYf2ppHN3PXsYtrVcx2nPdtgkfdZd8KN1leZ
 3/m7l+hUk+ltgRlRpabESEfROzpWKhOBrM/2wSzlGYBqxWpsHVvLGPjIcXE5a2hfim45aihLC
 T0dZfG+VHOFkgmwZ+Ed3v64TeMXSgcpiDMd0kPzDztFouWBuzERhM5z3IN7OPbkLAfrAeTqpP
 D064eC6bp6DuxTJLQV4xzW7QC1oSgPjC1/l79UVj7l+aWMgvF41gm3oMoPf8rX5meU9GtojN5
 5VY0/3bzgwOZP3rwymiF351LBMIhcZT95lC7zmMc3S1/UJbmuVktVqVGVXvHYd69dRqq66S7f
 fZjqzXC/HM/ZPiU7e4qmaSmvFRYX3oIR1XlkJj3CwZcaI0Q+ExhGkJhcX/4vI7qhKm86OxtrU
 +xKwnIcXoUiLwS7Hnwh29WNgF2mGcv3AppsMnFjeH9CahWu6aqC2LPnqFzBVAG9QoOXMA4dAI
 kpMm+A==

In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
does not have a VL805 USB 3.0 host controller, which is connected via
PCIe. Instead, the BCM2711 on the Compute Module provides the built-in
xHCI.

Stefan Wahren (3):
  dt-bindings: usb: xhci: Add optional power-domains
  ARM: dts: bcm2711: Add generic xHCI
  ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host

 Documentation/devicetree/bindings/usb/generic-xhci.yaml | 3 +++
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts       | 9 ++++++++-
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi             | 5 +++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi                 | 9 +++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

=2D-
2.34.1


