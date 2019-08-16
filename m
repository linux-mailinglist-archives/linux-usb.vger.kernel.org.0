Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39AA08FCD6
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfHPHzq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Aug 2019 03:55:46 -0400
Received: from mga12.intel.com ([192.55.52.136]:59052 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726762AbfHPHzq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Aug 2019 03:55:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 00:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="scan'208";a="194944611"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 16 Aug 2019 00:55:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 16 Aug 2019 10:55:42 +0300
Date:   Fri, 16 Aug 2019 10:55:42 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Use usb_debug_root as root for our
 debugfs entry
Message-ID: <20190816075542.GG24772@kuha.fi.intel.com>
References: <20190815191815.755606-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815191815.755606-1-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 09:18:13PM +0200, Hans de Goede wrote:
> Use usb_debug_root as root for our debugfs entry instead of creating our
> own subdirectory under the debugfs root.
> 
> Another patch in this series will make the same change to the fusb302
> driver, which also uses dev_name() (on the same device) for the debugfs
> entry name. So we also prefix dev_name() with "tcpm-" here to avoid a
> name conflict.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 15abe1d9958f..5241d17c3399 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -19,6 +19,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/usb.h>
>  #include <linux/usb/pd.h>
>  #include <linux/usb/pd_ado.h>
>  #include <linux/usb/pd_bdo.h>
> @@ -571,17 +572,13 @@ static int tcpm_debug_show(struct seq_file *s, void *v)
>  }
>  DEFINE_SHOW_ATTRIBUTE(tcpm_debug);
>  
> -static struct dentry *rootdir;
> -
>  static void tcpm_debugfs_init(struct tcpm_port *port)
>  {
> -	mutex_init(&port->logbuffer_lock);
> -	/* /sys/kernel/debug/tcpm/usbcX */
> -	if (!rootdir)
> -		rootdir = debugfs_create_dir("tcpm", NULL);
> +	char name[NAME_MAX];
>  
> -	port->dentry = debugfs_create_file(dev_name(port->dev),
> -					   S_IFREG | 0444, rootdir,
> +	mutex_init(&port->logbuffer_lock);
> +	snprintf(name, NAME_MAX, "tcpm-%s", dev_name(port->dev));
> +	port->dentry = debugfs_create_file(name, S_IFREG | 0444, usb_debug_root,
>  					   port, &tcpm_debug_fops);
>  }
>  
> @@ -597,10 +594,6 @@ static void tcpm_debugfs_exit(struct tcpm_port *port)
>  	mutex_unlock(&port->logbuffer_lock);
>  
>  	debugfs_remove(port->dentry);
> -	if (list_empty(&rootdir->d_subdirs)) {
> -		debugfs_remove(rootdir);
> -		rootdir = NULL;
> -	}
>  }

I guess one option here as well would be to still group the entries
under the "tcpm" directry, but just place that under the
usb_debug_root directory.

thanks,

-- 
heikki
