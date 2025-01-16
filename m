Return-Path: <linux-usb+bounces-19401-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B17FA13989
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 12:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72BF8188A1AD
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 11:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A631DE88B;
	Thu, 16 Jan 2025 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlNvNYST"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10A19FA92;
	Thu, 16 Jan 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737028533; cv=none; b=iIMq72huiTV9qlLGknJ+bNUDN1qVQllUUckAhl9FRK3ZBNzzNaA6a2ylrQe9DdSQBBpXOFTZQAnwml7qwfj9MCY3kH5IMXtV4RkxA1nP/ldjam0kXmXBVfxLEYpMhrC0ETMzV2qK7rD3H4D5pjtqcRCqJ7hXno/PqYhGaibw2eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737028533; c=relaxed/simple;
	bh=mBTyNJeoSx5VzSYVtliwJ5IDDg5ZnaTeDgNLH2Ro2rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnsI6F6QUv8FqHV4gIWlcWlpUsQeJ0uwnsgW1+HhL79Yj8DsUT1FmrXuQePTteSYuh2/AQCSE3YWD2hG/Y2t8SF+LSCnswgQTlCZlXqXcLCdV69dUv65Uhea+LSKpn5awBuBy9Nser8LNzf6uc6rghCDVkbi+zUvcGpcnaeMSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlNvNYST; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737028531; x=1768564531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mBTyNJeoSx5VzSYVtliwJ5IDDg5ZnaTeDgNLH2Ro2rE=;
  b=hlNvNYSTlCUTmGIHq7TzgHrC6pqINZrLw2v7vuhnrWOGiGOPzTNMgBz5
   f6MIALpEGPCeUPe7FWHrUkyeL5r68K/01evTXrsMWD4P2wcJBTu/Y8q8d
   A0an1p+mysiPW7O8LQ7MEhqPj5aDNt746moaBy6GNBLQP+gAT4DkkhICH
   /eUWfZthEPHJUxhYgjBASKFTNfR2IxQNtAKHr/YHeNe3YzdM9OGyVOccX
   pvLu5W72O49Zm3K2jmaor3jmU40gfXJ2M2fcbFhzKv3w9YeH2CpUoYK5T
   EL/rghKMke2VUwiuPihW6StS7UhXv6dihQSNGqHY2cxVhCpjC079bh6X/
   Q==;
X-CSE-ConnectionGUID: WQc8v6C7T2mEu6W7Gbd3BA==
X-CSE-MsgGUID: 1HGd7lx3StW1seHrw5dS9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="62781239"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="62781239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:55:31 -0800
X-CSE-ConnectionGUID: t70zuP69Rm+TP/03n9tR3w==
X-CSE-MsgGUID: K3aiVeEFRLSGkZnmsJ0v0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="105238476"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 16 Jan 2025 03:55:28 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 16 Jan 2025 13:55:27 +0200
Date: Thu, 16 Jan 2025 13:55:27 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/6] usb: typec: ucsi: add Huawei Matebook E Go ucsi
 driver
Message-ID: <Z4jzr1PUPhwpQLTY@kuha.fi.intel.com>
References: <20250113174945.590344-1-mitltlatltl@gmail.com>
 <20250113175131.590683-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113175131.590683-2-mitltlatltl@gmail.com>

Hi,

On Tue, Jan 14, 2025 at 01:51:26AM +0800, Pengyu Luo wrote:
> The Huawei Matebook E Go tablet implements the UCSI interface in the
> onboard EC. Add the glue driver to interface with the platform's UCSI
> implementation.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/usb/typec/ucsi/Kconfig              |  11 +
>  drivers/usb/typec/ucsi/Makefile             |   1 +
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 526 ++++++++++++++++++++
>  3 files changed, 538 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index 75559601f..e94956d27 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -91,4 +91,15 @@ config UCSI_LENOVO_YOGA_C630
>  	  To compile the driver as a module, choose M here: the module will be
>  	  called ucsi_yoga_c630.
>  
> +config UCSI_HUAWEI_GAOKUN
> +	tristate "UCSI Interface Driver for Huawei Matebook E Go"
> +	depends on EC_HUAWEI_GAOKUN
> +	select DRM_AUX_HPD_BRIDGE
> +	help
> +	  This driver enables UCSI support on the Huawei Matebook E Go tablet,
> +	  which is a sc8280xp-based 2-in-1 tablet.
> +
> +	  To compile the driver as a module, choose M here: the module will be
> +	  called ucsi_huawei_gaokun.
> +
>  endif
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index be98a8791..dbc571763 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -23,3 +23,4 @@ obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
>  obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
>  obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
>  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
> +obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)	+= ucsi_huawei_gaokun.o
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> new file mode 100644
> index 000000000..da1993805
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -0,0 +1,527 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ucsi-huawei-gaokun - A UCSI driver for HUAWEI Matebook E Go
> + *
> + * reference: drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> + *            drivers/usb/typec/ucsi/ucsi_glink.c
> + *            drivers/soc/qcom/pmic_glink_altmode.c
> + *
> + * Copyright (C) 2024 Pengyu Luo <mitltlatltl@gmail.com>
> + */
> +
> +#include <drm/bridge/aux-bridge.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitops.h>
> +#include <linux/completion.h>
> +#include <linux/container_of.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/platform_data/huawei-gaokun-ec.h>
> +#include <linux/string.h>
> +#include <linux/usb/pd_vdo.h>
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/workqueue_types.h>
> +
> +#include "ucsi.h"
> +
> +#define EC_EVENT_UCSI	0x21
> +#define EC_EVENT_USB	0x22
> +
> +#define GAOKUN_CCX_MASK		GENMASK(1, 0)
> +#define GAOKUN_MUX_MASK		GENMASK(3, 2)
> +
> +#define GAOKUN_DPAM_MASK	GENMASK(3, 0)
> +#define GAOKUN_HPD_STATE_MASK	BIT(4)
> +#define GAOKUN_HPD_IRQ_MASK	BIT(5)
> +
> +#define GET_IDX(updt) (ffs(updt) - 1)
> +
> +#define CCX_TO_ORI(ccx) (++ccx % 3) /* convert ccx to enum typec_orientation */
> +
> +/* Configuration Channel Extension */
> +enum gaokun_ucsi_ccx {
> +	USBC_CCX_NORMAL,
> +	USBC_CCX_REVERSE,
> +	USBC_CCX_NONE,
> +};
> +
> +enum gaokun_ucsi_mux {
> +	USBC_MUX_NONE,
> +	USBC_MUX_USB_2L,
> +	USBC_MUX_DP_4L,
> +	USBC_MUX_USB_DP,
> +};

Missing newline.

> +/* based on pmic_glink_altmode_pin_assignment */
> +enum gaokun_ucsi_dpam_pan {	/* DP Alt Mode Pin Assignments */
> +	USBC_DPAM_PAN_NONE,
> +	USBC_DPAM_PAN_A,	/* Not supported after USB Type-C Standard v1.0b */
> +	USBC_DPAM_PAN_B,	/* Not supported after USB Type-C Standard v1.0b */
> +	USBC_DPAM_PAN_C,	/* USBC_DPAM_PAN_C_REVERSE - 6 */
> +	USBC_DPAM_PAN_D,
> +	USBC_DPAM_PAN_E,
> +	USBC_DPAM_PAN_F,	/* Not supported after USB Type-C Standard v1.0b */
> +	USBC_DPAM_PAN_A_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
> +	USBC_DPAM_PAN_B_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
> +	USBC_DPAM_PAN_C_REVERSE,
> +	USBC_DPAM_PAN_D_REVERSE,
> +	USBC_DPAM_PAN_E_REVERSE,
> +	USBC_DPAM_PAN_F_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
> +};
> +
> +struct gaokun_ucsi_reg {
> +	u8 num_ports;
> +	u8 port_updt;
> +	u8 port_data[4];
> +	u8 checksum;
> +	u8 reserved;
> +} __packed;
> +
> +struct gaokun_ucsi_port {
> +	struct completion usb_ack;
> +	spinlock_t lock;

Locks need to be commented. Did you run checkpatch.pl on this?

> +	struct gaokun_ucsi *ucsi;
> +	struct auxiliary_device *bridge;
> +
> +	int idx;
> +	enum gaokun_ucsi_ccx ccx;
> +	enum gaokun_ucsi_mux mux;
> +	u8 mode;
> +	u16 svid;
> +	u8 hpd_state;
> +	u8 hpd_irq;
> +};
> +
> +struct gaokun_ucsi {
> +	struct gaokun_ec *ec;
> +	struct ucsi *ucsi;
> +	struct gaokun_ucsi_port *ports;
> +	struct device *dev;
> +	struct delayed_work work;
> +	struct notifier_block nb;
> +	u16 version;
> +	u8 num_ports;
> +};

thanks,

-- 
heikki

