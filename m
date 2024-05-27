Return-Path: <linux-usb+bounces-10592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA698D055C
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 17:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD4351C209E1
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 15:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5AD15A840;
	Mon, 27 May 2024 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iJRIad8X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936F21E880
	for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821151; cv=none; b=AtcpEwNENSCbqGNCt9G2kc8HHQJG4hpH5atzwNIMEN6eIIUSvCAA0qqqHv1BdqX1qHAdOVpRe/bviLSoTE4v04bGEiSja9KoWvO/Vl1Gztqyig0v82uYAZSX6bd7IiuG1ok3r8HUU0CvylZ4TGWAWFSGExjHSlaZ0nH6SaG5Xvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821151; c=relaxed/simple;
	bh=AO5nSYfoZmTmOnVUiP3qQUadzHCNJAjQMwP0TefZ1q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UTi+KWQbwIuEGo6STKwKJV7OHLuJYZuhgHNosup9Ah+36WT8bAw37+FvEnLU+8QRugd7HX5ugMHQG2oquxEL+Ez6qvhqkq3kz5jeTc4r8Cv5rWPccsDfSsdiF3m1H4Uvx/bRGbUN8aoJ7Ul1jf4CS56xUI+NlCd4oON7PO19NRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iJRIad8X; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-420180b59b7so48800835e9.0
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716821148; x=1717425948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlPh8asFNYRAYES5kXdkoiGJIIskI39MHFNbVehtCHw=;
        b=iJRIad8X/QGGmd79b7bgomr+wyoidVYEkdsMbFU6gMIEv4VIvZfIUuOEf3Z9A25QxR
         3RYA0PDUYKgwIny0prco6d3uqBagRWVtOT1wxyX6DIt+zAvb7OPB2aPbOv+4UjRXQcYS
         4fV4G15FRHPaWIdBk6ZuKEgBEne26pwUE8wCgHSgv9WL5uS+vhElzie3XZrmNb5c4BMn
         Fr6G/4G8DUMZV+tg1nxwzAQnbDfkqKR6iTzvSZHsPCuZAHqsLwgxcLUBbU0LcQU2hL8U
         +j4aoLjwn04CHdObVwhIdhskibrwjbHoX21NR61ImNopRNqv54JKU3bddU2UCwp7rOlK
         CY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821148; x=1717425948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlPh8asFNYRAYES5kXdkoiGJIIskI39MHFNbVehtCHw=;
        b=uhfoeotaPL/psTfH59SlLoUmFYr/eVT2lHf+GxQAg7Navpbd/FHJloOyNDpzKWveHt
         wN5RK6G+Th3/hVCr8kBPJy1p5Oui5uaLviTLLq30j+3PjeIzrxOsZUnYBlj/DCc6gIiF
         YlJy7xaGDeqD8bN0DGOLoLMQ/rj420Q0jBeXwVPOIPIjsZv9hGPDBmaD5JwE1AvFZfkT
         3WZk31g6NR3sL2wOp5O9zzYIgVnoCpYyMwvhdjBwjeUTjjjfHPbwbQqEdrAnbrtN4XYY
         eMlxt0aynegZUCxeD6M4w87MLDPn7HvVyHonCtBc3PPc24mNKedqimLAIh7tPRod/FMU
         LmaA==
X-Forwarded-Encrypted: i=1; AJvYcCVd+pa8gub9NOu5gQcX0n3IazVP4am2GLwqEf9ZMDJ8vweNNyibACTJpYjjsPYJaaT+K1NvVRrVMhPfDE1QHxaCOBJvahClfT22
X-Gm-Message-State: AOJu0YywzCQ8dCZXsnMtsGWhH9Rs53NJlGj/0W2zbCkat/FFrprkUAhT
	By2PjS3D2iG8nc7PmEqRnybGVAaPcMBhwr/b7+6HbqRSn43m/xCDFxFInb4QAds=
X-Google-Smtp-Source: AGHT+IFr258v4SXR0QTU2G0U7yZ6h9mynnDCJbZQqvSS9vBIBIZa0qKTI7/tvGC3zsaKQiHMi+PM4A==
X-Received: by 2002:a05:600c:2045:b0:420:1853:68c3 with SMTP id 5b1f17b1804b1-421089de945mr65141785e9.20.1716821147875;
        Mon, 27 May 2024 07:45:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108989fdesm111746175e9.25.2024.05.27.07.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:45:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: set minItems for interrupt-names
Date: Mon, 27 May 2024 16:45:38 +0200
Message-ID: <20240527144538.155704-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's a set of compatibles for which we set a strict list of 5 interrupt
names even though minItems for the interrupts property is 4. One of the
USB controllers on sa8775p only consumes 4 interrupts which leads to
dtbs_check errors. Make the last entry optional by setting minItems to 4.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index cf633d488c3f..4251dc25ee9a 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -468,6 +468,7 @@ allOf:
           minItems: 4
           maxItems: 5
         interrupt-names:
+          minItems: 4
           items:
             - const: pwr_event
             - const: hs_phy_irq
-- 
2.43.0


