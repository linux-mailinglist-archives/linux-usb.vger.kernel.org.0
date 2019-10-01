Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931AEC35CC
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388531AbfJANeV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:34:21 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34277 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfJANeV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:34:21 -0400
Received: by mail-pf1-f195.google.com with SMTP id b128so8026227pfa.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x7jmTH8bDcxoYn9LljaiZiBoSJP2PuVUtxqCGE388TI=;
        b=XK6+vSJLnNrl6e9r6wR6E/VTvPPXdMMjXYpEFul2XkdbxgiOyEgrw0Zu2u3Natae61
         mS/yyuHqey7DLCl1AoiSOhlGRIMtb+Gcjg8vr2nAJNG8t5WPf/dDkFcTqJpp+5vi3Gdt
         BJWstiSCypfbjB/ddnSuwM8KlT2gaXJmVAaQNC7l5OsOYLfKB5VfgXF0oMXUEepl+Ogn
         SHozxLYxx2xh4EHeA6UE+8JHuBS8nYNY9wHONJ8Xl2I+hParelaXDzBdTpk8ihvKrmPT
         IP05g3h3aGyjFZ+guFAHCsP7Yeq1ocFCHZTog53Wl1Su7Gimng2RjsTA1KlhzKX4UcMI
         HRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x7jmTH8bDcxoYn9LljaiZiBoSJP2PuVUtxqCGE388TI=;
        b=qC20r2EHsjjtPN8XkO+jP5b3vZlfAQsqNGKgobLp9iGZ1WK9p9syN4oKC+oluljMgV
         z5ZpkjXibYjqDKVRYioytpiKV6EpszxhE9bIVBUakP5xRe38GQ/LditAr1nubMzH3EO4
         koPVP/YM214Mj4yRI4GZt9rcBnhDCAPs3K8Rg0SOPwborbuKHjWJ2CsTa5wZW6qAF0k7
         pj518yPcxTWY3f3zRoS1FK580giK2A09EY2xP/TheKLMy8bVwmfyTo+Ut6txllJ1cjDk
         uBR9gVhVJ+ZUWhw7lYgkkB6Zm0iw69OVEGVVV0Xany9LwRqBi6orDYUX8gVb+0QNBFBH
         5iRg==
X-Gm-Message-State: APjAAAWja2fyyhB7RobW69aaU6A+1JFZKmPuypwIaZFQJM8aD/aXcwI7
        WfIRdzhs+sCh2UhaMGa8MvcltDuk
X-Google-Smtp-Source: APXvYqy/rUzxscyZfZzIEM1/PCwclBj0HD4W+9sSxqievE9P2fs7Jw9QnmE1cHdeDDYA6T27tHCsTA==
X-Received: by 2002:a65:68d3:: with SMTP id k19mr30365922pgt.149.1569936856154;
        Tue, 01 Oct 2019 06:34:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v32sm22021009pga.38.2019.10.01.06.34.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:34:15 -0700 (PDT)
Subject: Re: [PATCH 5/7] usb: typec: tps6598x: Start using struct
 typec_operations
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-6-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <91ed071d-5b67-bbb2-8640-8d2680d3e3c2@roeck-us.net>
Date:   Tue, 1 Oct 2019 06:34:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001094858.68643-6-heikki.krogerus@linux.intel.com>
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
> typec_capability during port registration. After this there
> is not need to keep the capabilities stored anywhere in the
> driver.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/tps6598x.c | 49 +++++++++++++++++++-----------------
>   1 file changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
> index a38d1409f15b..0698addd1185 100644
> --- a/drivers/usb/typec/tps6598x.c
> +++ b/drivers/usb/typec/tps6598x.c
> @@ -94,7 +94,6 @@ struct tps6598x {
>   	struct typec_port *port;
>   	struct typec_partner *partner;
>   	struct usb_pd_identity partner_identity;
> -	struct typec_capability typec_cap;
>   };
>   
>   /*
> @@ -307,11 +306,10 @@ static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
>   	return 0;
>   }
>   
> -static int
> -tps6598x_dr_set(const struct typec_capability *cap, enum typec_data_role role)
> +static int tps6598x_dr_set(struct typec_port *port, enum typec_data_role role)
>   {
> -	struct tps6598x *tps = container_of(cap, struct tps6598x, typec_cap);
>   	const char *cmd = (role == TYPEC_DEVICE) ? "SWUF" : "SWDF";
> +	struct tps6598x *tps = typec_get_drvdata(port);
>   	u32 status;
>   	int ret;
>   
> @@ -338,11 +336,10 @@ tps6598x_dr_set(const struct typec_capability *cap, enum typec_data_role role)
>   	return ret;
>   }
>   
> -static int
> -tps6598x_pr_set(const struct typec_capability *cap, enum typec_role role)
> +static int tps6598x_pr_set(struct typec_port *port, enum typec_role role)
>   {
> -	struct tps6598x *tps = container_of(cap, struct tps6598x, typec_cap);
>   	const char *cmd = (role == TYPEC_SINK) ? "SWSk" : "SWSr";
> +	struct tps6598x *tps = typec_get_drvdata(port);
>   	u32 status;
>   	int ret;
>   
> @@ -369,6 +366,11 @@ tps6598x_pr_set(const struct typec_capability *cap, enum typec_role role)
>   	return ret;
>   }
>   
> +static const struct typec_operations tps6598x_ops = {
> +	.dr_set = tps6598x_dr_set,
> +	.pr_set = tps6598x_pr_set,
> +};
> +
>   static irqreturn_t tps6598x_interrupt(int irq, void *data)
>   {
>   	struct tps6598x *tps = data;
> @@ -448,6 +450,7 @@ static const struct regmap_config tps6598x_regmap_config = {
>   
>   static int tps6598x_probe(struct i2c_client *client)
>   {
> +	struct typec_capability typec_cap = { };
>   	struct tps6598x *tps;
>   	u32 status;
>   	u32 conf;
> @@ -492,40 +495,40 @@ static int tps6598x_probe(struct i2c_client *client)
>   	if (ret < 0)
>   		return ret;
>   
> -	tps->typec_cap.revision = USB_TYPEC_REV_1_2;
> -	tps->typec_cap.pd_revision = 0x200;
> -	tps->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> -	tps->typec_cap.pr_set = tps6598x_pr_set;
> -	tps->typec_cap.dr_set = tps6598x_dr_set;
> +	typec_cap.revision = USB_TYPEC_REV_1_2;
> +	typec_cap.pd_revision = 0x200;
> +	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;

Nitpick:
	struct typec_capability typec_cap = {
		.revision = USB_TYPEC_REV_1_2,
		.pd_revision = 0x200,
		.prefer_role = TYPEC_NO_PREFERRED_ROLE,
	};

Your call, though.

> +	typec_cap.driver_data = tps;
> +	typec_cap.ops = &tps6598x_ops;
>   
>   	switch (TPS_SYSCONF_PORTINFO(conf)) {
>   	case TPS_PORTINFO_SINK_ACCESSORY:
>   	case TPS_PORTINFO_SINK:
> -		tps->typec_cap.type = TYPEC_PORT_SNK;
> -		tps->typec_cap.data = TYPEC_PORT_UFP;
> +		typec_cap.type = TYPEC_PORT_SNK;
> +		typec_cap.data = TYPEC_PORT_UFP;
>   		break;
>   	case TPS_PORTINFO_DRP_UFP_DRD:
>   	case TPS_PORTINFO_DRP_DFP_DRD:
> -		tps->typec_cap.type = TYPEC_PORT_DRP;
> -		tps->typec_cap.data = TYPEC_PORT_DRD;
> +		typec_cap.type = TYPEC_PORT_DRP;
> +		typec_cap.data = TYPEC_PORT_DRD;
>   		break;
>   	case TPS_PORTINFO_DRP_UFP:
> -		tps->typec_cap.type = TYPEC_PORT_DRP;
> -		tps->typec_cap.data = TYPEC_PORT_UFP;
> +		typec_cap.type = TYPEC_PORT_DRP;
> +		typec_cap.data = TYPEC_PORT_UFP;
>   		break;
>   	case TPS_PORTINFO_DRP_DFP:
> -		tps->typec_cap.type = TYPEC_PORT_DRP;
> -		tps->typec_cap.data = TYPEC_PORT_DFP;
> +		typec_cap.type = TYPEC_PORT_DRP;
> +		typec_cap.data = TYPEC_PORT_DFP;
>   		break;
>   	case TPS_PORTINFO_SOURCE:
> -		tps->typec_cap.type = TYPEC_PORT_SRC;
> -		tps->typec_cap.data = TYPEC_PORT_DFP;
> +		typec_cap.type = TYPEC_PORT_SRC;
> +		typec_cap.data = TYPEC_PORT_DFP;
>   		break;
>   	default:
>   		return -ENODEV;
>   	}
>   
> -	tps->port = typec_register_port(&client->dev, &tps->typec_cap);
> +	tps->port = typec_register_port(&client->dev, &typec_cap);
>   	if (IS_ERR(tps->port))
>   		return PTR_ERR(tps->port);
>   
> 

