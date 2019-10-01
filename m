Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6258EC35D2
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388126AbfJANfa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:35:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40951 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732921AbfJANfa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:35:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id d26so4208627pgl.7
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s2zE4zosM+6iXCc3U6W5Ygw+/H4pKx73vzGQYMx0eTw=;
        b=ZAYzXk7Ds5ieDidaLAICni0RMyR8yu/RUhYFBI1BgX9bh/3ihi21gJgd1QeEApZ/GQ
         NNTuhR62AU0mhbWrQm98emngC6lYJqT/6kuaZmWPtYX15x2Enk6jMKUm5C5PrFp4ThWm
         nddN8vQI8RwttK2C6H0DD3lAJ1pQyBYcq818DegibJzqWlpSUvQKud5Udb7dFQiANEsn
         QwqCZo/QCqM2dRi7vQSh8Xp41MUB6RavrzqWGG22NVzUQAyDjwSWMP0WOHdBWHKAa9FZ
         iO5ZrDcOQbc6q2LxeBS5MFYUbihEwCyhkyj3Xr1PG13HaizV/e6xe42P0eOM4vI8U3v8
         oqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s2zE4zosM+6iXCc3U6W5Ygw+/H4pKx73vzGQYMx0eTw=;
        b=eN2pK+b7jPFRqNqcWn6M8HaFbAgvKEYqJ8gbr7TNB0l1nBNlmlyrelT0tA1lPGqdL/
         UZ0L9i96InWzF5nJWHruOeQyNdqDM3WGDl5Pqqw3v/B7N1i8tFIyW6PTFVCVzuXF9SuF
         oOzGtsOWrB7yYqZ8PiacK2+m2tZoh0MzLWkSmXBbXUJVwIXztGULUaX8CbHbNOWB0ZAz
         QwjjGanJ7tlZanlLG+tGgCNvaZne3FcF6OBy8tYJC6OIIP+rdnjAFDgJFB+nodXlU9l8
         AMGbMb3nftBN6uO5LTjW7Eb6wWrT3ryFeqDRyimFr/jeK65v3cR4JQMAZiow+70RBdmG
         r5Vw==
X-Gm-Message-State: APjAAAX/BX1FlCzd/AqXWR0JdkivHdB+vZb98Y8TJKwpLm56NoyIEUyt
        ARqccPw7XNZWm0GN3qRkWXWp1IRJ
X-Google-Smtp-Source: APXvYqwWqFvdKw1VxfvEp5EtxtCELw5FVuEy5NmSm4TLBWnTGfnkWsDmMLG7L2B5zthP/sxfxptfxA==
X-Received: by 2002:a63:ff4a:: with SMTP id s10mr29745256pgk.166.1569936928429;
        Tue, 01 Oct 2019 06:35:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 22sm16546023pfj.139.2019.10.01.06.35.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:35:27 -0700 (PDT)
Subject: Re: [PATCH 6/7] usb: typec: ucsi: Start using struct typec_operations
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-7-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <65812811-2696-d4a9-5ed0-7fd33690e83e@roeck-us.net>
Date:   Tue, 1 Oct 2019 06:35:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001094858.68643-7-heikki.krogerus@linux.intel.com>
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/ucsi/ucsi.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index ba288b964dc8..edd722fb88b8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -17,9 +17,6 @@
>   #include "ucsi.h"
>   #include "trace.h"
>   
> -#define to_ucsi_connector(_cap_) container_of(_cap_, struct ucsi_connector, \
> -					      typec_cap)
> -
>   /*
>    * UCSI_TIMEOUT_MS - PPM communication timeout
>    *
> @@ -713,10 +710,9 @@ static int ucsi_role_cmd(struct ucsi_connector *con, struct ucsi_control *ctrl)
>   	return ret;
>   }
>   
> -static int
> -ucsi_dr_swap(const struct typec_capability *cap, enum typec_data_role role)
> +static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
>   {
> -	struct ucsi_connector *con = to_ucsi_connector(cap);
> +	struct ucsi_connector *con = typec_get_drvdata(port);
>   	struct ucsi_control ctrl;
>   	int ret = 0;
>   
> @@ -748,10 +744,9 @@ ucsi_dr_swap(const struct typec_capability *cap, enum typec_data_role role)
>   	return ret < 0 ? ret : 0;
>   }
>   
> -static int
> -ucsi_pr_swap(const struct typec_capability *cap, enum typec_role role)
> +static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
>   {
> -	struct ucsi_connector *con = to_ucsi_connector(cap);
> +	struct ucsi_connector *con = typec_get_drvdata(port);
>   	struct ucsi_control ctrl;
>   	int ret = 0;
>   
> @@ -788,6 +783,11 @@ ucsi_pr_swap(const struct typec_capability *cap, enum typec_role role)
>   	return ret;
>   }
>   
> +static const struct typec_operations ucsi_ops = {
> +	.dr_set = ucsi_dr_swap,
> +	.pr_set = ucsi_pr_swap
> +};
> +
>   static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
>   {
>   	struct fwnode_handle *fwnode;
> @@ -843,8 +843,8 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>   		*accessory = TYPEC_ACCESSORY_DEBUG;
>   
>   	cap->fwnode = ucsi_find_fwnode(con);
> -	cap->dr_set = ucsi_dr_swap;
> -	cap->pr_set = ucsi_pr_swap;
> +	cap->driver_data = con;
> +	cap->ops = &ucsi_ops;
>   
>   	/* Register the connector */
>   	con->port = typec_register_port(ucsi->dev, cap);
> 

