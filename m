Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 252B3D02E7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 23:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729933AbfJHVgq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 17:36:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46029 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbfJHVgq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 17:36:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so143317pfb.12
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 14:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UfO+rsp7LGs7g9+EqxndB2tvOXFeYPZj/g42I1KrvmM=;
        b=Qo7KPUUWCYCMob2rXHzwMdKCirx6wuwmFakwcWDbM1+suZV7FZASpRqz2dXPZ3deoW
         oElr0/goPJ2KgjI+wz1mZxOB/h57AzPdNBH8upquYdCEy/PqcGiuYJUN132I6vTQMk7k
         9m9qBwFYQ+pK1BNfnOv3LXpTd2VZUEONnRk4zPfl0V8LKyrj2U3iihIEqT7O+55rlAEx
         s2FYW3XmgAobEf5GIkUha82FEMNVeDMQmiqqOxcg0QqqyEs0kqHoJEmU1kIdgg0T79Ds
         KGcMd/RTPItgYe4qoxGI50aXy43aRff+0ORMqo+zMU7eBsbKEa8C5DZ7Hn83A8/nJjOZ
         rR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=UfO+rsp7LGs7g9+EqxndB2tvOXFeYPZj/g42I1KrvmM=;
        b=J+K3TPCF3x8AlSBqPiux9qhNU/ntGpElIRmBzovle2Z32S8mnANNZvbogr4gewnW9Y
         pg3FxXvjoIWZs4tx5b0H9c50EG5gnNSUpWefvsyz9D7j5Vi9fAKLNXFVDqmT6anpw72x
         LzoKKWRQoqWs7k/jGoWqWvrsyN3YTCmzKmMTMI7JjtktwxbMKvkalEiu2h+hHP7ctasG
         dYqPvm2g3erJtOE6shkWqb8L4kKRH7pPPwCUGNfOJ2U3VQwOoMOT9on+R7w7+YhvKUVr
         heHKqXn3wVunajMwlekHJ1jPDEllUlzb/ik8XJapeplM+wfYfQIyz9eFCEYGWGopXF6h
         FCHg==
X-Gm-Message-State: APjAAAUWNRbsebAjAK7NY21BZuJXLm58ay60MJPSxd42424hWtbuTXQc
        BzmSsZGb/33YFPBOI4rclZQ=
X-Google-Smtp-Source: APXvYqzm8X0nXqrOiQ4hgGiSwTNnSTYGGkO6E4lcPUY/DqKG2RKaUEdOJvOul6UnMpt78dFJBPZdAw==
X-Received: by 2002:a63:541e:: with SMTP id i30mr588262pgb.130.1570570605506;
        Tue, 08 Oct 2019 14:36:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g19sm134934pgm.63.2019.10.08.14.36.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 14:36:44 -0700 (PDT)
Date:   Tue, 8 Oct 2019 14:36:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/9] usb: typec: Introduce typec_get_drvdata()
Message-ID: <20191008213643.GB16138@roeck-us.net>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
 <20191008111350.68581-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008111350.68581-3-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 02:13:43PM +0300, Heikki Krogerus wrote:
> Leaving the private driver_data pointer of the port device
> to the port drivers.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/class.c | 11 +++++++++++
>  include/linux/usb/typec.h |  4 ++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 0bbf10c8ad58..89ffe370e426 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1488,6 +1488,16 @@ EXPORT_SYMBOL_GPL(typec_set_mode);
>  
>  /* --------------------------------------- */
>  
> +/**
> + * typec_get_drvdata - Return private driver data pointer
> + * @port: USB Type-C port
> + */
> +void *typec_get_drvdata(struct typec_port *port)
> +{
> +	return dev_get_drvdata(&port->dev);
> +}
> +EXPORT_SYMBOL_GPL(typec_get_drvdata);
> +
>  /**
>   * typec_port_register_altmode - Register USB Type-C Port Alternate Mode
>   * @port: USB Type-C Port that supports the alternate mode
> @@ -1592,6 +1602,7 @@ struct typec_port *typec_register_port(struct device *parent,
>  	port->dev.fwnode = cap->fwnode;
>  	port->dev.type = &typec_port_dev_type;
>  	dev_set_name(&port->dev, "port%d", id);
> +	dev_set_drvdata(&port->dev, cap->driver_data);
>  
>  	port->sw = typec_switch_get(&port->dev);
>  	if (IS_ERR(port->sw)) {
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 7df4ecabc78a..8b90cd77331c 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -179,6 +179,7 @@ struct typec_partner_desc {
>   * @sw: Cable plug orientation switch
>   * @mux: Multiplexer switch for Alternate/Accessory Modes
>   * @fwnode: Optional fwnode of the port
> + * @driver_data: Private pointer for driver specific info
>   * @try_role: Set data role preference for DRP port
>   * @dr_set: Set Data Role
>   * @pr_set: Set Power Role
> @@ -198,6 +199,7 @@ struct typec_capability {
>  	struct typec_switch	*sw;
>  	struct typec_mux	*mux;
>  	struct fwnode_handle	*fwnode;
> +	void			*driver_data;
>  
>  	int		(*try_role)(const struct typec_capability *,
>  				    int role);
> @@ -241,6 +243,8 @@ int typec_set_orientation(struct typec_port *port,
>  enum typec_orientation typec_get_orientation(struct typec_port *port);
>  int typec_set_mode(struct typec_port *port, int mode);
>  
> +void *typec_get_drvdata(struct typec_port *port);
> +
>  int typec_find_port_power_role(const char *name);
>  int typec_find_power_role(const char *name);
>  int typec_find_port_data_role(const char *name);
> -- 
> 2.23.0
> 
