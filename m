Return-Path: <linux-usb+bounces-27402-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F3B3D2CC
	for <lists+linux-usb@lfdr.de>; Sun, 31 Aug 2025 14:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E5773BCD14
	for <lists+linux-usb@lfdr.de>; Sun, 31 Aug 2025 12:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD4425BF18;
	Sun, 31 Aug 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BwKxziMl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3401C258EF6
	for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756642952; cv=none; b=qVb7987pcZT1apw3KHq6SSSbZp4FSCPWrOrsmnO0+YK65jFEVnrlEQpfLzeDUGCZiCi7Muq0fzmciXLB/4VkCEHyYXatcj8wC9jeTtMU4ArTjLMXoLwCT9qutmb7hktJoItmpaBjz9X78kJKET0KXETeGQKT1ABawP7KL32maRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756642952; c=relaxed/simple;
	bh=zYRCQi+0wejFXM/43WXjQP9aWgNnIJKlUNtum34adHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXXUbIpQDkg3rtRPL6Olj3YlW6rcAYnfIs/0URLb5DjtQkgheSheva6LNgIvXZBX2TKgZqjmNt3YKvRllKIcFR9/ujdbS6b9mcDFD/lNtvoNsTQq3kKcKXQy82vdhbOOwGIxYKy+/FSC3a+pN3hx+Dj9PYywxLV5/NhKehloPC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BwKxziMl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3cbb5e7f5aaso492339f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756642948; x=1757247748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlZf3qovc7XadcWpXTOZUbLWBNy6tyoy94Ss5nrbIig=;
        b=BwKxziMl6kNtOdHny7q6UIBmJgLV+0zu51UYrmLTJ3Y2Yf9SSjnnmci9DGpK0t7/UD
         MISwNmYY3r+UTPqUz4yCl74vCvdIElqyWcjAc9Yutok++8gxaenmFpSLoqCGHlc6LfY6
         VJQ9VxJeCSeDYyGbDhhQo6Z77cRSeLkESDhB77cyWpvQ3EZsthvcagnADqq5XcFUlUBW
         mudbRFaxTCulMlqRGHoEI6L2BYH7WlKXtv1gixlZQczUtX0b2DNicVQWHxKIbpGm8R89
         cP92i6CH7elLR9zhxehL0LaOgTq6B8mbBKwqeLJYAQFV5go5uu5SqCaFIcEv+XOh4WQ3
         /OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642948; x=1757247748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlZf3qovc7XadcWpXTOZUbLWBNy6tyoy94Ss5nrbIig=;
        b=YeklcKrujlpf+tEVcL9C7t91KreuVFc9KUpZy4jAhdw3ii8vNnLK9IceufB7yYLpo6
         PsmVO1a4UlKQMrGGBdrulZul10thLauKx871NDdwuR4PwjT+4lrQ9VEcJKh+Nya0rNdJ
         5Llaw9qh6QgeTYnV7Eno837TxD/7u7d2M5NwDHdQM5L05iYw0IF7Zop4TDDfjVWbz2qd
         XajGjEzN2+DoVmXwybjJ5lRW9H7Odd/pEOrGkwsW6ETRQxfiClKS/eacYRd+VDoAcW4T
         FddSsbOqZMXdWeHHmWfGrWvQZbvWJBZP1r9nV+BX4zN8DXiw2aqdNklcDzB92MiGUqV0
         N6xg==
X-Forwarded-Encrypted: i=1; AJvYcCWm8g655ZJoDZ8XCRR2gH3dbxqtCJa//swQINl3s0XkYw2sfJkeTARTZJE49PPX0B5Sr92xeJUTsno=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5iyOmSNINdQll5HKMGZQM2VWD/kIwRdK8+WvsKFTRM7PxBH7
	Kg4M9MO9kK8yhZ1aeu+uUtAeC+3OBcabn5OqY8wiBVduL8sNx+fip6OjsKhQgtdEKog=
X-Gm-Gg: ASbGncvRj/h/QtImlJiEGSX09SCsnl3NgctTVyXx1NrBffYyu4UKZdIng7j7UHp+5f1
	UX1Dme1cQISfgdOU141uZsj8XenmQcxrqm9Kc3jhjZ8FfHHlBuKx+RuOxQQrnHtTkG0UN8qsrcC
	VRBgXh0Ic+Z6PZ6JNSNRWoiu1nZi5+/+xD3c0M3TsGri0i7Diyc/ZM7W0OeQZB72cyGWd4KumvH
	R56VZ1BoBrSjYxrKS4pui9tiTYBl30BEE1hexjsyH3amm/VHILUFqn1LeU2E4aEoBh7GSA8XAXc
	C0YjmmQzU0Fq8BnCIiseY3q74cgfovoGKKemRb1LY/tyJ3lQBYCBQ3eosKiZ5PllB4BMGUTt/D1
	BLlWzF+qj8grOOnCbSBMAR6mExbCJgkB2pB6x+5LaFA27
X-Google-Smtp-Source: AGHT+IFnFYjlAZftIcXFAXoUbNXxsZRoP0QGkBeFfD6J1UbS/LZNxNdYQv7RKd53VW6gkvcHWeZOPA==
X-Received: by 2002:a05:600c:4e0f:b0:458:b6b9:6df5 with SMTP id 5b1f17b1804b1-45b81eb0a80mr29694345e9.1.1756642948423;
        Sun, 31 Aug 2025 05:22:28 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6b99sm194866225e9.4.2025.08.31.05.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:22:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: usb: s3c2410-usb: Drop entirely S3C2410
Date: Sun, 31 Aug 2025 14:22:24 +0200
Message-ID: <20250831122222.50332-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
References: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zYRCQi+0wejFXM/43WXjQP9aWgNnIJKlUNtum34adHA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotD5/mW0FdtzwHuJEB4jcnGQja4NpqHdMXn3m9
 yr02e1dX5iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLQ+fwAKCRDBN2bmhouD
 11FXD/9XsBkrYV+LeU8wPHs+IkpJtomIWP8qNp9O5Fuo8nvKiNG+p1IZgJXhKnfr7WVNTGb8825
 DkoR99gRgG97/ze6tYvEnIMOF+GuMk35ywxX0maLWdsoVbNK4QAM0hVLsI0FUDZSPHabkrVupA4
 Nb4VFWumhNpbq196L6xerhRrSR+VRgM7H6dH6Q86Le1VE6YQxtd8yrfBh5glKK0sgI7XT7m92x+
 elu7YdlGWs08O/sKb5hB05fmWdEwOu1Ll8oIcbCVmhHZARL46oHXXtuIhJftYHBtXnyXQXQxcgF
 FQDmQCPqeAA9O6ET1I1T/nOySfqXOOFG10cZ6LnaKpFvDkiRNYmvv4GP8cfdeFoeyWPnl0quT4R
 wuvG1uyUviTUHQMIZJJiwGKvXr4h7tIVj5IndB69owM9m9skryq9szWpz9G9gba2FUYkNCCZk+b
 443uSbn5LIYHIyAAC8GGPK/NUu8S6D02qL1+Y2MW5ZMtdBGYMGIguGZ7zC9zJdiqsqtOQwL6vla
 2O0Rh5PROZLIGmoFKl1M5br3SFOYN5M+o1z1ys6HbGlXx3kaJX/MI4eRXDadtJVXhDZhwQNOSgS
 6TOb32kG2bVZ8U4OVxlNBxBY8n4dNLfKDvkvB1iXXdP2l4lUEVmg42TSvg98KRVZFbh/swPe6Ap Hawqd3N/hMNEfkg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 .../devicetree/bindings/usb/s3c2410-usb.txt   | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
deleted file mode 100644
index 26c85afd0b53..000000000000
--- a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Samsung S3C2410 and compatible SoC USB controller
-
-OHCI
-
-Required properties:
- - compatible: should be "samsung,s3c2410-ohci" for USB host controller
- - reg: address and length of the controller memory mapped region
- - interrupts: interrupt number for the USB OHCI controller
- - clocks: Should reference the bus and host clocks
- - clock-names: Should contain two strings
-		"usb-bus-host" for the USB bus clock
-		"usb-host" for the USB host clock
-
-Example:
-
-usb0: ohci@49000000 {
-	compatible = "samsung,s3c2410-ohci";
-	reg = <0x49000000 0x100>;
-	interrupts = <0 0 26 3>;
-	clocks = <&clocks UCLK>, <&clocks HCLK_USBH>;
-	clock-names = "usb-bus-host", "usb-host";
-};
-- 
2.48.1


