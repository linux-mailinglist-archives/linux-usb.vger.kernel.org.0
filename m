Return-Path: <linux-usb+bounces-23072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B7A8987B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 11:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E907E189EA5E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A782918E3;
	Tue, 15 Apr 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lt5Y2zKE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B43B29116F
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710166; cv=none; b=cX6rjRUPAjsuZdYNK/1H0576ZLGm08toGG+uvyy3wFLYmUiHUyEzp7KdkMVjOSrga91l5jJ2h9+qgE0Qe9amakht8kwEw01h3Agup5HB0UhwjwKrpbd3IWI61GRznGQYA4yEOtEF3PSA0pN8eHk0j4TRrJ1l6ORaGZArrr4vEwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710166; c=relaxed/simple;
	bh=ONXSgzh9c6IpKB4NMWKJprMd6baGNhHuNXrdpm2GO2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMHdJ/OLzNwtc9FPRMY7Iv4LuVxO0QqsruDWwE54/Un17VgspHevcKLXywiLlnNGZJY3EKwdgARemgKCAHvrg/mH95ZJ1haqCvu+hoVOg8APbaxjb3Rql1SIBLCUSXaVeJCipNAdIxEPGGZNEujonPPbmLbwZ+fkkmsrMeaLWGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lt5Y2zKE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224191d92e4so50984825ad.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744710163; x=1745314963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnnKr2l4LbB38k4Mhz6nIOWpASIGRG3czOC4OX6mJP0=;
        b=lt5Y2zKE50YZBW4KMaeax2b7+VUtHIcyx8zTp4QsHIVNt9oJL0vKXREra0OD9rn3JR
         1HDu4gqmzbj0OqPJBLo3aEN48GMxQLKMJCnkbd39Uwtvjlsa3g4+QA6BLDKxivGCTCqc
         CKAwp5p0sDS3Krj2dLp9gVF46+OH6gZ9k91Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710163; x=1745314963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnnKr2l4LbB38k4Mhz6nIOWpASIGRG3czOC4OX6mJP0=;
        b=RTKlRB39NnphYzYbuhHKtcpgumMmGwCaQFk/SUtMatPD0ebSMsrv7+BzGXCvFJuOdY
         aJShN+bVqRGofUaF7CtQ6LGq7Bh31n6uFFoHqv5lMGydeOcrTvk2dkPNDnWCH/h5MTIZ
         uNzw/AN35c60K9zCzW0mSM84idfg7lUugWPZZcXG4KXOeMO7jLdNTlIKDPHOtSN9QV4r
         5A1CrDC6NPN/k3H7PW8LWlOdTdwGIv+IzBUM9XvnBFYCq9zPc3RTi3eF/CKcu9J8DrRU
         Ppa1sKw3+flcKecFcdigC6G4i6ySX/BOv+gDGaas1IIB5+EL8q90AVKDGHAGJ4BMY9R2
         K3yw==
X-Forwarded-Encrypted: i=1; AJvYcCUb7kSlKEGvD0OPxOdljBMM17yTdByzqtBvbI4Wb+fuez+I/wmiqAzrUVrPvwMc2McGComKIZeTaJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwWZCqXn4NICmzgR3OtNlv3dehW+avQmQYe0j1jLuAvfl25uXB
	RLLbOEVFwZl1k2Wy+m0r63vQTyNewSEtAkWcmYr0LtaLfLy6luNXoEKe5SfJumFomUGCXM4o3yY
	=
X-Gm-Gg: ASbGnctP3Q0OdzIriBAGIr19CUnawZv8rFX8ClG3iL92doDgLbBy62kwugOEW+QbaI0
	VObh0snBuhdxJqSBWulvewv1uAziwv9gdSjTCCM17ZoyaUS25W1gS8VHKDdLipwjSIRhy7ihHBw
	jecgb8JYbcLT0oscfEXeacVWP18rx6Qnk3D+ijOb0DR8bwi8iXls8BQ9FMqtR8654DiCi+eE3FQ
	jYspuy4U8TryfD0kE/PPMm8ULDlW4mGB3eMfSYwfEhGuqKmTaRj2petGOKK0tvEpUarZuCQlnHF
	wPiQGx6q0e3flgC+vcH36mbhLmpw9jmPvrHGe6+qWgaYvB9SuiSLXrYUs2PJHt3V
X-Google-Smtp-Source: AGHT+IE9w43CJv/UOue4t3Qpb3ePg00zQx/RfidlriRmSUsZqjwz6p1TKUXguwdh81XU2yIGyaoZRw==
X-Received: by 2002:a17:902:ef0a:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-22bea49d314mr228210365ad.11.1744710163568;
        Tue, 15 Apr 2025 02:42:43 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7d0d:86ea:ee84:cd08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca5asm113135215ad.254.2025.04.15.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:42:43 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
Date: Tue, 15 Apr 2025 17:42:00 +0800
Message-ID: <20250415094227.3629916-4-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
In-Reply-To: <20250415094227.3629916-1-treapking@chromium.org>
References: <20250415094227.3629916-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inherit usb-hub.yaml and remove duplicated schemas.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- New in v2

 .../bindings/usb/realtek,rts5411.yaml         | 47 +++++--------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
index 6577a61cc07531..52fad201a56c82 100644
--- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Matthias Kaehlcke <mka@chromium.org>
 
 allOf:
-  - $ref: usb-device.yaml#
+  - $ref: usb-hub.yaml#
 
 properties:
   compatible:
@@ -21,51 +21,30 @@ properties:
 
   reg: true
 
-  '#address-cells':
-    const: 1
+  '#address-cells': true
 
-  '#size-cells':
-    const: 0
+  '#size-cells': true
 
   vdd-supply:
     description:
       phandle to the regulator that provides power to the hub.
 
-  peer-hub:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to the peer hub on the controller.
+  peer-hub: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-
     properties:
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          1st downstream facing USB port
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          2nd downstream facing USB port
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          3rd downstream facing USB port
-
-      port@4:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          4th downstream facing USB port
+      '#address-cells': true
+
+      '#size-cells': true
+
+    patternProperties:
+      '^port@[1-4]$': true
+
+    additionalProperties: false
 
 patternProperties:
-  '^.*@[1-4]$':
-    description: The hard wired USB devices
-    type: object
-    $ref: /schemas/usb/usb-device.yaml
-    additionalProperties: true
+  '^.*@[1-4]$': true
 
 required:
   - peer-hub
-- 
2.49.0.777.g153de2bbd5-goog


