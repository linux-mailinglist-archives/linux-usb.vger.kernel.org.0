Return-Path: <linux-usb+bounces-31015-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD0C906C9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 01:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 913D234ECB5
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 00:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9395F2139C9;
	Fri, 28 Nov 2025 00:27:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED991F4C96;
	Fri, 28 Nov 2025 00:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764289664; cv=none; b=nGZUS542s1RxLZPIv1s8ey3bDToWMXYDLQgBbweqeqTzfvOPa4GYDRU5KJ8SSTY2GoKZ/qlvO5x9bwfoBO4cV0Jgd1n5pbdqovKZE87VktWMxdhJsHApn5oM5vyakcdjmsOsNRLthA3P5L14g7ycAZLn4QoC2p++6sadwLsscE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764289664; c=relaxed/simple;
	bh=UrnAKGkKlxEe5ApYlVlupJbZmp/owkUSOCyzAFd03ac=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ByZ6mobJF3wzivTR+KKVgYXrp7+LMoBE7YjynUz5Rzm0i2z4K2KwXhX6e48V4Bcbn5/I97hwzmHb4mYwakWp8uika2DS15NRZLqY277tGbqBFXP9bAGix3Oa+oaiSz0PJnmFJkTcE0M+xx1hWNvdWrTgMfUTiXC2aeFr1j0711k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 28 Nov
 2025 08:27:34 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 28 Nov 2025 08:27:34 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v2 0/2] Add AST2700 support for Aspeed vhub
Date: Fri, 28 Nov 2025 08:27:29 +0800
Message-ID: <20251128-upstream_vhub-v2-0-1fa66a5833c2@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHsKGkC/13MywrCMBSE4VcpZ20kl8barnwPKRLT0WTRC0kbl
 NJ3NxbcuPwH5lspInhEaoqVApKPfhxyyENB1pnhCea73CS51EJIzZYpzgGmvyW33JmC5OVZmVJ
 rUP5MAQ//2r1rm9v5OI/hvfNJfNefdPqTkmCc1YJXvK5VBfCLiRPQzbDuaMee2m3bPmllE7ivA
 AAA
X-Change-ID: 20251125-upstream_vhub-3e20483a455e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764289654; l=1048;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=UrnAKGkKlxEe5ApYlVlupJbZmp/owkUSOCyzAFd03ac=;
 b=LGYVQGQ8i7g94NwVJWfNatY7KQZfrIp01emaDZlFrkoo8xIBtzqqpnkJqSdwTnEeuJh1jA+92
 9gQFRTNpRNdBXDIiyX6INWMuNOUOjzWveU5LwipX8snqn31NnmtAYc1
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

This series add Aspeed vhub support for AST2700.
The AST2700 vhub requires a reset and uses 64-bit DMA.
This series updates the binding and driver to support these two
requirements.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v2:
- add an else to block resets properties false on other platforms.
- add AST2700 in capability in description.
- Link to v1: https://lore.kernel.org/r/20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com

---
Ryan Chen (2):
      dt-bindings: usb: aspeed,usb-vhub: Add ast2700 support
      usb: gadget: aspeed-vhub: Add ast2700 support

 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml   | 22 ++++++++++++++--
 drivers/usb/gadget/udc/aspeed-vhub/core.c          | 30 ++++++++++++++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h          |  1 +
 3 files changed, 51 insertions(+), 2 deletions(-)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251125-upstream_vhub-3e20483a455e

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


