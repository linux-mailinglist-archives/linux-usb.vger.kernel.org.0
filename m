Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDABECFAD
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 17:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKBQLX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 12:11:23 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42763 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfKBQLX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 12:11:23 -0400
Received: by mail-pf1-f194.google.com with SMTP id s5so814243pfh.9
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uZR4Nl4H2+RMIvhQW14seEirSuZvuloIbFQocTDqpf8=;
        b=UtcQuTfsvuoZ5LkfYe5ph3RT1YDz7g739QHhwkYadzyoTXWTbGheAIlTJ3XyLQNBvQ
         rwJ3MiC0jf/Zl66m09ybzZIaZJ1UwiWxpwQdPG7yR2aJmf9hwcUtzIxIt3sdfK/8N3sJ
         4ZedSYLLudSYsBVNH474GFso6CvfBkoPe3A/5a0LYxViC9Ivb24ZlJs6Mnjx4j+ZDY2Q
         n+8+i6/rVVSft2GaFBTYOB2W40wwKYPRX2ocwniZ6N3CFc3G6EpkCoB/RXwvnP7noxA1
         lV94BTuXEx++SAiLcw3Bg8ZCEIlh89+2SuHnffnzQzcXqPGdHdm7/7PTlcqcZDiG0+2A
         UVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uZR4Nl4H2+RMIvhQW14seEirSuZvuloIbFQocTDqpf8=;
        b=FPV8fkR2aj5R8LOGFYvR3XdQswlR/lM/iZSzENi6cwFbVv3n7SpIBBYT8/8eoh1Cmf
         Em1erE3GNGwuKP4UbDEvh1CWct5bY2hu0b5+M1vxxqtrD78l8xJzKWNj0fpHF5+pGlcC
         H7iMCXQRvGqxVt8cx8cWIKweKdAJy7WxlP3vFqcWeiBO0sSW7cti7wbzbAYdos8X2kNd
         6WqM1WjNhvgiIy3nJrZz/yrndl+tESUZaOz90lfUegbYJBbXN7B28v0M8nxu88Xy9LAN
         dGvzzIH76/5AfwSIYmOD3ryK/40jY44Fc5Qv3VALaRUQ86xiyLR+IO059ZaYVOYKzwpo
         K7iA==
X-Gm-Message-State: APjAAAU8rbmECWzijii4Xb9CPdAmTiV+6lAJINkrAp8oCVXOf+qVTxNb
        MjBJ2Kf8RIgIMGtBE+D1PG4=
X-Google-Smtp-Source: APXvYqy0Nb9f5EBdQ3is/3ezFvnc0oBtnzri9Ds9Q3nehyh61jR9b8T9bIlBRd3AVhwbl/b25upKDw==
X-Received: by 2002:a62:ee0d:: with SMTP id e13mr17065596pfi.58.1572711082902;
        Sat, 02 Nov 2019 09:11:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a1sm11069868pjh.25.2019.11.02.09.11.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Nov 2019 09:11:22 -0700 (PDT)
Subject: Re: [PATCH v3 10/18] usb: typec: hd3ss3220: Give the connector fwnode
 to the port device
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
References: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
 <20191025082324.75731-11-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8f050871-b3b8-21b3-0662-a74a398831c8@roeck-us.net>
Date:   Sat, 2 Nov 2019 09:11:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025082324.75731-11-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/25/19 1:23 AM, Heikki Krogerus wrote:
> The driver already finds the node in order to get reference
> to the USB role switch.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Tested-by: Biju Das <biju.das@bp.renesas.com>

The fusb302 driver retains the fwnode and calls fwnode_handle_put()
in the remove function. Assuming this isn't necessary here,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/hd3ss3220.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index db09fa0d85f2..323dfa8160ab 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -178,15 +178,17 @@ static int hd3ss3220_probe(struct i2c_client *client,
>   		return -ENODEV;
>   
>   	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
> -	fwnode_handle_put(connector);
> -	if (IS_ERR(hd3ss3220->role_sw))
> -		return PTR_ERR(hd3ss3220->role_sw);
> +	if (IS_ERR(hd3ss3220->role_sw)) {
> +		ret = PTR_ERR(hd3ss3220->role_sw);
> +		goto err_put_fwnode;
> +	}
>   
>   	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
>   	typec_cap.driver_data = hd3ss3220;
>   	typec_cap.type = TYPEC_PORT_DRP;
>   	typec_cap.data = TYPEC_PORT_DRD;
>   	typec_cap.ops = &hd3ss3220_ops;
> +	typec_cap.fwnode = connector;
>   
>   	hd3ss3220->port = typec_register_port(&client->dev, &typec_cap);
>   	if (IS_ERR(hd3ss3220->port)) {
> @@ -220,6 +222,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
>   	if (ret < 0)
>   		goto err_unreg_port;
>   
> +	fwnode_handle_put(connector);
> +
>   	dev_info(&client->dev, "probed revision=0x%x\n", ret);
>   
>   	return 0;
> @@ -227,6 +231,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
>   	typec_unregister_port(hd3ss3220->port);
>   err_put_role:
>   	usb_role_switch_put(hd3ss3220->role_sw);
> +err_put_fwnode:
> +	fwnode_handle_put(connector);
>   
>   	return ret;
>   }
> 

