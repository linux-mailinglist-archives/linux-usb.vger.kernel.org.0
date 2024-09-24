Return-Path: <linux-usb+bounces-15353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E79843C5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 12:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC941C21C7E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 10:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE8619C561;
	Tue, 24 Sep 2024 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="pC8Ot6Kn"
X-Original-To: linux-usb@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9D419C540;
	Tue, 24 Sep 2024 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174410; cv=none; b=r7uNkRcrKUppnWY1fSDEtunHEvPh7ftD46h0IMv2+QpDdpspQ1YDkBHg6XnNxnYS9O7wjHn6xXL8M1SaAdqHeh6OcJJg9z0xlylCVR+ZwUnWlC8+dgaTNdS1U3uxij3gPAFmDN2BUESapZBeG0DXHVhPxf8z+jEjhUtVixvMalE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174410; c=relaxed/simple;
	bh=dNP4cVkYeMVPCUAl6V9ZNPpmFdKOOmK3mbBZjBEMtfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oSrEiU2M/FgWAPoEGxnJ0lIkYkTpZ++Z+BfGGjCZKeaWbXXcQNw2q2ZQRk8Ro0ObpdvS/49az7EKEWYSwhB1tgP3JzqgDIe9H4r4U2SSs48iipuEJ0E7WhpiTRwjipz/CKkP7C5VBXUrnYB4kBiYZYhPUROJhrmqa40CuqLkKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=pC8Ot6Kn; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1727174401;
	bh=b/byf2gL4R1q3RchD94jm7yV/wDyD9oU7cKPxmILi+0=;
	h=From:To:Cc:Subject:Date:From;
	b=pC8Ot6KnQD068NvG3k6OTdpC8op+YBVCyBGgBeMfEVA9YrSNM0bljqt+xkeGTqYry
	 aD8EZKxpYkXtXbs0E5hRAePAjBFrptqUVqiMDue5rDIEL6jEhaT/SYCb2OOD0Kq9zo
	 27Q+qEQ+w79e68A1nhfXmEb4k9OQXMh/QPbvlpzU=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 497B7A0419;
	Tue, 24 Sep 2024 12:40:01 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Petr Benes <petr.benes@ysoft.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Michael Walle <mwalle@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v4 0/2] Add support for new IMX8MP based board
Date: Tue, 24 Sep 2024 12:39:39 +0200
Message-ID: <20240924103941.1729061-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
this series adds support for a new member in our IOTA platform.
The board is based on the i.MX8MP SoC. It adds support for most
of the board functionality except USB Type-C port and some other
minor things.

This series originally included the dt-binding for that Type-C
port controller but I finally removed it based on a good comment
from Krzysztof. I will post the Type-C binding including the driver
in a followup series.

Michal

Michal Vokáč (2):
  dt-bindings: arm: Add i.MX8MP IOTA2 Lumpy board
  arm64: dts: imx: Add imx8mp-iota2-lumpy board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mp-iota2-lumpy.dts | 423 ++++++++++++++++++
 3 files changed, 425 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts

-- 
2.43.0


