Return-Path: <linux-usb+bounces-23176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F76A91596
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 09:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5751189E417
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 07:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989AA21A44F;
	Thu, 17 Apr 2025 07:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzmxQ+nX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A611B4153
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876001; cv=none; b=Cc1E42wo5qBAA9st5QmQeQXqQZgb1VrbQJri05ySWn/XN8TutsHdME7Oq0V4/A8zMreJhzbsUL8O8KujTGwXiHU2yrRd4S7FXObj9nFetef8QtYsyWKRZ7uUbnSvk/rB+XGnuHgZFjpkjQu5rUPVAZtBU6VXwe5VIpbV8kKcPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876001; c=relaxed/simple;
	bh=Eb9cXVsuOC4GbThMc32N8q0N/L9WglE/l9ak7PMRhw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLnO+dnyXUNKNtVRl7+SC7j0YuzgvrO9cbI4ASrVUy636NKRuFW//VJfktAHqZMk2GprzrztTnIYdEcmn+27YMduRHZzyPN86fyPMa3QzgPNBI4EitBjuRxoAkcTH9ViLWyu6+R+L8N8ADhMvY0RxlCnIaMh0Y+pQWJ0rF3C2cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzmxQ+nX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso12942f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875997; x=1745480797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRtdeaVuk9B5XsngdQBqU6+Uwf4/zyBV5nrkNqEVjA0=;
        b=bzmxQ+nXQ6yNMQcs/q1cuW8TPGvQw6h8Q2KxjWOibEdfhKuo5Ph3AI63wByy60rfE6
         oBZa1YW4qZx35mwxHJjB4npNBiUNjU0ce8LXvxN1JHOg0e4ej5tSuPZ/5vhgM4mOchV1
         kixzmkiw0A3XzSkGS6uD4fWTjr3x3ygSZmqS/smzFMsvNb3mmO/t7TjNmCqeKh1eeG35
         aZ5EuzTk3buVqD7RJVzdiYnOmsJ3Hv1/gsNsPtRVIH41wkj0Pmyji18o7Izvj/BIAIyK
         ceVCxVK1G4irBd5Q6MxjbCNcg2I5escT0Mzzp0JD841xfrO047W/5AEC10K/sZn4cgzo
         vy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875997; x=1745480797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRtdeaVuk9B5XsngdQBqU6+Uwf4/zyBV5nrkNqEVjA0=;
        b=mx5sbcz+Mg+U1vrvk76q/cT31VcXNIJ2Y5W288jR/O5ioPd6TMtZbuxeUh9T2I9uzY
         bJIcL3P7GPaYNsmg1R0BS4JHWnl0uLoDY3MiHkmb8N0TQr5JJ6MImUPaWdspmoPiKdcf
         QsTg1ifZxq1oirYctkV/Hicw84jet4P4ZTwXq+jUSCi3VzJH4NmbrjJoXpz38AHS0S/W
         j8Xy5V5FkItSAKLc/QAWwP4bMSGWm20pLbcFMYU8RNNpx1e8bccCaP2b1kTeCdVihtvu
         EuTwEjA40tLQx9sWv7RabxceWo8S5tt8enCQV1spY0aYogKU87veM1YHFvIKa6MYoXqT
         rXMg==
X-Forwarded-Encrypted: i=1; AJvYcCWDBqUIdQnkD3TTHVHWHZzetz1/sPT/rvH3WH1E4FRc3RuGYX0/R8x2GeKfXd0SX+djmpRuufwOAC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41yVsgzf4q42fDHfv4WvQROmFRRT32j7DqrNg6IQw1IrzY/98
	IjyqwxrrFv6r70VpZv4G6AF3egAWZ2IgBebSs9z53V3DW46wr1z70PK3aqdbMyI=
X-Gm-Gg: ASbGncsawIhO3cUX7BCjfO6NGkLtrHnKeXPrv9+BESwGreWZaycQ3jy5BIT5NG7dMO8
	2YK2fz6AykIQ+51C16P2OvLcqZUJnMoZN6bf9woYjMM2yMwD6tOms7W0Ok8JI+R1+pfdPqaQtTY
	AhAx+md4Gd13b1qqRoggRxclfvDHPOL2OubB7DIxdmbr48JnSjepwBtmVwWzW3EdOf2DTE1busC
	4BhKFo/4iHYxjlELveLPgBn5784Fbrp9tOMuO/jLCK7wlTSH9fJoX5URnR/3lUozlAkHe+BnHoh
	y7UwSwFTlKoq++7OUv6TWhp7jjQfaR7/Jejfdlu2epdHQED5hIbtzNB3IZWDOco2R5xIMgPKGzw
	rTlHDjw==
X-Google-Smtp-Source: AGHT+IErpFYig+5USrElsn8/GLitcKQ8MpWzj97AV4tWtydIWiChjBtijhGr4jx+hlgc+5rmITX55w==
X-Received: by 2002:a5d:6d8a:0:b0:38d:ba08:dd64 with SMTP id ffacd0b85a97d-39ee8f2ced9mr726282f8f.0.1744875997580;
        Thu, 17 Apr 2025 00:46:37 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d12b5sm43332595e9.10.2025.04.17.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] USB: host: omap: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:34 +0200
Message-ID: <20250417074634.81295-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index d011d6c753ed..6dedacba94b3 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -225,7 +225,7 @@ config USB_EHCI_HCD_OMAP
 	tristate "EHCI support for OMAP3 and later chips"
 	depends on ARCH_OMAP || COMPILE_TEST
 	depends on NOP_USB_XCEIV
-	default y
+	default ARCH_OMAP
 	help
 	  Enables support for the on-chip EHCI controller on
 	  OMAP3 and later chips.
-- 
2.45.2


