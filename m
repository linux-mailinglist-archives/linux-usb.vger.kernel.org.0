Return-Path: <linux-usb+bounces-28065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E45B56981
	for <lists+linux-usb@lfdr.de>; Sun, 14 Sep 2025 15:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D7297A042A
	for <lists+linux-usb@lfdr.de>; Sun, 14 Sep 2025 13:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A421F463E;
	Sun, 14 Sep 2025 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHR/9HUm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAEC1A9F89
	for <linux-usb@vger.kernel.org>; Sun, 14 Sep 2025 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757858220; cv=none; b=HItmDZ8Da3/UUDHkCgzkx76tef97xG3s9yHe1dzz0VqofNCftG9f0R6p2aSDLiQaUeJFRFmJvBrqPA+nrIWvdMYW1ZAM8WppWNG4tbEjXooSjqyjlsrLVlt0oSPuMYd/QgH7jg3xCdLp+CJcxzink9xFNy2YxU9Aw7RN+7riTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757858220; c=relaxed/simple;
	bh=G/YgUWwYgipT54ZkK5S7t4iIid/jh16TP1NiVGcDIfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqLXxxhJnPmbw4/gKr5VvfjaBnbYuWZh/ZLWmEbBgdl1y1a0VTTKd67vyj8QePApLdvDarN10XLHpt4LbRZ2XtR7+zccUA3y/JQaowgL3k1LPVPm8fOj9+NRhkKUHr6v0B6tF5WihHGpQBoQG6Tq/NMvfc9IxuNUJ64eP1yttpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHR/9HUm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45f29e5e89bso8565225e9.2
        for <linux-usb@vger.kernel.org>; Sun, 14 Sep 2025 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757858217; x=1758463017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=aHR/9HUmPwzCarHoxiVPUS/JKdRy83Hp2l549rHvBav+G1aHNjN8qNTMr40oPOfbx4
         +/pXMl/O8BAX45mR7VNJdalKpzw/ueWtoibME1WjIYjIVvfII2wtNIOk6BUyhZ+huHJU
         RP4zk1sttF/Fr3XykCaT96FjN/pzMD7cacDdbisKuIt2+/xBjvtBdlyUKqeN76Js32Yl
         NbBQCkiQ2dLlPVZWvlgDoQWdvkP9LbJpQrdXsb1Q8Fv+DPHKbmfReTMnQnPiMW5DYOmx
         H/POhEFkC1UL76iwgvGaYxf2baU6iK0r12ik59DM1mohymEmc9ZjME7Cnch6pQPtqmW4
         UZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757858217; x=1758463017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=ejkT4q4/VwnllCB4p54D7awE/heHAmf5NKTmPqDKLLFOoPnJL3uvPgQOkZODgVQjoA
         zwRyD0gh5edcSRCvxQCYlTUfCjENigqHDmybBmV2nkpnO/PbGDrAr5P4R0AbdCM2z82w
         Z6s934e+sEDOcewwreFShTRfIH6Ix+HsGvbW2TjkHrFOvgk88hc/EVTF/Vn+qxY3XRa4
         z6ggbKbgTYuVlUVFVNOHG3VwglweIjxmZbnkZao7/wSm2YvH3pLiKlQrI9hcGcKjLmmS
         87sEEp+dDpQNxRrNNpvu+JzKy+z026XatbpWmyZjMKOpuSpSc5oIROL8reyjf77PNnJe
         nRnA==
X-Forwarded-Encrypted: i=1; AJvYcCU2d1vDIX6ZlWSq3XtMLqzulffBdUtLS4OMYnMPPZQ/u1gqmuZBsF+ejtzwDtAUm7SVDii84jghN1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHcZd6/zf9c+qept4EkGZ+Vpl6ApFNRHPBpMIUgezdOjeWkx6W
	d+ZYktxAqEMgowPLkv57fkjCJYrmjHXMIviSjoZB2OPmP5pqFUfXlvi8
X-Gm-Gg: ASbGncukXv7PeGJl8DBtiXCBk0BH25si6UbEY1RZoxxgNxkkJ9WYrfMNRgLVtmF6Qgm
	GpDkP126MFA10mhxg/5i1VBeBreyqBYuTimPKunU4tDlg0Z0An5RjZ1WEpoAJrruOP8pHjqlQZ6
	p4RiYczrWbz5uHYJbSoLXP+DwERi0XjsAATEpCx0ANZ/85GT/KEO5ffBesJyU4jIv+DnFQBnTv1
	VaULhpkOjawvO4reQfwt+Vinu4T3B2JqyqrOIo+vs8Ej1D+tf5OEpXoCgCtYzO8Sg3LVwOROFZ9
	5VZ2IA/qNXZWM0mTJAiZg63Ic2O/Z6ifpKzKOEqWB7ut9Jc+iGFpL+2r0IHkUwPewDZcMaLMrHL
	8djMgOOvrRPg7usIzUi8p8O+OOb+X5cvi0srpwFbB0s34YMzV1w+KS7HUhO3cqVjHQunBzj1noA
	==
X-Google-Smtp-Source: AGHT+IHB+VULFKNGf84XS/gc0CK50EFtBdez3HC/85lxGgum+zb542w5P3i1LGfQ0Av13zEl30jWvw==
X-Received: by 2002:a05:600c:1387:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-45f211fc2dbmr82961965e9.37.1757858216790;
        Sun, 14 Sep 2025 06:56:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e84de17f9bsm6740887f8f.49.2025.09.14.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:56:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: usb: samsung,exynos-dwc3 add exynos8890 compatible
Date: Sun, 14 Sep 2025 16:56:52 +0300
Message-ID: <20250914135652.2626066-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the exynos8890-dwusb3 node. It features the same
clocks and regulators as exynos7, so reuse its compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 6d39e5066..6ecbf53d8 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -21,6 +21,9 @@ properties:
           - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
           - samsung,exynosautov920-dwusb3
+      - items:
+          - const: samsung,exynos8890-dwusb3
+          - const: samsung,exynos7-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.43.0


