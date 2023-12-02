Return-Path: <linux-usb+bounces-3604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9934A801FB4
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 00:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 479CF28100A
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 23:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6408224F2;
	Sat,  2 Dec 2023 23:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="XRTyZn0v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C5511F;
	Sat,  2 Dec 2023 15:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701559376; x=1702164176; i=wahrenst@gmx.net;
	bh=TbxRik80dLzZG7DIQ9xWqFWVyrcfx693GRjJ1QeCo4o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=XRTyZn0v3J6k8WSkFtnNhfFZEOmA4fBbQGdjrB5KGE7U4XcaseiYRPw6SvYD+vJL
	 x4dkU2awZCyRzOybT4ccySAvB76n54Ml8lRCvNrkm8+rGCsSY9j8XEKKLBqROTAtn
	 MGnXjnRfEyJ40Pe6hP8weRQVv8zHyANxD4igZrFll+aASbAbApv+I563AdWiW6O/7
	 4vSCJD19HANt9gMeIldTWD969aurixSCMsftUcb1C6MHsxKR+Vv2c7j9HoTzBiHgN
	 ieWCdz6cru0r01hIruRaYYCTy5QH27fekLrq9Qgl3St8DCFMKE446pNJQM5L73Vj+
	 MPBK0C7fCtPZah3SNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhlKs-1rn0nw0oNs-00dp5u; Sun, 03
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
Subject: [PATCH V3 1/3] dt-bindings: usb: xhci: add support for BCM2711
Date: Sun,  3 Dec 2023 00:22:15 +0100
Message-Id: <20231202232217.89652-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:mVHHG7lLDU2toWoVhlnfCV8tio7telUp1Yc0xssnqcRC7o2XUht
 4btrZuVRxJAfzs9mhoidiP5ynBJ8sd8a5iItdXcZFRKvlFEM9Ul7yxyKppHPhlD8HUJuFEa
 mYCBRYEuWcRr+iZNL+Hq7E/JYnhUYUK4DsO6x+TdRnezLgmMghnAf6QafurLCzdV+p367rl
 gt9eAEBCiuoOpk5tAPEkw==
UI-OutboundReport: notjunk:1;M01:P0:ycFP+XFM+cM=;R2TbG7g6ZnUeVAfMTN2+GFWFBKS
 NQgEWBl5M5DT0KwYwBPYV7hPHJg+nwXf3Kr+Aip70vGVFdamItzFb+PuTvKiW8ojl6bPKhvlE
 w+XrTa22/kokJWr0fkqlvioGYdrWlnA6p9u1uQ/taZ3gettDayXTELUMa07WQPI8kK0gDtL5U
 V4/9ezeYA9DQxIPclEM05qwGDosLKLpTZQuVezCD/BNmElKpC5dPfMBip8zDOS4eIwU50Jdtq
 WPmBSs8TkL7ay3apB0D09wK9HiM5Pzz7/t1XXa+0L1pS9K4f69Pz69v02R4IRDN9/Iirl+hZb
 UIBq7gIk86xNQeWj1zf51zOlaZ7KwPiVEdptv2r8F8Me8/PCKQhunv4RHpBk0m2EVo1RKnkzg
 AOA5T//6yywxnzx2nWw27Au76C+MAn5L6sjkqWUITUljKCexE2P8Pk5EaGeoynlMTlbzp7l1o
 OEJB8VgAbc7prEbg9G0gFAa15N1yckhpjlNiVMJbYvveYB9LmSrpkOXRTFKlYE8nkX10TjJsb
 uXzWzzEuonTvusNbN+ghxCaty+FjNDww5t/K5aQ7XkLw3lc/pjYTeS93iMI76UX+83lZ1UK3i
 Tx6orNklRygieFhoMnyOu38nf7WaemMu1lvnJqokOMaE44NK5mZKKN63CA0rqZtHvbPvJRvhm
 V2cM6Hv4LaLkZFXCSzgW7FNSiVTV10U/g5prfBK7BtlJ/AziPe6YSXggpgBhe9Ctjhbz/N9j9
 DBAKcM7ZY8qYomND2G1PaNGOe+zxo60uXvbmvMNg+IdKKsLD2bKVLsKvuX2r5TipbNcBxDRUn
 h0eJMteGSk8GyzWzmjDCoYKg/ONeuRHKXgq9TGgkU69Ur0MfQcWUrjdw5tPaiwM5Cp2ln9cFH
 0IxqoQBxtsL0TddLyRYW/VKYD5qtw42jv4umkICONjuJvHdU6CwMxVs1S3tfY7g92Tlll5xLx
 KG8zBUW8DGF7WzzLofM4xqP5HJY=

The xHCI IP on the BCM2711 SoC is compatible to "brcm,xhci-brcm-v2",
but also requires a power domain. So introduce a new compatible
and the specific constraints. Since the key allOf can only occur
once, merge the reference below.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../devicetree/bindings/usb/generic-xhci.yaml | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Doc=
umentation/devicetree/bindings/usb/generic-xhci.yaml
index 594ebb3ee432..b6e10b0a3c24 100644
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
@@ -28,6 +25,7 @@ properties:
       - description: Broadcom STB SoCs with xHCI
         enum:
           - brcm,xhci-brcm-v2
+          - brcm,bcm2711-xhci
           - brcm,bcm7445-xhci
       - description: Generic xHCI device
         const: xhci-platform
@@ -49,6 +47,9 @@ properties:
       - const: core
       - const: reg

+  power-domains:
+    maxItems: 1
+
 unevaluatedProperties: false

 required:
@@ -56,6 +57,20 @@ required:
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


