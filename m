Return-Path: <linux-usb+bounces-33651-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GPgC5WknWmZQwQAu9opvQ
	(envelope-from <linux-usb+bounces-33651-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 14:16:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC218773F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 14:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CCC7310B348
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DC839C637;
	Tue, 24 Feb 2026 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9Zebv7L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A2137AA61
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938927; cv=none; b=sBrw1mYWVLmytgpS613Df65Asbf8NtAxsfvfm19dKXTg+XA7652hR8mIbutInQ+zkRT9dXeTsmsghnEP5/b9MFgOcU1uiXJWy9JFaB9qCZ1Cb+0Ph+rq+9gXiWB3yQjvAy2u3t3v0b2MeVviQo5cz46bOn2ykMGJUd+AjYGwB/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938927; c=relaxed/simple;
	bh=OtvZyrWT5VTFMSmcrnZ05pfhHH5/ggvbA2goI3o9av0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A4ChyUpf6/KlUenxkwIoYFeXxgwTAmudkuxaB6j9kxq0vpBeMvbwRuhiKqGhflzTEbY8XoiokWTY+whykRDpAPawg8IX/LpTV81BkkK/A+f6Km43l7Jp+U9wT+nNVnrMrCB5e7OuuM0e+MDIU09ydgZGiwvSAB3Gc4mlUckxQSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9Zebv7L; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82318702afbso5035259b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 05:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771938926; x=1772543726; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87f//Yej2+AUh9A9iH8uD4m2fZ6NHMgB/zE+EasfNio=;
        b=L9Zebv7LOQaC6c6XHWpyX6CQ29DrxcclFUEvrgp10lOMnDvlaeSvDAKGNAMsfTnFA+
         XuyR6yjXi8KJmbJG44dICWjcwuArUHmINyKVxFsbc4xBobXsDbqjfFPIityUYGO2MXiZ
         9mYkeH2d/NGziCETzGGZ0CrZU1z5u2akwaRrDBhcniTCWAzKYoWtPKdLiA9b2NHARn9N
         nFu0x9CSzMYgAPPFgmHqioNxm6TWPv/WHvolnRM083QW4GcnUNsaaA8CH2BMvk6tIQCe
         3qVmWQIG02V1eMgY1WhLMb4iPBnPSwaqaWjLmVwIEVukvYPFajluOj+RTFtJq1nMbKu4
         DoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938926; x=1772543726;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87f//Yej2+AUh9A9iH8uD4m2fZ6NHMgB/zE+EasfNio=;
        b=Kwv308LDdKSF9NmZ5vTYKq6BIFgZF9zlaQQxdUaWkvtUsRg5BzdBu/fN8/rzwKmlDQ
         It+Wt0M8sFybZlfDBBpz/8a6QUI3TA32tpYoBgk8abmU5/FbFxPUBHsYE3dUBW2Uh+0y
         K/KGDqmq/jVravTb/THI8zcdlCkrGU8nejijbEphzWwl2riIugiVmhJkIwstFxcGTc9o
         qxPK4sxssEthq6CYFDt+SygEWDNis5HO/La9MYb+Jib5QXzCdpLOqVNIVmZAB5iIodzw
         yVqDD5zBN1p8Vv6MtRZByA25w+cXzU5SB9gYp0wZ8b21gyktsnWc3SRW7HGpyMO1dvzo
         j8kQ==
X-Gm-Message-State: AOJu0YzxdkW6lhDSKS6W3yFLHxLKyH2HTft/rijLItOZyY87quDu3c2x
	OgWJ4gIKb8T0pKxWNPWb5TaNbTd2A171uvvyyV/QB5WGhG/NL8ZlNGkM
X-Gm-Gg: AZuq6aIgLIDP0aT/hfWtbVskxXN7xWXyCB7sgpNy/tu0A/g+L4Rwmw5n114YFIgEwhR
	LzKpvi9mblP5eydyZY+F68AA9na6xHRB1S+i2HBbuYoNoA7a9nT6bL6WHdY8mbJc461LntXiMr/
	2SK4z/HPDY9FtLqerz4dGMNxA5kU4Yn9hXR6zLCriFw7BmvvcfB5mVIKI04dx5rrCDDWitWRKJ0
	9aQkYSW9ZPyTatrcsgIT5sKANFXVdE9bDmTw7TM73BqmB/iv025IzEx0q0mhX9EfG20iKA7nP4D
	YNME/HnUM5fyJdUpD4XSdkAnoSTF7uDlJTpSrAeJoRAhl6Regk22pgU6WuP2O2ekPjG+a75PjS5
	wHZ1oYvQQU+JSGupTp755JtQwQ2pRKApxlS1GX6xbQ6Xdz9jqvl9AoOrrKGqwKaCLJptlteoPb5
	xp0+eTyuyXySoXiHXv3DF8ZJSkHnYLBK2vhVJ2MRD7fg==
X-Received: by 2002:a05:6a20:1595:b0:2fa:26fb:4a7b with SMTP id adf61e73a8af0-39545f88edfmr9797900637.57.1771938925786;
        Tue, 24 Feb 2026 05:15:25 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm10794013a12.24.2026.02.24.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:15:25 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v2 0/4] dt-bindings: usb: atmel: convert Atmel USB
 controller bindings to YAML
Date: Tue, 24 Feb 2026 13:12:57 +0000
Message-Id: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqjnWkC/03MQQ6CMBCF4auQWVvTaYlSV97DsKgwhUkomBYbD
 endrbhx+b+8fBtECkwRLtUGgRJHXuYS6lBBN9p5IMF9aVBSnSQqI+zqaRLPeBf67BpjsUaqGyj
 /RyDHr926taVHjusS3jud8Lv+FCXxT0kopOjRajJaSu3wOnjL07FbPLQ55w9oFK+jogAAAA==
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33651-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABBC218773F
X-Rspamd-Action: no action

This patch series converts the legacy text-based Device Tree bindings for
Atmel/Microchip USB controllers to DT schema (YAML) format.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v2:
- Drop the separate YAML patches for OHCI and EHCI.
- Add the compatibles "atmel,at91rm9200-ohci" and "atmel,at91sam9g45-ehci"
  to the existing generic OHCI and EHCI binding files.
- Link to v1: https://lore.kernel.org/r/20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com

---
Charan Pedumuru (4):
      dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI binding support
      dt-bindings: usb: generic-ehci: fix schema structure and add at91sam9g45 constraints
      dt-bindings: usb: atmel,at91rm9200-udc: convert to DT schema
      dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema

 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  77 +++++++++++++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  81 +++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  46 +++++---
 .../devicetree/bindings/usb/generic-ohci.yaml      |  27 +++++
 5 files changed, 218 insertions(+), 138 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-atmel-usb-37f89a141e48

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


