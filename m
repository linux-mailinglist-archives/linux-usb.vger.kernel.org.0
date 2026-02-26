Return-Path: <linux-usb+bounces-33745-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCnNJ5dtoGk3jgQAu9opvQ
	(envelope-from <linux-usb+bounces-33745-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 16:58:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA461A9467
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 16:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C03E53404961
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F6E410D0E;
	Thu, 26 Feb 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CrdUSEoj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3440FD80
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120390; cv=pass; b=n/Fa4wsqzquuVJUTAXejol9MN75PslAPMSx52llQhpdlo/BGgVWS5WHFRr4ibOy2Avv87fbZAoNvEZHq+kN8QCULGtVmF7Ccz7qTV8ssZOwNnNX5BVxy8CTsk9J1vySNtlkRThQ/ZC/2qdPbCkVpSg6kOkZc/USUvqzYtgFgTVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120390; c=relaxed/simple;
	bh=7p3KnwhCjiXCAFckjTZO4s4z0gC/fOAvonkWNNLLb1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A50rLOoG0BVFVAm2EqiBIHqlOyDPuFwx1+wh/LKfnOcYOlxVk5gu/tjDJKL5fMz7xxXXFpM0HkVtg1vbk4p9lBXj3D6Kp/IntokkufO+rDpE21bFkEltjDBG7JKDI5dDTHCMawVv97tOVhLUSt04QxlevqPjKqBos2QJ9DkYHE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CrdUSEoj; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120364;
 b=Vx9RCxgehNOKJfNXdOZLmduEHVB3GfH6sCOxnimiCcQtaVMaXbUIMFMUxxWraRgBsEJQQtyJ
 H0zHvczPhN0mkePlRBFdL4upDtf/h3KHTyAx99c7ypOCEdLTUpXSqGBFVbR/mpljMQ1ouyqBxiD
 mNhiCqLDFlW3ti9GC7QMIP+M59wWQ9KUYTnEdNlqj3TTuP8do19/m+47TXBuaHiGwp1qatAo94U
 Tw0U8qJbzwgSeSJJU1AhG3IvYJEUKh/nAdw6zRE3lkwY0qZCxk/iTmceAZ/EuxJvSkHVgMsLnQe
 0sXF5+yC7C38G7XIg8I3IBmnUV9c+JyWhR4KR69q1iTRg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120364;
 b=GqdsKLP/UO89i09L1TL0g35SOZy/j7Y6RPhX2R4PMeVDAYx3GN94XUlWEZNPho5nxMh51xOY
 1CQg2uyVwT5nZaZ+XCT4X/cch+RDCd22YLHBaQMqkdA3ZVdTDk9GLSo/JilCs/m2WQzbOkdbrxQ
 zV2uuYDcqaykNfrFEXzPJY9+P8URuarpnTQSm00wghjyBQ6cdGwuTk0D5GnJ485G9XWiSFvGGbU
 0xEs5ffUVOpaN4n3rtmT1GZKviT2AKxD5nWxQJtSfgdyXSPgsd960Ls5DT1uQzTeiwN6Wm0MGwi
 xLfFKocKrVghH+4ygb4MMhceJzPkxbUiK4Qz8RovUfZpQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 26 Feb 2026 16:39:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EFE42A407F2;
	Thu, 26 Feb 2026 16:39:00 +0100 (CET)
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
Subject: [PATCH v3 0/5] Support TQMa8QM
Date: Thu, 26 Feb 2026 16:38:49 +0100
Message-ID: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4fMFxL2sBsz4F898
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:e6eeaebf4cf021a93157c2a1ac4b54d4
X-cloud-security:scantime:1.938
DKIM-Signature: a=rsa-sha256;
 bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120364; v=1;
 b=CrdUSEoj7s27eeLk5hEmkkOaCHBLt2j2x6bsazimg9z3O+nLGEHjDWqatBCTpArME7HqVJxw
 RH4SSGt99vUArNZoQSXJ4Y/b6UyIca/k8KRX9H3v7QDAzp7MvcHpX8TjSkP8WCXO0Y4J7vRMGMD
 O6XJvhsWaeWiDdxSpkaD39u/aNJQDJNJ6iY5AIUuH3qUBwFx0i/OyPv2mWNupK9zFrofFGw/uh1
 KPU+qhGLxZuYjHehXzFLhuNvuO3bx6wBXJiss/5RCXtJbmdCWt21orJOqhrdvu3trqqobxykkSs
 7EGSALFUYM7sz64QTEEl8hgO3K/womKIQ6kyWX8rs7WgA==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33745-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ew.tq-group.com:mid,ew.tq-group.com:dkim]
X-Rspamd-Queue-Id: 4AA461A9467
X-Rspamd-Action: no action

Hi,

this series adds support for TQ's TQMa8QM. The first 2 patches are prepatory:
1. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

2. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

3 & 4. Device bindings and platform DT

5. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Changes in v3:
* Small cleanups in patch 1 & 4

Changes in v2:
The need for clock-output-names properties for renesas,9fgv0441 has
been removed by reworkging the PCIe clocking

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (5):
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: freescale: add initial device tree for TQMa8x
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 867 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 325 +++++++
 6 files changed, 1207 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0


