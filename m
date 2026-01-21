Return-Path: <linux-usb+bounces-32577-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMDJDjZ7cGktYAAAu9opvQ
	(envelope-from <linux-usb+bounces-32577-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 08:07:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C55296C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 08:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2689F4E1E57
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFE04418D5;
	Wed, 21 Jan 2026 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQAfKaGx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4D3557EE;
	Wed, 21 Jan 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768979233; cv=none; b=mPKgbBPioQ2QJiN3RUYgSgGjz9OcF9Ho3DwvmkuvpNqOGdGxxS8lfpSxyIKl7LIVG65whel0MflqoVHOu2A0zsKsDWphG2cX8aS7VjXpXb+TIOmNZArGBncWP1uu74qg1654aW/zCfVfcq9LuFWDa75CbxFis+Y/F+tZZFoBS88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768979233; c=relaxed/simple;
	bh=D/qLyHaqemYuzX/6TqYrPD10JkyadCvZeTQHZMRgjjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqd/pyyZ24KEky2Ys+4HGg3yeXmO5NWeldPOc8EtG9ngU1E3MeOo2n6waxS5H3WGLUYGEfoUiBhXgmEfeHYJt3leOOftRWaVwMD63ci8b1ZbXYOx2i1McZS2QQmjJHHOSAVQhs35dCElXL+tfc9j2ATz4DiE08E9q05jYLwsrJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQAfKaGx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CB8C116D0;
	Wed, 21 Jan 2026 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768979231;
	bh=D/qLyHaqemYuzX/6TqYrPD10JkyadCvZeTQHZMRgjjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQAfKaGx2l7So5vR6Sb/9yAdfiXnVwSwF7BVyCPT5Gl8dlA4guXULV9JwgaAi+XZu
	 cZbwYCiY2CzQog11d8mqnHB8RefvzDr8V1Rr2XWCRZqAI5JQT9K+hLMT62h2TbTANq
	 cuK5tk6kEyswVLuJ0nKOBmSolo5nSHyZeq6hY9DXx/ROoQ6n0tYrgRQo2gpwpLtjbp
	 vtpSyfmx6vyN5zynOP4RcK4CR6snVv6/eSa4Svpv85wX454t0zUGWjcmESxBxXUoiX
	 QjQrec+8G9xkT8Ptv0B5PZcDftAh4NcpIzUMNLKg2ulrtNpVu4pJQKsqyC7bU/Dmjl
	 0jORLJgIQmepw==
Date: Wed, 21 Jan 2026 12:37:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, conor@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aXB7GqQaxtgKReVa@vaman>
References: <20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260120143243.71937-4-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120143243.71937-4-jiayu.riscv@isrc.iscas.ac.cn>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32577-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D95C55296C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20-01-26, 22:32, Jiayu Du wrote:
> Add driver for the USB 2.0 PHY in Canaan K230 SoC, which supports PHY
> initialization and power management.
> 
> Add Kconfig/Makefile under drivers/phy/canaan/.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  drivers/phy/Kconfig               |   1 +
>  drivers/phy/Makefile              |   1 +
>  drivers/phy/canaan/Kconfig        |  14 ++
>  drivers/phy/canaan/Makefile       |   2 +
>  drivers/phy/canaan/phy-k230-usb.c | 283 ++++++++++++++++++++++++++++++
>  5 files changed, 301 insertions(+)
>  create mode 100644 drivers/phy/canaan/Kconfig
>  create mode 100644 drivers/phy/canaan/Makefile
>  create mode 100644 drivers/phy/canaan/phy-k230-usb.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 142e7b0ef2ef..e37bcceef65a 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -150,6 +150,7 @@ source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/apple/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
> +source "drivers/phy/canaan/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
>  source "drivers/phy/hisilicon/Kconfig"
>  source "drivers/phy/ingenic/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index dcbb060c8207..8cef0a447986 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -22,6 +22,7 @@ obj-y					+= allwinner/	\
>  					   apple/	\
>  					   broadcom/	\
>  					   cadence/	\
> +					   canaan/	\
>  					   freescale/	\
>  					   hisilicon/	\
>  					   ingenic/	\
> diff --git a/drivers/phy/canaan/Kconfig b/drivers/phy/canaan/Kconfig
> new file mode 100644
> index 000000000000..1ff8831846d5
> --- /dev/null
> +++ b/drivers/phy/canaan/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Canaan platforms
> +#
> +config PHY_CANAAN_USB
> +	tristate "Canaan USB2 PHY Driver"
> +	depends on (ARCH_CANAAN || COMPILE_TEST) && OF
> +	select GENERIC_PHY
> +	help
> +	Enable this driver to support the USB 2.0 PHY controller
> +	on Canaan K230 RISC-V SoCs. This PHY controller
> +	provides physical layer functionality for USB 2.0 devices.
> +	If you have a Canaan K230 board and need USB 2.0 support,
> +	say Y or M here.
> diff --git a/drivers/phy/canaan/Makefile b/drivers/phy/canaan/Makefile
> new file mode 100644
> index 000000000000..d73857ba284e
> --- /dev/null
> +++ b/drivers/phy/canaan/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PHY_CANAAN_USB)		+= phy-k230-usb.o
> diff --git a/drivers/phy/canaan/phy-k230-usb.c b/drivers/phy/canaan/phy-k230-usb.c
> new file mode 100644
> index 000000000000..350950563f60
> --- /dev/null
> +++ b/drivers/phy/canaan/phy-k230-usb.c
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Canaan usb PHY driver
> + *
> + * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>

2026 now!

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +
> +#define MAX_PHYS		2
> +
> +/* Register offsets within the HiSysConfig system controller */
> +#define K230_USB0_TEST_REG_BASE     0x70
> +#define K230_USB0_CTL_REG_BASE      0xb0
> +#define K230_USB1_TEST_REG_BASE     0x90
> +#define K230_USB1_CTL_REG_BASE      0xb8
> +
> +/* Relative offsets within each PHY's control/test block */
> +#define CTL0_OFFSET		0x00
> +#define CTL1_OFFSET		0x04
> +#define TEST_CTL3_OFFSET	0x0c
> +
> +/* Bit definitions for TEST_CTL3 */
> +#define USB_IDPULLUP0		BIT(4)
> +#define USB_DMPULLDOWN0		BIT(8)
> +#define USB_DPPULLDOWN0		BIT(9)
> +
> +/* USB control register 0 in HiSysConfig system controller */
> +/* PLL Integral Path Tune */
> +#define USB_CTL0_PLLITUNE_MASK		GENMASK(23, 22)
> +
> +/* PLL Proportional Path Tune */
> +#define USB_CTL0_PLLPTUNE_MASK		GENMASK(21, 18)
> +
> +/* PLL Bandwidth Adjustment */
> +#define USB_CTL0_PLLBTUNE_MASK		GENMASK(17, 17)
> +
> +/* VReg18 Bypass Control */
> +#define USB_CTL0_VREGBYPASS_MASK	GENMASK(16, 16)
> +
> +/* Retention Mode Enable */
> +#define USB_CTL0_RETENABLEN_MASK	GENMASK(15, 15)
> +
> +/* Reserved Request Input */
> +#define USB_CTL0_RESREQIN_MASK		GENMASK(14, 14)
> +
> +/* External VBUS Valid Select */
> +#define USB_CTL0_VBUSVLDEXTSEL0_MASK	GENMASK(13, 13)
> +
> +/* OTG Block Disable Control */
> +#define USB_CTL0_OTGDISABLE0_MASK	GENMASK(12, 12)
> +
> +/* Drive VBUS Enable */
> +#define USB_CTL0_DRVVBUS0_MASK		GENMASK(11, 11)
> +
> +/* Autoresume Mode Enable */
> +#define USB_CTL0_AUTORSMENB0_MASK	GENMASK(10, 10)
> +
> +/* HS Transceiver Asynchronous Control */
> +#define USB_CTL0_HSXCVREXTCTL0_MASK	GENMASK(9, 9)
> +
> +/* USB 1.1 Transmit Data */
> +#define USB_CTL0_FSDATAEXT0_MASK	GENMASK(8, 8)
> +
> +/* USB 1.1 SE0 Generation */
> +#define USB_CTL0_FSSE0EXT0_MASK		GENMASK(7, 7)
> +
> +/* USB 1.1 Data Enable */
> +#define USB_CTL0_TXENABLEN0_MASK	GENMASK(6, 6)
> +
> +/* Disconnect Threshold */
> +#define USB_CTL0_COMPDISTUNE0_MASK	GENMASK(5, 3)
> +
> +/* Squelch Threshold */
> +#define USB_CTL0_SQRXTUNE0_MASK		GENMASK(2, 0)
> +
> +/* USB control register 1 in HiSysConfig system controller */
> +/* Data Detect Voltage */
> +#define USB_CTL1_VDATREFTUNE0_MASK	GENMASK(23, 22)
> +
> +/* VBUS Valid Threshold */
> +#define USB_CTL1_OTGTUNE0_MASK		GENMASK(21, 19)
> +
> +/* Transmitter High-Speed Crossover */
> +#define USB_CTL1_TXHSXVTUNE0_MASK	GENMASK(18, 17)
> +
> +/* FS/LS Source Impedance */
> +#define USB_CTL1_TXFSLSTUNE0_MASK	GENMASK(16, 13)
> +
> +/* HS DC Voltage Level */
> +#define USB_CTL1_TXVREFTUNE0_MASK	GENMASK(12, 9)
> +
> +/* HS Transmitter Rise/Fall Time */
> +#define USB_CTL1_TXRISETUNE0_MASK	GENMASK(8, 7)
> +
> +/* USB Source Impedance */
> +#define USB_CTL1_TXRESTUNE0_MASK	GENMASK(6, 5)
> +
> +/* HS Transmitter Pre-Emphasis Current Control */
> +#define USB_CTL1_TXPREEMPAMPTUNE0_MASK	GENMASK(4, 3)
> +
> +/* HS Transmitter Pre-Emphasis Duration Control */
> +#define USB_CTL1_TXPREEMPPULSETUNE0_MASK	GENMASK(2, 2)
> +
> +/* charging detection */
> +#define USB_CTL1_CHRGSRCPUENB0_MASK	GENMASK(1, 0)
> +
> +#define K230_PHY_CTL0_VAL \
> +( \
> +	FIELD_PREP(USB_CTL0_PLLITUNE_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_PLLPTUNE_MASK, 0xc) | \
> +	FIELD_PREP(USB_CTL0_PLLBTUNE_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_VREGBYPASS_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_RETENABLEN_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_RESREQIN_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_VBUSVLDEXTSEL0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_OTGDISABLE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_DRVVBUS0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_AUTORSMENB0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_HSXCVREXTCTL0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_FSDATAEXT0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_FSSE0EXT0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_TXENABLEN0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_COMPDISTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL0_SQRXTUNE0_MASK, 0x3) \
> +)
> +
> +#define K230_PHY_CTL1_VAL \
> +( \
> +	FIELD_PREP(USB_CTL1_VDATREFTUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_OTGTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXHSXVTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXFSLSTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXVREFTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXRISETUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_TXRESTUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_TXPREEMPAMPTUNE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL1_TXPREEMPPULSETUNE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL1_CHRGSRCPUENB0_MASK, 0x0) \
> +)
> +
> +struct k230_usb_phy_instance {
> +	struct k230_usb_phy_global *global;
> +	struct phy *phy;
> +	u32 test_offset;
> +	u32 ctl_offset;
> +	int index;
> +};
> +
> +struct k230_usb_phy_global {
> +	struct k230_usb_phy_instance phys[MAX_PHYS];
> +	void __iomem *base;
> +};
> +
> +static int k230_usb_phy_power_on(struct phy *phy)
> +{
> +	struct k230_usb_phy_instance *inst = phy_get_drvdata(phy);
> +	struct k230_usb_phy_global *global = inst->global;
> +	void __iomem *base = global->base;
> +	u32 val;

blank line here please

> +	/* Apply recommended settings */
> +	writel(K230_PHY_CTL0_VAL, base + inst->ctl_offset + CTL0_OFFSET);
> +	writel(K230_PHY_CTL1_VAL, base + inst->ctl_offset + CTL1_OFFSET);
> +
> +    /* Configure test register (pull-ups/pull-downs) */

wrong alignment above, pls fix it

-- 
~Vinod

