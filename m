Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3AB4730BD
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 16:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhLMPpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 10:45:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234484AbhLMPpC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 10:45:02 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA95C061574
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 07:45:02 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id r26so23643105oiw.5
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 07:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f32I24THoZj8VM1uPDeymNf1lCxQF/tsSQR0RzhDDy0=;
        b=Jsp8YK05/OaDSqD0KywUXkg/KnwTG8LAnYkueGfuTKAySR0AJ23s2qDpDN/Yje2gf2
         1jBO8alNRHHQsUFOnTJrEuafgAQlKc4V/VeVe872c+ohlOZ/H4ctOScrF2683xalkIlB
         aXPFyZSu1s99rmdcW6CWBrH4UALXj61AMvnlX15VEpCZQ8sg1PB36EuoQmagjorOmIxu
         eXZQ0AW+ykLpEyUBSIwB7iB+aEsiO28qfEM2/ScBv5JnS7KeZYBIak8PpigoX03IEnYG
         3yy2uyeBS9ul9txpFiGKVxv6nTX0lsIgCB72w9UdeqAXpe8z1TG8pnnCzvT87vFWFwIk
         ZJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f32I24THoZj8VM1uPDeymNf1lCxQF/tsSQR0RzhDDy0=;
        b=XzhH3pN9n5NdQ6aqXzoxgt5vaoRMtk1CnXg5uRMeA4JhQLE0j7M32UkAE33apspwjx
         7LGesK6/PJHcwhO+WrQWO9IgQ81tZCCCKA3zvPeY7Bzlv7plE8e9zs+mdr0ne/pirfON
         9tHGLFOgEYVJZoeXcym/8NbYpRX9YQdkTKkYF75DhI0N3Ue7hCfOG9JaCqgarpzyoPKK
         IGV/fyp47tad8c1DZHDdSx4b8j5/4z2fcDtJ6/FxGwXF//pIRwTrUrewJ+VTBjyXcsKd
         5/nED4rjXomn8plurKG1F/qCa8D8S90jeznqgzw9BtRT79jO4SDxxSgnmDNWXZORTQbc
         RLXg==
X-Gm-Message-State: AOAM532HqPecob6ZPCekBT0RcMo5UgPrc7CKzxTs3GlquEH3B/Ji5UID
        ub9iKNMPPeasw4KnUk9sKJw=
X-Google-Smtp-Source: ABdhPJxQt/6Ibw5X/bfGrc1xZszilRnUc54jtRbJk4nnKT5fR7gVRjYNUB7TmuDU/n+/DO/ZoKNiow==
X-Received: by 2002:aca:aacc:: with SMTP id t195mr27124076oie.2.1639410301288;
        Mon, 13 Dec 2021 07:45:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b22sm2646906oib.41.2021.12.13.07.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 07:45:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V2] usb: typec: tcpm: fix tcpm unregister port but leave a
 pending timer
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
References: <20211209101507.499096-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <35e4235d-4434-8b05-dbdd-15e10a6daa1c@roeck-us.net>
Date:   Mon, 13 Dec 2021 07:44:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209101507.499096-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/9/21 2:15 AM, Xu Yang wrote:
> In current design, when the tcpm port is unregisterd, the kthread_worker
> will be destroyed in the last step. Inside the kthread_destroy_worker(),
> the worker will flush all the works and wait for them to end. However, if
> one of the works calls hrtimer_start(), this hrtimer will be pending until
> timeout even though tcpm port is removed. Once the hrtimer timeout, many
> strange kernel dumps appear.
> 
> Thus, we can first complete kthread_destroy_worker(), then cancel all the
> hrtimers. This will guarantee that no hrtimer is pending at the end.
> 
> Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority for processing events")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> Changes in V2:
>   -Introduced a flag "port->registered" to avoid race.
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 6010b9901126..59d4fa2443f2 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -324,6 +324,7 @@ struct tcpm_port {
>   
>   	bool attached;
>   	bool connected;
> +	bool registered;
>   	bool pd_supported;
>   	enum typec_port_type port_type;
>   
> @@ -6291,7 +6292,8 @@ static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
>   {
>   	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
>   
> -	kthread_queue_work(port->wq, &port->state_machine);
> +	if (port->registered)
> +		kthread_queue_work(port->wq, &port->state_machine);
>   	return HRTIMER_NORESTART;
>   }
>   
> @@ -6299,7 +6301,8 @@ static enum hrtimer_restart vdm_state_machine_timer_handler(struct hrtimer *time
>   {
>   	struct tcpm_port *port = container_of(timer, struct tcpm_port, vdm_state_machine_timer);
>   
> -	kthread_queue_work(port->wq, &port->vdm_state_machine);
> +	if (port->registered)
> +		kthread_queue_work(port->wq, &port->vdm_state_machine);
>   	return HRTIMER_NORESTART;
>   }
>   
> @@ -6307,7 +6310,8 @@ static enum hrtimer_restart enable_frs_timer_handler(struct hrtimer *timer)
>   {
>   	struct tcpm_port *port = container_of(timer, struct tcpm_port, enable_frs_timer);
>   
> -	kthread_queue_work(port->wq, &port->enable_frs);
> +	if (port->registered)
> +		kthread_queue_work(port->wq, &port->enable_frs);
>   	return HRTIMER_NORESTART;
>   }
>   
> @@ -6315,7 +6319,8 @@ static enum hrtimer_restart send_discover_timer_handler(struct hrtimer *timer)
>   {
>   	struct tcpm_port *port = container_of(timer, struct tcpm_port, send_discover_timer);
>   
> -	kthread_queue_work(port->wq, &port->send_discover_work);
> +	if (port->registered)
> +		kthread_queue_work(port->wq, &port->send_discover_work);
>   	return HRTIMER_NORESTART;
>   }
>   
> @@ -6403,6 +6408,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>   	typec_port_register_altmodes(port->typec_port,
>   				     &tcpm_altmode_ops, port,
>   				     port->port_altmode, ALTMODE_DISCOVERY_MAX);
> +	port->registered = true;
>   
>   	mutex_lock(&port->lock);
>   	tcpm_init(port);
> @@ -6424,6 +6430,9 @@ void tcpm_unregister_port(struct tcpm_port *port)
>   {
>   	int i;
>   
> +	port->registered = false;
> +	kthread_destroy_worker(port->wq);
> +
>   	hrtimer_cancel(&port->send_discover_timer);
>   	hrtimer_cancel(&port->enable_frs_timer);
>   	hrtimer_cancel(&port->vdm_state_machine_timer);
> @@ -6435,7 +6444,6 @@ void tcpm_unregister_port(struct tcpm_port *port)
>   	typec_unregister_port(port->typec_port);
>   	usb_role_switch_put(port->role_sw);
>   	tcpm_debugfs_exit(port);
> -	kthread_destroy_worker(port->wq);
>   }
>   EXPORT_SYMBOL_GPL(tcpm_unregister_port);
>   
> 

