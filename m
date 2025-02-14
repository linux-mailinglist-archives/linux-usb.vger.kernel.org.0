Return-Path: <linux-usb+bounces-20642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC276A35CC5
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 12:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE6F188D1F1
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 11:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDBA263C7F;
	Fri, 14 Feb 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKqaE3Bk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80B325E44A
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739533363; cv=none; b=qCJbr7mSDdZskZ6TxL0S+Eesb2tivq01TCySsk/1Y0fq+8dXAsvTYDNDy+7KF2CD/XbaAyj0S99DOIZTHe7BT1rowq5SGeCz91ipK3q4E+PxPNYRQBUSLwoMo1E0NoYDdw1gl7AJLketnqO+VDoFCO2adPk2CpyxJWUOQqkF6R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739533363; c=relaxed/simple;
	bh=F/zv8ld6hxQ5meu1qeOYsIEsIIqaCJ+HJ4Gs6tRkKhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJwt84rmuT1GP8820fjzWkFjqREtgFcCcjA6djbMFtP2JJX9IjJUar2WBJsGbSeqKPh1yPYfv0lcor1fRI0hbdJfoK9YH84hDRQMtIOU9sN6zAwuTU4ROpqDtK8XTVZNrBEzuIxjo5xeeN/qYCzZ+ezDu2vDBWbgyRtAZgRn/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKqaE3Bk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4395f645200so1902155e9.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 03:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739533359; x=1740138159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=je3Y6JE9/0vgfYFp2HTKthP0SuJ3Chwygb5NcOwDms4=;
        b=qKqaE3BkM7marsQxQBxUFZ70JdlGGi7tbaQAEmJl7O548QQIT3N4gPIR0hxlJ40YxB
         s5RJ2pp8s7bnj/C/jQ4mZNqb0paxXAEowkpj0I1gWcnQhroMjQeZ+n4D5e4petutcHeh
         5B1Wbfgu99MCJDxkEbgkKF/sRtqzybdurlr+/PqX51SRA917HPSlSG/VJSzPSqkgf4oO
         MCOpyM0sfV9hBJjgppV+/uWg5n5moIuY6w51AC5klNsUWpK1a03AzgJEKnXvzG2fD8nj
         3LZT1+QO3D9IMt87yD9kXJOh1zWpu2Et893hkxMfT8qd5rFmzbyONgyPbzOlekmEqzgY
         8MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533359; x=1740138159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=je3Y6JE9/0vgfYFp2HTKthP0SuJ3Chwygb5NcOwDms4=;
        b=iht+CmThSGXQCR6xiNEhoP2P8w2AVXPTzMFLmcuetV7g2aDrxlSSA+/IbYQMAUrgMb
         CFtKoE7XdlhWhCf1BUw5jvxkyWL2+XE7RtIgVkgqUPL4PtfIlCWA0fR0iniZxAWH0wJy
         Y391+sXgzfNwHZpdwE/94cbRAzrqNP7NsjcUviNFnzNsnXMBIRp4SqCRZdiGFXsfquuo
         grsCWnzPZ+06U6uWXQMxzvxJ3HHeeoUDcXoGQdCbVciyNHnOO5hUDayGm+A3hbOfPUgx
         vfdc8BCljafCncoaRm8jwsri7sFpiNusHP+v2Nis9v3UoN68pGRx3fzAh595tErWZWm1
         KOzA==
X-Forwarded-Encrypted: i=1; AJvYcCW/xlk+LD51wdnzheDoUlUMZA8xA8rY3gC+rQpJihNcxH+9r/Py8+ji8Fs1sBlXm3mrVqqB7qNG7ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1NUKbhsjmwmJ7cON/HHOmnM4EfJ+ojNRs85Nxg//ySDKylRB
	dvS8AsPQOt/oL+GUybGiGTwH4zoPzAW9RTjS3U+wmKmJIp43z3Z2p6alW+NfXwo=
X-Gm-Gg: ASbGncurbCUZWadglxpsPGc0bimaUNHsWgjXuznIy09jKcpHbUWVh7a/AXCPJKcC36o
	4p6br5cqbf3x/lJ7QFKqCUIVe3KQLhyX44SqPBqkXekeNjOmRd2j8SSiTlj8tzaimFZ7sCKmBnd
	eAN3zA8fd+TK27pfGJPqeRDYrO7cMAgvuAyJDR5feXbOiKJya+b908EEGEq6X0CN66G692fBOrW
	cYal/PH8aow6ayaAvhRODCVyycE5AX93H0UHqgJBblrihOt4ISbvLgt0o9LQqdvTvHAckBQgmBA
	LwA7fbIkgGFc2EGgruUIfsY7otH8YQ==
X-Google-Smtp-Source: AGHT+IHD2zuPWbS12hO8QjYVrO+0ZsWls0jxCUOQqd45DbLIATzXSslULpB7tkVtgTvMILaRHe52cQ==
X-Received: by 2002:a05:600c:1986:b0:439:614a:8bee with SMTP id 5b1f17b1804b1-43967111951mr14380305e9.5.1739533358965;
        Fri, 14 Feb 2025 03:42:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8dd6sm4455148f8f.62.2025.02.14.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:42:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: usb-device: Replace free-form 'reg' with constraints
Date: Fri, 14 Feb 2025 12:42:35 +0100
Message-ID: <20250214114235.49476-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace free-form text of 'reg' property with proper constraints so
incorrect values can be actually reported.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6..c67695681033 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -39,8 +39,10 @@ properties:
 
   reg:
     description: the number of the USB hub port or the USB host-controller
-      port to which this device is attached. The range is 1-255.
-    maxItems: 1
+      port to which this device is attached.
+    items:
+      - minimum: 1
+        maximum: 255
 
   "#address-cells":
     description: should be 1 for hub nodes with device nodes,
-- 
2.43.0


