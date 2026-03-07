Return-Path: <linux-usb+bounces-34174-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JINJ/Psq2lziAEAu9opvQ
	(envelope-from <linux-usb+bounces-34174-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 10:16:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4168322AD7D
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 10:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 968FD301673D
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 09:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD382389E01;
	Sat,  7 Mar 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHZ0QwA3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309081C84AB
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772874988; cv=none; b=phjgQlLGZ1pON5SAhLopfbWvVamVjc1msO8pkc0UMnWSVRsXt0Y+cyopF3V3nZv6tC5fuoiKFnqZD76d3XdlInMQfHa3ctmKf7HjQ4ED445L91+fsNChKSwk3WN0B6pDtRihnvDx56442oKQUtxaAT09jgILQDyqnnoza+FElCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772874988; c=relaxed/simple;
	bh=0BeJbyK6IYV+W6lKVToAFbaJYfCIAXJ18MXUNpzvUrk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DlLYYyJexEPP+4XG80wABy4jfASc9FVq8C1rGMtA1A8ec4H6TAhY3k/J8NpK6IZP3UPeFXVZAKhs8e10nwuq1we3ve3UdNxBd9/rdkjpWDLE3unkVG51Xg2DUWelTu1e/8suEn9T9dhWeZSZ34Ho2NcFuKE7J5yxXdYLv+LqVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHZ0QwA3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae82df847bso9550245ad.2
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 01:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772874985; x=1773479785; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pM4veKlw7sYc5J7DCc/SxORcyDfB/eynQvq/fzVIvsk=;
        b=mHZ0QwA3r7WF5CU7+1hFj1av9+lj/Vt4Mj931T/B2uis9T9p1lF1iUJfygIVNyYoxD
         2OBDSOvkV5sOu/HCrOxUOBjWdnBj4unIHmwUDEGtdIuFUlgJelR0rjL08i/2Yxwmalz6
         /vUD1VLBrPdAd5JVWfcBSiJf5BitIw1E4OornHu4b7a6uvfvemxM2ZxOyFCsuc/T7n+1
         1F5EeDpH/vSAVTzFMS7OnDsPpmOGY7F+KoKRJT45M/EpJRvasbFd/suyFm4XF79ZRnnT
         ND6h0xYQnwafkHZs6dYZMqGK5eeA60iPx1V8FryKXD29V+kW6s++4emdy96swNxetKD2
         XT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772874985; x=1773479785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM4veKlw7sYc5J7DCc/SxORcyDfB/eynQvq/fzVIvsk=;
        b=w69Xha+OZaUX2oe2wcPjHveUefuZQlorgpKAAvK196LDGLOlVRCKtf+RXC6f2AzoE/
         g5kIhNzpslf5/7pGyh5RIfy5HhicvLfQ8gXfNepsI7HiL9Tpjr7NaFjyhUL52wxgJcC5
         lSmamXOH6iARGm48nHJ2k76AowVGGOKX3+KpxR+o69J/0a7vuVs0sqCx1qrqp1wXIZeS
         tWpz4ixP3m00BKDXQzWDmREdGY4txsr5z1ahY+3u6knzaKcq2SBxXhqseOFKIfe/ICKf
         D58/SDahMSSjNWjaolaK8fqMCtsTyhgJcL4o8M4LgAPwTT9H8tT9XdciRaLfAgSdSJ6m
         R0/g==
X-Gm-Message-State: AOJu0Yz3mNjZzyVmav9TGOmxZC03iBoqRHOOZkm8cf0jvvjscj1Z6b4B
	/zxsKRXVhHUhuK8EDCMJs2pvCu4tlVoLJII//ctVNY4gIzJ+udzX+GXK
X-Gm-Gg: ATEYQzwaLUum/DqYwqQtEVoOcuJIzLJKuW/f70ODJ80u7JcUNBtWUSYYsPlvEHsOMug
	37m+l+xOzfemncRs8b7oDi1ZjfyL0s+Brvkizz9wmEn2q9VhsoEYViN+V3wZDT2evjTE3GnBte5
	aUQMt/5uuaspdUhjbSxcRbjGAEOoBTX53zHymjfF8jwK3qklLO5cKZMlAo6o7DQMkatwy+f5dZK
	zchPpK20s+JzVHDPDyyBDX3UP3lbmEhgRZ2z3x6qmiWFOb326y/5wH7xvIpGeqKGVz1rcnYeL2t
	6HU7+llndcZbrD1o4NJo1MKoKrKJvzmb9ytIVB4s/Sy/E0uqI3lTsAVwRizglRm/Qin3zEoe+hN
	cq6AoG3KciRih0mLgty88I3VtmvAM9j17+5AcyLiLtS4q4KDptyHBEi+JM2XBZfnPB+zIt5l2X0
	FtNVBHNf44t19gAZoEJXp8RMJJohTb3qmM6wGk+HJTX6U=
X-Received: by 2002:a17:903:b4b:b0:2ae:3a77:a1f4 with SMTP id d9443c01a7336-2ae8247ed08mr49240215ad.24.1772874985576;
        Sat, 07 Mar 2026 01:16:25 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:24 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v3 0/5] dt-bindings: usb: atmel: convert Atmel USB
 controller bindings to YAML
Date: Sat, 07 Mar 2026 09:16:17 +0000
Message-Id: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHsq2kC/02MQQ6DIBQFr2JYl4YPFKWr3qPpguJXSVQasKSN8
 e5Fu2E5L29mJRGDw0iu1UoCJhednzOIU0XsYOYeqWszE864YsA1NcuEI33HJxV112gDElA2JP9
 fATv3OVr3R+bBxcWH75FOsK//CmdQVBJQRlswArVgTHRw6yfjxrP1E9kriRcml6XJs6laZRRcr
 LayLs1t23577oIC3AAAAA==
X-Change-ID: 20260129-atmel-usb-37f89a141e48
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 4168322AD7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34174-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

This patch series converts the legacy text-based Device Tree bindings for
Atmel/Microchip USB controllers to DT schema (YAML) format.

Note:
The patch "dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema"
depends on the patch "arm: dts: at91: remove unused #address-cells/#size-cells
from sam9x60 UDC node". If the DT schema patch is applied before the DTS
cleanup patch, `dtbs_check` will fail due to the presence of the removed
properties in the existing DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v3:
- sam9x60: Add a new patch removing the unnecessary #address-cells and
  #size-cells properties from the sam9x60 UDC node.
- atmel,at91sam9rl-udc: Remove #address-cells and #size-cells from the
  atmel,at91sam9rl-udc binding properties.
- generic-ohci: Add an else condition to the generic-ohci schema properties
  for improved validation precision.
- Link to v2: https://lore.kernel.org/r/20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com

Changes in v2:
- Drop the separate YAML patches for OHCI and EHCI.
- Add the compatibles "atmel,at91rm9200-ohci" and "atmel,at91sam9g45-ehci"
  to the existing generic OHCI and EHCI binding files.
- Link to v1: https://lore.kernel.org/r/20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com

---
Charan Pedumuru (5):
      arm: dts: at91: remove unused #address-cells/#size-cells from sam9x60 udc node
      dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI binding support
      dt-bindings: usb: generic-ehci: fix schema structure and add at91sam9g45 constraints
      dt-bindings: usb: atmel,at91rm9200-udc: convert to DT schema
      dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema

 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  77 +++++++++++++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  75 +++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  46 +++++---
 .../devicetree/bindings/usb/generic-ohci.yaml      |  33 ++++++
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   2 -
 6 files changed, 218 insertions(+), 140 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-atmel-usb-37f89a141e48

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


