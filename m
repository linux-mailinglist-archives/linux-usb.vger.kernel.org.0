Return-Path: <linux-usb+bounces-31590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6FDCCCFD2
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 18:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0AF7301226D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 17:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E493559DC;
	Thu, 18 Dec 2025 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FYP8ZSVD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB93559D8
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071338; cv=pass; b=hciAo2xNNHMA68WncUcr6/5UOkADC/ToOgPY5UQ4R7+hX2J5281/hfv4X2dYqFLEHDvsbh+FTPjRjiOTT520Zk1HbhFaJ8ver1zEwYsGbvD8esN62dDt8jwsn0KCv2hTm+6pYGOyr1wHyOJC6aGHgV+FNoXHZFahr37/lcNSdiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071338; c=relaxed/simple;
	bh=XQ46J/0Q/s1txq+6yOGv2tGq9CYnPBG5axSq5J5swGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcZyl0OZzSVMnZ0vGxLQOFkw/6B+KjyNfdrn5IYF556yqFNPYZgNVVpNZVui65e9psczeeOQh2efChYUUvYDc5ClK9L/moAsj663Iyzd9AAM4IBaiee8KmrNZojk1kXI+LhBS14eLWTm7VTsuXXKkobrf/CDPm3WASC+VERCLEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FYP8ZSVD; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071303;
 b=RI9dDzShZEvtTZuAyLKssYMXi+w+e5AZgQdR2dMWuTSjaWAXWqw2mHxVkTduQIHHZVIAMWIP
 kDqAe4RIZgk2Ec40M81+5+KR2nhExlLpB1geFQIZ7F8HhvEy8qFJ26GOf3JgF5FJbQy/3no9Hls
 ZBu1bSCXD2n2xZoHYfdBrLEVoSWQm3q/iQeRaKTESO3Npu942atvVPcoR2Vy0T+ykEypBQQuPim
 SyWxcXSRbVT2pOJ+nvq6d6vUctj9rT4FqtuNkLPrNd/h2X/ge7kO+O5YHQxNEgXpCrVXzkFh0HO
 eozGgYY6CoKSZQVa2N4gd4U9vD94mllzr4scqXYv+ONZg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071303;
 b=abYeteFGZ7w8eGy5dzu1jwHaSi6TN1kJPyb50xUhK4MEMu5olrXpkXkG8uuWA9s5+nPmp6mk
 gQP4XcJb7Lmv8C89veKM1LbOHm8DKOJ2SZtTrbQ7Jdfasx4LyHEgtAo8Lkkx6UM3KsLV7jSIIlq
 +t1MJV2u60jy6uGAum/GC8LG6NpkCmcBc6/QJVDcuoscBk/nB0qIGFbjH2SzL4IyGnvLRpG0dzj
 T0nakCWE3HDEic0fzzYG9aVlNXgRWW+W+7F/yDpnl9ntiVEu3oZ+L5Bt+2V0Xbf2qvo/gG3gVbG
 1hQOy3SPyDTu0ogC24KKJLD32ZunAvAEGe/L3PO579CZA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 18 Dec 2025 16:21:43 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 16D9ACC0D31;
	Thu, 18 Dec 2025 16:21:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/6] Support TQMa8QM
Date: Thu, 18 Dec 2025 16:20:47 +0100
Message-ID: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4dXDrx4SHSz4F929
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:836eb70413c5acce62e457440dd9da8d
X-cloud-security:scantime:4.420
DKIM-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071302; v=1;
 b=FYP8ZSVDSwP/ymeVJgrWOk1Wif4sC2r9iUUhRKpaLkZW3KigzwF64LmSeobZ1VV3AkTz/S8f
 lCTHOfb5vwHjyO8RBQ8QMNRk+oA7QN3JM0rTSbia5mYKI1Bi9+CuECef28FgjRJgB/Kz5boCjwv
 oo1o4TFwScJmi62SqAX7ZFoYYW7GVzOGO68XCfQTMR8tb+xvngDw/ebIySMIBMOCfdFAN+80kAW
 Up7hT6LcTcAMdN5yMrSvIFCN7LbC2i1KTMgAKuzer2khTQ4AlPvzuZLCOHlVq03A0VaNyL3p09c
 nmLED01RCWsYP3vzLgINwh9US2++hf/3bSa+1CtGTYcKA==

Hi,

this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
property on the parent clock.

2. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

3. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

4 & 5. Device bindings and platform DT

6. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (6):
  dt-bindings: clk: rs9: add clock-output-names property
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: Add TQ imx8qm based board
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../bindings/clock/renesas,9series.yaml       |  37 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |  11 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 869 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 322 +++++++
 7 files changed, 1253 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0


