Return-Path: <linux-usb+bounces-33549-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJb9F985nGlCBgQAu9opvQ
	(envelope-from <linux-usb+bounces-33549-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:28:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1C1757F7
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12932304AA1D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 11:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67B1362138;
	Mon, 23 Feb 2026 11:27:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD0361679
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846070; cv=none; b=WsBmsGKuj8mY1ul79f7cBnQnz1q9CVCtKsd7uC9+oKu/Bju7th0YzGm8SxaUOcC4T7G+0NvSSof+cEI7qvQ6XtgM5YHUaJhNk8DMnDotGzusgB5HRyUFy2gRHkqTpK0znApM5gWIlN8tMRmYaI1r4MjvoadsCfaYMbUqL86AoaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846070; c=relaxed/simple;
	bh=WLjLX4fFTrjRDe7fmnzKRUWhyDRziRi/Dp4t5UD44DE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M0LZL4mpgQvxGBRBJvt8CY2z+hi5vwT/8VkXQU1OdwebLEvFMA/Sbwl9D//XLvXEYPmDPPiYp7DKzjXc1gDUQup7YgCFWZoUoJx2Ljl6NlTaI3NczTh7RRcDu8vNipXCiskewRACzeRjL+25HTBM4S/CKnTUlsC2EoTtbUuTi8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vuU6C-0007VH-4J; Mon, 23 Feb 2026 12:27:36 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 0/4] Add onboard-dev USB hub host managed vbus handling
 support
Date: Mon, 23 Feb 2026 12:27:33 +0100
Message-Id: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKU5nGkC/43NsQ6CMBSF4Vchnb2mLVCvTr6HcSjcAl1a0kKDI
 by7hcXBQcf/DN9ZWTTBmshuxcqCSTZa73LUp4K1g3a9AUu5meSy5igFJAVCweRH28IcG/Cu8To
 QkEnQIFUkCDVHxbIwBtPZ5dAfz9yDjZMPr+Mslfv6n5tK4KBINiXqmlDgfTSun6fgnV3OZNiOp
 +oDXsUPsMqg0J1EFLKmS/UFbtv2Bg4lqi4cAQAA
X-Change-ID: 20250821-v6-16-topic-usb-onboard-dev-b8d4d1d8a086
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33549-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.908];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: F0B1C1757F7
X-Rspamd-Action: no action

Hi,

the whole purpose of this series is to make it possible to control the
USB VBUS regulators of an USB hub via host managed regulators.

Regards,
  Marco

---
Changes in v5:
- Link to v4: https://lore.kernel.org/r/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de
- rebase on top of v7.0-rc1
- dt-bindings: fix typo
- dt-bindings: move example into usb-device.yaml

Changes in v4:
- dt-bindings: change to vbus-supply and shift doc to usb-device.yaml
- onboard_dev: make use of new regulator API to parse child device
               regulators.
- onboard_dev: drop hard coded downstream port number and make it more
               dynamic
- onboard_dev: drop limiting support to SMSC hubs
- Link to v3: https://lore.kernel.org/r/20250821-v6-16-topic-usb-onboard-dev-v3-0-6d2b38a5d818@pengutronix.de

Changes in v3:
- fix dt-bindings issues
- Link to v2: https://lore.kernel.org/all/20250327172803.3404615-1-m.felsch@pengutronix.de/

Changes in v2:
- fix compile time errors in case the module builds
- Link to v1: https://lore.kernel.org/all/20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de/

---
Marco Felsch (4):
      usb: port: track the disabled state
      usb: hub: add infrastructure to pass onboard_dev port features
      dt-bindings: usb: usb-device: add usb hub port vbus-supply suppport
      usb: misc: onboard_dev: add hub downstream port host vbus-supply handling

 .../devicetree/bindings/usb/usb-device.yaml        |  15 +++
 drivers/usb/core/hub.c                             |  55 +++++++++-
 drivers/usb/core/hub.h                             |   4 +
 drivers/usb/core/port.c                            |   6 ++
 drivers/usb/misc/onboard_usb_dev.c                 | 117 +++++++++++++++++++++
 include/linux/usb.h                                |   3 +
 6 files changed, 198 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250821-v6-16-topic-usb-onboard-dev-b8d4d1d8a086

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


