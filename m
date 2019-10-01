Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46327C357B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388317AbfJANWk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:22:40 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33048 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388242AbfJANWj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:22:39 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so8003239pfl.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MbTLfv9HOJdJobcy1aSrXzkpRe1VhcA7npe8w5Cu48w=;
        b=ZUIfY/W3t3/34iHWJ5vtwDt1wILatmRISvCZxu3WRcmW3GdImJi/VQrpBoSXgbGNxz
         xWVbwpHRghaJ7LhvorTGaeQhsb9J/1kmp6haaQ+iLyHQBGW7rzHFBUYe+ZnHpKDvCpt/
         O8Y2c908agLeVcFtdYKmJCYSIbO4+YTasCLHwtOw+S4oV3mN1bXsvuYOK2FwmSbNviQK
         cKZ1daRbC9yOZext900TAlp+NIPLBuhNDee3Ti8HH9BaEoOwdaddUkYX1dk05tZLSYGq
         u0+s61UVPHwvxnwYLqSFekfonqCBMx3F1zUFWHEWlPmH8k1AK3aFVbSrfpBuX70KEnGM
         p6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MbTLfv9HOJdJobcy1aSrXzkpRe1VhcA7npe8w5Cu48w=;
        b=OzcAKqcz7x8KQbI82xSuoguXS4JAHrNJVV1KPAPeuSk6vZ1ZxxV3y6DW4+wLmbblxC
         PlwrShBlZOSwoaxRNxnd2/1CV1tP/H6jVVvsV2UXEDBzzflwGJ8CqVYCzGLSOcfx6epv
         KvqBYrNITsW+L8ScFbImHeKLfZMdmVjq/+LLOw8zJVK4xHCUh3KWp04htKhyy2U2fjGx
         yFKJASuVKpSH64ogDuBWSb9ElXMsljPcwUp4caUQAar0eABH432gCO8VxFQOhf2WgPBx
         c+kxT0LttVYFIfLZsp5eoSMWIEi0pmqJ8Idzh23gHrLq/J8d8Kb1z74pRMgAPHB8Pgd0
         nGTg==
X-Gm-Message-State: APjAAAVgAsp5kXyOZ8lsJzOqItE0XZ7Rh+dK+W8tPw7KOPPiQ9g8jrJL
        zNOQNgHz7NzQXu2t4cKqSD/18m/M
X-Google-Smtp-Source: APXvYqw8l0Yl5GLDe6gl3mOiTT7UxGAlxchYccuOUtGNEX36bIz06WbwFZTUxW7sJ4J5lvVCgNd2PQ==
X-Received: by 2002:aa7:9d8e:: with SMTP id f14mr27888249pfq.217.1569936158723;
        Tue, 01 Oct 2019 06:22:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t14sm16474345pgb.33.2019.10.01.06.22.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:22:38 -0700 (PDT)
Subject: Re: [PATCH 3/7] usb: typec: Separate the operations vector
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-4-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6378359b-cf1b-eb8a-997d-8102ee6ee241@roeck-us.net>
Date:   Tue, 1 Oct 2019 06:22:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001094858.68643-4-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/1/19 2:48 AM, Heikki Krogerus wrote:
> Introducing struct typec_operations which has the same
> callbacks as struct typec_capability. The old callbacks are
> kept for now, but after all users have been converted, they
> will be removed.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/class.c | 90 +++++++++++++++++++++++++--------------
>   include/linux/usb/typec.h | 19 +++++++++
>   2 files changed, 76 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9fab0be8f08c..542be63795db 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -59,6 +59,7 @@ struct typec_port {
>   	struct typec_mux		*mux;
>   
>   	const struct typec_capability	*cap;
> +	const struct typec_operations	*ops;
>   };
>   
>   #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
> @@ -961,11 +962,6 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>   		return -EOPNOTSUPP;
>   	}
>   
> -	if (!port->cap->try_role) {
> -		dev_dbg(dev, "Setting preferred role not supported\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>   	role = sysfs_match_string(typec_roles, buf);
>   	if (role < 0) {
>   		if (sysfs_streq(buf, "none"))
> @@ -974,9 +970,18 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>   			return -EINVAL;
>   	}
>   
> -	ret = port->cap->try_role(port->cap, role);
> -	if (ret)
> -		return ret;
> +	if (port->ops && port->ops->try_role) {
> +		ret = port->ops->try_role(port, role);
> +		if (ret)
> +			return ret;
> +	} else if (port->cap && port->cap->try_role) {
> +		ret = port->cap->try_role(port->cap, role);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_dbg(dev, "Setting preferred role not supported\n");
> +		return -EOPNOTSUPP;
> +	}
>   

This is a semantic change: Support is now checked _after_ the string is evaluated.
I understand the reason, but it should be noted in the patch description
(not sure if it is worth it, though - it seems to me it makes the code more
difficult to read).

>   	port->prefer_role = role;
>   	return size;
> @@ -1005,11 +1010,6 @@ static ssize_t data_role_store(struct device *dev,
>   	struct typec_port *port = to_typec_port(dev);
>   	int ret;
>   
> -	if (!port->cap->dr_set) {
> -		dev_dbg(dev, "data role swapping not supported\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>   	ret = sysfs_match_string(typec_data_roles, buf);
>   	if (ret < 0)
>   		return ret;
> @@ -1020,9 +1020,19 @@ static ssize_t data_role_store(struct device *dev,
>   		goto unlock_and_ret;
>   	}
>   
> -	ret = port->cap->dr_set(port->cap, ret);
> -	if (ret)
> +	if (port->ops && port->ops->dr_set) {
> +		ret = port->ops->dr_set(port, ret);
> +		if (ret)
> +			goto unlock_and_ret;
> +	} else if (port->cap && port->cap->dr_set) {
> +		ret = port->cap->dr_set(port->cap, ret);
> +		if (ret)
> +			goto unlock_and_ret;
> +	} else {
> +		dev_dbg(dev, "data role swapping not supported\n");
> +		ret = -EOPNOTSUPP;
>   		goto unlock_and_ret;

This really makes me wonder if the semantic change makes sense. Support
is now evaluated _after_ the lock has been obtained. That seems like a
waste.

> +	}
>   
>   	ret = size;
>   unlock_and_ret:
> @@ -1055,11 +1065,6 @@ static ssize_t power_role_store(struct device *dev,
>   		return -EOPNOTSUPP;
>   	}
>   
> -	if (!port->cap->pr_set) {
> -		dev_dbg(dev, "power role swapping not supported\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>   	if (port->pwr_opmode != TYPEC_PWR_MODE_PD) {
>   		dev_dbg(dev, "partner unable to swap power role\n");
>   		return -EIO;
> @@ -1077,11 +1082,21 @@ static ssize_t power_role_store(struct device *dev,
>   		goto unlock_and_ret;
>   	}
>   
> -	ret = port->cap->pr_set(port->cap, ret);
> -	if (ret)
> +	if (port->ops && port->ops->pr_set) {
> +		ret = port->ops->pr_set(port, ret);
> +		if (ret)
> +			goto unlock_and_ret;
> +	} else if (port->cap && port->cap->pr_set) {
> +		ret = port->cap->pr_set(port->cap, ret);
> +		if (ret)
> +			goto unlock_and_ret;
> +	} else {
> +		dev_dbg(dev, "power role swapping not supported\n");
> +		ret = -EOPNOTSUPP;
>   		goto unlock_and_ret;
> -
> +	}
>   	ret = size;
> +
>   unlock_and_ret:
>   	mutex_unlock(&port->port_type_lock);
>   	return ret;
> @@ -1108,7 +1123,8 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>   	int ret;
>   	enum typec_port_type type;
>   
> -	if (!port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
> +	if ((!port->ops || !port->ops->port_type_set) ||
> +	    !port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {

The above now requires _all_ callbacks to exist, both ops and cap based ones.
Is that on purpose ? Maybe this should be as follows ?

	if (((!port->ops || !port->ops->port_type_set) &&
	     !port->cap->port_type_set) || port->fixed_role != TYPEC_PORT_DRP) {

or a bit better to read
	if (port->fixed_role != TYPEC_PORT_DRP ||
	    ((!port->ops || !port->ops->port_type_set) && !port->cap->port_type_set))

>   		dev_dbg(dev, "changing port type not supported\n");
>   		return -EOPNOTSUPP;
>   	}
> @@ -1125,7 +1141,10 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>   		goto unlock_and_ret;
>   	}
>   
> -	ret = port->cap->port_type_set(port->cap, type);
> +	if (port->ops && port->ops->port_type_set)
> +		ret = port->ops->port_type_set(port, type);
> +	else
> +		ret = port->cap->port_type_set(port->cap, type);
>   	if (ret)
>   		goto unlock_and_ret;
>   
> @@ -1181,18 +1200,22 @@ static ssize_t vconn_source_store(struct device *dev,
>   		return -EOPNOTSUPP;
>   	}
>   
> -	if (!port->cap->vconn_set) {
> -		dev_dbg(dev, "VCONN swapping not supported\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>   	ret = kstrtobool(buf, &source);
>   	if (ret)
>   		return ret;
>   
> -	ret = port->cap->vconn_set(port->cap, (enum typec_role)source);
> -	if (ret)
> -		return ret;
> +	if (port->ops && port->ops->vconn_set) {
> +		ret = port->ops->vconn_set(port, source);
> +		if (ret)
> +			return ret;
> +	} else if (port->cap && port->cap->vconn_set) {
> +		ret = port->cap->vconn_set(port->cap, (enum typec_role)source);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_dbg(dev, "VCONN swapping not supported\n");
> +		return -EOPNOTSUPP;
> +	}
>   
>   	return size;
>   }
> @@ -1597,6 +1620,7 @@ struct typec_port *typec_register_port(struct device *parent,
>   
>   	port->id = id;
>   	port->cap = cap;
> +	port->ops = cap->ops;
>   	port->port_type = cap->type;
>   	port->fixed_role = cap->type;
>   	port->port_roles = cap->data;
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 8b90cd77331c..6c95a9ff43c6 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -168,6 +168,22 @@ struct typec_partner_desc {
>   	struct usb_pd_identity	*identity;
>   };
>   
> +/*
> + * struct typec_operations - USB Type-C Port Operations
> + * @try_role: Set data role preference for DRP port
> + * @dr_set: Set Data Role
> + * @pr_set: Set Power Role
> + * @vconn_set: Source VCONN
> + * @port_type_set: Set port type
> + */
> +struct typec_operations {
> +	int (*try_role)(struct typec_port *port, int role);
> +	int (*dr_set)(struct typec_port *port, enum typec_data_role);
> +	int (*pr_set)(struct typec_port *port, enum typec_role);
> +	int (*vconn_set)(struct typec_port *port, bool source);
> +	int (*port_type_set)(struct typec_port *port, enum typec_port_type);
> +};
> +
>   /*
>    * struct typec_capability - USB Type-C Port Capabilities
>    * @type: Supported power role of the port
> @@ -180,6 +196,7 @@ struct typec_partner_desc {
>    * @mux: Multiplexer switch for Alternate/Accessory Modes
>    * @fwnode: Optional fwnode of the port
>    * @driver_data: Private pointer for driver specific info
> + * @ops: Port operations vector
>    * @try_role: Set data role preference for DRP port
>    * @dr_set: Set Data Role
>    * @pr_set: Set Power Role
> @@ -201,6 +218,8 @@ struct typec_capability {
>   	struct fwnode_handle	*fwnode;
>   	void			*driver_data;
>   
> +	const struct typec_operations	*ops;
> +
>   	int		(*try_role)(const struct typec_capability *,
>   				    int role);
>   
> 

