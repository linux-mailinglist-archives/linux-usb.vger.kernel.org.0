Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76819CCBBC
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2019 19:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbfJERjV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Oct 2019 13:39:21 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37772 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbfJERjV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Oct 2019 13:39:21 -0400
Received: by mail-pg1-f194.google.com with SMTP id p1so3819271pgi.4
        for <linux-usb@vger.kernel.org>; Sat, 05 Oct 2019 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KKLHxWKssU9YHURhugKtfYqnbk5fOteJiwKnu6OUyuI=;
        b=bygeEO8AQeY9Zci/HG04HvS4ljKGl1ZUfxvBHnYgpC9UkOZVP1ES9qEXdzug0mL133
         kru8CpTzFSr1YUHlOuOVnsDLQflVu45VMdYK7JbH+HIbVHMBvYls4/PYVRGJUBV3f/bl
         WHyXIbmIrAzDe0S9cDDw7eRQty4ssdX4pFgL5w+f9pzm1zM3nG9JmgLgKr5dPwWFldW9
         Q5hUQ95HlT4iWvRx1rGjAbTPg4Pq7GUI/XKygtjei3OywqNd4MeNkThvCFzfXuQjCbmF
         Ng56Qrhh5UDfwHVW4lLEKaO/F6hIBNDvaYQbN0LNdZJvySY6OLwqpCqNr/eVrrFX8VSH
         lkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KKLHxWKssU9YHURhugKtfYqnbk5fOteJiwKnu6OUyuI=;
        b=UUVwRZ1JW4RtXpQl70ZoQbZ9cVBrk2sa4GM0CLQ4PfQF8yssV3NHFk3eADcIzav0Fj
         tJH5IeokTjxw2GpGzR23piPPbaxAOWxUNt74uTaUmSF0+DAubZz4v+JkxpuDzdsFofj6
         3UcTCT/ZQDRJWpVINbZ2eK+Y8cAehhZ/rrV+NbqBNmCqf03w0Kicw+Whqg3SVPtmFLzn
         7NbEJDbny00hCZoLyo2qhNZUHGKehe7SlT/UPSr+HdNBOe8odua9Hk1YpwCfnGSDjKyS
         uH/vkEmoKXPH1yXQyRb93gVOpgd6zdemgks25v7JgWUFlKnLKfrAq4MRWd4k8GYUWevv
         bHqg==
X-Gm-Message-State: APjAAAUDdHtzrdpzN0hzJ5Ms4Hy7XW6aP5BOq/t0IYI3ApzlAhI1G2+A
        aie6fbOad3eqLz2pfACfmuRMrYTg
X-Google-Smtp-Source: APXvYqxHXzDCeSUP2jR+XWJndvQjtNZUbPUubmKzMJLMEjTHpiW6HR76Pb49JXFaHuDAO3YHskYruQ==
X-Received: by 2002:a63:9d04:: with SMTP id i4mr21773690pgd.254.1570297158506;
        Sat, 05 Oct 2019 10:39:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x23sm8759066pfq.140.2019.10.05.10.39.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 10:39:17 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] usb: typec: tcpm: Start using struct
 typec_operations
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
References: <20191004150817.45413-1-heikki.krogerus@linux.intel.com>
 <20191004150817.45413-5-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0ec263d0-f5d8-0f93-06ae-5da0ff073b95@roeck-us.net>
Date:   Sat, 5 Oct 2019 10:39:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004150817.45413-5-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/4/19 8:08 AM, Heikki Krogerus wrote:
> Supplying the operation callbacks as part of a struct
> typec_operations instead of as part of struct
> typec_capability during port registration.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpm.c | 45 ++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 96562744101c..32b4ce6ce60b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -390,12 +390,6 @@ static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
>   	return SRC_UNATTACHED;
>   }
>   
> -static inline
> -struct tcpm_port *typec_cap_to_tcpm(const struct typec_capability *cap)
> -{
> -	return container_of(cap, struct tcpm_port, typec_caps);
> -}
> -
>   static bool tcpm_port_is_disconnected(struct tcpm_port *port)
>   {
>   	return (!port->attached && port->cc1 == TYPEC_CC_OPEN &&
> @@ -3970,10 +3964,9 @@ void tcpm_pd_hard_reset(struct tcpm_port *port)
>   }
>   EXPORT_SYMBOL_GPL(tcpm_pd_hard_reset);
>   
> -static int tcpm_dr_set(const struct typec_capability *cap,
> -		       enum typec_data_role data)
> +static int tcpm_dr_set(struct typec_port *p, enum typec_data_role data)
>   {
> -	struct tcpm_port *port = typec_cap_to_tcpm(cap);
> +	struct tcpm_port *port = typec_get_drvdata(p);
>   	int ret;
>   
>   	mutex_lock(&port->swap_lock);
> @@ -4038,10 +4031,9 @@ static int tcpm_dr_set(const struct typec_capability *cap,
>   	return ret;
>   }
>   
> -static int tcpm_pr_set(const struct typec_capability *cap,
> -		       enum typec_role role)
> +static int tcpm_pr_set(struct typec_port *p, enum typec_role role)
>   {
> -	struct tcpm_port *port = typec_cap_to_tcpm(cap);
> +	struct tcpm_port *port = typec_get_drvdata(p);
>   	int ret;
>   
>   	mutex_lock(&port->swap_lock);
> @@ -4082,10 +4074,9 @@ static int tcpm_pr_set(const struct typec_capability *cap,
>   	return ret;
>   }
>   
> -static int tcpm_vconn_set(const struct typec_capability *cap,
> -			  enum typec_role role)
> +static int tcpm_vconn_set(struct typec_port *p, enum typec_role role)
>   {
> -	struct tcpm_port *port = typec_cap_to_tcpm(cap);
> +	struct tcpm_port *port = typec_get_drvdata(p);
>   	int ret;
>   
>   	mutex_lock(&port->swap_lock);
> @@ -4122,9 +4113,9 @@ static int tcpm_vconn_set(const struct typec_capability *cap,
>   	return ret;
>   }
>   
> -static int tcpm_try_role(const struct typec_capability *cap, int role)
> +static int tcpm_try_role(struct typec_port *p, int role)
>   {
> -	struct tcpm_port *port = typec_cap_to_tcpm(cap);
> +	struct tcpm_port *port = typec_get_drvdata(p);
>   	struct tcpc_dev	*tcpc = port->tcpc;
>   	int ret = 0;
>   
> @@ -4331,10 +4322,9 @@ static void tcpm_init(struct tcpm_port *port)
>   	tcpm_set_state(port, PORT_RESET, 0);
>   }
>   
> -static int tcpm_port_type_set(const struct typec_capability *cap,
> -			      enum typec_port_type type)
> +static int tcpm_port_type_set(struct typec_port *p, enum typec_port_type type)
>   {
> -	struct tcpm_port *port = typec_cap_to_tcpm(cap);
> +	struct tcpm_port *port = typec_get_drvdata(p);
>   
>   	mutex_lock(&port->lock);
>   	if (type == port->port_type)
> @@ -4359,6 +4349,14 @@ static int tcpm_port_type_set(const struct typec_capability *cap,
>   	return 0;
>   }
>   
> +static const struct typec_operations tcpm_ops = {
> +	.try_role = tcpm_try_role,
> +	.dr_set = tcpm_dr_set,
> +	.pr_set = tcpm_pr_set,
> +	.vconn_set = tcpm_vconn_set,
> +	.port_type_set = tcpm_port_type_set
> +};
> +
>   void tcpm_tcpc_reset(struct tcpm_port *port)
>   {
>   	mutex_lock(&port->lock);
> @@ -4770,11 +4768,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>   	port->typec_caps.fwnode = tcpc->fwnode;
>   	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
>   	port->typec_caps.pd_revision = 0x0300;	/* USB-PD spec release 3.0 */
> -	port->typec_caps.dr_set = tcpm_dr_set;
> -	port->typec_caps.pr_set = tcpm_pr_set;
> -	port->typec_caps.vconn_set = tcpm_vconn_set;
> -	port->typec_caps.try_role = tcpm_try_role;
> -	port->typec_caps.port_type_set = tcpm_port_type_set;
> +	port->typec_caps.driver_data = port;
> +	port->typec_caps.ops = &tcpm_ops;
>   
>   	port->partner_desc.identity = &port->partner_ident;
>   	port->port_type = port->typec_caps.type;
> 

