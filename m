Return-Path: <linux-usb+bounces-31587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF97CCCFD8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 18:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC0AB302AE0A
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 17:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6084354AD4;
	Thu, 18 Dec 2025 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XmNxL/Fz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93C8352FA2
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071319; cv=pass; b=gxnvHYfjud0qQ3OWgTnCOu/2MoFq92hX0G0OFV0hPi5i9JUVDAotcyiCgEMdOkTxtdosltkeRkObIDMSinMShwwq/LkmhCLIiBzDqR6PCkWvtFXhl52HbNrvv6MM24dWWRYsaTpgzV1T7Ntk55Fh0bqwla0/YhYYAkO/gefRpMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071319; c=relaxed/simple;
	bh=6cFJMMBpfqYHtmXLgEpDrCdBFuoUEsV5n0RZlhvD924=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bB2SuqqYhfSe1PVFu/Ub/tv4oq9II/zwAeZzAJqlQ+phy2suSZmbNDwjna/d6Jcixv9ho1+c9Sdow+lmMs/cNCTXuzCdlsEELowlM20FHbLmQRrcZCSBUwxlEiUQetXXj+2SmPpDU6xVNk9+gQ6d2NJVa6JvQ2V2Ga7osuNPA+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XmNxL/Fz; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=718S0BdFz8xiVCzU8aXFCL2DNXNEbKnbIjEDDeQ51yA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071293;
 b=HMv4f10YV9j2xPoFoisfGgbTxIrlhNG+Z3yQVYD92uEJ+MCQgaEuUIt8BANOV1XTAg5qXgeU
 2bOCuvCHZCrNSZFoHNoMV4TwSpW0OoZ+WQZKfSvW80iHg3I1/zE9YI+m0WXeFcRohI4wUgaQjoG
 vcfY59Eyc6PsP+CL9USr/w1xxzNtucchg9v5pxa0nI/b7PnFrQjltDiojdID68YQOVeFKZV3rB+
 Ez0+KacEMD4ESnNoX3MceAeJvhhUGSq3NbFV/7YYcmiB4tCjWjjFktWbdOc79x1Vifrvwp2QFGf
 MLOYT9hWYmKW7DatBGsnyBf+h3B/aneeICt8o11oLZPxA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071293;
 b=Ykj4IiROJYAOtKGzEOrdfsX8WRIjpr+RoWdM9yEgwssF+cVLLPV3mRymzM7JJWia/nBDvXoZ
 09K6T8C48Adi50p8eK1F3gOekHyAY+d4YnbWIfj4ovxAXNDMsCnDvKEAIz1Qf51ksJNPwe6jUxM
 8JZmJ70pofRP/D/zHdEbBCT2uRTAdhEAwSbganq4DS+PxX/q/xHHmCxS8MLtE/7zeeHa7Miq6++
 voQoz7oGS3MdJyGbAqEQ109NLj/B1YTP5orLxDoInmJwmkXxd6E7ex9tLsszzhsgXilP8O9Remw
 ZA55mDe2Ni2I5y3bI9VT0Etoeb3lxQ2YJVnFPvfkrx3rw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 18 Dec 2025 16:21:32 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DC1C2CC0D53;
	Thu, 18 Dec 2025 16:21:08 +0100 (CET)
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
Subject: [PATCH 3/6] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Thu, 18 Dec 2025 16:20:50 +0100
Message-ID: <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXDs20KQZz3yY5w
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:af1e11a75574753d5df662a88887dfc6
X-cloud-security:scantime:1.983
DKIM-Signature: a=rsa-sha256;
 bh=718S0BdFz8xiVCzU8aXFCL2DNXNEbKnbIjEDDeQ51yA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071292; v=1;
 b=XmNxL/FzU6UDdWAssVHHgq76ILnEDDqnwW97C9sqtYaaPKfpeOMw35bvL2Fyi6gb1DptU7ji
 +xAYSxfpr4Yg0MLlLBVJqdk5q5bfbSinwXGygGRX4TpcBkJIDsjGMjpfhs6pGoosM2YKvr7+Eh+
 26P3/TGMffjIsO1qZqsZEa4XAlhefagXsM/+u64/aR02aCz1rDUacVq5AaHOlrTicRXBLheLhnf
 oYB8gcG46FtPZ/yIIy3r+48sYJPBeKL4S6CrwOGWhKqdeEnoovwd8AV9WDNJcVp7J899yY16j08
 +u5oLeCI6ocpGrh5wiJqxs0hbTZO8N1T/AdNhWrjsmYmQ==

IRQ mapping is already present. Add the missing DMA interrupt. This is
similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
DMA IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index bd6e0aa27efe9..f2c94cdb682b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
 		ranges = <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
 			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pciea_lpcg IMX_LPCG_CLK_6>,
-- 
2.43.0


