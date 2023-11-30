Return-Path: <linux-usb+bounces-3508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1AE7FF3CD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 16:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB0A4281A10
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 15:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AE6537F8;
	Thu, 30 Nov 2023 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cB52k5hY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C5610F0;
	Thu, 30 Nov 2023 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701358972; x=1701963772; i=wahrenst@gmx.net;
	bh=yy21d05ZZ5waMHdEE97FGH+AnuyHWZdHUoTZaUo85kg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=cB52k5hYTxLcwMwVBxH8isoo+QmPlhJSaZ47kAFmIO3rngoiH3v63PcEiCoKhfOg
	 ueMKDoUksYPesVzlnoDk7JFpS75Kso6y14sYL0FNvcv2epYWUp+jtsNj9u0Vc0EwI
	 K7Kkfm8ANnczkUJCUPiVNlansAi5yTnfN4GfXXKldxwzfj/yFGe6GQ5xXOwq/q+bz
	 ygC2bc3YsDU+gr0eTQocMvw29OOB6sSEww6z7ZaT5arDqJMcBSpGhrlR1qwTZDTfr
	 4E3ejT8vTRDi15EXLJL8Xb9ciMXFSliIj26jF5vRXXqLq7fzjnualbV2PKZjf0Yhj
	 IaMHM2MHsUYjUr23eg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0JM-1rWkKK0mSW-00kPbU; Thu, 30
 Nov 2023 16:42:52 +0100
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
Subject: [PATCH V2 0/2] ARM: dts: bcm2711: Add generic xHCI
Date: Thu, 30 Nov 2023 16:42:27 +0100
Message-Id: <20231130154229.22334-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dqi3/iyJkC+d0JvMkDzmVOvFvD58VLrqpt24F7WYohiihJz1h3u
 5tZgs/EgIsZazjR5w7cXFH3uWjkV7KgMJRTl9b1ufVHKhaKwI3SP4womw7z9mw4FU8/Ba71
 pbf+vteLB+0plkwdlO7MI0UK8Us725xODxiRiNZTrvYySbV25r1xsjXICYQfA/ND/dlfMjQ
 CQLSwGED7po3ACjmUoZsA==
UI-OutboundReport: notjunk:1;M01:P0:DxSaJlUQl5Y=;nKLoGThw3tlAsFXGsKHq2bPO33q
 oI/vn/ZA/ZbhUn2P9TmHu42Ukz12fbsb3dd7ttq0P7Co153ryfR+oDg9WurAR25ff3zYNxkRq
 xN6SZcIDHtfFZLAhBrDEYWkFsvtmgsVqLLTfnXud2IOyx9EeAWHIQWfcKDfYppnG/JiN1M8qa
 j/uGcqeBWSJTVPb5jZuS0r1Ld/WGs3sErxxU2OfxD4XYfikG1RwohvQHmEfeUtnVsp2DAxc42
 EYLuG3XWpc/FLStlcq1ubXQptikYNHaqDUopGcGiDpo692HwAbsrEBp/YnOg7DCGUH5yQEJ4l
 9bGm/JHKpRCvD5pNB61PW7E+XXBwPjVCe3ORej8LaOdHlYlonii//kPmVLTIwWiBUdVfzpUQ5
 Jsi2mZQVpqyKcKOe0JnBkkbkhyRyyKh7MGnJOJV+50Stod1kJKdtLHmjG7MEnmdOMpi7hORbN
 S7HCy+eRRMahkXd7efL+xS3qFTAPChunG61vo5pXoIzngDCcmUMWj/BUa1+7ldZQCe7g3GB9O
 ra4QpUJLyipF47vHID/JwtA5tW/kK1gfZplvayReHfWjjsDuG4vgBa0pcRQO47Z0b3v2MCNYd
 TMcpQVz4X86Xy6F4KSqiZijly0qAxzFxuHAzjZAyVbZmiktKe2B5eCizSKX6/JlX30+ke8IwG
 onJVMIV7WWFMWwtnzJzoWYSMyQT/7rpVs3CB+ulCUQLIYUGIUKq9Ym3DzhQwz4Tn53OwFQCKs
 oFOu5FT8u3tUIFCQPgAu7foOQv3XzcqA1xRFsz6Kq/nLF59PUW+hySQtu6y9hEMYEaAop7nIO
 8yvbvG7tOVivYRyf3AdWREgvb43ReZPvBZlMhRqIbDgAYtDm//DkOCGMeL9cYyPaXDJM+qwo8
 /HXdSy2jeXFfQHpWf9B5XH1JnAr1gFv91zzD9we8X/Z5fiydOvd06/RC7m858at6ThoC5Iw5G
 UEemAg==

In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
does not have a VL805 USB 3.0 host controller, which is connected via
PCIe. Instead, the BCM2711 on the Compute Module provides the built-in
xHCI.

Changes in V2:
- adjust xHCI compatible as suggested by Justin & Florian
- keep xHCI disabled in order to let the bootloader decide which
  USB block should be enabled, which result in a drop of patch 3

Stefan Wahren (2):
  dt-bindings: usb: xhci: Add optional power-domains
  ARM: dts: bcm2711: Add generic xHCI

 .../devicetree/bindings/usb/generic-xhci.yaml      |  3 +++
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |  5 +++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

=2D-
2.34.1


