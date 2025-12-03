Return-Path: <linux-usb+bounces-31128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35634C9EFA1
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 13:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C6961348026
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 12:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1702F3C1D;
	Wed,  3 Dec 2025 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="M/ty+Bga"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3E2DA76B
	for <linux-usb@vger.kernel.org>; Wed,  3 Dec 2025 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764613; cv=none; b=TLCrs8OH5g3/8R3uJW5p1l1tgyCxefP+cgAhZN9SHflZ8efq9aOykhcJhXBVsd+JoWeAGTPQh3YSyvwhmAmcL7zxMh42E/8dkcGMiv9GvRbaMsDD/dG/06GXIo/OpKIJx6AICR43NEr27qGybseKMmb8LOX2xgOZNDmHhsq/ZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764613; c=relaxed/simple;
	bh=NxtJzgFmiV1E4Vkc5ZsSa30BPNQ2UxpzQEAUPNYwUwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxWCPn6M7NYwfrMN4fbMg5Fq+YcZewZkZ26bbnnakXo4mMrDOqz/jIwCyI+Mt2S6+Qftf2Y+8XrNiGdq0TdFmDFjGHue2RHu9Gnl6F+QUnYQjIFNklNm149XIPTqFopqPsdPYRJ2EK51D4lSd4yJPiaggsFPz1sPf7669AJIu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=M/ty+Bga; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8823cde292eso62258236d6.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Dec 2025 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764764610; x=1765369410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UFfRQ/mCyul9iPxIkRd9hdWn0tYgTUuUvSNMVexe3M=;
        b=M/ty+Bgaxdkal1GaEoT82ZPaoC4BadaQyRTHmrMGmAxXyQqDi5uSZoYKXQwXea+oee
         NvSMKLBHybz4n++aWptzBgagbRbz7hnZ1LJa1V7QAN/hfrqzG7azzZbAe3SmVuVdYyAV
         rGJ3lM+z1DrK9y529LT+xkSAyLDNBkN4JZix1HncZxgvaOZgyYBwwkQoGcSu07YvvXCu
         KACe0JF6m3V2ZTH26IqQVyVhq6C2/WIII8fwJyG5P0Z7wEjs6etQO+08hzMirGuJinf+
         6k4Eia7Bvfj6wQuF7obGWxA9PTMPuRfrMiGzsvzmr+0wBvTKBrWyTAnWgYEycCGk1PHR
         jeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764610; x=1765369410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UFfRQ/mCyul9iPxIkRd9hdWn0tYgTUuUvSNMVexe3M=;
        b=SzIk4iYy2GqbY9EStKgkcSg64PLSAhdqPseWC/aOMi5AxU0BhzPYBevQpHGoPOyP3Z
         1Tx/m87jqaFu5eBOlIKkEEmUwWzcbmU6cO+EhrrmgHWXdX1eNOlt5QK79SKQ+x7qdAk9
         J5IMbeCZ1pTBjYF1NK2hwSivrOZdGYciFy236a1BslGl7xlhR76kFCONTIy8xP/Bepek
         ylaElsrOkc4Qt24dyMbHf1D3Y8VrKxeCPlbtmF/EpyMD4QdhZ8tSm/76rO3DXCcOKUw0
         nRfovRjqwXF4LZYpHY2+/tAE/LI2zFQWuNQJabUP+oWBoCMNhEF1ZZd99C8FGitvMyKp
         7loA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Hc2SGOlcf/vv9DDn39CnjI0G7Os33xBY+a5W3T9VNs36d/PRMEB3qTUyTVd/lyOVNXgU9ozHeZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4jJHHAIfZNwmPEXf+ULH4SP5HHxqaoKA9KYWslcE683aUxmr
	9xPzVKOv70Ig7mVFe65ACy2LA+E5NHQzutO9lWFslpp3BKw1sHlGnxZFi1GCYM/afOQ=
X-Gm-Gg: ASbGncu5eI4S0TmO1N904WyVrHDd2eO9eycblrmZ4pSbNUhd28pQfyIzd40JMuNiNk1
	bKNXRfPlOnjKwJagBAyR6UgZr6/1/N51PXAQtRIBOA66qGqmi5FZ+2rIjyyC6jAb5MrcrOqcNXM
	9vEWk34p6cnK3j2AK48bst3hZSIySAXeNH8WfYsCrn+OnMtsk+D2Mf9jDZdq+NimDx57vxfTt8Q
	R7aki7MWb4XN+92josiJfApFp1BfrZ+xFG/AzOI4cW5uetAw9qp11hbrVAxybc95MOJesDcXYj+
	0/rWdtZa7qLNwbIRG6+xUOh8/V0zCXpR/6oels9I/ZT5uZIufVpwv5UY24PTPW9ZEWQVegfwmYv
	B8NnoddGduwBdUkwNNRRi791lFeyxALkS96frUmYj9r3uxelY7Lw7B+EeX1zC1gkQ+JCZyJ+nz9
	Sl/blw1XlubzidZ385SjPHSLm3b6luZ8QIrEVJzhIs7ATS
X-Google-Smtp-Source: AGHT+IGsaXlqNMoWBqDJybU7SgFep9PuPbieD5S4OluHzHLsLb5SxcZWmzH1944iGtWvvNXqPDBk/A==
X-Received: by 2002:a05:6214:33c9:b0:886:3fd2:ea78 with SMTP id 6a1803df08f44-888194c597amr27028086d6.24.1764764610234;
        Wed, 03 Dec 2025 04:23:30 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm115214351cf.3.2025.12.03.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:23:29 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
Date: Wed,  3 Dec 2025 13:21:30 +0100
Message-ID: <20251203122313.1287950-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203122313.1287950-1-robert.marko@sartura.hr>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip LAN969x is a series of multi-port, multi-gigabit switches based
on ARMv8 Cortex-A53 CPU.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,lan969x.yaml

diff --git a/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
new file mode 100644
index 000000000000..3fa1d4ed40d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,lan969x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Boards
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |+
+   The Microchip LAN969x SoC is a ARMv8-based used in a family of
+   multi-port, multi-gigabit switches.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
+          Ethernet development system board.
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan969x
+
+required:
+  - compatible
+
+additionalProperties: true
+
+...
-- 
2.52.0


