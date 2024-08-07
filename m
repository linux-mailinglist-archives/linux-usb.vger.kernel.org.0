Return-Path: <linux-usb+bounces-13198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C494AA62
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 16:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB7BA1F21E03
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 14:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF77884D0D;
	Wed,  7 Aug 2024 14:37:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141DE84A27
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723041432; cv=none; b=jlycO8X/BCBknPVj6tRghQE9I9CeTIpGDPXRWWtT/d0v7PGAFDjcu6Cff1LvBypn1+SQ7hOzYlxwy10HzMN8PpHU/a0XyCmvKLjwyN5UN6j385WKX2U2IIuCG6/hyG/l/wvKFq2Mmye259btT5MdFAjDso5x4ISuA0+1P87Yt38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723041432; c=relaxed/simple;
	bh=/ShUO5gWWyQPEk/n/IYfO27GTJqaZHpFeEF6y5w9DLs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=knDNUeEl15/BBByuCKF4R6y97nNwQePXsLNyqhqZaymkZQ1QFynF0mVO4ob/3bW+MHz+HKuQmwR7Z5sTLsgzT+AJxizIqRixKWiBl8OwzVrDULsPfeD7uyu+vn5jM4kqj1MRJu76fzTfKS6Fjnxmnb8166PBBC5Zpcv22un+mMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sbhme-0004Iv-G5; Wed, 07 Aug 2024 16:37:00 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/3] External VBUS port power handling for onboard USB
 devices
Date: Wed, 07 Aug 2024 16:36:50 +0200
Message-Id: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIOGs2YC/x3NywqDMBBG4VeRWfvDGIKXvkpxYczYziaRRENBf
 PcGl9/mnIuyJJVMr+aiJEWzxlDRtQ2t3yV8BOqrybCxPPIAZ1F6dIwj7rrizA4xuLgkDy8FdmL
 Lw2i82SaqkT3Jpr9n8J7v+w/z3qe+cAAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi,

some PCB designs don't connect the USB hub port power line to the
dedicated hub port power pin. Instead they use a host controllable GPIO
line to enable the VBUS power.

This patchset addresses this use-case by hooking into the
usb_clear/set_port_feature() function and call the usb-onboard-dev hook
if available. The usb-onboard-dev driver is taking care of the rest.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (3):
      usb: hub: add infrastructure to pass onboard_dev port features
      dt-bindings: usb: microchip,usb2514: add support for port vbus-supply
      usb: misc: onboard_dev: add ext-vbus-supply handling

 .../devicetree/bindings/usb/microchip,usb2514.yaml |  7 ++
 drivers/usb/core/hub.c                             | 22 ++++++-
 drivers/usb/misc/onboard_usb_dev.c                 | 76 ++++++++++++++++++++++
 drivers/usb/misc/onboard_usb_dev.h                 |  2 +
 include/linux/usb/onboard_dev.h                    |  6 ++
 5 files changed, 111 insertions(+), 2 deletions(-)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240807-b4-v6-10-topic-usb-onboard-dev-49040782d2f9

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


