Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7447E772303
	for <lists+linux-usb@lfdr.de>; Mon,  7 Aug 2023 13:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjHGLsS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 07:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbjHGLrv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 07:47:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD7199
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691408869; x=1722944869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b0P6enm4x0YY7z0Neh2sj5+llTug0secPVpz7CNdHio=;
  b=cb5AqX8q7jTRZ9Ic+DzqBPD6BEMgCWR0kxutsEUDG3x2/wAKNThLK9K5
   bW5181OdvS79FNPgk2hNosRw8zpHmeU7hRbmngcc24x+oum5TyTEZSGOZ
   UtUrKRi1u05bG3LBX5SRliDyklSaD8e8PjgRqksdm4L7duJe2rYCFsola
   3y9DEXsQKnAo6PcVopfAaQkD7mtw14qWijpT3+2TC69I+n3gezdWVvqYj
   NV2p0QQk5DNnEC6CT5pc9GHIjo3RRnShbioHQv0+fHQlqh0hC047hAaSk
   buyapbR35wdCdZPEC0ae+1IFaHgD1jpkbfAv1e+mDLZUChIqf/TZM8AFt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="374198863"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="374198863"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 04:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="874284441"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 07 Aug 2023 04:47:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Aug 2023 14:47:46 +0300
Date:   Mon, 7 Aug 2023 14:47:45 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Add debugfs for ucsi commands
Message-ID: <ZNDZ4T5hAeRZTavR@kuha.fi.intel.com>
References: <20230807105205.742819-1-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807105205.742819-1-saranya.gopal@intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 07, 2023 at 04:22:05PM +0530, Saranya Gopal wrote:
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

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes from v1:
>  - Removed debugfs.h file and moved the definitions directly to ucsi.h
>  - Made void as return type for ucsi_debugfs_init
>  - Made void as return type for ucsi_debugfs_register
> 
>  drivers/usb/typec/ucsi/Kconfig   |  1 +
>  drivers/usb/typec/ucsi/Makefile  |  2 +
>  drivers/usb/typec/ucsi/debugfs.c | 99 ++++++++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c    | 15 +++++
>  drivers/usb/typec/ucsi/ucsi.h    | 24 ++++++++
>  5 files changed, 141 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/debugfs.c
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
> index 000000000000..0c7bf88d4a7f
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/debugfs.c
> @@ -0,0 +1,99 @@
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
> +void ucsi_debugfs_register(struct ucsi *ucsi)
> +{
> +	ucsi->debugfs = kzalloc(sizeof(*ucsi->debugfs), GFP_KERNEL);
> +	if (!ucsi->debugfs)
> +		return;
> +
> +	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
> +	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
> +	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
> +}
> +
> +void ucsi_debugfs_unregister(struct ucsi *ucsi)
> +{
> +	debugfs_remove_recursive(ucsi->debugfs->dentry);
> +	kfree(ucsi->debugfs);
> +}
> +
> +void ucsi_debugfs_init(void)
> +{
> +	ucsi_debugfs_root = debugfs_create_dir("ucsi", usb_debug_root);
> +}
> +
> +void ucsi_debugfs_exit(void)
> +{
> +	debugfs_remove(ucsi_debugfs_root);
> +}
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index f6901319639d..c6dfe3dff346 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1530,6 +1530,7 @@ EXPORT_SYMBOL_GPL(ucsi_create);
>   */
>  void ucsi_destroy(struct ucsi *ucsi)
>  {
> +	ucsi_debugfs_unregister(ucsi);
>  	kfree(ucsi);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_destroy);
> @@ -1552,6 +1553,7 @@ int ucsi_register(struct ucsi *ucsi)
>  
>  	queue_delayed_work(system_long_wq, &ucsi->work, 0);
>  
> +	ucsi_debugfs_register(ucsi);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(ucsi_register);
> @@ -1611,6 +1613,19 @@ void ucsi_unregister(struct ucsi *ucsi)
>  }
>  EXPORT_SYMBOL_GPL(ucsi_unregister);
>  
> +static int __init ucsi_module_init(void)
> +{
> +	ucsi_debugfs_init();
> +	return 0;
> +}
> +module_init(ucsi_module_init);
> +
> +static void __exit ucsi_module_exit(void)
> +{
> +	ucsi_debugfs_exit();
> +}
> +module_exit(ucsi_module_exit);
> +
>  MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("USB Type-C Connector System Software Interface driver");
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index c09af859f573..474315a72c77 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -15,6 +15,7 @@
>  
>  struct ucsi;
>  struct ucsi_altmode;
> +struct dentry;
>  
>  /* UCSI offsets (Bytes) */
>  #define UCSI_VERSION			0
> @@ -277,6 +278,16 @@ struct ucsi_connector_status {
>  
>  /* -------------------------------------------------------------------------- */
>  
> +struct ucsi_debugfs_entry {
> +	u64 command;
> +	struct ucsi_data {
> +		u64 low;
> +		u64 high;
> +	} response;
> +	u32 status;
> +	struct dentry *dentry;
> +};
> +
>  struct ucsi {
>  	u16 version;
>  	struct device *dev;
> @@ -286,6 +297,7 @@ struct ucsi {
>  
>  	struct ucsi_capability cap;
>  	struct ucsi_connector *connector;
> +	struct ucsi_debugfs_entry *debugfs;
>  
>  	struct work_struct resume_work;
>  	struct delayed_work work;
> @@ -388,6 +400,18 @@ static inline void
>  ucsi_displayport_remove_partner(struct typec_altmode *adev) { }
>  #endif /* CONFIG_TYPEC_DP_ALTMODE */
>  
> +#ifdef CONFIG_DEBUG_FS
> +void ucsi_debugfs_init(void);
> +void ucsi_debugfs_exit(void);
> +void ucsi_debugfs_register(struct ucsi *ucsi);
> +void ucsi_debugfs_unregister(struct ucsi *ucsi);
> +#else
> +static inline void ucsi_debugfs_init(void) { }
> +static inline void ucsi_debugfs_exit(void) { }
> +static inline void ucsi_debugfs_register(struct ucsi *ucsi) { }
> +static inline void ucsi_debugfs_unregister(struct ucsi *ucsi) { }
> +#endif /* CONFIG_DEBUG_FS */
> +
>  /*
>   * NVIDIA VirtualLink (svid 0x955) has two altmode. VirtualLink
>   * DP mode with vdo=0x1 and NVIDIA test mode with vdo=0x3
> -- 
> 2.25.1

-- 
heikki
