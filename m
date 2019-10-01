Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DAEC35B8
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388414AbfJANap (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:30:45 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39923 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388342AbfJANap (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:30:45 -0400
Received: by mail-pl1-f195.google.com with SMTP id s17so5485004plp.6
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kkH+X/j45aQgHaNrowbIi5jWJ4GxsthVLB6k1rdAg9w=;
        b=rzl4UeyAxVyv5zbZiuCEm0becqEngZ/6q9lS49vHW6gUPoF0Drgo5QhKYB/AAn0VBQ
         2rS9UyxynayUxjAmc7xvhvUPPOHdnRuLh5UNOW4NGrt7aOt4LEBJ+8P5emDVwiHwcA20
         Xvtv6WNqqLfDlzwkea2r/u2PiOXn0HSRhcl2aTgy7yNaXckGEUBVrAqtorVGImEowWBD
         pkg7YW7nWF3H6Jn8D0svslNaXA+9Y6in0RM3x40lKCqrmp3bh0ZB2bsxgERDyB5yB8Si
         R6uLawFGMH3QspY1aY/PZ8Ne3zf9CLnX/cA20/lWgIDaQPJI4wTZUefEOuiPIArx6RkM
         PqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kkH+X/j45aQgHaNrowbIi5jWJ4GxsthVLB6k1rdAg9w=;
        b=bBkrVUF77KER520Bu/ZqZy6C6wtyEA8yXKY7zupXBB0cDtOsjlKCtcVkGb9Mjx7O9/
         FMJZj50lZ6dg91zKHAFBiUWaXQeF/gG0jTb1SbRNAwk4hlxF8LENaqtc3GDRSLbeM9u5
         uz2985ZkV24MwqTt1DCc8VsmtLUYE0NS80SchtQOW+vpQyQuxy/w887ZZKVE2mXXpbbv
         SKQxNRRT/iOqba0QmGDkINhu99ItZ08W9fxu31k2JLdHMhOTZzosrD0ZCdbPhT1NoJ/F
         /f3ehmAwZGIsn4/wJTp67XiUohhVXmqK/hB30y67rki8IcT40WPvw2zxEP63YcXBtUqA
         j+Cg==
X-Gm-Message-State: APjAAAWS82nddjWYFH07pRiW+J7wU+DZLSt5rlmy39KPgXRaKXEHKtuT
        6VlU6TZzcsdJVkjEBrtbPFv9fnEJ
X-Google-Smtp-Source: APXvYqx89PoR3TsgT1Xjh0D9vZ+e9F+aSrdvbuSyrmoSIqYc+ItdE9//sxpsbdZajtlBErvwa7iiLg==
X-Received: by 2002:a17:902:fe0e:: with SMTP id g14mr26276282plj.285.1569936644152;
        Tue, 01 Oct 2019 06:30:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q24sm17502074pgt.1.2019.10.01.06.30.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:30:43 -0700 (PDT)
Subject: Re: [PATCH 4/7] usb: typec: tcpm: Start using struct typec_operations
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-5-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <84d546e9-2f3f-1c82-97d3-ab1cc0c7d818@roeck-us.net>
Date:   Tue, 1 Oct 2019 06:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001094858.68643-5-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/1/19 2:48 AM, Heikki Krogerus wrote:
> Supplying the operation callbacks as part of a struct
> typec_operations instead of as part of struct
> typec_capability during port registration.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 47 ++++++++++++++++-------------------
>   1 file changed, 21 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 96562744101c..0fde7e042d5f 100644
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
> +static int tcpm_vconn_set(struct typec_port *p, bool source)
>   {
> -	struct tcpm_port *port = typec_cap_to_tcpm(cap);
> +	struct tcpm_port *port = typec_get_drvdata(p);
>   	int ret;
>   
>   	mutex_lock(&port->swap_lock);
> @@ -4096,7 +4087,7 @@ static int tcpm_vconn_set(const struct typec_capability *cap,
>   		goto port_unlock;
>   	}
>   
> -	if (role == port->vconn_role) {
> +	if (source == port->vconn_role) {

source is boolean, vconn_role is enum typec_role.
The original typec code took advantage of typec_role == TYPEC_SINK matching false,
and typec_role == TYPEC_SOURCE matching true, but I don't think it is a good
idea to carry that down to low level drivers. This will confuse everyone who wants
to contribute a driver in the future.

>   		ret = 0;
>   		goto port_unlock;
>   	}
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

