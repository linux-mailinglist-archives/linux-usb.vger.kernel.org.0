Return-Path: <linux-usb+bounces-31734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1096CDA962
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 21:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12214306456C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2470A3596FF;
	Tue, 23 Dec 2025 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="tqNu0iNX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4DB3590AC
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521307; cv=none; b=CDc59FhnwVD1yJeMMCNOjafUHMsnzx/c8m40ayWSuHM7iGCB0tcsBJJguwvmvDNPfJTbufCG0rGv4gLzGHfpmA0QSJQmljC2paF+8EdlQ+p7OOSjPaCeq4c1RLnd6+Mh4fxBtp3cOal9JklSQA3Uo4+FYtOXS+ORX6KvRaLgS7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521307; c=relaxed/simple;
	bh=XoF0Eovrxm1txLTrLfP7MB7ayo4/Y25gdep/95xkk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSQqVHa0fz2FykS/69Py9rBI0H04xsw4mChbhRu7tMG/0FWSfBcmIpPxA2DDRpikiF/Fl2xVB1QV//r81ZjlJ03Ok/YM6wyf9gwbMa2G/N9oNJ9Qoq6iGxpEdY279myLLeUkxoutxfmAgPxvrqDtU24efwfsLory8/j96t4k7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=tqNu0iNX; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so5324715b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521304; x=1767126104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=tqNu0iNX/T8f4ZQ0j/Yobjqpzb43xMAQ24m5BfCOWvdzq3IHmLjeqTBOAgIiE7d5S2
         N5fBPe5y3gl9uLYGhAi4647HW/5fN5LATqcvMhv8qLSObvDo519o4bPtPTd0HcrOtJNL
         +yrIM8SMF0AMAun4zHRZJCoFTQvESD1JZ71NTG7XBB+JBmw6GT/ko8ZiqfMcvI7AT3/T
         fYOEil8UzahtCc/HfhugBjuEHq4Pcujmr1Visr30t0FPiD0JQG5z8cnjJpuD0T4CGuh4
         AzOo/BgdB+0KcAyjo3REQrPASQFRboUdXtpZEUsvwTEelTK2a6yQ1+FXxnZACDRLKtDD
         LFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521304; x=1767126104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=rgbxLIMqllWs8iFY5DWCe54SMct2EYN0+rvbrLRr6owV7cMCVtdbvwhV1DBEgAh1Dx
         kYoMdr4JpIo5TeVrbrkx4MGDLNAHhKX3dxp2iJX5AbLqzN6dn+jkc0KenEcBNe1i26Lh
         htvvubEFMVc4deRL8p53QDzqci5WP/J0ty5+z2urfKmxrmMLX1EIkXPYBsSWoOeYQ03k
         0CuFGi1Z/q64C4IJ1u8vtgwZ96IUiHY7siv7YbxDmdMe10a1xbAmAdmYjlzA+DaIe4QA
         FzohiKHoYWzs1O8SKwuUVl6S9rP0mHdlSliD/3bW5kTbrD8vUkMXmJSYTN/cT7laiqzR
         DdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJnEPCyBvyicRnDhTgeqYs+9eYCf1g4nTKyR1A3WzM4W/tUep74v+ZlqvD8oyvJVnC57hUBdnZieA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbTqHgRnKT4oP+NJm3PyjEkfpsY3prPr5aXx2xBCLJGKQG8eo5
	KHMRhp5HsumJmVGLwWOOyIliwshMw7/cJglQkr80DfOoImudlgrSlAtZY3GzZ19NG+Y=
X-Gm-Gg: AY/fxX6UzVIC8cvKOyvzNZjglxtoR5zH4XmRg5xe6P6KedLkaybDZyZpnaNPM8F6TCA
	5Vofj/PXh1Au9xd3d8FogfM4SGCd1jFh9djb31brDMbnq38eUavmdNCnDSdVFj3UrFq4AHa2Wrg
	GGcVWanqRxvYl44qg+pZ59qeJw7AUJkG7skdy8AUAlgLEH3xYOkmTa8EwlhUHLhYPT5wQDhcHQC
	M8FNvRC8hxzN6ln8Pxdkfhh3UH+glAcpEgmuM36TagiUax85kcOZn3NayjeI3sr7vZqoNoRKAno
	Wfa7wXlRNyDFPQKD9xrCL2SB70/0AFZHoYlGkR2EA6VL5BhAKiLFXkBas1Wt+k3IpcINCmszAGU
	oDuVPeLsQPUSuSEqMkCGqx+x+9kZWX6v72mbd8y6qpEqYgrzgGzUOaCRUHVlR+e/gpUrKhNbNnk
	oAjL2c9aa5Xl10FyVhZMvE+KSMyeQwo5uRtk1f1VRzln6HdoGSUem9PxyHjvpe6C2/cPk2hH201
	f06oZX2
X-Google-Smtp-Source: AGHT+IFrLV1OA+vGIt1Qeh3SInjG9m4lWsVJ7UMsa9ff7itN29HXneV9Wlv0pR5HcnrOBgJnEjlG2A==
X-Received: by 2002:a05:6a20:9392:b0:364:14f3:22a7 with SMTP id adf61e73a8af0-376a9de5935mr12020799637.42.1766521304022;
        Tue, 23 Dec 2025 12:21:44 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:43 -0800 (PST)
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
Subject: [PATCH v3 14/15] dt-bindings: arm: AT91: document EV23X71A board
Date: Tue, 23 Dec 2025 21:16:25 +0100
Message-ID: <20251223201921.1332786-15-robert.marko@sartura.hr>
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

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4..b0065e2f3713 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -241,6 +241,12 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: Microchip LAN9696 EV23X71A Evaluation Board
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan9696
+          - const: microchip,lan9691
+
       - description: Kontron KSwitch D10 MMT series
         items:
           - enum:
-- 
2.52.0


