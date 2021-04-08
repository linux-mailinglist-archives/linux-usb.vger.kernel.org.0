Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B220359027
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 01:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhDHXJT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 19:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbhDHXJT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 19:09:19 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41323C061760
        for <linux-usb@vger.kernel.org>; Thu,  8 Apr 2021 16:09:07 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id k25so3940635oic.4
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 16:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YPJP18fUjfANa5DhSg3YaFHQLMdynHRhrW1eEZtXt7o=;
        b=Oew+aT3Vo9wS2NRYaa9w9Ypfh6fpvYg9C9xQraeDTVrm09P7+4KkKnWA6+UmTzqiJV
         6j2fmeeBEQOjIQrFTsuSF3dhng9u0mI86pp9MReuEpSpuFa1iYNO2kcNuAeF47eJUpiH
         iS+IPR3F0hqYj0gSA2dUd6XTQV/8Yt9BVEg6HSZ9aKa2z2Qq+pExYNDWaXaxx5DO9r/8
         8ZX+mxybFTP4BeQna5veu7ZykLVNYWR7RpnSdu+cAhjYuyfd8PZi8p6jnBSaEOUlPgro
         wupAqTErbd9sjZZ1xCBkGhKg7q8v392OUQMM3Q4YICLdYzGyGyZEhB6/u/nRoMRYZNPK
         7Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YPJP18fUjfANa5DhSg3YaFHQLMdynHRhrW1eEZtXt7o=;
        b=AZy/qMUTibx0IRJZ/Wb2o4shbqegPI/oJQt08Ad2JJntMn/RLPp9eQ4zoqX3zkKuHV
         ZtTkHYJgTpEO9RUnMq4DUU1tkUfInMxJCHRIbSFr1HhGvyqUvVtwjXxi48RTOrF1Ql3X
         6Gi5arGJVCVInkAt4NYEUuf9nxxEnuR4yhv1KB7ldM1YCeFAWEWoL5tCX9BaJXy6GjXB
         8+5PqpJmAL8JUujm1g1YxUTY0g8/O8MM9lLeVRAMmF0rQXbtA7rd34j3Cqhqh0C4FkzO
         +333d+Cj1rcyIq8H4tFv3xCRiLPx7iQfxosGXJUD2C0tXjvTygQtD7QaIK0YjQMNLa48
         NGSQ==
X-Gm-Message-State: AOAM533sds00ugApRcBT290VhK/Jx85+PUOil5rQqjIDjrVkdHeRcnU4
        BNaT53c2nOqCsJW48L6Cpp0=
X-Google-Smtp-Source: ABdhPJwgKO4YJTqDsUHwNgl55Eb+ATjXb7H08ZabO8Ao0kcRvx40/9vWhKUIi37RVs2vCEyYlm4lHw==
X-Received: by 2002:aca:53cb:: with SMTP id h194mr8119885oib.175.1617923346545;
        Thu, 08 Apr 2021 16:09:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e20sm182064otl.15.2021.04.08.16.09.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 16:09:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 8 Apr 2021 16:09:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: roles: Cakk try_module_get() from
 usb_role_switch_find_by_fwnode()
Message-ID: <20210408230904.GA87058@roeck-us.net>
References: <20210408203611.544005-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408203611.544005-1-hdegoede@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 08, 2021 at 10:36:11PM +0200, Hans de Goede wrote:
> usb_role_switch_find_by_fwnode() returns a reference to the role-switch
> which must be put by calling usb_role_switch_put().
> 
> usb_role_switch_put() calls module_put(sw->dev.parent->driver->owner),
> add a matching try_module_get() to usb_role_switch_find_by_fwnode(),
> making it behave the same as the other usb_role_switch functions
> which return a reference.
> 
> This avoids a WARN_ON being hit at kernel/module.c:1158 due to the
> module-refcount going below 0.
> 

Took me a while to figure out what the subject line is supposed
to mean.

s/Cakk/Call/

Otherwise

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

It might be useful though to explain the difference between
fwnode_usb_role_switch_get() and usb_role_switch_find_by_fwnode(),
and why two different functions are needed, both passing fwnode
as parameter and returning a pointer to usb_role_switch.

Thanks,
Guenter

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/roles/class.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 97f37077b7f9..33b637d0d8d9 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -189,6 +189,8 @@ usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
>  		return NULL;
>  
>  	dev = class_find_device_by_fwnode(role_class, fwnode);
> +	if (dev)
> +		WARN_ON(!try_module_get(dev->parent->driver->owner));
>  
>  	return dev ? to_role_switch(dev) : NULL;
>  }
> -- 
> 2.30.2
> 
