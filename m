Return-Path: <linux-usb+bounces-3755-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB153805F19
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 21:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6197281F95
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 20:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C95F6DCFD;
	Tue,  5 Dec 2023 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="F91h6paz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95164194;
	Tue,  5 Dec 2023 12:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701806763; x=1702411563; i=wahrenst@gmx.net;
	bh=sHZB3gt1cJ2iNutQMvwwC4/pfSexz1q7EQBrxnjvhz8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=F91h6paznK1HzvIAwkwOlqO8cgiciTQRzoHZZRV+86U0Y88DfVlsjXNFztbt5aNy
	 +s7pIBdSqT528Zs3mLzdLvyBTFlNdgEzH/eJ1jvCVJa4Jku3C39mdOt1p7PuShINv
	 2bfKYKVnhrdvvUdBkCKR0bebEDFwtBvvTB2GicfhUGN80iVH/VvKTLmQDGipuYVcR
	 h153cMMqdQbDMv+bf3gtwcE3tqRErQGAj5FkO8KKZ3jm7dLlRLrQGI40hS8l4Q4hw
	 SQM+Qlemj6wIOK5hjouq7W1QwQxWJVUvk31/5uDIQVF4reaR7FpF+iNDW4X1+g2tJ
	 SrCQnGzDH9YqNcLdfg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLi8m-1qt4pP20sy-00HfYH; Tue, 05
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
	Stefan Wahren <wahrenst@gmx.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V4 1/3] dt-bindings: usb: xhci: Add support for BCM2711
Date: Tue,  5 Dec 2023 21:05:29 +0100
Message-Id: <20231205200531.8232-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:M/FBh/U+w4JvaljMqyNW6OWptCyc8BIPABF/ynqsHQVmNwwJ45B
 RNz6e/k50d9l2uGbes9MHD0QWG9QJkKXYKkhcMiKNpJtpP6W+QRRYKpNQoFz6cWuxXsjCz5
 PI27JTzuuqb4ju8kY9DAPhq0dyaPYxEsEdsZlcekPoGnSTUKhYUtXNY5dPdlCksjd41Wez3
 eWumZ4/lCVMtMzdm2yjmQ==
UI-OutboundReport: notjunk:1;M01:P0:breIgNV51t8=;BUZbIZmjjmgmrk7TUmApci4zrvc
 3hotQes/pAgADtlmJCbosOXLIjlp1aTNiU/bMvTxnVgW7lbFuuDy3mYjHlJStl8H3r8+pylV0
 53HGlM2HT2By95m7VVQBKLQl351NNms7Ah0ocGVyh6J+nMkcsP3r6mK6MP8GqN+TGAhsdetI0
 peU9y+jeEUtxoD2a6q4KgOWZmZefudMKxr4QQM/M5h/L9YiG0J8a/z6p4fMfcGyfQfgBnKr39
 VBC7jzNjkE9PCPIhLTFeCZUEI1LAJdwb8DRh85SbHmP47oFUkCKRM70vtXpkVrNilYQB5Jb+l
 ceSjECOEk/BC8AAONgdOMCv9IHpqU2PzFKsJF9M7UBW+D1K8ZnPGXwhvmLAif1K7YNbjtzgpC
 aVxlbvMnq76mq4tt+KJZqAZLGZny7ItNRdaanfHR8uG3TLR/jEpLoAVlaM6uHVJeOItRyfXGU
 JAhTXe+0dWYOoJoN9sD2g36MU9ZXz36GTDI/8KjtIhgc+gtjHKaFFSN1JCZ0lQ0LUxFFv8eJd
 d+RRPLm6Iosh4yVSsoUVJdaqU99h/MuOfz4pSnoMAsDihRA6capb1/jzz3dMQsHsxWvkSx7wC
 REyH0qvCMbPSpTk/GCzlLGczO58QySMxsfbJkCfJC7MQL0thuKo4VrVmluqvnll3GKXPXGsjY
 l411YTnlQ3KMcuzlytp3KOWAiQ6fcbha7nmbK4z0n8EIfxWTg9PqiiYtSefJcsBh6FH/5PMWT
 ivqfSug2HimGFSc78t+uy8KelZtljg+vbeYlzsnT4klGODuAmC7gbAGgwq5I9xCpkwBlwTL2F
 Vp4RZvhvn3mjof/N7eTcg0xuv5Hmd4tMzhO7QH+u8LXm9St6JMtKkR+oExmCxJHZJYGu1NcTb
 7PTyVK3fU2KQfEp4M8QVvYgoDKGPQKH29sa61JCSZCWneLoALl56m5n5XYhIuBxQttv1qFPtH
 sKE/bSpoNTCMxPKpHugUL3JuD7E=

The xHCI IP on the BCM2711 SoC is compatible to "brcm,xhci-brcm-v2",
but also requires a power domain. So introduce a new compatible
and the specific constraints. Since the key allOf can only occur
once, merge the reference below.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
=2D--
 .../devicetree/bindings/usb/generic-xhci.yaml | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Doc=
umentation/devicetree/bindings/usb/generic-xhci.yaml
index 594ebb3ee432..6ceafa4af292 100644
=2D-- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
@@ -9,9 +9,6 @@ title: USB xHCI Controller
 maintainers:
   - Mathias Nyman <mathias.nyman@intel.com>

-allOf:
-  - $ref: usb-xhci.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -25,6 +22,11 @@ properties:
               - marvell,armada-380-xhci
               - marvell,armada-8k-xhci
           - const: generic-xhci
+      - description: Broadcom SoCs with power domains
+        items:
+          - enum:
+              - brcm,bcm2711-xhci
+          - const: brcm,xhci-brcm-v2
       - description: Broadcom STB SoCs with xHCI
         enum:
           - brcm,xhci-brcm-v2
@@ -49,6 +51,9 @@ properties:
       - const: core
       - const: reg

+  power-domains:
+    maxItems: 1
+
 unevaluatedProperties: false

 required:
@@ -56,6 +61,20 @@ required:
   - reg
   - interrupts

+allOf:
+  - $ref: usb-xhci.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-xhci
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
+
 examples:
   - |
     usb@f0931000 {
=2D-
2.34.1


