Return-Path: <linux-usb+bounces-31720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6101CDA79D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 21:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D88F130728BC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7695234D3AC;
	Tue, 23 Dec 2025 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="HUqO414M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50AC34CFB7
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521192; cv=none; b=VziHvbnvw/KnQAeqmyrlS2K6/9EpsV4QCiPG7rbytRymdU73k+kVmSnbOb3Mp1BWYqjBl8YPW0IVrF45oV/zmr70TXe1RuHXmTqdXEBHb2ZnrFTtUhrNiJ6rA0DFWzBCyQPVIdcECeGbZmiK+YXq5WV8NERmmtrPnxSWU/aOC+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521192; c=relaxed/simple;
	bh=k/Yd1BmFzU0e9UFcJv9URIkTbmDEVBM0hOo+JTGIPAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXpjjGVN4BSzorpL7CmJ2Tr9uaWWMKeeveUYnznhoUU2BzRNZYuoCRv3KoMsLaIpOus7/L+rGt5SwN0z0cIZErfcjOg7oE1kyhCHampLxDsrSd8l1Vjjq48+f/mTGFbfG9vesWBOfWLueFEymRnOI4tvXgikt6euaYvo8u6U6Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=HUqO414M; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so4264480b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 12:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521188; x=1767125988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=HUqO414MlgCB7zdxZlWKiA66FDKd7L0u1wR8AN9ttDrPg9lwMIj47NTBgAoPJEAAGa
         cY1T3OZEINElj1MhmU2gxplQO8bFLFVDU6XbeVOYavY58iOVkKZf1U1X6nA8d7ohZJjP
         qOZOYs8Gk6SKZjC85XLNMOWKy14Ax1T0wBXDOvD/yRP6sJE5+mHIVqXh049rbUOT7k9A
         TGrkqHVnIbg3geGjYDRD4LUaxT8ULeHfCeq28+wx1lfol7YmRNs5cTPUjVgyqHHlP9rO
         NNbWDDETwJXC3GEsUN1k+/pZLLqOQBCukXd3Z9lwPHHtk+UefNn1nqfNCX5qRs9AshBw
         g3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521188; x=1767125988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=WCs2xSjYlUg0UPcUZHXi+ntW2xwSwK51XjZ1BJMJDfRfTTvUSMujsawwcYych3BMOS
         S64l9JSOXP3LtRXVM76DkY3syBEnxG6ZCOq9D5CeTOOnxykz2sDymhx9xKKwcM/TafEG
         8NapJEbL/g3d+UidOzQLt3mu9sTk3uEXy0glf7QA0dMX6zKspmJqdoUMZ4zrgiXdhB4g
         Igl8RptErBP0iWBl2rzNycAhXWhZdNeEQsVXzyONFM6idOP4zfx0xbQaWYHYt+UYxY0j
         uuIzwUNqdbu9qISDu56Ugzy2gwNJczCpBJSfXpF0tLv6QZlrTsefN+Y2WPMLXzRrn6lo
         P6hw==
X-Forwarded-Encrypted: i=1; AJvYcCV9NTNSKUID6U0fC3sTViuLS588WRUlowpxDs4GHxCh8ViHcRq/sIfa3zDLChOmvzfjDIR4TxipjTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdvbiZhJwxBaERjb7NrGqxT7asbKl3K3hyVO0UnDX2u1erRfgr
	3UcwU1v0LAxt1hn9v2221S+Oxs6xuZaFhU3TvICX8Z91eQvrvsVrZEcVlwA02eXdrb0=
X-Gm-Gg: AY/fxX5obJa25Bnb+tEJtx3w4Hx6t1XdRBVMh+eEtZY9n8xZ7WS09KZLmVmOlEE81k+
	cumtAEIeAHVDH4xQv5bsOYHMvMQ4BHmDjZEv/bQZWMMP4tKV8/YoBneZs3Es4IPYJ4jqsKBGSnc
	Yxjw8xHqRsjoiG/tqzf6Dd13aYfzp9drJwNuLgicXdupG127CB3p64VOIC+xY1oXq0hx2/cQ78t
	nmyVbJ7UcsMrFzzF3ihkkv2fABJBUBChU7dk3jQnxLCj4lZE5rExqqQJPo9QtL/doS4oi7hKKkG
	5mDFj7d0AUJFuw8Ltp8V+nOVCAofzUdpP9rKbKZ3bE7w+y9/LDE3nsFBPn7RGUsCpiIcqx3oq9e
	oCXY1HTAE92IKbJS6BnZ09fbqwFjDuvQ4aFuYxme6eO1vjAaydxXMj/i22TbOFvnyzORrS/FQoT
	jy9TTprESD5YwsoPwx43yk8LeCFNQIRxWC5QAkJH98mA7SHvU1SftGZ9+z8rQJYhMAG1c737Hz4
	Vrc4Bb/
X-Google-Smtp-Source: AGHT+IE+Anjl+JtTMJZqrlQreb+g+wMpx+gUdAmyeFe7d/HK4xJHxIHW6brkXbwTDShJoU/zn1Vu9Q==
X-Received: by 2002:a05:6a20:939f:b0:366:1fea:9b54 with SMTP id adf61e73a8af0-376a96b9a4fmr12941961637.39.1766521187944;
        Tue, 23 Dec 2025 12:19:47 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:19:47 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Date: Tue, 23 Dec 2025 21:16:12 +0100
Message-ID: <20251223201921.1332786-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required LAN969x clock bindings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Rename file to microchip,lan9691.h

 include/dt-bindings/clock/microchip,lan9691.h | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,lan9691.h

diff --git a/include/dt-bindings/clock/microchip,lan9691.h b/include/dt-bindings/clock/microchip,lan9691.h
new file mode 100644
index 000000000000..260370c2b238
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_LAN9691_H
+#define _DT_BINDINGS_CLK_LAN9691_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0


