Return-Path: <linux-usb+bounces-29972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA107C2778A
	for <lists+linux-usb@lfdr.de>; Sat, 01 Nov 2025 05:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FD1F40719A
	for <lists+linux-usb@lfdr.de>; Sat,  1 Nov 2025 04:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486D9286417;
	Sat,  1 Nov 2025 04:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgsLooRp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9A928504D
	for <linux-usb@vger.kernel.org>; Sat,  1 Nov 2025 04:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761971096; cv=none; b=pBZ3bCvcIGBnbdxNu2yjk9N2oLh4xUkfaCqaBPzP///TlrQZkNNQut4hlyjnfU59K67+elvVkNlkqy56BGUS0IJrqouHifxa9nJJkSToBFc49HS3ZyiMq3YOr6czm14b8YkInrNXqJq/IyLahaaRGgz4Mv3tlg7A4fIV2Jxxb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761971096; c=relaxed/simple;
	bh=5WHfnnAEjEl7b65PNjGeo2Ba/xJE8CKHD2SN89cu3Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lR0ynLpj7xQMm7TOx0NQo6Xn02ed4pito/bOtiCFxjUQ6hh463vEZyfZLDsqOzPxtkuVEX8vuezd+D3cPosNlQG1bidIQ6o3A4SpAbHgeQ6q75uics6a47EAM+vRVDYsoOYBaVikdbNtuFT/jUKhh3XMTN/w8tS+EbwkrHTjqY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgsLooRp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f5d497692so3740827b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 21:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761971093; x=1762575893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpDoufdPjG28A/t0l3uGrRRBG6p6T+fKPiyqq6TZvRs=;
        b=AgsLooRpDTUkIS7wnKxThtMOGBE9alk1zizSUyt0orMuVHT3evGWwNLvdSulqS/gRP
         7is1N0BVgLy2agIVUqonQL83X9Jg0hFRZDrlsrTeQsDOA1pIw/3WBGI9DLoY+1+ZszsT
         QAVpLGrzN32Ec04oA3w5M0ur/k5SJ+/e/PcUKMlU9qPZhPLATzyvFNDGeurh8s3pCRm3
         9bWNwyBiHeLRK0wxNM+ZrUGBH9bP8+wiFhRlUnvZaFWHMWaJlDtH6tK758bqmXPwEi+Y
         +/kThZKUMdV67YUNLbDbyALO2GEIkiygoigHcQV82d+QABetEaz+FOeIEMTbTiaIciQA
         MzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761971093; x=1762575893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpDoufdPjG28A/t0l3uGrRRBG6p6T+fKPiyqq6TZvRs=;
        b=Ja0Pe2A37ze2SCtZfCDS9brDSWgKYk/t8Iwn738xX8Nap8iAThLLj/tbiwksnGwbJJ
         +rp5hPNf1mgo7+dLvEHxS1ExkGYWtDfSWXlTsU1Ft/tF/VdAKn0Rcqzza7HGwMJqlBFI
         XQjw1FS8Di5sTsncN5yKNsR3lOpbleacIwVKxvyddQSc78xNZe+X7VZyyF3EVCWdsEbs
         RwiAw6OOjJqFdH9mf+Hg5O2jYgi0rEvqQoDchT1yI62Q2VE0E34KzCZWyQqwNB233vK6
         YCbKSqz6fPQMfMLP7bHrGCodfE7GVBDusJI2nrwEZ9K8fjjOVIdtVTKcc5a42xtrGKtT
         MZoA==
X-Gm-Message-State: AOJu0YzBW+IAnctAPxQXf4cmtvnn1l6UshsSOoXrpRSvSebPAKF5veM2
	qD9pC6g7DSFyvRomohkYWTX6FhqDSIGRTxEKVrEnGOgNtcT6ANslTvkl
X-Gm-Gg: ASbGncsNZjReAvkKpzBkhEiJhqoS2HUGn4avGw5Xk7xofcrFQlCGk4gHAB7a+dSPb4p
	FpNjC1M8R4Bl3uwaVY4Od+0GMM7o1E1wqJkefSLunB3uHiBbJjW73XDhUuCbCusOxIxizLY/oVt
	WjbCh8XgV8JQQgSpxt4lCU5BeWOmDDss5BEUqrBYrvuMaCy2PHUZYxzmUhIQYr0B0zxfk3TJh7V
	6ljWaReOJ6sIfmBfLTj+RqBIOGDkmX5rf+RgIBqP97vHuSiUgnplicqgyRAIeeaEFQpU7RzEYaf
	m3OuZ332sxvusDJ6b6F87drJbfxZNVT5p4nHTtCHxYK7i/6Hx4rE1YJ+I2sil8niw3iN4fjp18r
	Dm8RHgpdzSMASgl0xqLIc7jUEat0KNybX7iqTnTQBoJf2THLiOAgONAoLVOTYjEysQIC0wMX/6j
	rQAqETPVvoe8kg8TkX/0YPjt6CDcYJhJt9vsnMuWkLmw==
X-Google-Smtp-Source: AGHT+IFBtoVlonGhlHWnTjQtAUPLEqb/CZBWvidsGzOw9KrDiWj7lh+Ow3/Lpm6it8MHYuXUquZ47Q==
X-Received: by 2002:a05:6a00:1251:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-7a7788ff6acmr7585723b3a.18.1761971093225;
        Fri, 31 Oct 2025 21:24:53 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db678f67sm3795120b3a.57.2025.10.31.21.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:24:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: usb: renesas,rzg3e-xhci: Add RZ/V2H(P) and RZ/V2N support
Date: Sat,  1 Nov 2025 04:24:40 +0000
Message-ID: <20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the USB3.2 Gen2 controller on Renesas
RZ/V2H(P) and RZ/V2N SoCs. The USB3.2 IP on these SoCs is identical to
that found on the RZ/G3E SoC.

Add new compatible strings "renesas,r9a09g056-xhci" for RZ/V2N and
"renesas,r9a09g057-xhci" for RZ/V2H(P). Both variants use
"renesas,r9a09g047-xhci" as a fallback compatible to indicate hardware
compatibility with the RZ/G3E implementation.

Update the title to be more generic as it now covers multiple SoC
families beyond just RZ/G3E.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/usb/renesas,rzg3e-xhci.yaml  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
index 98260f9fb442..3f4b09e48ce0 100644
--- a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
@@ -4,14 +4,22 @@
 $id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/G3E USB 3.2 Gen2 Host controller
+title: Renesas USB 3.2 Gen2 Host controller
 
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
 
 properties:
   compatible:
-    const: renesas,r9a09g047-xhci
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a09g056-xhci # RZ/V2N
+              - renesas,r9a09g057-xhci # RZ/V2H(P)
+          - const: renesas,r9a09g047-xhci
+
+      - items:
+          - const: renesas,r9a09g047-xhci # RZ/G3E
 
   reg:
     maxItems: 1
-- 
2.43.0


