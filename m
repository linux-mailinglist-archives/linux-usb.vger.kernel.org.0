Return-Path: <linux-usb+bounces-35568-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFVCNqG5xmnoNwUAu9opvQ
	(envelope-from <linux-usb+bounces-35568-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 18:08:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1E34814E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 18:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80EAA30DD302
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 16:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE7A351C38;
	Fri, 27 Mar 2026 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqhu4PGD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C035AC3A
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630074; cv=none; b=WaGMNKvKbO73QCPtWsKH/hLBGdDt6dsNkoUQlVcYszukHNjasMPnW8RPlev3RT2GM770k8M2IdIn85tMkC1i0uiQ4gfOTl6JGeldW3BRvM8+JnvdpDBinkedFoEdyaFC4BbTWsvlNZ7JaK4efVA9D7PI9gdOAAwBt2iAJ3YRE08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630074; c=relaxed/simple;
	bh=IIEe6p/2b8mHbH/L1QZ72Ut1uvoqOXePwTz8y7eTZ/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AEAynkmlPlpW/Sjch12dePtpWyTa8MYGt5HF5ZWDg9nfxDblgaF9i1XZ6q3qWS1v2c7ld/HJ/RLJUvddIknVIHhZSu+1YoWXYoLwLqY7lDCsUNBIIcqCRoOBm22l8R8r79Hyu1jtoQ4fWG0DsOgrUvofFeX6dbdO98aElsEnk4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqhu4PGD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so20106245ad.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630073; x=1775234873; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=icAwEwH8j7JyHdp/GRQI0AOGmMKcZjmWcMVOP98ILmM=;
        b=eqhu4PGD6OrkyEso1+WRLZ/liwjvU/EQWDh02QCYX+L4v6s1X3Jir0uSfgn9ZufHoa
         r+jkNCTZ+k1PU19sqRFHr07SAF5MaUfPv/DnhGAhZub0zPdACIDWhEvgn1h+D7DQUKdZ
         9G/OkGssBCgjt5aDUqq0Qdv+gfWay8AQ4Qlhw3BZu8ED/7Tmqr3meuhSVd227AYfLwLR
         O+jNiPdc/U7vopvcJpwcR5qZV/1S2DFTOulIbss0LU5XMC8NnBg4rReauCuiMbs1mTmG
         SoDtxYX95/Y8y0fmSvU3mDUkUG3M/XZBcZ1TfFHTQpdDXSwmyen/jTW5EFq2xYwExHj6
         8CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630073; x=1775234873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icAwEwH8j7JyHdp/GRQI0AOGmMKcZjmWcMVOP98ILmM=;
        b=bFWja9dqebJmAUo7sjGRYdmjz/bycnkAM3FTSHFiaDMzEdc0xz6j4WEvqV3Edsr1tA
         Ti3RlvPRJw23XR9vVPNdcCb1/rzCnq1TvdSitAmSuAWIWsHlNuRpJ3B/CeWMGmGgYc5Q
         He9EWIFKE06lrUTPaem9rzznvGLDdpU8wOW/xAAX7qQwS2cB4T1sJQ+14JFRl7aG1pcD
         ijqeRDi3qW8ovpNmxP+3GqLw/s0in5Lod8EsKN6kkngjMQVTrP3dtq9Y93ITbAUu3GzU
         Qn7YUlGt9/B52vBSRVHiuQzDJ0XBd3Uyu6Sj3I3MtSVusKiiK999AEHu6ASkpgl41svw
         hJlA==
X-Gm-Message-State: AOJu0YzofHqQgeWnQK7WL+ZKs2+8cv44jxk2e1UGy0FFwtimE+HebiNr
	HS1a3MX5b10Lz6We6yqYv65SMG1DYsXfxgMV2g+nmvtJOSes+7sq3alN
X-Gm-Gg: ATEYQzzYv3Mm6HFXCNZbh+CKM4EDdK2HU7GAb3Quk5kpBv/H2SMIbwT08ckWdmy5zD2
	4iyDPUq2RWbZxd6nc7d4ksKx8pD3cF2p6+lsum1fs36Y9jQBcm+genw/ACMyQ49tXdxqtyfPJGi
	Kv0rayQ3d45PbtU5ax9/7iS/kQp6XvBxHOQ1UsMUvip0sF8+tuouyKpSrkRnwPD75ZwSnNs0Wf9
	JnSL6fQV8940CziaxLVzhx8Nuk6Bzlh6hnSeXKlRAhhsfGl+mT+/+1pAYYMmr9Z6H0lG5UzEZN+
	Qr6dYtTOjUqsKUXF+AO+dZJ4SvhYd0OlYYwjnKOTeykU5Q8jgS33EHEl7T/CB5bv9XFQbvhG9Ur
	IYiNfYlPzi7UdN8iFjel0AlW83mIZoI5Cg3sEKD60ID1qnCPRKgG3iyBYrizID7aK3FIZj7pWZr
	yZNRhJDodMDw757TXuDQUfa0jAoak/N1/sT+qBXdzqgsy+
X-Received: by 2002:a17:902:e94c:b0:2b0:5a4c:726f with SMTP id d9443c01a7336-2b0c48e9a76mr63024805ad.15.1774630072724;
        Fri, 27 Mar 2026 09:47:52 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:47:52 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v4 0/5] dt-bindings: usb: atmel: convert Atmel USB
 controller bindings to YAML
Date: Fri, 27 Mar 2026 16:47:41 +0000
Message-Id: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK60xmkC/13M0Q6CIBTG8VdxXEfjAIF21Xu0LhAPyqbZwFzN+
 e6hXcS6/M7O77+QiMFjJOdiIQFnH/14T0MeCmI7c2+R+iZtwhlXDHhFzTRgT5+xpkK7sjIgAWV
 J0v8joPOvvXW9pd35OI3hvadn2K7fCmeQVWagjDZgBFaCMeHg0g7G90c7DmSrzDyTXOaSJ6kaZ
 RScbGWl/pfiJwXTuRRJisbK0qHWvMZcruv6AQYTrBkWAQAA
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35568-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EAC1E34814E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v4:
- generic-ohci: Modify the commit message and modify description for the
  properties "atmel,vbus-gpio" and "atmel,oc-gpio".
- atmel,at91rm9200-udc: Remove minItems for clocks and rename
  unevaluatedProperties to additionalProperties.
- atmel,at91sam9rl-udc: Remove minItems for clocks and modify commit
  message.
- all: Remove the corresponding text binding node for each patch from
  the text binding file.
- Link to v3: https://lore.kernel.org/r/20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com

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

 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  76 +++++++++++++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  74 ++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  46 +++++---
 .../devicetree/bindings/usb/generic-ohci.yaml      |  41 +++++++
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   2 -
 6 files changed, 224 insertions(+), 140 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-atmel-usb-37f89a141e48

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


