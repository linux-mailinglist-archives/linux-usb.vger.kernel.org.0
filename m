Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAF1D024E
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 22:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731033AbfJHUoc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 16:44:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40230 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbfJHUoc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 16:44:32 -0400
Received: by mail-pg1-f195.google.com with SMTP id d26so10937369pgl.7
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nmmOKPTsvyGUoyuXu+nPXQyEy3RdTp7A7NRvn61bkoQ=;
        b=HN1hyf6weVu+Vk5AAdemCyFfXZGwPnmH9GgT2QIMmjiGuOsXu8WrE9igUZtqJL9cEX
         QnG8GJ61yx0gyJnC5/YFaNeXbR/Te4SX35/x9oCP32D2GTVi3iPiiYfG7XfK3emuM4Kr
         hT45FGSGoE20/PJ/cptu232szfP3/zrs6kyveCqD9g+wKF8JcjB+KaSJp/PApgSUOJFG
         Nnsj00TPDA08Axc9qxebhy2Q8+xoLtBrmVnmYh6hQSEIdIc/AkhZcZwfxw4eUxxUOjig
         eQZJXmugjA38rGFmj15UniMtpyJ21NBWUlQAHSLEtTtP20vlx40W02tWOJ64BOvDAHVM
         XSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=nmmOKPTsvyGUoyuXu+nPXQyEy3RdTp7A7NRvn61bkoQ=;
        b=W3/wxxnhE1Gvbdx6cDHdTGGELephRxwHu/jggieyrCbRqrK4H5WUOo/iQXPH08wB0F
         rT+fR8v7eipHkuEJxgFE/zc8rInI4BuksgkYCyQF1W8N5kmYZEZauTkxm8z90v5LLYvL
         8q3VGKmwZUyptgvU56DCuwM2ZntjbzkSOIU6ZD08GkaXEP43UPKJRS6KtydRUOK7Nr3w
         m34tzsGMxVR0wGyjbk6sZ3rWR1GIcyTFEG7nVz8/f+oRS3dZ0qDiN0L8B3OnirPLAZYR
         aawds3keqdav1YJXv2ClandhcSs4TkozLX0XlFtHcV9V7iE7AE4LhKvoPy7VtyNSMFKb
         ZwNQ==
X-Gm-Message-State: APjAAAX++lZVw6p2wcv+XMSj6hFRCIqOY6VmUlXbCaKZJqepsK2ZvW+Y
        Q8LxCqwX1jz9ryZXl6mzLINSVS6d
X-Google-Smtp-Source: APXvYqzO3P8RC8wrkuYtqvTK2fFg7IJqgR3QgFFAP9obUeBUMcnXVg5M4Y7mYx9Fxu7UXG8U9hpZPw==
X-Received: by 2002:a63:fa0a:: with SMTP id y10mr328002pgh.446.1570567470872;
        Tue, 08 Oct 2019 13:44:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b9sm23839pfo.105.2019.10.08.13.44.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 13:44:29 -0700 (PDT)
Date:   Tue, 8 Oct 2019 13:44:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/9] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191008204428.GA16138@roeck-us.net>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
 <20191008111350.68581-2-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008111350.68581-2-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 02:13:42PM +0300, Heikki Krogerus wrote:
> Copying everything from struct typec_capability to struct
> typec_port during port registration. This will make sure
> that under no circumstances the driver can change the values
> in the struct typec_capability that the port uses.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/class.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 94a3eda62add..0bbf10c8ad58 100644
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
> @@ -1579,9 +1581,10 @@ struct typec_port *typec_register_port(struct device *parent,
>  	mutex_init(&port->port_type_lock);
>  
>  	port->id = id;
> -	port->cap = cap;
> +	port->orig_cap = cap;
>  	port->port_type = cap->type;
>  	port->prefer_role = cap->prefer_role;
> +	port->cap = kmemdup(cap, sizeof(*cap), GFP_KERNEL);

I just realized ... unfortunately kmemdup() can return NULL.

>  
>  	device_initialize(&port->dev);
>  	port->dev.class = typec_class;
> -- 
> 2.23.0
> 
