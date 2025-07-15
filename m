Return-Path: <linux-usb+bounces-25809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB426B04FFD
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 06:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21D003BB17F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 04:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220342D8DB0;
	Tue, 15 Jul 2025 04:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npUfWfvb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971202D322E;
	Tue, 15 Jul 2025 04:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752552231; cv=none; b=KRcPufYQsA0ghNvQPT37kW8tKcSCBl7yqoZbpvUH3JVjBNy2qGb6snKLlW0zsGDNVDufrItgzr3Ir6xOeFqMscplnd3O9kRtYCqvaTIe1yopdEz9e+pa3RdgLAuEvtiKNPFd7wp8YpkyIf1Kls7GirsJp7NkgcprpxKjAgv/UZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752552231; c=relaxed/simple;
	bh=NXtp7w76eILz7UJorQaVSrmzzRCcq8QUVDUca4Vg+Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KT1do4gmzCPoEKwYqnv0mWQRUqI6gAFdqhrKM72sYsJK8CRULpmrSojlCgj5yvOhBvM7AkXx4EHBVcRM3y7R2+gsl2/+49/UW819UUNboToqRYgkRpjhndntmL1VeCKUcFTNXyFKrcnADQAtsJRyqD7JsU+mDTlIiVCTwfn1ryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npUfWfvb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4514DC16AAE;
	Tue, 15 Jul 2025 04:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752552231;
	bh=NXtp7w76eILz7UJorQaVSrmzzRCcq8QUVDUca4Vg+Qc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=npUfWfvbA7lJFIhCallO/I0yc9wr3VBfo5zQc5Ga12ufBUuaKaEe6Rw+hv9A9YKi0
	 XABQxXUBM0WBelHvxxjl60F8krg+avKwzxLgIGTtQNxXDoppmJCFBUksLHCZJEK5FM
	 bU8R4B/MjXh8+ewgjsWvY0VLaAiA07QlfQdt+kMMykoOF6ILPYSGti1+yUrewjteh/
	 c0+UVha9A/PWPoWJUUjCpUBCrvmwbgsN7i/6xNkbcaySHu5FhA0z1oJzZFw7JV7GIV
	 sDkf3fNNY1LHFeifiGbaIOmeNxDJ0pzOg2/VqIRi5K48v0ZzCg99PpbgufgiKN+bW4
	 spIHTtVeemPVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F11C83F21;
	Tue, 15 Jul 2025 04:03:51 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 14 Jul 2025 23:02:52 -0500
Subject: [PATCH 09/17] soc/tegra: pmc: Add Tegra210B01 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-t210b01-v1-9-e3f5f7de5dce@gmail.com>
References: <20250714-t210b01-v1-0-e3f5f7de5dce@gmail.com>
In-Reply-To: <20250714-t210b01-v1-0-e3f5f7de5dce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, Azkali Manad <a.ffcc7@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752552229; l=7406;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=hzjKnBO/Bhd6FTOOojs+tMJUMscvli8+8bMrtnhg7WI=;
 b=UJmfrzgea8bspNX1hqX9xywhLGh0IZF0nArp+5yu5aCmw2r06knUY1zdSnE1/2YiY0a4myVOp
 UX1Qtl6NQrVBmO8Tqnr3Q7wMX/qdPqYi0cM8Fbhe88EFYoSZ/kkyFtJ
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Azkali Manad <a.ffcc7@gmail.com>

---
 drivers/soc/tegra/pmc.c | 117 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e0d67bfe955cdea6b4703952741b0b9970084d66..689354c280883f7096f007ae714dad1b379a2852 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3732,6 +3732,122 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.has_single_mmio_aperture = true,
 };
 
+static const struct tegra_io_pad_soc tegra210b01_io_pads[] = {
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x1b8, 0x1bc, 5, "audio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x1c0, 0x1c4, 18, "audio-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 4, 0x1c0, 0x1c4, 10, "cam"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x1b8, 0x1bc, UINT_MAX, "csia"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x1b8, 0x1bc, UINT_MAX, "csib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 10, 0x1c0, 0x1c4, UINT_MAX, "csic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 11, 0x1c0, 0x1c4, UINT_MAX, "csid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 12, 0x1c0, 0x1c4, UINT_MAX, "csie"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 13, 0x1c0, 0x1c4, UINT_MAX, "csif"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DBG, 25, 0x1b8, 0x1bc, 19, "dbg"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DEBUG_NONAO, 26, 0x1b8, 0x1bc, UINT_MAX, "debug-nonao"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DMIC, 18, 0x1c0, 0x1c4, 20, "dmic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DP, 19, 0x1c0, 0x1c4, UINT_MAX, "dp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSI, 2, 0x1b8, 0x1bc, UINT_MAX, "dsi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIB, 7, 0x1c0, 0x1c4, UINT_MAX, "dsib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIC, 8, 0x1c0, 0x1c4, UINT_MAX, "dsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSID, 9, 0x1c0, 0x1c4, UINT_MAX, "dsid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EMMC, 3, 0x1c0, 0x1c4, UINT_MAX, "emmc"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EMMC2, 5, 0x1c0, 0x1c4, UINT_MAX, "emmc2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_GPIO, 27, 0x1b8, 0x1bc, 21, "gpio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI, 28, 0x1b8, 0x1bc, UINT_MAX, "hdmi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HSIC, 19, 0x1b8, 0x1bc, UINT_MAX, "hsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_LVDS, 25, 0x1c0, 0x1c4, UINT_MAX, "lvds"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x1b8, 0x1bc, UINT_MAX, "mipi-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_BIAS, 4, 0x1b8, 0x1bc, UINT_MAX, "pex-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 5, 0x1b8, 0x1bc, UINT_MAX, "pex-clk1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x1b8, 0x1bc, UINT_MAX, "pex-clk2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, UINT_MAX, UINT_MAX, UINT_MAX, 11, "pex-cntrl"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1, 1, 0x1c0, 0x1c4, 12, "sdmmc1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3, 2, 0x1c0, 0x1c4, 13, "sdmmc3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI, 14, 0x1c0, 0x1c4, 22, "spi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI_HV, 15, 0x1c0, 0x1c4, 23, "spi-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x1b8, 0x1bc, 2, "uart"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB0, 9, 0x1b8, 0x1bc, UINT_MAX, "usb0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB1, 10, 0x1b8, 0x1bc, UINT_MAX, "usb1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB2, 11, 0x1b8, 0x1bc, UINT_MAX, "usb2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB3, 18, 0x1b8, 0x1bc, UINT_MAX, "usb3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x1b8, 0x1bc, UINT_MAX, "usb-bias"),
+};
+
+static const struct pinctrl_pin_desc tegra210b01_pin_descs[] = {
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AUDIO, "audio"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AUDIO_HV, "audio-hv"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CAM, "cam"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIA, "csia"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIB, "csib"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIC, "csic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSID, "csid"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIE, "csie"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIF, "csif"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DBG, "dbg"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DEBUG_NONAO, "debug-nonao"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DMIC, "dmic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DP, "dp"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DSI, "dsi"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DSIB, "dsib"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DSIC, "dsic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DSID, "dsid"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_EMMC, "emmc"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_EMMC2, "emmc2"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_GPIO, "gpio"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_HDMI, "hdmi"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_HSIC, "hsic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_LVDS, "lvds"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_MIPI_BIAS, "mipi-bias"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_PEX_BIAS, "pex-bias"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_PEX_CLK1, "pex-clk1"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_PEX_CLK2, "pex-clk2"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_PEX_CNTRL, "pex-cntrl"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SDMMC1, "sdmmc1"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SDMMC3, "sdmmc3"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SPI, "spi"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SPI_HV, "spi-hv"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_UART, "uart"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB0, "usb0"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB1, "usb1"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB2, "usb2"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB3, "usb3"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB_BIAS, "usb-bias"),
+};
+
+static const struct tegra_pmc_soc tegra210b01_pmc_soc = {
+	.supports_core_domain = false,
+	.num_powergates = ARRAY_SIZE(tegra210_powergates),
+	.powergates = tegra210_powergates,
+	.num_cpu_powergates = ARRAY_SIZE(tegra210_cpu_powergates),
+	.cpu_powergates = tegra210_cpu_powergates,
+	.has_tsense_reset = true,
+	.has_gpu_clamps = true,
+	.needs_mbist_war = true,
+	.has_impl_33v_pwr = false,
+	.maybe_tz_only = true,
+	.num_io_pads = ARRAY_SIZE(tegra210b01_io_pads),
+	.io_pads = tegra210b01_io_pads,
+	.num_pin_descs = ARRAY_SIZE(tegra210b01_pin_descs),
+	.pin_descs = tegra210b01_pin_descs,
+	.regs = &tegra20_pmc_regs,
+	.init = tegra20_pmc_init,
+	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.powergate_set = tegra114_powergate_set,
+	.irq_set_wake = tegra210_pmc_irq_set_wake,
+	.irq_set_type = tegra210_pmc_irq_set_type,
+	.reset_sources = tegra210_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
+	.reset_levels = NULL,
+	.num_reset_levels = 0,
+	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
+	.wake_events = tegra210_wake_events,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
+	.has_usb_sleepwalk = true,
+	.has_single_mmio_aperture = true,
+};
+
 static const struct tegra_io_pad_soc tegra186_io_pads[] = {
 	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, UINT_MAX, "csia"),
 	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, UINT_MAX, "csib"),
@@ -4253,6 +4369,7 @@ static const struct of_device_id tegra_pmc_match[] = {
 	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
 	{ .compatible = "nvidia,tegra210-pmc", .data = &tegra210_pmc_soc },
+	{ .compatible = "nvidia,tegra210b01-pmc", .data = &tegra210b01_pmc_soc },
 	{ .compatible = "nvidia,tegra132-pmc", .data = &tegra124_pmc_soc },
 	{ .compatible = "nvidia,tegra124-pmc", .data = &tegra124_pmc_soc },
 	{ .compatible = "nvidia,tegra114-pmc", .data = &tegra114_pmc_soc },

-- 
2.50.0



