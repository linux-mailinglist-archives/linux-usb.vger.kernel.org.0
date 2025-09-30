Return-Path: <linux-usb+bounces-28803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69473BAADFA
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 03:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2547B3B45E5
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 01:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898831E5B63;
	Tue, 30 Sep 2025 01:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PKeCj5zf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EFC1E520A
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 01:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759195467; cv=none; b=gCwTK9UBk3BxzoUqO87IakkfjKss/yHI1+wRc1CNZ+Mx+iBwyqocmQFnQKBUGDrmBgqOaWbofk0Qbsg6Y9d2Y6qeGj/KAUwEpnvaTLTO3JQfas7ORAlnpe5Bhi0O8xfaaHketizk31jgsUtVs6m+WzzM6lRCbOohMybqxoTUyU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759195467; c=relaxed/simple;
	bh=K/Ast7zI4CBJT0EMM1Wyl6eslOV+td2jx96m2YIfAWY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NwC3XMMzvkr1V2+VX/EFyv5jVTnRWCMqymlkWGe0U6t+0Rxt5Lr+9qHzNGJxgSIm0CyZrv6mLNMf/KIhHqp8PuhRixCQhBHkcQzGa0mxPoanv2WAeJcNIudg/NgU3ErQHnluhDunSgOKbXfefL6bHduaNZmOx/EdjjJ/7+MI9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PKeCj5zf; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b55443b4114so3672820a12.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 18:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759195465; x=1759800265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqKmfga5+DprzT5XPy4gegnRDxSvFLR2QAkxrjqmzq8=;
        b=PKeCj5zfV81HFeM393ae+j4rCl3jO+e9wzbbJ83x5Yr7Vx0EIwmmAInTNaPhIKYpT0
         vYYNV0tszXNrqBKiCNavFdjP4A0FrnWWzTK0/E7GPPqSNy0Led7kJmp65L7TDgTd3Zp9
         1ckFlz3k5P3lvUnwV7NxwiSChni3iGDGRrzHDnE+pZ59pGkftveox03l7AnVEB8Llna5
         VEZrgHGnZOdKrCDrwPmKqX6c02Go9AiPV7w3Clxfq1tuRT+sXwjiw9eApMTwuFw9NZOD
         uKZtLSxAlBogfakpC+zhqu5jkz5vZZqNH8QlPpXjHKmCRVdXCVp1UlClGb0GV4KdKHN/
         WjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759195465; x=1759800265;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aqKmfga5+DprzT5XPy4gegnRDxSvFLR2QAkxrjqmzq8=;
        b=qTUaYkbwB4zdV0NsIdZ5mU/x0qS4X3NsJF4mGtZq0PLD6iSY0fVQ9iGvAlxBu38xEZ
         6o4eWeJwFPRyT/qhMbGRSEv4xotOjhHBug5vZ8DJK26rJYrF73gS5NoaI10rBnJr20i7
         Y03iLSGHY8TZy/lQDgOfndYwHFbi3t2oDhYsHytBUT7lSpQ1J+iOM8IhCi+KImV5MvcE
         9SNUlQlRm1A9sj/el/f1j2RuoJ51FdMUz7BeZ1aLE8AO/6tkTytDuD3GlgAGeDZciuXy
         iFxUyl9E4XaZyeIzII+74ICTQzRVxWcNS3mT5RBmmzQDtsx/aXBfmXOKd/XmtivQdMrk
         p/1A==
X-Forwarded-Encrypted: i=1; AJvYcCUVERHOYqrDTXf//lgAWPHwiJoKu6tAudsfdGalnQFTx1nK70u1z6yIjB+ERctZCsdE3fRiTaCNch8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4JYoHc4fOqDDa3ItNGp0SPdl0FEG1rlJ94hZJP0x2hNPxeWaz
	K+LUQZCMNQ0gdzR3llqaHZgHsIS6FuPWnZECKgjtpmLFDcwm7bGL1tdSWZ3OYOtJ1OVl8vUGowN
	WVji6Eg==
X-Google-Smtp-Source: AGHT+IEp3ni/J2850XF1SC8Da4jAYRKJ8zaTUNw+gIGy76wXxB5yLFx3I78wqin08hufNLQBk+qUDJPhQio=
X-Received: from plpk18.prod.google.com ([2002:a17:903:3db2:b0:261:6462:787])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e945:b0:27e:f018:d2fb
 with SMTP id d9443c01a7336-27ef018d516mr153000195ad.6.1759195464977; Mon, 29
 Sep 2025 18:24:24 -0700 (PDT)
Date: Tue, 30 Sep 2025 01:23:46 +0000
In-Reply-To: <20250930012352.413066-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250930012352.413066-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250930012352.413066-2-jthies@google.com>
Subject: [PATCH v1 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
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
 1 file changed, 71 insertions(+)
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
--=20
2.51.0.570.gb178f27e6d-goog


