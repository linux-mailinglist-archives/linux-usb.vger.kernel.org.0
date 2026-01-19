Return-Path: <linux-usb+bounces-32487-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C1D3A2C2
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 10:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BCF930BEDBF
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 09:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907D03563CD;
	Mon, 19 Jan 2026 09:18:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F7A354AF6;
	Mon, 19 Jan 2026 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768814336; cv=none; b=Jjc2AACO591Rv7jJWHMLb0k9M8PkB10cYuQpBQxE7iqz3V9+wyECqoF0NgOR5Ahpuel0sUBjGsz2tbqoSJk7Cs//52ozspCdLEQ3A7Kw4fMZ6+t9b/hNXxobI1k9Eu8wOp40iZaCtE95nejwIaNESMdxIHb3/2hww260M6alyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768814336; c=relaxed/simple;
	bh=neXInHZeFqZv2XFiR7pXGsBlXJnB212c1Gp8ntrSGVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/ugJVHgU9MV14ZFrSIoqn1dEa3G/YUUKi2Dn4IFuGQpkOdwSHPIoQhBIqcUl8LxT0jUCZ91ofoHoQcI+0Q6IXT3rYynMHWfL2fNlHfNpef6pJzNV/yK+Y5+4352rcfjffPTemR1zUICu/OSrIUfuS7B0YA4hG6vlml46iM5j8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.206.18])
	by APP-01 (Coremail) with SMTP id qwCowADXf2vI9m1pXbZKBQ--.4971S2;
	Mon, 19 Jan 2026 17:18:02 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	conor@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add USB support for Canaan K230
Date: Mon, 19 Jan 2026 17:17:49 +0800
Message-ID: <20260119091753.294073-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXf2vI9m1pXbZKBQ--.4971S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1UZryxGw18Jr1xJFyrZwb_yoW8ZF1fpa
	y7CFWakFsrtFWaqF4ftw4rCFy3JFn5Jry3Gryag3sxXF48CFyUZwn3urW5ZF1UGFsruryj
	qFs0kFyxGFWUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

Add support for the USB PHY and DWC2 IP which is used by Canaan K230,
and made relevant changes to the DTS.

This series is based on the initial 100ask K230 DshanPi series [1] which
is based on the clock and pinctrl series. Check the details in the link.

Link: https://lore.kernel.org/all/20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]

Changes in v3:
- Shrink reg length to match the address/size-cells in k230-usb-phy yaml.
- Move all PHY instance creation and initialization from xlate to probe.
- Modify xlate function to only perform index lookup for PHY instances.
- Define all register base offsets macros at the top of file instead of
  hard-coding magic numbers directly in probe.
- Link to v2: https://lore.kernel.org/all/20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn/

Changes in v2:
- Fold the child into the parent in dtsi.
- Define one usbphy with phy-cells=1.
- Delete the clock of the usbphy as it is not needed.
- Link to v1: https://lore.kernel.org/all/20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn/

Jiayu Du (4):
  dt-bindings: phy: Add Canaan K230 USB PHY
  dt-bindings: usb: dwc2: Add support for Canaan K230 SoC
  phy: usb: Add driver for Canaan K230 USB 2.0 PHY
  riscv: dts: canaan: Add syscon and USB nodes for K230

 .../bindings/phy/canaan,k230-usb-phy.yaml     |  35 +++
 .../devicetree/bindings/usb/dwc2.yaml         |   3 +
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  17 ++
 arch/riscv/boot/dts/canaan/k230.dtsi          |  35 +++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/canaan/Kconfig                    |  14 +
 drivers/phy/canaan/Makefile                   |   2 +
 drivers/phy/canaan/phy-k230-usb.c             | 271 ++++++++++++++++++
 9 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
 create mode 100644 drivers/phy/canaan/Kconfig
 create mode 100644 drivers/phy/canaan/Makefile
 create mode 100644 drivers/phy/canaan/phy-k230-usb.c

-- 
2.52.0


