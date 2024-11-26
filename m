Return-Path: <linux-usb+bounces-17872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FE9D943F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7959F285ED4
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCA81D5AA5;
	Tue, 26 Nov 2024 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m8nlkNVh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005B1D5169
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612888; cv=none; b=XU1Fi5aBPK7UFLX36xAgAAhI8zcglmk6PvWGp5IV5YnRqEJa20OzDBL2DOxbdI67ip4gI9mbUEySMq/VqWyp3IX8GYF27tF1Q2sG66gTTm2jBKRHHITI3IUqj33WD8Lpa01NVPAKbKLTUAWL2DKDUckOkvl4kjOngzk/jOIW74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612888; c=relaxed/simple;
	bh=65f39XdX+JOlbTHLjNv6Nr2gl6HREhiCkJ3xGoC26cY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ovv288IycfgrgsU4EV9hWfvr7YMN8p1PQ5c14xf/6d9bviiNvr3mDSzYR3/qFRzRjnR/VipKN+isJ1lRxhIUUc9UsBAO8qLhytGA2SYaiHFdXIVKj7vyheRPJNXcv2hZ1e/rtf6QWpLvKZn892km39VapXvzjKtkAsDTTKNRDos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m8nlkNVh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38246333e12so5354309f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612884; x=1733217684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4yY5kKHWBOgnydB5P9+GaDat1sMgmo5I0rPUXNWFHQ=;
        b=m8nlkNVhsaB3jK7XongGdX628G4LHMoP0RQb+Fy2eThGVVjEpYrIwzavXgidYzXjpU
         Akrc2K7sKR/89kelyfMJHdrFuLjNXnRe7qLuRhmkQL25PTdqWdrLdqfV4KJ7lKxB/Zpe
         AsBPGroAlW3ebNVbLZ96mDTSxMaeIFRj85CXXA4R0Bu6HfPNCyXQtgrk2t6HhhutSHHk
         Y4szJqEUgY19SJU1s1cXtwhWV2FIolcF7Op8oeYeKnpetH7MZTiTsWXHmQtIS9K2+2L1
         gyHrEC26t/ks/8oydQHYVQ7AmO/LpIoRpakONOsedYvRhYPxKsBRh5E0O5kgtRD89RGD
         HxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612884; x=1733217684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4yY5kKHWBOgnydB5P9+GaDat1sMgmo5I0rPUXNWFHQ=;
        b=XYH3ewp1DG10y2JNOe650KrtdLi+/H23lQ3IAENADbrmameJAHuQABUGu5fvVGDory
         +2fDQveWxnWaxU5k5x6b98lL+MV3D+39nRWMv+TNqFcEaSNAS4FSbfDatmzu0+dOC6Ux
         zDAazwa3IeAfRPEM65tSVPlUFk+Eb46oAT+1nLyVMuPCIdtC7QWk9anmSSUgCQM6XbDp
         /vFeGl7tPSCQYSiPwb4X0fpVjJVUcnDk6sWd+Mg3aGenAJcbb4MbmvkWFSlTDc63OzQI
         Hm23Qq7I2VRodXd6Gl4J2ZG4zoAFHhxu6zuF0HlYGvsGb7UvIB3rGXvOgWTUfOSU/iiV
         iLCw==
X-Forwarded-Encrypted: i=1; AJvYcCWlR3pujs82gFUpOkITSf03HrXg9QR93h+UNf7Bu01bQoVrNsVNLuCXkiAadJQmECl0YYc6E/5w58M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVyHQH8SjB6TB/t3lshD86XX59hTCjodPLdPOLGy6GqdVTu8Z
	d3x6h+OkTV/mHupLi0gA/BOBW85ubulP7Wtx9uJPfWROTAQcH+LBmyAjivt2Vu4=
X-Gm-Gg: ASbGncvTbE+rJo4oY3vXDptFtxVu/681/jWT8uoblUmLyfuDQTACDJK5OGuVQr1eVet
	F099QjNNBYwhi+rrM97zu0Yt92Tz6JnXv++7xTwB63S9uA0X8Y0MtdKxjLL6chgBWYRoFvGqX8x
	ArFkiyZgMWV9hpid0Z0m/uNWEvMZAG2kdGnWkNI0H/2/7Ou0JQ8KYxazBhxvwA8n34zM23+zV60
	dAQJRwEDgvomjgkJr30Ft1zvMYUbtvPP9atNQ5n2HCU+tyc/TucqZiH8X705e3xNTUUS8z4JSBX
	iqg=
X-Google-Smtp-Source: AGHT+IECNxqnMdsMr8sIEyPl41XrbsF2Eglii8m3iIb2siIoiQVCnnx0E2A0rJ4JNGhhSHg/JoNpCw==
X-Received: by 2002:a5d:59ab:0:b0:382:450c:25e9 with SMTP id ffacd0b85a97d-38260b8ce0bmr16781285f8f.35.1732612884408;
        Tue, 26 Nov 2024 01:21:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:24 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 11/15] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
Date: Tue, 26 Nov 2024 11:20:46 +0200
Message-Id: <20241126092050.1825607-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S USB PHY control block is similar with the one found on
the Renesas RZ/G2L. Add documentation for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 .../devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index b0b20af15313..ae59c2dcadbf 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -20,6 +20,7 @@ properties:
           - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
           - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
+          - renesas,r9a08g045-usbphy-ctrl # RZ/G3S
       - const: renesas,rzg2l-usbphy-ctrl
 
   reg:
-- 
2.39.2


