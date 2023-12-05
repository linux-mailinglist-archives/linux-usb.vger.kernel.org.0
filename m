Return-Path: <linux-usb+bounces-3754-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CC805F17
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 21:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B16061F21705
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 20:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ACA6DCEF;
	Tue,  5 Dec 2023 20:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="O5xydmL5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB92D3;
	Tue,  5 Dec 2023 12:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701806763; x=1702411563; i=wahrenst@gmx.net;
	bh=xN/ErPjadN/jV77MFGVvBcX0XwfMsxQpu2tUi/HAjVQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=O5xydmL56/km4Jj1jPYEYps+k1Mmv7BKyU8aAMPoRk8SUZY0SIsHaNHNsFkcSfbQ
	 jGrN392YTbch+oZZldW8OohB3iucp4iweyqQ6lbT9t62wLSdKPstBlInLEmo3NxqZ
	 isuh+HTe3tU3dNPEFKdPtwpIa59DknIYq+q0JA1Lt/LcR6JSYJbauwyPMn93b0poT
	 di6M99UiObSf5EOdjD/OSyDKh8zIhgeoD6WLTwwIvDhDergFosL2t4WBl3l0nbAu4
	 Z2C02/de+of0gh1q/41CsN363YVlNORHjpbO4TR4XKgj5iNGkdoq1TJL98/t4xh+3
	 zEIahb9A6/r/HlAtfA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1qq3kn489T-00KhYQ; Tue, 05
 Dec 2023 21:06:03 +0100
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
Subject: [PATCH V4 0/3] ARM: dts: bcm2711: Add BCM2711 xHCI support
Date: Tue,  5 Dec 2023 21:05:28 +0100
Message-Id: <20231205200531.8232-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5HPU2vIcWmS3ntPJrgNuQeVA7QoUH0zqXetl9S+e3nDIhOS4Kd/
 W6pEodQA9J2zkTx+lwgtpezWaBPGsgionI7YiDOOoTtlGzhZUVNpv8vx4DYLbka8fzHU8u/
 tOj+fyLASAPyLX7P4r4qQeIt/c5afXk1RRurSmUpXsv9+sp4zNB60b66lpr2LO9/TWa/LjF
 PTB0jYBvGU9MtxSyAQnzw==
UI-OutboundReport: notjunk:1;M01:P0:aaH0xAi2yI8=;DRV2MIdwQKMCKp3JpAdIzQToQ2x
 bx+eeVxsEkuDkoGzb3fZPc9uUB/dQEQYI6dbJcDwsJkqE4q/DwMxkaqGJv0c2RPrRISNcIUxV
 ZKgXtIqIdtClSM4Kz28fMd3lAam1Hu/P+AkZzHlX7Gcuf2wKFmdu/LQN8wzQUtyqmDVzCBsqB
 0Lhkbx8TIJ6Rn/VsjUp/I6ksVou0k0FIcc8T2PtSehcZaAHgIDEVJ9rcZBhlnKMZGiRzCoUPM
 wLm5CCOlStwLAMTthVt5q47oYlYjwxd1m7AbU2CUCFUnCBZ3VDPWhVCwwSBn6sh/38eYoyAFi
 fKLdIXann1YJolC1VzxQ77ua16ZgiKRrHC8hpCyzQHN1PpVpVxJzo69GKaWArB2nUzMy2LPEK
 wXHShnYMFYjpPABW+SlQJH5O+czp/jbpXHXFqA6k5Mnd2Eqf+rl+cJ5ce8mp4ggWYxapjwuMT
 5TrBWZJruy+9qdG/4NT6S6BMIhhKokJZ/8SOmlpSs5ZMWQPGJi7GSKOZ9Z4EmE6daZkzFriaq
 YxdmNwv0tmKolhDd6y0RnSI492fd3GrpF0BFx7nnxoYa3wLF2lrK1Lul+oiHEstQPhVCFr2tx
 L5M24048AsKTSbfmdGHBqRy40naY8HQt8KDdhES1JaBOSiR50jt+P1LboncNvZnLHfwUTv6xX
 xA7q7453xaiHnpAyGCOAOIoDDnJX2hjIiqeqtjdjV/e3466wVNKAGTjil/aiJ8KlWkaPC3ByT
 N+kjVbBYote+cZkmWx5tC1JbrFVSWKlZQzL3K2HKY78L1diks765B0z4HFSLuDxhQfAI+gppI
 IOt+d9Ian7LnsdrlSTU5HyTzLydCfohsU8KqZFnQc6JLnMwN8qQ/WF5EvX+TmxvNR9Wf+1bqH
 TAL7/EIJTpg1F+it3Pb9Xsl2qdfzry7ExLZXMwsAHKsqk0v/sA04e+LduwPi40GjdWH7tcLQf
 A/6eQA==

In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
does not have a VL805 USB 3.0 host controller, which is connected via
PCIe. Instead, the Compute Module provides the built-in
xHCI of the BCM2711 SoC.

Changes in V4:
- use "brcm,xhci-brcm-v2" as fallback compatible as suggested by
  Conor & Florian

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

 .../devicetree/bindings/usb/generic-xhci.yaml | 25 ++++++++++++++++---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |  5 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi       | 14 +++++++++++
 drivers/usb/host/xhci-plat.c                  |  3 +++
 4 files changed, 44 insertions(+), 3 deletions(-)

=2D-
2.34.1


