Return-Path: <linux-usb+bounces-22249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3439A73A63
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 18:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9B83B8DD1
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 17:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C002192F8;
	Thu, 27 Mar 2025 17:28:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B0218EBE
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096530; cv=none; b=GC7FutfOJlebXhK2CfqNDwb3CITe1Nd3cR+lU6xIUAV+eMdBNUg62n9kPhUpN4B3gdAFRMMqkOMJwCU7mQDuc92TIEtNVDmtcCK/ihsL9Ju+Z8jPcIE6ZsJCN5F32hmAWZsPfrrxIMB19WocW60Ihj6qa6C77W5hv3+8akvzWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096530; c=relaxed/simple;
	bh=Ewb3hGLmllHwmqOj+nkzsevSgEtBKa46vN6xsQyAXtU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y69rFmHQZo649gNkE9dJpcVq87eqesl8OF91Kc/qgMrTZVVuMoJcxAok+qmffh37H5kpI86sMBz1tDhRgxucDsKfs5bnQfYUKs22dQimvcYLP9Ffj9aTLyimHjmocEjmIYP69R/+ZP5Mz5DPL9AGlNzSEjut3A2JaLAKGbL2Mnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1txr1m-0002hN-Uv; Thu, 27 Mar 2025 18:28:26 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mka@chromium.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	festevam@denx.de,
	stern@rowland.harvard.edu
Cc: kernel@pengutronix.de,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add ext. port vbus handling for onboard-dev
Date: Thu, 27 Mar 2025 18:27:59 +0100
Message-Id: <20250327172803.3404615-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi,

this small series is the successor of [1]. The intend of this series is
to make it possible to switch the vbus of the downstream ports of an
onboard-dev hub via ext. regulators controlled via the host.

The approach from v1 was not sufficient since it caused compile errors.
We indentified the issue and went with idea-3 [2] to fix this.

Regards,
  Marco

[1] https://lore.kernel.org/all/20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de/
[2] https://lore.kernel.org/all/wtvhsdo2zefehkgfcp2cfdl2uht4lcrytyjyhwjhnpcyvx4kd2@iurrw554aegh/

Marco Felsch (4):
  usb: port: track the disabled state
  usb: hub: add infrastructure to pass onboard_dev port features
  dt-bindings: usb: microchip,usb2514: add support for port vbus-supply
  usb: misc: onboard_dev: add ext-vbus-supply handling

 .../bindings/usb/microchip,usb2514.yaml       |  6 ++
 drivers/usb/core/hub.c                        | 55 ++++++++++-
 drivers/usb/core/hub.h                        |  4 +
 drivers/usb/core/port.c                       |  6 ++
 drivers/usb/misc/onboard_usb_dev.c            | 95 +++++++++++++++++++
 drivers/usb/misc/onboard_usb_dev.h            |  3 +
 include/linux/usb.h                           |  3 +
 7 files changed, 170 insertions(+), 2 deletions(-)

-- 
2.39.5


