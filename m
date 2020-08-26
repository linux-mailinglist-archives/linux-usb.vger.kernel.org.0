Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E62D252C62
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgHZLXK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:23:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:34006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbgHZLWb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:22:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 554512083B;
        Wed, 26 Aug 2020 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598440950;
        bh=2f8C7i96fns+kouMgk15ZKVtRRjMCQz+WQ0lnFNuxHg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N29z69mMPKyPN7iY6h9UdCw2CVVb8FIPg2I9QGLXOK85XEUJ/90+BNFtEBp9OdcIu
         YjeJE6L252wivtlZuRlUPedZwIOuMI6wQcvKwjZ0b/+YhHq/azchVNEsUtsilwzJjl
         IsZEQGwCYTdgfIYJajxooMvtisBi+3OCVdJPmaaM=
Date:   Wed, 26 Aug 2020 13:22:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 9/9] thunderbolt: Add debugfs interface
Message-ID: <20200826112246.GA3760307@kroah.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
 <20200826110736.55186-10-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826110736.55186-10-mika.westerberg@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 02:07:36PM +0300, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@intel.com>
> 
> This adds debugfs interface that can be used for debugging possible
> issues in hardware/software. It exposes router and adapter config spaces
> through files like this:
> 
>   /sys/kernel/debug/thunderbolt/<DEVICE>/regs
>   /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT1>/regs
>   /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT1>/path
>   /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT1>/counters
>   /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT2>/regs
>   /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT2>/path
>   /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT2>/counters
>   ...
> 
> The "regs" is either the router or port configuration space register
> dump. The "path" is the port path configuration space and "counters" is
> the optional counters configuration space.
> 
> These files contains one register per line so it should be easy to use
> normal filtering tools to find the registers of interest if needed.
> 
> The router and adapter regs file becomes writable when
> CONFIG_USB4_DEBUGFS_WRITE is enabled (which is not supposed to be done
> in production systems) and in this case the developer can write "offset
> value" lines there to modify the hardware directly. For convenience this
> also supports the long format the read side produces (but ignores the
> additional fields). The counters file can be written even when
> CONFIG_USB4_DEBUGFS_WRITE is not enabled and it is only used to clear
> the counter values.
> 
> Signed-off-by: Gil Fine <gil.fine@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/Kconfig   |  10 +
>  drivers/thunderbolt/Makefile  |   1 +
>  drivers/thunderbolt/debugfs.c | 700 ++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/domain.c  |  13 +-
>  drivers/thunderbolt/switch.c  |   3 +
>  drivers/thunderbolt/tb.h      |  14 +
>  drivers/thunderbolt/tb_regs.h |   4 +-
>  7 files changed, 742 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/thunderbolt/debugfs.c
> 
> diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
> index 354e61c0f2e5..2257c22f8ab3 100644
> --- a/drivers/thunderbolt/Kconfig
> +++ b/drivers/thunderbolt/Kconfig
> @@ -16,6 +16,16 @@ menuconfig USB4
>  	  To compile this driver a module, choose M here. The module will be
>  	  called thunderbolt.
>  
> +config USB4_DEBUGFS_WRITE
> +	bool "Enable write by debugfs to configuration spaces (DANGEROUS)"
> +	depends on USB4
> +	help
> +	  Enables writing to device configuration registers through
> +	  debugfs interface.
> +
> +	  Only enable this if you know what you are doing! Never enable
> +	  this for production systems or distro kernels.
> +
>  config USB4_KUNIT_TEST
>  	bool "KUnit tests"
>  	depends on KUNIT=y
> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index 754a529aa132..61d5dff445b6 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -5,5 +5,6 @@ thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o us
>  thunderbolt-objs += nvm.o retimer.o quirks.o
>  
>  thunderbolt-${CONFIG_ACPI} += acpi.o
> +thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
>  
>  obj-${CONFIG_USB4_KUNIT_TEST} += test.o
> diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
> new file mode 100644
> index 000000000000..fdfe6e4afbfe
> --- /dev/null
> +++ b/drivers/thunderbolt/debugfs.c
> @@ -0,0 +1,700 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Debugfs interface
> + *
> + * Copyright (C) 2020, Intel Corporation
> + * Authors: Gil Fine <gil.fine@intel.com>
> + *	    Mika Westerberg <mika.westerberg@linux.intel.com>
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "tb.h"
> +
> +#define PORT_CAP_PCIE_LEN	1
> +#define PORT_CAP_POWER_LEN	2
> +#define PORT_CAP_LANE_LEN	3
> +#define PORT_CAP_USB3_LEN	5
> +#define PORT_CAP_DP_LEN		8
> +#define PORT_CAP_TMU_LEN	8
> +#define PORT_CAP_BASIC_LEN	9
> +#define PORT_CAP_USB4_LEN	20
> +
> +#define SWITCH_CAP_TMU_LEN	26
> +#define SWITCH_CAP_BASIC_LEN	27
> +
> +#define PATH_LEN		2
> +
> +#define COUNTER_SET_LEN		3
> +
> +#define DEBUGFS_ATTR(__space, __write)					\
> +static int __space ## _open(struct inode *inode, struct file *file)	\
> +{									\
> +	return single_open(file, __space ## _show, inode->i_private);	\
> +}									\
> +									\
> +static const struct file_operations __space ## _fops = {		\
> +	.owner = THIS_MODULE,						\
> +	.open = __space ## _open,					\
> +	.release = single_release,					\
> +	.read  = seq_read,						\
> +	.write = __write,						\
> +	.llseek = seq_lseek,						\
> +}
> +
> +#define DEBUGFS_ATTR_RO(__space)					\
> +	DEBUGFS_ATTR(__space, NULL)
> +
> +#define DEBUGFS_ATTR_RW(__space)					\
> +	DEBUGFS_ATTR(__space, __space ## _write)

We do have DEFINE_SIMPLE_ATTRIBUTE() and DEFINE_DEBUGFS_ATTRIBUTE, do
those work here instead of your custom macro?

Other than that, this series looks fine to me:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
