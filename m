Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF4C58F509
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 21:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733170AbfHOTqg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 15:46:36 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43236 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729779AbfHOTqf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 15:46:35 -0400
Received: by mail-pl1-f194.google.com with SMTP id 4so1439279pld.10
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OSQEhR1pkVaKJxBDfxnh2KojMNBlcr+bEDFpUQewXbs=;
        b=b4mcvCWNp6jjfsHufTvEa3SNtbYruxqUT6hUfWpXhugLntFIZTXb1Jilci2sbHRD2D
         gcSWA55vsQ8QlKIIwWY5AykQAViRMSVucltUGsrZNaKFQBXD5bwiNi3RbithKngsedEJ
         ssMp/PMaCP7thcRCU3dUahswe3fkL7koaVGFU1MMWhSNg33Vy2ObNgjYyXtWcA9c42lV
         odP4DUCMr4BS4jPB8sIDsT4c0szTTtw5xyM09cR09K01Jeyp7Qfh6PCGdUX23MCxij79
         hdtVXSIMfwzk8PtBxHniMmFfVr/YCmtrRKAXBMJvFTLqn5WoC61BUfi4vJQcA9ROojti
         mkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=OSQEhR1pkVaKJxBDfxnh2KojMNBlcr+bEDFpUQewXbs=;
        b=PXtvmEp1AjlDJQVvyyKpuLmMLPrLw7ecEZLQm5JpbxlfZoG1uhwSdN+xszTriiGOWz
         UEXdY+dZLHyPofqWRoqAx6KEpT3S5RRn0wUw/+ZXPH2lQKvlIErTlmfKZSyFAMftRhjx
         3RvId0BvHnXGHB64KVD1lOIeMB7CO74gPB7rkQ2LzItuSU7oFpPXLyZKP9k5d+o66Pt9
         8+shiE8ak9krQhzyHYobHaPShyjrCYUyej5+UHf89IOp5EtMeNK9nCQHBwHh+5VHpZZf
         sXlvhtDXfVxidU+M0Z9fXDo0WS+xw2JVt8itTF6rIEPobr01DDVyfUIMpEY6yflAmkLe
         cd6A==
X-Gm-Message-State: APjAAAUQsA1Ykn/ww33rKgbyebF8qO9ZdXRtLcC3xv8vmMNPqxruGoXb
        yIA7It9QPusc90CKUFDXeXqeqNHD
X-Google-Smtp-Source: APXvYqzSH7K8LPuMlAlTL4dcm89YCVapm8x5S8tKbG4kHBxxzJ5E3ErvjH7Zy0Y3vaDB2BKM60ILRg==
X-Received: by 2002:a17:902:3081:: with SMTP id v1mr5887235plb.169.1565898395378;
        Thu, 15 Aug 2019 12:46:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e9sm3437844pge.39.2019.08.15.12.46.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 12:46:34 -0700 (PDT)
Date:   Thu, 15 Aug 2019 12:46:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Use usb_debug_root as root for our
 debugfs entry
Message-ID: <20190815194633.GA12421@roeck-us.net>
References: <20190815191815.755606-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815191815.755606-1-hdegoede@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
>  
>  #else
> -- 
> 2.23.0.rc2
> 
