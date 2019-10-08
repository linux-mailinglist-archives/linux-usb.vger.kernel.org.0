Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E346DD02EB
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 23:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbfJHViH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 17:38:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46552 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbfJHViG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 17:38:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id q24so9028180plr.13
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6uLfN9YOjjRZGUg8ABfrga5y4B8uwpBg1KzxBZWaKpc=;
        b=R7yLSqSvDIV+idvw1+OmqCoQPjPi9Ao/rYRnhKxp7pxMzRZ2gtJT910Y8c8kAL5qkK
         QZGxHLrXy8vWrEgdLhk69H3fBti1kyNC4sJH2PCBCA0FHTeCbVcxZYhTUuqbt67YCARR
         jJzzBfBOIDDxYn4A8S0Nkg5YsWXR6SuS8uMJYM7d8Otmo11XhItXxkdBjptXWRj0+Ndg
         POliKjNjT/mhekW+NPW3K0/rMPHD8DOkf67gtJtRu5pxhFai0WcZKUTR7CTBFQgnpvaN
         2fUbJ7Vnf9p4uaEhjNWm+TrYFMq4t7DSQCAv+cp2sja15U+ftuGu0sXfV5hVRHHAr+lL
         Vdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6uLfN9YOjjRZGUg8ABfrga5y4B8uwpBg1KzxBZWaKpc=;
        b=hXQMTHceGmMioBPYCZox2tLb7oc1zyKM31UItpGjqA5BIQdVMmtGEdKQ9pI5QeIFBV
         r6hFPV7N58nSKrguVNXQf4r6DVqyQibIqZCQHnSdEFKSWPgVT5rj8iM23XY5+5xY5XoU
         O73ZUoEV6ac5WZ4SGqWktIYftuQ2eGMRqUKpFUFdnRCpCL4pBriYsXpAi1tIsyabvPee
         bhdOUhhYXy+p6Oq3V6KWUiYN1+uhLegvHnIa71zvuRGCthf7wHvZcBw4foKdsotk3nwq
         QYg/+sHDGFaMLtib8Cy/48iwmi3Zw5Df0lhUNa3t+zRSrHSrcj9+Ii/4+qg3C+v5zh5+
         uZFw==
X-Gm-Message-State: APjAAAUz1humPKPngL6r0ccbKzZfQSJeX2NXtwArH67qLn8VHh1C87j5
        qk+nm1uIZp9Nr0VmnBhD8iwOVlY9
X-Google-Smtp-Source: APXvYqzRBEmG77vNrGUdJ/HNfx2f+iEFX0ZAz3dCKOgXWFCNww4xwZ7j0opHV9tpj8eKCxcDcJWycw==
X-Received: by 2002:a17:902:4c:: with SMTP id 70mr34569755pla.30.1570570685595;
        Tue, 08 Oct 2019 14:38:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q20sm82733pfl.79.2019.10.08.14.38.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 14:38:05 -0700 (PDT)
Date:   Tue, 8 Oct 2019 14:38:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/9] usb: typec: Separate the operations vector
Message-ID: <20191008213804.GC16138@roeck-us.net>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
 <20191008111350.68581-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008111350.68581-4-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 02:13:44PM +0300, Heikki Krogerus wrote:
> Introducing struct typec_operations which has the same
> callbacks as struct typec_capability. The old callbacks are
> kept for now, but after all users have been converted, they
> will be removed.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/class.c | 39 +++++++++++++++++++++++++++++----------
>  include/linux/usb/typec.h | 20 ++++++++++++++++++++
>  2 files changed, 49 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 89ffe370e426..11ed3dc6fc49 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -54,6 +54,7 @@ struct typec_port {
>  
>  	const struct typec_capability	*orig_cap; /* to be removed */
>  	const struct typec_capability	*cap;
> +	const struct typec_operations   *ops;
>  };
>  
>  #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
> @@ -956,7 +957,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (!port->cap->try_role) {
> +	if (!port->cap->try_role && (!port->ops || !port->ops->try_role)) {
>  		dev_dbg(dev, "Setting preferred role not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -969,7 +970,10 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>  			return -EINVAL;
>  	}
>  
> -	ret = port->cap->try_role(port->orig_cap, role);
> +	if (port->ops && port->ops->try_role)
> +		ret = port->ops->try_role(port, role);
> +	else
> +		ret = port->cap->try_role(port->orig_cap, role);
>  	if (ret)
>  		return ret;
>  
> @@ -1000,7 +1004,7 @@ static ssize_t data_role_store(struct device *dev,
>  	struct typec_port *port = to_typec_port(dev);
>  	int ret;
>  
> -	if (!port->cap->dr_set) {
> +	if (!port->cap->dr_set && (!port->ops || !port->ops->dr_set)) {
>  		dev_dbg(dev, "data role swapping not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1015,7 +1019,10 @@ static ssize_t data_role_store(struct device *dev,
>  		goto unlock_and_ret;
>  	}
>  
> -	ret = port->cap->dr_set(port->orig_cap, ret);
> +	if (port->ops && port->ops->dr_set)
> +		ret = port->ops->dr_set(port, ret);
> +	else
> +		ret = port->cap->dr_set(port->orig_cap, ret);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1050,7 +1057,7 @@ static ssize_t power_role_store(struct device *dev,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (!port->cap->pr_set) {
> +	if (!port->cap->pr_set && (!port->ops || !port->ops->pr_set)) {
>  		dev_dbg(dev, "power role swapping not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1072,7 +1079,10 @@ static ssize_t power_role_store(struct device *dev,
>  		goto unlock_and_ret;
>  	}
>  
> -	ret = port->cap->pr_set(port->orig_cap, ret);
> +	if (port->ops && port->ops->dr_set)
> +		ret = port->ops->pr_set(port, ret);
> +	else
> +		ret = port->cap->pr_set(port->orig_cap, ret);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1103,7 +1113,8 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>  	int ret;
>  	enum typec_port_type type;
>  
> -	if (!port->cap->port_type_set || port->cap->type != TYPEC_PORT_DRP) {
> +	if (port->cap->type != TYPEC_PORT_DRP || (!port->cap->port_type_set &&
> +	    (!port->ops || !port->ops->port_type_set))) {
>  		dev_dbg(dev, "changing port type not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1120,7 +1131,10 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>  		goto unlock_and_ret;
>  	}
>  
> -	ret = port->cap->port_type_set(port->orig_cap, type);
> +	if (port->ops && port->ops->port_type_set)
> +		ret = port->ops->port_type_set(port, type);
> +	else
> +		ret = port->cap->port_type_set(port->orig_cap, type);
>  	if (ret)
>  		goto unlock_and_ret;
>  
> @@ -1176,7 +1190,7 @@ static ssize_t vconn_source_store(struct device *dev,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (!port->cap->vconn_set) {
> +	if (!port->cap->vconn_set && (!port->ops || !port->ops->vconn_set)) {
>  		dev_dbg(dev, "VCONN swapping not supported\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1185,7 +1199,11 @@ static ssize_t vconn_source_store(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	ret = port->cap->vconn_set(port->orig_cap, (enum typec_role)source);
> +	if (port->ops && port->ops->vconn_set)
> +		ret = port->ops->vconn_set(port, (enum typec_role)source);
> +	else
> +		ret = port->cap->vconn_set(port->orig_cap,
> +					   (enum typec_role)source);
>  	if (ret)
>  		return ret;
>  
> @@ -1591,6 +1609,7 @@ struct typec_port *typec_register_port(struct device *parent,
>  	mutex_init(&port->port_type_lock);
>  
>  	port->id = id;
> +	port->ops = cap->ops;
>  	port->orig_cap = cap;
>  	port->port_type = cap->type;
>  	port->prefer_role = cap->prefer_role;
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 8b90cd77331c..c9bef128453b 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -168,6 +168,23 @@ struct typec_partner_desc {
>  	struct usb_pd_identity	*identity;
>  };
>  
> +/**
> + * struct typec_operations - USB Type-C Port Operations
> + * @try_role: Set data role preference for DRP port
> + * @dr_set: Set Data Role
> + * @pr_set: Set Power Role
> + * @vconn_set: Source VCONN
> + * @port_type_set: Set port type
> + */
> +struct typec_operations {
> +	int (*try_role)(struct typec_port *port, int role);
> +	int (*dr_set)(struct typec_port *port, enum typec_data_role role);
> +	int (*pr_set)(struct typec_port *port, enum typec_role role);
> +	int (*vconn_set)(struct typec_port *port, enum typec_role role);
> +	int (*port_type_set)(struct typec_port *port,
> +			     enum typec_port_type type);
> +};
> +
>  /*
>   * struct typec_capability - USB Type-C Port Capabilities
>   * @type: Supported power role of the port
> @@ -180,6 +197,7 @@ struct typec_partner_desc {
>   * @mux: Multiplexer switch for Alternate/Accessory Modes
>   * @fwnode: Optional fwnode of the port
>   * @driver_data: Private pointer for driver specific info
> + * @ops: Port operations vector
>   * @try_role: Set data role preference for DRP port
>   * @dr_set: Set Data Role
>   * @pr_set: Set Power Role
> @@ -201,6 +219,8 @@ struct typec_capability {
>  	struct fwnode_handle	*fwnode;
>  	void			*driver_data;
>  
> +	const struct typec_operations	*ops;
> +
>  	int		(*try_role)(const struct typec_capability *,
>  				    int role);
>  
> -- 
> 2.23.0
> 
