Return-Path: <linux-usb+bounces-27979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD97B53D0A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 22:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C6B57BA128
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 20:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1A2276038;
	Thu, 11 Sep 2025 20:22:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58EC2741C9
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757622178; cv=none; b=vAKZCjHOUrlHg7wfD6zurWz8ESoPvi4M1tO7wgVfbLDqZFb3Cr7GlRhFaEWI7lj3soxWTi/SomQ+h8y+3RGstGd5Grhza4PcTJsjG8BbHhGDEFiJWpdl9iwTx4Zk4JRyhR4bfEVER/NFbfIWTPKaCF/hfW9vmwFBBKZNCwg6DBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757622178; c=relaxed/simple;
	bh=6DMQ0RZ/cMSS8NPCfOJCtNcVWEGZ5Csr9zUJlvdAcXc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lphebloxx8dQ+ZsdrOOZxLvLypGq/gFIQaMTZSgUVdxHJsK8M94/6D/t2teoWO++Fln+PyidtgIFeCXbwN69ubHVu1U/KTHFTaBtg7Dx5TCzyleKgZ7+DHxa2EPYSI+TTbvFm73/9dyJMM0xBTnozXQJWX8qu3JY9P9uwn+VGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwnog-0005yg-HH; Thu, 11 Sep 2025 22:22:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v4 0/5] Add onboard-dev USB hub host managed vbus handling
 support
Date: Thu, 11 Sep 2025 22:22:41 +0200
Message-Id: <20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEvw2gC/43NQQ6DIBCF4asY1p0GUAnpqvdoXIAz1dmAASU2x
 ruXeoIuv7f43yEyJaYsHs0hEhXOHENFd2vEOLswETBWCy11L61WUAwoA2tceIQte4jBR5cQkAp
 4ix0qtE5aI2phSfTm/aq/huqZ8xrT5zor7W/9r1takGBQ+9a6Hq2yz4XCtK0pBt7vSGI4z/MLQ
 J6+RMsAAAA=
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

the whole purpose of this series is to make it possible to control the
USB VBUS regulators of an USB hub via host managed regulators.

Regards,
  Marco

---
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
Marco Felsch (5):
      usb: port: track the disabled state
      usb: hub: add infrastructure to pass onboard_dev port features
      dt-bindings: usb: usb-device: add usb hub port vbus-supply suppport
      dt-bindings: usb: microchip,usb2514: add vbus-supply example
      usb: misc: onboard_dev: add hub downstream port host vbus-supply handling

 .../devicetree/bindings/usb/microchip,usb2514.yaml |   7 ++
 .../devicetree/bindings/usb/usb-device.yaml        |   6 ++
 drivers/usb/core/hub.c                             |  55 +++++++++-
 drivers/usb/core/hub.h                             |   4 +
 drivers/usb/core/port.c                            |   6 ++
 drivers/usb/misc/onboard_usb_dev.c                 | 117 +++++++++++++++++++++
 include/linux/usb.h                                |   3 +
 7 files changed, 196 insertions(+), 2 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250821-v6-16-topic-usb-onboard-dev-b8d4d1d8a086

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


