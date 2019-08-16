Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D9A8FCC0
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 09:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfHPHvM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Aug 2019 03:51:12 -0400
Received: from mga04.intel.com ([192.55.52.120]:13153 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbfHPHvM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Aug 2019 03:51:12 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 00:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="scan'208";a="194944115"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 16 Aug 2019 00:51:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 16 Aug 2019 10:51:09 +0300
Date:   Fri, 16 Aug 2019 10:51:09 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: fusb: Use usb_debug_root as root for our
 debugfs entry
Message-ID: <20190816075109.GF24772@kuha.fi.intel.com>
References: <20190815191815.755606-1-hdegoede@redhat.com>
 <20190815191815.755606-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815191815.755606-2-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 09:18:14PM +0200, Hans de Goede wrote:
> Use usb_debug_root as root for our debugfs entry instead of creating our
> own subdirectory under the debugfs root.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I have one question below. Otherwise:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 93244d6c4bff..69a2afaf8f68 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -26,6 +26,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> +#include <linux/usb.h>
>  #include <linux/usb/typec.h>
>  #include <linux/usb/tcpm.h>
>  #include <linux/usb/pd.h>
> @@ -206,23 +207,17 @@ static int fusb302_debug_show(struct seq_file *s, void *v)
>  }
>  DEFINE_SHOW_ATTRIBUTE(fusb302_debug);
>  
> -static struct dentry *rootdir;
> -
>  static void fusb302_debugfs_init(struct fusb302_chip *chip)
>  {
>  	mutex_init(&chip->logbuffer_lock);
> -	if (!rootdir)
> -		rootdir = debugfs_create_dir("fusb302", NULL);
> -
>  	chip->dentry = debugfs_create_file(dev_name(chip->dev),
> -					   S_IFREG | 0444, rootdir,
> +					   S_IFREG | 0444, usb_debug_root,
>  					   chip, &fusb302_debug_fops);

In tcpm.c you named the entries "tcpm-%s", dev_name(...

Shouldn't we do something similar with these as well? I mean,
even though this is just debugfs, shouldn't we give some hint for the
user how to identify these entries?

How about if we still continue grouping the entries under the
"fusb302" directory, but just place that under usb_debug_root?


thanks,

-- 
heikki
