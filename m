Return-Path: <linux-usb+bounces-27123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F11B3002C
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 18:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB6FBA01FF8
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 16:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6ECD2DF71E;
	Thu, 21 Aug 2025 16:32:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18BF277CBD
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793921; cv=none; b=fe0M0aX2fwLo5lu7G3ihB5QAQRA1grVuIoT2PZLWXzHpyl88jI4GBSI74exAqTzz8+FhZtgHbTTQcG1DKRVxoLpJRbtPGNEmwLAelM4hj/EvUSNpRL68n0SdA+edhO0574yOw0srPOmX40xqteztNMhI7kUPirpvFkCRgmOWkuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793921; c=relaxed/simple;
	bh=tAfVxwRPvahk2ZkXdPSsjANI+nDUKTHt6qSKiUko3uE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rTmDR1vBBzLw+Zy5EHqeyal0Bc42stTnvkHBiotroUaDWPCM5GtogTTT019p3XOkxGGH03VKxhb8JD9H9abHvMH4h33m0M1fdpgZVRB/OX2CEnJXexYeeD5Bol4PbQTUQUktogGpqzbo6viX46bOAwNyB6HxCg379hj9GbFdIeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1up8Cj-0004O7-Hd; Thu, 21 Aug 2025 18:31:57 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 0/4] Add ext. port vbus handling for onboard-dev
Date: Thu, 21 Aug 2025 18:31:54 +0200
Message-Id: <20250821-v6-16-topic-usb-onboard-dev-v3-0-6d2b38a5d818@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpJp2gC/x3MQQrDIBAAwK+EPXdBTSLSr5QeNLtp96JBWwmIf
 4/kOJdpUDgLF3hODTJXKZLiwPyYYPv6+GEUGgajzKqc0Vgtaou/dMiG/xIwxZB8JiSuGBwtpMl
 55SyM4ci8y3nvr3fvF+o1iTZtAAAA
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

Hi,

the purpose of this series is to make it possible to switch the vbus of
the downstream ports of an onboard-dev hub via ext. host controlled
regulators.

Changelog:
v3:
- fix dt-bindings issues

v2:
- Link: https://lore.kernel.org/all/20250327172803.3404615-1-m.felsch@pengutronix.de/
- fix compile time errors in case the module builds

v1:
- Link: https://lore.kernel.org/all/20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de/

---
Marco Felsch (4):
      usb: port: track the disabled state
      usb: hub: add infrastructure to pass onboard_dev port features
      dt-bindings: usb: microchip,usb2514: add support for port vbus-supply
      usb: misc: onboard_dev: add ext-vbus-supply handling

 .../devicetree/bindings/usb/microchip,usb2514.yaml |  6 ++
 drivers/usb/core/hub.c                             | 55 ++++++++++++-
 drivers/usb/core/hub.h                             |  4 +
 drivers/usb/core/port.c                            |  6 ++
 drivers/usb/misc/onboard_usb_dev.c                 | 95 ++++++++++++++++++++++
 drivers/usb/misc/onboard_usb_dev.h                 |  3 +
 include/linux/usb.h                                |  3 +
 7 files changed, 170 insertions(+), 2 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250821-v6-16-topic-usb-onboard-dev-b8d4d1d8a086

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


