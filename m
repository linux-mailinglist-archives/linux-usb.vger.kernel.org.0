Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09D8C35E3
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388337AbfJANiA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:38:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43663 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfJANiA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:38:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id v27so9655743pgk.10
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zx440opCRou7RJExCjwBcOilbBUXGZQGg2MVKaa1Ve4=;
        b=T820+MifgREiys3vwaZpYKh/SiY4VNbIsZzvzH7mlOFuebYL4HUQUyJ8clZPkzMsnl
         LZSNPQwOz0v8UjeLjjx7PjqsRdSjHw4wwGlFSrcG7ttruYjwHcUYJEtKvMdxA+/5J3Ne
         HInzwJnSpVX/Duee2iLl5rVajk+ozVqxQfVrhxpDyYFInJXdc12IAkFeJmB618JaT4LG
         WfnZrwwYF3rA0XidAfI+zZV3D8HgTn3auWfZziAWT9/pp6aAJ5NZQCBUzJviwmtjggzK
         33VN1TFDU0CEKiwqUW227MyU/ROX1SP25D1J/X0yJcraGDzLvNKWpH0DCojBgZTfvu6i
         oghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zx440opCRou7RJExCjwBcOilbBUXGZQGg2MVKaa1Ve4=;
        b=c7A/4fVTZNFKgxJYwqL8/09GTu2h5G/5QqYWyjTuvWgF/J0fKX/M6XUdVfakn6gFIl
         H/qtbMi70WgZxzlgHFO/8CPnmzwJ1Tvgu4MZPbYYisUPqDqxs5anVA3ugfYMlvIm64KQ
         dH0k4tzp7lNv053CI7AmpJr9Iu71lRMow9Hxr+jRgVqe6WlVOJoDp2voAYq8T+5l0lA/
         SjqWAlI1qnpTk0MsAgQRQVx7+vQSymWvNHocU8PiVxcymHtG4P9Koc5p00xpldfjGCK1
         RhAwkJjbgsZS+F0X11Vg6+RwwcXhaXGyZllQF9b/5lmhZah/DDnZI2tnj7QcbTYtRF52
         iovw==
X-Gm-Message-State: APjAAAUJ3pLYHt+hmVmCaqR4rj9VJLflQl9cMy0cqluxT6pQKS1TjwK/
        Yk22F2pUlutwvoOxDQAAPywrjpAU
X-Google-Smtp-Source: APXvYqxhDhjgjHBVKYnN4XnsknaErg5c90k7bJ/6uGqGZ2Qz1GaU8IX479ZRXVCCTmc0qEa10Zbwsw==
X-Received: by 2002:a62:3147:: with SMTP id x68mr27343866pfx.129.1569937078036;
        Tue, 01 Oct 2019 06:37:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y80sm15953648pfc.30.2019.10.01.06.37.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:37:57 -0700 (PDT)
Subject: Re: [PATCH 7/7] usb: typec: Remove the callback members from struct
 typec_capability
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-8-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6923a476-c460-062c-9c29-600d225bf128@roeck-us.net>
Date:   Tue, 1 Oct 2019 06:37:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001094858.68643-8-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/1/19 2:48 AM, Heikki Krogerus wrote:
> There are no more users for them.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/class.c | 65 +++++++++++++--------------------------
>   include/linux/usb/typec.h | 17 ----------
>   2 files changed, 22 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 542be63795db..58e83fc54aa6 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -58,7 +58,6 @@ struct typec_port {
>   	struct typec_switch		*sw;
>   	struct typec_mux		*mux;
>   
> -	const struct typec_capability	*cap;
>   	const struct typec_operations	*ops;
>   };
>   
> @@ -970,19 +969,15 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>   			return -EINVAL;
>   	}
>   
> -	if (port->ops && port->ops->try_role) {
> -		ret = port->ops->try_role(port, role);
> -		if (ret)
> -			return ret;
> -	} else if (port->cap && port->cap->try_role) {
> -		ret = port->cap->try_role(port->cap, role);
> -		if (ret)
> -			return ret;
> -	} else {
> +	if (!port->ops || !port->ops->try_role) {
>   		dev_dbg(dev, "Setting preferred role not supported\n");
>   		return -EOPNOTSUPP;
>   	}

This leaves the semantic change in place. I think it would have been better
to keep the support checks as in the original code.

>   
> +	ret = port->ops->try_role(port, role);
> +	if (ret)
> +		return ret;
> +
>   	port->prefer_role = role;
>   	return size;
>   }
> @@ -1020,20 +1015,16 @@ static ssize_t data_role_store(struct device *dev,
>   		goto unlock_and_ret;
>   	}
>   
> -	if (port->ops && port->ops->dr_set) {
> -		ret = port->ops->dr_set(port, ret);
> -		if (ret)
> -			goto unlock_and_ret;
> -	} else if (port->cap && port->cap->dr_set) {
> -		ret = port->cap->dr_set(port->cap, ret);
> -		if (ret)
> -			goto unlock_and_ret;
> -	} else {
> +	if (!port->ops || !port->ops->dr_set) {
>   		dev_dbg(dev, "data role swapping not supported\n");
>   		ret = -EOPNOTSUPP;
>   		goto unlock_and_ret;
>   	}
>   
> +	ret = port->ops->dr_set(port, ret);
> +	if (ret)
> +		goto unlock_and_ret;
> +
>   	ret = size;
>   unlock_and_ret:
>   	mutex_unlock(&port->port_type_lock);
> @@ -1082,21 +1073,17 @@ static ssize_t power_role_store(struct device *dev,
>   		goto unlock_and_ret;
>   	}
>   
> -	if (port->ops && port->ops->pr_set) {
> -		ret = port->ops->pr_set(port, ret);
> -		if (ret)
> -			goto unlock_and_ret;
> -	} else if (port->cap && port->cap->pr_set) {
> -		ret = port->cap->pr_set(port->cap, ret);
> -		if (ret)
> -			goto unlock_and_ret;
> -	} else {
> +	if (!port->ops || !port->ops->pr_set) {
>   		dev_dbg(dev, "power role swapping not supported\n");
>   		ret = -EOPNOTSUPP;
>   		goto unlock_and_ret;
>   	}
>   	ret = size;
>   
> +	ret = port->ops->pr_set(port, ret);
> +	if (ret)
> +		goto unlock_and_ret;
> +
>   unlock_and_ret:
>   	mutex_unlock(&port->port_type_lock);
>   	return ret;
> @@ -1124,7 +1111,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>   	enum typec_port_type type;
>   
>   	if ((!port->ops || !port->ops->port_type_set) ||
> -	    !port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
> +	    port->fixed_role != TYPEC_PORT_DRP) {
>   		dev_dbg(dev, "changing port type not supported\n");
>   		return -EOPNOTSUPP;
>   	}
> @@ -1141,10 +1128,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>   		goto unlock_and_ret;
>   	}
>   
> -	if (port->ops && port->ops->port_type_set)
> -		ret = port->ops->port_type_set(port, type);
> -	else
> -		ret = port->cap->port_type_set(port->cap, type);
> +	ret = port->ops->port_type_set(port, type);
>   	if (ret)
>   		goto unlock_and_ret;
>   
> @@ -1204,19 +1188,15 @@ static ssize_t vconn_source_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	if (port->ops && port->ops->vconn_set) {
> -		ret = port->ops->vconn_set(port, source);
> -		if (ret)
> -			return ret;
> -	} else if (port->cap && port->cap->vconn_set) {
> -		ret = port->cap->vconn_set(port->cap, (enum typec_role)source);
> -		if (ret)
> -			return ret;
> -	} else {
> +	if (!port->ops || !port->ops->vconn_set) {
>   		dev_dbg(dev, "VCONN swapping not supported\n");
>   		return -EOPNOTSUPP;
>   	}
>   
> +	ret = port->ops->vconn_set(port, source);
> +	if (ret)
> +		return ret;
> +
>   	return size;
>   }
>   
> @@ -1619,7 +1599,6 @@ struct typec_port *typec_register_port(struct device *parent,
>   	mutex_init(&port->port_type_lock);
>   
>   	port->id = id;
> -	port->cap = cap;
>   	port->ops = cap->ops;
>   	port->port_type = cap->type;
>   	port->fixed_role = cap->type;
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 6c95a9ff43c6..e759668f8af9 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -197,11 +197,6 @@ struct typec_operations {
>    * @fwnode: Optional fwnode of the port
>    * @driver_data: Private pointer for driver specific info
>    * @ops: Port operations vector
> - * @try_role: Set data role preference for DRP port
> - * @dr_set: Set Data Role
> - * @pr_set: Set Power Role
> - * @vconn_set: Set VCONN Role
> - * @port_type_set: Set port type
>    *
>    * Static capabilities of a single USB Type-C port.
>    */
> @@ -219,18 +214,6 @@ struct typec_capability {
>   	void			*driver_data;
>   
>   	const struct typec_operations	*ops;
> -
> -	int		(*try_role)(const struct typec_capability *,
> -				    int role);
> -
> -	int		(*dr_set)(const struct typec_capability *,
> -				  enum typec_data_role);
> -	int		(*pr_set)(const struct typec_capability *,
> -				  enum typec_role);
> -	int		(*vconn_set)(const struct typec_capability *,
> -				     enum typec_role);
> -	int		(*port_type_set)(const struct typec_capability *,
> -					 enum typec_port_type);
>   };
>   
>   /* Specific to try_role(). Indicates the user want's to clear the preference. */
> 

