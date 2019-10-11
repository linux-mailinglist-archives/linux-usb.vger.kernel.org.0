Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFB9AD4606
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 19:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbfJKRBF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 13:01:05 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35471 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfJKRBE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 13:01:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id 205so6454545pfw.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2019 10:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jaPmXffzM/Ymr3BJC11zw2urLnF9O3sTfMMzXaCvpgU=;
        b=W3ATdNsBASfMPMw5va91INJbRN8bexZ1WKxGz6gPs4UtE/6vZNRO0evMfTYY3ecEin
         NxCKq+VQNVaQPdgNpYMKCg1GhQunUHyQ9gg0aEubBKrHCSKIqFmcxdrg7KFbe9gFFPbs
         wbcWTahdoCk40Yc5WdR8dYM0YecEVqiNZvi+ubLbCCw2+dJu5nD1t4WefWCKYBuiVSlP
         jx0nL4KxyoM60ole2GqEFGe0N7r9jC8B+IAe57yu1JLdk4Nlf6W9nB32FefGLgBBkwvK
         S4JSaEMFYnnL+e4TW8VoKgx4u0ZGC56VrmHbrVo1eYAdVzuai1jLwlCURSMQr2wnZig4
         YiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jaPmXffzM/Ymr3BJC11zw2urLnF9O3sTfMMzXaCvpgU=;
        b=mNEUkbZPPigof6AXt6udNeSZtJu4BmOvOyb82Od6+ISez3aKd96u3ALbc0ao3hQSh8
         VixISgXG5XmoyCZqEp4g61U/4yqWtaDUpl3Zmm1UJhDPhmm54TP9os+cfT68HyL8dkbB
         5ZMLTItHaNY6OzW7x00jErZDP3E48tV1U8nt+jfAt4hQpcTwhmecEu3P8UVJ0GBACxNC
         RrIu8I0IgALXPq/JaYWitHPmKmLwWHS+PFVT2dkka2tFUn9LKNP/kw0p4vsyaGIwvZFY
         5hjd9iBgnDpsF5zglcNDSrM23pdIoD69NmrPC1LgyOrvuiJ10jnHtC2VPzIwztz1Ovov
         lJmw==
X-Gm-Message-State: APjAAAVR2rsQ40fmUrayXk2zvibUbCR6IOhqI61c/+/VvebxBm/AR/Es
        WjgVbMI5s5mxEeaWQ/sbERi1ys51
X-Google-Smtp-Source: APXvYqxU1AxgJEOY+fvbUjohm+HbJ6DgSS56HjUj2i6+we031MGjNoXFxbF435/Wt7gKqJW/z2j/JQ==
X-Received: by 2002:a17:90a:f0c5:: with SMTP id fa5mr8885773pjb.68.1570813263773;
        Fri, 11 Oct 2019 10:01:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q42sm8731597pja.16.2019.10.11.10.01.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 10:01:02 -0700 (PDT)
Date:   Fri, 11 Oct 2019 10:01:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 1/9] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191011170101.GA25828@roeck-us.net>
References: <20191011153219.35701-1-heikki.krogerus@linux.intel.com>
 <20191011153219.35701-2-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011153219.35701-2-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 06:32:11PM +0300, Heikki Krogerus wrote:
> Copying everything from struct typec_capability to struct
> typec_port during port registration. This will make sure
> that under no circumstances the driver can change the values
> in the struct typec_capability that the port uses.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/class.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 94a3eda62add..7749933ffce5 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -52,6 +52,7 @@ struct typec_port {
>  	struct typec_switch		*sw;
>  	struct typec_mux		*mux;
>  
> +	const struct typec_capability	*orig_cap; /* to be removed */
>  	const struct typec_capability	*cap;
>  };
>  
> @@ -968,7 +969,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>  			return -EINVAL;
>  	}
>  
> -	ret = port->cap->try_role(port->cap, role);
> +	ret = port->cap->try_role(port->orig_cap, role);
>  	if (ret)
>  		return ret;
>  
> @@ -1014,7 +1015,7 @@ static ssize_t data_role_store(struct device *dev,
>  		goto unlock_and_ret;
>  	}
>  
> -	ret = port->cap->dr_set(port->cap, ret);
> +	ret = port->cap->dr_set(port->orig_cap, ret);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1071,7 +1072,7 @@ static ssize_t power_role_store(struct device *dev,
>  		goto unlock_and_ret;
>  	}
>  
> -	ret = port->cap->pr_set(port->cap, ret);
> +	ret = port->cap->pr_set(port->orig_cap, ret);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1119,7 +1120,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>  		goto unlock_and_ret;
>  	}
>  
> -	ret = port->cap->port_type_set(port->cap, type);
> +	ret = port->cap->port_type_set(port->orig_cap, type);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1184,7 +1185,7 @@ static ssize_t vconn_source_store(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	ret = port->cap->vconn_set(port->cap, (enum typec_role)source);
> +	ret = port->cap->vconn_set(port->orig_cap, (enum typec_role)source);
>  	if (ret)
>  		return ret;
>  
> @@ -1278,6 +1279,7 @@ static void typec_release(struct device *dev)
>  	ida_destroy(&port->mode_ids);
>  	typec_switch_put(port->sw);
>  	typec_mux_put(port->mux);
> +	kfree(port->cap);
>  	kfree(port);
>  }
>  
> @@ -1579,7 +1581,7 @@ struct typec_port *typec_register_port(struct device *parent,
>  	mutex_init(&port->port_type_lock);
>  
>  	port->id = id;
> -	port->cap = cap;
> +	port->orig_cap = cap;
>  	port->port_type = cap->type;
>  	port->prefer_role = cap->prefer_role;
>  
> @@ -1590,6 +1592,12 @@ struct typec_port *typec_register_port(struct device *parent,
>  	port->dev.type = &typec_port_dev_type;
>  	dev_set_name(&port->dev, "port%d", id);
>  
> +	port->cap = kmemdup(cap, sizeof(*cap), GFP_KERNEL);
> +	if (!port->cap) {
> +		put_device(&port->dev);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
>  	port->sw = typec_switch_get(&port->dev);
>  	if (IS_ERR(port->sw)) {
>  		put_device(&port->dev);
> -- 
> 2.23.0
> 
