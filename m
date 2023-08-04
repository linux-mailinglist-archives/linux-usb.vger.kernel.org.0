Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E659876FFD8
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 13:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjHDL74 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 07:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjHDL7z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 07:59:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9A1B1
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 04:59:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 890E361FA0
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 11:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B43C433C7;
        Fri,  4 Aug 2023 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691150394;
        bh=ULmHOLztKRnhZRJTugrDAzETi8daTm4srA8ohmg198A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xUuXdPZf7AORceb1987Ue9RRM9xhz8SdammnL9EryGB0zbdsdG6FjrE59HHsraUFP
         HqZ8D95o3yY186vW4frDiB4lM1tficJvUuefkH+BE4TRQIwniYtLiEhjZWSJIM4eP0
         NxvzAEdNi3iL7YBFWhKpqxf0Z22H5qknyHwiDFlQ=
Date:   Fri, 4 Aug 2023 13:59:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Add debugfs for ucsi commands
Message-ID: <2023080400-manly-naturist-a002@gregkh>
References: <20230804115336.399801-1-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804115336.399801-1-saranya.gopal@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 04, 2023 at 05:23:36PM +0530, Saranya Gopal wrote:
> Add support for UCSI commands through the following debugfs:
>   # /sys/kernel/debug/usb/ucsi/$UCSI_DEVICE/command
>   # /sys/kernel/debug/usb/ucsi/$UCSI_DEVICE/response
> 
> Eg: To execute UCSI GetCapabilities:
>   # echo 0x6 > /sys/kernel/debug/usb/ucsi/<ucsi device>/command
> Then read the result,
>   # cat /sys/kernel/debug/usb/ucsi/<ucsi device>/response
>     0x02000320000000020000ff0400000445
> 
> UCSI command will be written into the command file and the
> response for the command can be viewed under the response file.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> Co-developed-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> ---
>  drivers/usb/typec/ucsi/Kconfig   |   1 +
>  drivers/usb/typec/ucsi/Makefile  |   2 +
>  drivers/usb/typec/ucsi/debugfs.c | 102 +++++++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/debugfs.h |  47 ++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c    |  15 +++++
>  drivers/usb/typec/ucsi/ucsi.h    |   2 +
>  6 files changed, 169 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/debugfs.c
>  create mode 100644 drivers/usb/typec/ucsi/debugfs.h
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index b3bb0191987e..bdcb1764cfae 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -4,6 +4,7 @@ config TYPEC_UCSI
>  	tristate "USB Type-C Connector System Software Interface driver"
>  	depends on !CPU_BIG_ENDIAN
>  	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> +	select USB_COMMON if DEBUG_FS
>  	help
>  	  USB Type-C Connector System Software Interface (UCSI) is a
>  	  specification for an interface that allows the operating system to
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index 77f09e136956..b4679f94696b 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -5,6 +5,8 @@ obj-$(CONFIG_TYPEC_UCSI)		+= typec_ucsi.o
>  
>  typec_ucsi-y				:= ucsi.o
>  
> +typec_ucsi-$(CONFIG_DEBUG_FS)		+= debugfs.o
> +
>  typec_ucsi-$(CONFIG_TRACING)		+= trace.o
>  
>  ifneq ($(CONFIG_POWER_SUPPLY),)
> diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
> new file mode 100644
> index 000000000000..2bb74ff007fc
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/debugfs.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * UCSI debugfs interface
> + *
> + * Copyright (C) 2023 Intel Corporation
> + *
> + * Authors: Rajaram Regupathy <rajaram.regupathy@intel.com>
> + *	    Gopal Saranya <saranya.gopal@intel.com>
> + */
> +#include <linux/debugfs.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/usb.h>
> +
> +#include <asm/errno.h>
> +
> +#include "debugfs.h"
> +#include "ucsi.h"
> +
> +static struct dentry *ucsi_debugfs_root;
> +
> +static int ucsi_cmd(void *data, u64 val)
> +{
> +	struct ucsi *ucsi = data;
> +	int ret;
> +
> +	memset(&ucsi->debugfs->response, 0, sizeof(ucsi->debugfs->response));
> +	ucsi->debugfs->status = 0;
> +
> +	switch (UCSI_COMMAND(val)) {
> +	case UCSI_SET_UOM:
> +	case UCSI_SET_UOR:
> +	case UCSI_SET_PDR:
> +	case UCSI_CONNECTOR_RESET:
> +		ret = ucsi_send_command(ucsi, val, NULL, 0);
> +		break;
> +	case UCSI_GET_CAPABILITY:
> +	case UCSI_GET_CONNECTOR_CAPABILITY:
> +	case UCSI_GET_ALTERNATE_MODES:
> +	case UCSI_GET_CURRENT_CAM:
> +	case UCSI_GET_PDOS:
> +	case UCSI_GET_CABLE_PROPERTY:
> +	case UCSI_GET_CONNECTOR_STATUS:
> +		ret = ucsi_send_command(ucsi, val,
> +					&ucsi->debugfs->response,
> +					sizeof(ucsi->debugfs->response));
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +	if (ret < 0) {
> +		ucsi->debugfs->status = ret;
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ucsi_cmd_fops, NULL, ucsi_cmd, "0x%llx\n");
> +
> +static int ucsi_resp_show(struct seq_file *s, void *not_used)
> +{
> +	struct ucsi *ucsi = s->private;
> +
> +	if (ucsi->debugfs->status)
> +		return ucsi->debugfs->status;
> +
> +	seq_printf(s, "0x%016llx%016llx\n", ucsi->debugfs->response.high,
> +		   ucsi->debugfs->response.low);
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(ucsi_resp);
> +
> +int ucsi_debugfs_register(struct ucsi *ucsi)
> +{
> +	ucsi->debugfs = kzalloc(sizeof(*ucsi->debugfs), GFP_KERNEL);
> +	if (!ucsi->debugfs)
> +		return -ENOMEM;

It's good to catch this, but it doesn't matter if it happens, just
return, no need to do anything different if this fails.

> +
> +	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
> +	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
> +	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
> +	return 0;
> +}
> +
> +void ucsi_debugfs_unregister(struct ucsi *ucsi)
> +{
> +	debugfs_remove_recursive(ucsi->debugfs->dentry);
> +	kfree(ucsi->debugfs);
> +}
> +
> +int ucsi_debugfs_init(void)
> +{
> +	ucsi_debugfs_root = debugfs_create_dir("ucsi", usb_debug_root);
> +	return 0;

This can't fail, so no need to return an int, right?

thanks,

greg k-h
