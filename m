Return-Path: <linux-usb+bounces-32168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D0D10592
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 03:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B31A30492B2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 02:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CC947A6B;
	Mon, 12 Jan 2026 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="QjVgpA+D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6537A27472;
	Mon, 12 Jan 2026 02:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185084; cv=none; b=SS1O1XAhaDvOU8KV7Em/Ij/u45NTlnGmwdKtIIJSl+ufbvvCZ+a9TVEJvdmWBlOpx/nNC1W96MHZi0sX7WDQ8oObTmxh1cmIiAHgxckNsUhRmVzOoKvg/FsAtNk78u6qCMfmSUkxJ476fR1E+zQvFh9nGYaHXpzSY5j0yjkNQ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185084; c=relaxed/simple;
	bh=MoMfG/P6UbSnnoMsB+rKCDa1C2zgWOSj5wLA0iReGMs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=klGvJ53RbJR43sa1D+8NwifhmvtPNJB+/MbxY2sLpCS95Gwgyx9V0ZDG0axE9TvBmbGKqF5bt3rqt2aBF6+f4EVhxB5e9dHACSJXSqQqHng1nQ8I9UmPRsKAc+XH9RByE36icS1iysIqf1NY4QnOqV37nTh8Q0VNULXR4INmdg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=QjVgpA+D; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768184914;
	bh=5OwuqBa1SKtgkAufTwdNUgHq4LXbcH9yxhfSttEXZd4=;
	h=From:To:Subject:Date:Message-Id;
	b=QjVgpA+DN/Tc8QipuykbZtIg3b5K343C1zO1SxXZbyKoZTntCzzs/m54JGrW+mUBR
	 YiTaueIBiMhHibvjqAHqRaOH3+dS89reMYNyw7DGPqgTwFos4t41FhNM6S8V2dUcEq
	 qIsYMhf0yV0V9zAmqxw6ZmnlDhPe3Z9yxtBDjnK4=
X-QQ-mid: zesmtpsz4t1768184911t0d1f0041
X-QQ-Originating-IP: sntjFapz4HbC+mkqdoSmtzzuUOEeNdmwI5vWgXHYI1c=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 10:28:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7699444275135992075
EX-QQ-RecipientCnt: 23
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hsun Lai <i@chainsx.cn>,
	John Clark <inindev@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: rockchip: Add rk3576 evb2 board
Date: Mon, 12 Jan 2026 10:28:20 +0800
Message-Id: <20260112022823.91-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NUTz4BkILuKLFFWBZfchHmjoVwmwrFRkzImEnehPaR3jbEDZ3g2ylOBP
	zyU4E/UQau/JqG0PeYlT4U6pgWBWE+dz3C6qZHXrNxQdTPmXYWk2/rXTm/KmjZBoInmvO8R
	EotUfgw11arf0KDibY23rz6eseGt14yYjcV/l7nn3mE2rhxxFtsdao0nF3AzhZQYAHSf0cb
	rSjvwX88NQ5890dyhnUVy6Oafvf+Yv5SsmGGqr3gl97hxkXwyqh+u2KapAmNAHVOVQSypkC
	j0UhMBrOXbOxPL2mRTbmjrmvPqIB9wFo35ysnTLJ2xxonJi9afYAPvBxaYjl9VZ7paLzPGU
	iir0CBFfcN3OnbYEB58YxJOgXrvSSHwTTgHYH4FI6NON97ylxpDZw0zWrho0zfEJrnsDvF+
	Muiula7JhKnThdAhuU44mMBmaTUOfNt2trHPepV6T4MhFBLFfie1VUoDl57c5XHr0gVWgqh
	SedXAWAor0XSlPU0XJzqzFkiS3K8waMzzuHx0SGC8Ocl0ubISUYA5/8EvmQgnnKnL3EOJGs
	8rsbYVfN5WcuhujPj2PIY8J13mzOEHv+SqH//tQfjGsc1e+yuEqvPxDTzXkf90gLmNCAQD6
	/KedC02g/OhjvuSuhiuOG3E8BiwTax6F89wK/qAw6fvRUWdh5+gLeIb7NUcJGCgfjve+uhV
	LreDZq+l0tPSG4nzpVlYmlm2QEKAnXqkSXcisOXco2YDiWsJ3BMzX+8X5Yt4ADWOkImMHtE
	ZKFMF9iJyJxgjAL11+2yvh5+SK2NYpCHUIzLvV8SGUWcZ7J085spljVfCtF9603VPf4teyl
	Yw4MM2Qm8Kv9MpVfXAPVnlPkg1pqymKZv4mn16iHBPDyXNFrUhwo4UUa28PjDKwME4l6D1B
	Q/iHsBR+JHgpPccXJUfS5x5o09+ItdKbLlmy9ICzV8cL+RAoUC70yDoi4+d4xlqAvmpGiPG
	G6d6fTZx7n/ejU6xylHcfwxu5gMeDukUhdCD3wcWgwwRTl/OOo3wToapeRj7GmbgeBo8WV4
	8II0ifReXt7EyCKL5H
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Hi,

This series add support for rk3576 evb2 board.

General features for rk3576 evb2 board:
    - Rockchip RK3576
    - LPDDR4/4X
    - eMMC5.1
    - RK806-2x2pcs + DiscretePower
    - 1x HDMI2.1 TX / HDMI2.0 RX
    - 1x full size DP1.4 TX (Only 2 Lanes)
    - 2x 10/100/1000M Ethernet
    - 5x SATA3.0 7Pin Slot
    - 2x USB3.2 Gen1 Host
    - 3x USB2.0 Host
    - WIFI/BT
    - ...

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260107070322.323-1-kernel@airkyi.com/ 
- Add binding for WCH CH334/CH335 hub controller.
- Add alias for mmc.
- Rename some usb vbus regulator.
- Add DP regulator.
- Change gmac phy-mode to rgmii-id.
- Add target-supply for sata.
- Change vcc-supply for ufshc.
- Add usb hub.
- ...

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260104023703.118-1-kernel@airkyi.com/
- Enable hdmi_sound and sai6.
- Add more cpu-supply.
- Use regulator to control sata power.
- Remove "cap-mmc-highspeed" prop in sdmmc.
- Add regulator supply for ufshc.
- Add the missing vcc3v3_hubreset regulator.
- Add otg capability for usb_drd0_dwc3.

Chaoyi Chen (3):
  dt-bindings: usb: Add binding for WCH CH334/CH335 hub controller
  dt-bindings: arm: rockchip: Add rk3576 evb2 board
  arm64: dts: rockchip: Add rk3576 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |    4 +-
 .../devicetree/bindings/usb/wch,ch334.yaml    |   65 ++
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 1002 +++++++++++++++++
 4 files changed, 1071 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts

--
2.51.1


