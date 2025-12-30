Return-Path: <linux-usb+bounces-31823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B10CE8933
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 03:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FA6B3016ED2
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 02:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1497C2E8DFE;
	Tue, 30 Dec 2025 02:38:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F9922F16E;
	Tue, 30 Dec 2025 02:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767062279; cv=none; b=hzg1N52jkzS6ULNqmMYqvSHqNadeG6zXd6R5FnIf+7fspw6Dj2nDU8PyjnRsSTYETrqmUVOmsebUMC99cMwntdIQIXCLrJPO4Z4Q4ZR2owxR3jKgvD9kwj3tELO7iIo+7WX/VuXpv1hbcMH2MM5IC6Bew5tD3VFCtrPw/Sm42lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767062279; c=relaxed/simple;
	bh=VSXKm31hQatW1zCEEqtxSmNpwWjE7Ln+95Q6lbKSUXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ytc1rSS/FfxaRB8cGFb+Tga5z+tA2RZgNhPM4GZj2H8IHNRoP4o1K4I/PDiTbCI4XxF6ItdWq9TnjMBkMKy1Wo+Imqremd0MmmjMU1it+2CF0mAMNL6/ttkBILDEYzM6kdwS0HZKcawhf9sMAXM+UfumDzZL/Q3cSGrNTIxpyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowACXQW3oOlNpIqZOAg--.5334S2;
	Tue, 30 Dec 2025 10:37:31 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/5] Add USB support for Canaan K230
Date: Tue, 30 Dec 2025 10:37:19 +0800
Message-ID: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXQW3oOlNpIqZOAg--.5334S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1UZryxGw18Jr1xJFyrZwb_yoW8XF4xpa
	y2kFZxGrnrtF4aqF4fJF48ury3Z3Z7Jry3Gryaq3srXF1UAFy5Ja93JFy3Zw17GF47Cry2
	vFsYkFy7GFyjyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

Add support for the USB PHY and DWC2 IP which is used by Canaan K230,
and made relevant changes to the DTS.

This series is based on the initial 100ask K230 DshanPi series [1] which
is based on the clock and pinctrl series. Check the details in the link.

Link: https://lore.kernel.org/all/20251229061318.16756-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]

Jiayu Du (5):
  dt-bindings: phy: Add Canaan K230 USB2.0 PHY DT schema
  dt-bindings: soc: canaan: Add top syscon for Canaan K230 SoC
  dt-bindings: usb: dwc2: Add support for Canaan K230 SoC
  phy: usb: Add driver for Canaan K230 USB 2.0 PHY
  riscv: dts: canaan: Add syscon and USB nodes for K230

 .../bindings/phy/canaan,k230-usb-phy.yaml     |  36 +++
 .../soc/canaan/canaan,k230-hisys-cfg.yaml     |  68 +++++
 .../devicetree/bindings/usb/dwc2.yaml         |   3 +
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  21 ++
 arch/riscv/boot/dts/canaan/k230.dtsi          |  51 ++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/canaan/Kconfig                    |  14 +
 drivers/phy/canaan/Makefile                   |   2 +
 drivers/phy/canaan/phy-k230-usb.c             | 272 ++++++++++++++++++
 10 files changed, 469 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
 create mode 100644 drivers/phy/canaan/Kconfig
 create mode 100644 drivers/phy/canaan/Makefile
 create mode 100644 drivers/phy/canaan/phy-k230-usb.c

-- 
2.52.0


