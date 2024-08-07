Return-Path: <linux-usb+bounces-13194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B7594A975
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 16:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1745B1F25756
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 14:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DCC38DF9;
	Wed,  7 Aug 2024 14:09:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC553A1BF
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723039740; cv=none; b=oOS25xdTMLYeOueCq3NG8RlPKNxqLXp8xZRyulrDyYnmc9uAijveqJQtG8bSZfxIgZrP5zKhH6shBb0zWgOLEtWFHfAnlw2q8ilbNJGdtp0k+KJrxUp0OQ1FfxZ7OJjtbwcfshLY0qsj8LeqKGR3tJcnJ5bLJMB/SpAd1IBx9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723039740; c=relaxed/simple;
	bh=NUj5wD7jqwjUuXRXzhxFQy2mFAEoVFERr+yep4YN54M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NCpp2r8qE/8JDQTgmKl2Y97mmpmb32kJYC018MjC+uAw35+06nkmQ6P8L9a65APd/gHu7Mpf1251N05I2uTU2EXL0wt8IaUhWkJIU//mAZ8qOV6soK4IKwlaeOJ9/7hMKmfwOBVsqExHg7/K/pUXjZbcIxgKR398QWnXv70Xc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sbhLQ-0002E5-OD; Wed, 07 Aug 2024 16:08:52 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/3] USB-Serial serdev support
Date: Wed, 07 Aug 2024 16:08:47 +0200
Message-Id: <20240807-v6-10-topic-usb-serial-serdev-v1-0-ed2cc5da591f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO9/s2YC/x2MQQqAIBAAvxJ7bsFMSvpKdLBaayEqtCQI/552G
 uYw84Inx+ShK15wFNjzsSepygKm1ewLIc/JQQqphBYthgYrgddx8oS3HzH3ZsuYKaCuTWu11Y2
 qJaTH6cjy8//7IcYPxLKF5G8AAAA=
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi,

this patchset is based on Johan's patches [1] but dropped the need of
the special 'serial' of-node [2].

With the patches in place and the usb hierarchy described in properly we
can use serdev on-top of usb-serial. The below example adds the support
for the following hierarchy:
 - host->usb-hub->ftdi-usb-uart->bt/wlan-module:

&usb_dwc3_1 {
	dr_mode = "host";
	status = "okay";

	hub@1 {
		compatible = "usb424,2514";
		reg = <1>;

		vdd-supply = <&reg>;
		reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>;

		#address-cells = <1>;
		#size-cells = <0>;

		device@1 {
			compatible = "usb403,6010";
			reg = <1>;

			#address-cells = <2>;
			#size-cells = <0>;

			interface@0 {
				compatible = "usbif403,6010.config1.0";
				reg = <0 1>;

				#address-cells = <1>;
				#size-cells = <0>;

				bluetooth {
					compatible = "nxp,88w8987-bt";
					fw-init-baudrate = <3000000>;
				};
			};
		};
	};
};

If no serdev node is found the usb-serial is exposed as usual and can be
accessed via /dev/ttyUSBx.

Regards,
  Marco

[1] https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/log/?h=usb-serial-of
[2] https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-serial-of&id=b19239022c92567a6a9ed40e8522e84972b0997f

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (3):
      serdev: ttyport: make use of tty_kopen_exclusive
      USB: serial: cosmetic cleanup <space><tab> mix
      USB: serial: enable serdev support

 drivers/tty/serdev/serdev-ttyport.c |  9 ++++++---
 drivers/usb/serial/bus.c            | 10 ++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240807-v6-10-topic-usb-serial-serdev-83a7f8f86432

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


