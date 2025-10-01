Return-Path: <linux-usb+bounces-28844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2962BB19CE
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 21:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D934C4415
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 19:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFEB2EC0A4;
	Wed,  1 Oct 2025 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rHrGUTNy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C474F2D8395
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347237; cv=none; b=dA/+Q2a0TK3VZHE8FZ6VVt/UY8Ss2bX1yePlQYfjJGK+yo2t7puIXJsZcD9wLm/5dbm0F6HpJ8eKSRvSjqyo29YFkpx0+BZ7Gu2M1C9atxZ79qUV6x3jO3Lk9e0NIU2tjHJZPJJe8aVgcSoNlg/YglOFEn9cBePUOQ8sPc9f4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347237; c=relaxed/simple;
	bh=FEpg/7BZxeu5NgwiYBv2Ee+RYqZ1LN0sPgk+srr05OA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AWXrclPKoDrcOpzvdMB0x+cPl1BPIajCn3zk4W1A8jx0x7YmXmcX76+x0L/oSKZLr4GOVUFCKh+hMlvgnqyBV/anORQkUcq4PKicjDmdlsu3TsYF/peHp9LjCVdxk4BFJzhpIYJZtwduLw7So5cnIKSKLuuyJ/4YJcwAnEu8DAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rHrGUTNy; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-27c62320f16so1551645ad.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 12:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759347235; x=1759952035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOZcKUaQjl52TKTb2c8zMCvsKmsV/y/lPeyOuQ6q8ow=;
        b=rHrGUTNyLHt0QEZZ6ADUSGqa1RgO4IG2OJ3oDEUn+s5kqyKSG11/HgcsZwoTejjeUM
         SN4+XrZE42WcZ3jXWC/ynGoziXjzQPSZpFSSXATNEipi9mjTMI1MlIVGSaah2KwiAaro
         +e1xYlKikK6SlZDp4fDzP005NwfrSX1fBoTAePWInJ9kIiV8VbGwaw4hOxCh81bWtZEd
         Fw1O7Je1eUSt5rKF6kziaqmGqlW2X/mV6UMQ3KuddTCVXVzXDSrbbMuDKf0mghcqW2tG
         S+ESsoyBf7v0pLlHNac2IHALFKPXIL2b7ZcHsTqJQj87oRDVfFJYGxXoxjxTcOgaQnOp
         UjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347235; x=1759952035;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KOZcKUaQjl52TKTb2c8zMCvsKmsV/y/lPeyOuQ6q8ow=;
        b=p1s43tQ1V/UYJ/JYCEFGM1+/YvGiVFPo8OpRcuKrcrLFy7HcFt57IAYsg0pgl5vzw7
         mnPbvZ555Vp6kZQcIDr3sm+cIj6I8m1aN3Iw51neCudM//hFmOWTZ4c77oALwhMEXYGo
         E8WCTuYSt4v5culNnMPbGn3aE4aCKDGQ78ctNAbNPz2I3oXakV4YgkzaHkaTYpfM+34k
         9bPOGp5KYrJMPV3m0l4cBEEh/wskOwKVHBSnfCdurDGeQ6gK0rwGDPj5lr9dRQFcUeTC
         6Z4oMYWQyul/hUfJpiwYUgRlwVsYVc4YMg4PSl+Jp3mWjmj63OW3dWg6Qbvr48WDp9TB
         HSSw==
X-Forwarded-Encrypted: i=1; AJvYcCWh7LRFFogRUAzp92bDOq/AoL0Ro0bshtZO+Q/pDY/WsDwqrcLs88anioGlYiSVsM35r4hqNqtGbzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3nEpMQqDL73vETuJ3FXGSSRXTKXxuJAstZxR7CalAIOMEF4Fa
	DnnODpPawNxBQ24Jvc9w7UQ7S4d2ffQ/tO8QULBuNkprwK4F6fhu22Gdru3fjMvZa6xeV6VLpWu
	kR+1wFQ==
X-Google-Smtp-Source: AGHT+IFYeUo9ghhsjfaPnkIvUWWb4I4GUIwXFFyCVFrvfzUwD+cx16qLBp9A0yGOlezJ5enJQwgNYB7XxzE=
X-Received: from plblb8.prod.google.com ([2002:a17:902:fa48:b0:24c:7829:4af6])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2446:b0:274:3db8:e755
 with SMTP id d9443c01a7336-28e7f2f7565mr44337445ad.30.1759347234575; Wed, 01
 Oct 2025 12:33:54 -0700 (PDT)
Date: Wed,  1 Oct 2025 19:33:41 +0000
In-Reply-To: <20251001193346.1724998-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001193346.1724998-2-jthies@google.com>
Subject: [PATCH v2 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chrome OS devices with PDCs allow the host to read port status and
control port behavior with UCSI commands sent to the embedded controller
(EC). Add documentation for cros-ec-ucsi node which loads the Chrome OS
UCSI driver.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 .../bindings/chrome/google,cros-ec-ucsi.yaml  | 71 +++++++++++++++++++
 .../bindings/mfd/google,cros-ec.yaml          |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec=
-ucsi.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.y=
aml b/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml
new file mode 100644
index 000000000000..2121776e3ff0
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/chrome/google,cros-ec-ucsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chrome OS EC(Embedded Controller) UCSI driver.
+
+maintainers:
+  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+  - Andrei Kuchynski <akuchynski@chromium.org>
+  - Benson Leung <bleung@chromium.org>
+  - Jameson Thies <jthies@google.com>
+  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
+
+description:
+  Chrome OS devices with PDC-based USB-C ports expose a UCSI interface
+  from the Embedded Controller (EC) which allows the host to request
+  port state and control limited port behavior (DR/PR swap). This node
+  allows the host UCSI driver to send and receive UCSI commands to a
+  Chrome OS EC. The node for this device should be under a cros-ec node
+  like google,cros-ec-spi.
+
+properties:
+  compatible:
+    const: google,cros-ec-ucsi
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[0-9a-f]+$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    required:
+      - reg
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |+
+    spi {
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      cros_ec: ec@0 {
+        compatible =3D "google,cros-ec-spi";
+        reg =3D <0>;
+        interrupts =3D <35 0>;
+
+        typec {
+          compatible =3D "google,cros-ec-ucsi";
+
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+
+          connector@0 {
+            compatible =3D "usb-c-connector";
+            reg =3D <0>;
+            power-role =3D "dual";
+            data-role =3D "dual";
+            try-power-role =3D "source";
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Do=
cumentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 50f457090066..646bc81c526f 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -99,7 +99,9 @@ properties:
   gpio-controller: true
=20
   typec:
-    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
+    oneOf:
+      - $ref: /schemas/chrome/google,cros-ec-typec.yaml#
+      - $ref: /schemas/chrome/google,cros-ec-ucsi.yaml#
=20
   ec-pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
--=20
2.51.0.618.g983fd99d29-goog


