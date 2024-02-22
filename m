Return-Path: <linux-usb+bounces-6916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBC5860464
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 22:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 757431F23DC0
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 21:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151FE73F3E;
	Thu, 22 Feb 2024 21:09:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D65173F27
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 21:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708636168; cv=none; b=h/+E6yBF0tLpHSWb5bRlyDS7WkMfhtJiuFtz4yZA94FoYXRpoa84D1le32U1o19hM7wRuGXjuMnqqMW21MTzDtToWy7dqHUsJ0GX/ACQabOavJsvAI58U9Tvq2YzzvY4zdq8ycxWWy3kmQzCqgyJ0bJfE0zxobH35W/whDlquRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708636168; c=relaxed/simple;
	bh=j31Dajbarf+Gba2tIUbxNCli685oiAzWii4l564PZMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E2ens17h20xj0ZVx+wikFltSgbFT4EmupUoOL6N0lrdueBeUHjvLnHLNOoYjiQw0k1SMT2Lqxm3mjYqL/NXCP5OSovunOgMKEx5F2yBEUtN7n7mprScpBllLaJpZj/FaTCvV8FMPYQVQv/5jgOnQjqdUGOA+tXjq2kBPqjmXboo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1rdGJY-0000lo-UV; Thu, 22 Feb 2024 22:09:08 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	jun.li@nxp.com
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH v3 0/4] USB-C TCPM Orientation Support
Date: Thu, 22 Feb 2024 22:08:59 +0100
Message-Id: <20240222210903.208901-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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

this adds the support to control the optional connector-orientation
available on some TCPC from the TCPM.

I used an custom board with OnSemi FUSB307B TCPC which is spec [1]
compatible but albeit the spec [1] says that this pin is controlled by
the TCPC if 'TCPC_CONTROL.DebugAccessoryControl = 0' it isn't at least
for this device.

I'm unsure if the usb tcpci spec has an copy'n'paste failure since
'TCPC_CONTROL.DebugAccessoryControl' shouldn't control the state of the
'connector orientation' pin or if the OnSemi FUSB307B has an HW bug.
Since on my device the 'TCPC_CONTROL.DebugAccessoryControl' is set to
0 but the register wasn't updated automatically.

The patch adapting the existing dts files is send separately, as
requested.

Regards,
  Marco

[1] https://www.usb.org/sites/default/files/documents/usb-port_controller_specification_rev2.0_v1.0_0.pdf

Marco Felsch (4):
  dt-bindings: usb: typec-tcpci: add tcpci fallback binding
  usb: typec: tcpci: add generic tcpci fallback compatible
  usb: typec: tcpm: add support to set tcpc connector orientatition
  usb: typec: tcpci: add support to set connector orientation

 .../devicetree/bindings/usb/nxp,ptn5110.yaml  |  6 ++-
 drivers/usb/typec/tcpm/tcpci.c                | 45 +++++++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                 |  6 +++
 include/linux/usb/tcpci.h                     |  8 ++++
 include/linux/usb/tcpm.h                      |  2 +
 5 files changed, 65 insertions(+), 2 deletions(-)

-- 
2.39.2


