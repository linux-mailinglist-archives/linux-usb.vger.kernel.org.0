Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCED6D02F3
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 23:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbfJHVka (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 17:40:30 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45139 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbfJHVka (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 17:40:30 -0400
Received: by mail-pg1-f195.google.com with SMTP id q7so10992255pgi.12
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 14:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZwX6WIEZunM3eg3+iEOkwec8MYOgKOWkfJVJ3qyrgLU=;
        b=hMBK4YvxI9h5JOX+GIf2JLRXWsgyT8unDcYF+eoeqxWRPFf9w6GZanuExNFebR2fdF
         abZW2uUiq3FY0hh8C9HDm6hg2Qm18GCFRzs3FI1oUDSwO6zyUDCw2sQwoqbvWjq9U3Qn
         hkUjEmS/X0tBcpa/wrLZMUXUa8eMRwKzAJ7x9EC6V7/xELfp9Q6XoCCPdd1bffS0aUp4
         tb5YNaOZX3yuFgauX/aUgvYVbfG9pUOd/bsp++a6KreLTjqNqzkCTr+B6mLOG5+9EmAk
         yuirRM4i6Nwa+jF4tz6/bMnk89v48qpkmXmbckW7LgBOYVT1CqoYHQNmVLifXFhFsmgK
         XEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZwX6WIEZunM3eg3+iEOkwec8MYOgKOWkfJVJ3qyrgLU=;
        b=lVPXqd3d3da2+VgL0dDC8P15UKMGTss9ejdm0+MzIo2zv2Xv7QpAe3loFjQLKukaQ0
         bf0Fo+ZwA99uNmR+QxXtxBdOHRoVJtCczID2qUiZ+XmWOS/V0X95nMvhjaHIJjJJPRXX
         Y8DA4wkG0VTOfpJ242ajP/gtezeO6cC0sPceH/2olik73l0QZ7zu9OdPaxGwWHFwxU7l
         E1402Eo2Ac1+pGQt/eJa4UchHQeQtWIOBg2PMiD1NgCT0nTv3ik5tedr/Wd9radsKu/B
         FkX4gR5mKogqa8WgQ0EJtc7EH3BzK7863M9T8DtvceBOgrVJxLFkDX2yrcISbuKs4BLl
         MghA==
X-Gm-Message-State: APjAAAX8xtf6G2o653Kr9V9NIBUVQHGULlS5kGq4MOWnfbBa/XYkyPXJ
        g8FsuAGn6th9MmsVutAnT/+3c2MF
X-Google-Smtp-Source: APXvYqw3PTcCYShtJuxPq/g76KpK65n1A8VUCRLEgtwiYfaxYnnjLrDlpoG0VejNfWg8sn9iQIFZiA==
X-Received: by 2002:a17:90a:2e8a:: with SMTP id r10mr8659888pjd.128.1570570828968;
        Tue, 08 Oct 2019 14:40:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h68sm78803pfb.149.2019.10.08.14.40.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 14:40:28 -0700 (PDT)
Date:   Tue, 8 Oct 2019 14:40:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 8/9] usb: typec: Remove the callback members from
 struct typec_capability
Message-ID: <20191008214027.GE16138@roeck-us.net>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
 <20191008111350.68581-9-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008111350.68581-9-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 02:13:49PM +0300, Heikki Krogerus wrote:
> There are no more users for them.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/class.c | 40 +++++++++++----------------------------
>  include/linux/usb/typec.h | 17 -----------------
>  2 files changed, 11 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 11ed3dc6fc49..3e9fa2530b86 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -52,7 +52,6 @@ struct typec_port {
>  	struct typec_switch		*sw;
>  	struct typec_mux		*mux;
>  
> -	const struct typec_capability	*orig_cap; /* to be removed */
>  	const struct typec_capability	*cap;
>  	const struct typec_operations   *ops;
>  };
> @@ -957,7 +956,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (!port->cap->try_role && (!port->ops || !port->ops->try_role)) {
> +	if (!port->ops || !port->ops->try_role) {
>  		dev_dbg(dev, "Setting preferred role not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -970,10 +969,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>  			return -EINVAL;
>  	}
>  
> -	if (port->ops && port->ops->try_role)
> -		ret = port->ops->try_role(port, role);
> -	else
> -		ret = port->cap->try_role(port->orig_cap, role);
> +	ret = port->ops->try_role(port, role);
>  	if (ret)
>  		return ret;
>  
> @@ -1004,7 +1000,7 @@ static ssize_t data_role_store(struct device *dev,
>  	struct typec_port *port = to_typec_port(dev);
>  	int ret;
>  
> -	if (!port->cap->dr_set && (!port->ops || !port->ops->dr_set)) {
> +	if (!port->ops || !port->ops->dr_set) {
>  		dev_dbg(dev, "data role swapping not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1019,10 +1015,7 @@ static ssize_t data_role_store(struct device *dev,
>  		goto unlock_and_ret;
>  	}
>  
> -	if (port->ops && port->ops->dr_set)
> -		ret = port->ops->dr_set(port, ret);
> -	else
> -		ret = port->cap->dr_set(port->orig_cap, ret);
> +	ret = port->ops->dr_set(port, ret);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1057,7 +1050,7 @@ static ssize_t power_role_store(struct device *dev,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (!port->cap->pr_set && (!port->ops || !port->ops->pr_set)) {
> +	if (!port->ops || !port->ops->pr_set) {
>  		dev_dbg(dev, "power role swapping not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1079,10 +1072,7 @@ static ssize_t power_role_store(struct device *dev,
>  		goto unlock_and_ret;
>  	}
>  
> -	if (port->ops && port->ops->dr_set)
> -		ret = port->ops->pr_set(port, ret);
> -	else
> -		ret = port->cap->pr_set(port->orig_cap, ret);
> +	ret = port->ops->pr_set(port, ret);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1113,8 +1103,8 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>  	int ret;
>  	enum typec_port_type type;
>  
> -	if (port->cap->type != TYPEC_PORT_DRP || (!port->cap->port_type_set &&
> -	    (!port->ops || !port->ops->port_type_set))) {
> +	if (port->cap->type != TYPEC_PORT_DRP ||
> +	    !port->ops || !port->ops->port_type_set) {
>  		dev_dbg(dev, "changing port type not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1131,10 +1121,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>  		goto unlock_and_ret;
>  	}
>  
> -	if (port->ops && port->ops->port_type_set)
> -		ret = port->ops->port_type_set(port, type);
> -	else
> -		ret = port->cap->port_type_set(port->orig_cap, type);
> +	ret = port->ops->port_type_set(port, type);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1190,7 +1177,7 @@ static ssize_t vconn_source_store(struct device *dev,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (!port->cap->vconn_set && (!port->ops || !port->ops->vconn_set)) {
> +	if (!port->ops || !port->ops->vconn_set) {
>  		dev_dbg(dev, "VCONN swapping not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1199,11 +1186,7 @@ static ssize_t vconn_source_store(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	if (port->ops && port->ops->vconn_set)
> -		ret = port->ops->vconn_set(port, (enum typec_role)source);
> -	else
> -		ret = port->cap->vconn_set(port->orig_cap,
> -					   (enum typec_role)source);
> +	ret = port->ops->vconn_set(port, (enum typec_role)source);
>  	if (ret)
>  		return ret;
>  
> @@ -1610,7 +1593,6 @@ struct typec_port *typec_register_port(struct device *parent,
>  
>  	port->id = id;
>  	port->ops = cap->ops;
> -	port->orig_cap = cap;
>  	port->port_type = cap->type;
>  	port->prefer_role = cap->prefer_role;
>  	port->cap = kmemdup(cap, sizeof(*cap), GFP_KERNEL);
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index c9bef128453b..894798084319 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -198,11 +198,6 @@ struct typec_operations {
>   * @fwnode: Optional fwnode of the port
>   * @driver_data: Private pointer for driver specific info
>   * @ops: Port operations vector
> - * @try_role: Set data role preference for DRP port
> - * @dr_set: Set Data Role
> - * @pr_set: Set Power Role
> - * @vconn_set: Set VCONN Role
> - * @port_type_set: Set port type
>   *
>   * Static capabilities of a single USB Type-C port.
>   */
> @@ -220,18 +215,6 @@ struct typec_capability {
>  	void			*driver_data;
>  
>  	const struct typec_operations	*ops;
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
>  };
>  
>  /* Specific to try_role(). Indicates the user want's to clear the preference. */
> -- 
> 2.23.0
> 
