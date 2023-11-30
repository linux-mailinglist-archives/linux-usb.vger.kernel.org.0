Return-Path: <linux-usb+bounces-3509-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF87FF3D0
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 16:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4BF71C20DFD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 15:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C3053807;
	Thu, 30 Nov 2023 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="sB8jtZz6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB1310D5;
	Thu, 30 Nov 2023 07:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701358973; x=1701963773; i=wahrenst@gmx.net;
	bh=kWZYlij2kNgwIM5uMiXInPyv/VHhBRMRoCrGHtd2dDQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=sB8jtZz6Xz8ASMBwCKpy52E4RbuiygkhQKQSsxr/DAhIArV9U5FCOk65DKwceGCw
	 nUlnrJPipQ/pu3W4nw+QKTtZGk8x6Lu5WpuHHNtFPpsGwSqymZfbAw2BIX3JipAcz
	 ZXCR9oXkD/vypngeggPK8Vbe2otQNOGDfVfWC6yqFP+xIyqNz0l0yftf30cRerldw
	 cxOWfbMTDCgPMRQkFryuG/MdhIXBn5jwFSzllCFco4J3q55ZzdnWE6T160rv6udx7
	 1iyNNTv9vFmoci8tCPNza0fhsKRkSdDpTUMfBm97dPLJgbicyptSn4GlpBymFsKph
	 rlFM1y2wuMenuZF0Ew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm6F-1r2vcF3BPP-00GJv1; Thu, 30
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
	Stefan Wahren <wahrenst@gmx.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2 1/2] dt-bindings: usb: xhci: Add optional power-domains
Date: Thu, 30 Nov 2023 16:42:28 +0100
Message-Id: <20231130154229.22334-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130154229.22334-1-wahrenst@gmx.net>
References: <20231130154229.22334-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QQhxP6kT7761HtF+VIHw4espQ3ZzBNTv0Vb9JSXeLDhtSjHDJ46
 zC3Cw3U3lm6Ak4POJQy4XrTBmG5wQn+BGxbNEZ5f0gbcldpHa8PGCcy6VAakK7bVhG96iHu
 wSriIjhVu+ittIWgmD8tBxa9cqYcnSsT6HdkRFowTZaKb2ak8J0dumbOdN9bei1KvEa8I+Z
 UnLys6+as5tc1IwtnkXsw==
UI-OutboundReport: notjunk:1;M01:P0:PvrOUnMOBjY=;LTAu8yW9kIzdrCOY6VrCfgfJ8VV
 PwuD9wZhKyzjuAr5qUM3OgRHmndO0nfRpIEUWfGb2z2lCZinzC0aL0p+yLnRxCYHuGKBH/Tpg
 prrjJPrzRD/+BuDCkAumoF1zTSs3NGzuGNqf5MhE16+hI4NEWm13qGQuIlzNAbLM+pJ1QnnXU
 d/nStLEUieOArKOuI1UynRIURdF6GpzWtxG2jivfQoS2m9PtuGR1t07xNt35kNJV0dKN+dLmM
 6GHIm7qzeP9N/vC1TZpl78NogrCfJC/junx1w19s3euSdCJsBflcbJ0ia6JbViMZzjso/KF9l
 LIRVBtWM34HI7VJPfTw1B6qxLNA3WK5rLvEuavBvtQXbpS0Ddf/DZ8X3y6J0DbnVV+3X38N4m
 lT2DiG+G5agiLUFSQtF9wdLQj4DZ6FTmcBV+q0DCFzM8GbjYLcnNPJFI0dSRY4/VRdU4JQrs2
 fUKBpEbXgGKgeSztrNz7cRKeX2Y6qVsTzC6sKca6SKo/DFYld31l009Hym/EHOoE4yKzm7gNt
 FGE/8qRO/Igk+1zM21sMBfglNdWYGGx6DHcIRhH0I6/VifLbET5S3SN1M3Ar6yX/emGIwwH08
 7KU/lfH4HPEyciO+ZzpJ/T02PlTjUyQXpdrpD7EWPqNQQh8MgyZoaF7ea+eQLj12iX1XTsNo/
 WgjqqBVytW9UQ2rhksMdE5SJ6nn+UuyRSwiiD81BlKBJLUBWCe3croq3SNwUtzvDXc0+NA41t
 kbIW51L0wnVGSjYw2A9thiYzWpT3IqMCZoQr8Cpp93kHPY8ZFRWlWGTGIy1dAO4X7iziYTtcf
 eHSNyVTDdKBB9yODZU7+QNj6v81Qoin8ej/uCTcuN5VZlM5XQtfuRNqucotuvCrjRf/efAHp4
 mh6lVKG5UCyIkAV5uWa+N4cwFOn1EgzusHh1z/fXWmddT8Ss2yf26VJkkwGKOJ0ksJqI58yHU
 kZ3KxohKZf92HpyMzKSVJaZuSxY=

BCM2711 SoC use a power domain for the xHCI. So allow supplying this
domain in bindings.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


