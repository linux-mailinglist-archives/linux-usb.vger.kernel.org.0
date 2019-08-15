Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD0D98F515
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 21:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733215AbfHOTqu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 15:46:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39011 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733204AbfHOTqp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 15:46:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id f17so1839900pfn.6
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MGKhu4a0Ob3B6Urz9FQ36zB+hB3TClMyWbo6S75O3fc=;
        b=FLz2S7GtUh5BX4MfgMP06gJmdiT7rdOPb6MG3nlPwfuOtP3h3QPRtT8ZhzWyA5Z8MM
         qf771GSDOa4R87exM33Td5yjl2WtjKWS44UJbnxXjdfiYl70gBmpHmrhvOrvDLV5f3uu
         gnMFRkiwv3ciP/4P3LT98RcfQWsapZZQP6M4MlF9xvDIchWO93g+4cF2z4fP+2uDCN1s
         2eFxSF3ZsRk3noiJer7ra2E2ze7ZdPc1kD0RFpCA737NzrG0mG6XZP9f4ThMg5fLOYPk
         QlWXMijxkNK+33BIzVu8a0uMm23V6M5XZaNJLrgY6VYBZQx+3ZcKb66nQOrs6UOcz+6e
         aPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MGKhu4a0Ob3B6Urz9FQ36zB+hB3TClMyWbo6S75O3fc=;
        b=sakJnnI1TYuCwGDKnf08pcAj/hKihPxYiQ9xWMM4TbohTxKk9+UeG8mQYDd0rn2crN
         XbNvRaEYyVaZCcClOcyO+CQ9oizsaktVuPkiXWXJnhsRgD25UrTe4i2dZhsWNb/MGNIR
         76FghE4YtajjiOkuiHPAoK+srsAkMawmszCCm0NgDliV2HDKvb/Acpnn31/xxTwgr/2Q
         2Q+4E+JkTs/xhRka+lJm9LTz7iEamEMx6FBYn3UF6R9GXCfy0q21Tme8z0C4ucUZ7fwJ
         ojV04PFa3dEl1JM+wFr+PRTdYEOkb02P/lyVutNY12ehoxKnLvi71iHoZ3LPdW8CUR87
         twJg==
X-Gm-Message-State: APjAAAWMxEIDFcXhgKWSPf/SXxUPhdwXCB+d8VoNIn9SL+jyCiV7xWSq
        +kSuYa3+as/8VqbxLpaTJY8=
X-Google-Smtp-Source: APXvYqwLYgZ0Yi0YxPmS7dLYtm8qf+L9wEN5SGT4yZWAHno4EFjZRSIwyK1ayqlGuXRT2MQctnmvnA==
X-Received: by 2002:a63:e907:: with SMTP id i7mr4707695pgh.84.1565898405271;
        Thu, 15 Aug 2019 12:46:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v184sm2836862pgd.34.2019.08.15.12.46.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 12:46:44 -0700 (PDT)
Date:   Thu, 15 Aug 2019 12:46:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: fusb: Use usb_debug_root as root for our
 debugfs entry
Message-ID: <20190815194643.GB12421@roeck-us.net>
References: <20190815191815.755606-1-hdegoede@redhat.com>
 <20190815191815.755606-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815191815.755606-2-hdegoede@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 09:18:14PM +0200, Hans de Goede wrote:
> Use usb_debug_root as root for our debugfs entry instead of creating our
> own subdirectory under the debugfs root.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
>  }
>  
>  static void fusb302_debugfs_exit(struct fusb302_chip *chip)
>  {
>  	debugfs_remove(chip->dentry);
> -	debugfs_remove(rootdir);
>  }
>  
>  #else
> -- 
> 2.23.0.rc2
> 
