Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8AEC35D3
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732921AbfJANgC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:36:02 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46655 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbfJANgC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:36:02 -0400
Received: by mail-pl1-f195.google.com with SMTP id q24so5479691plr.13
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6RY2KcHBMdP5JmKRFPprGl+R49/zy/WuVzehXD6opUc=;
        b=Y92MiDZn9PR8t/k/Z9R4AkQfoaHGUKxX9zsw7Jx+FK5b1J9AU6pMbyvn9SA0vd4+YI
         Qq7VUfcLtp9new9hjT/d+NjlLA1oOx78XElCD/IC9rWamvr25FVudxrUJ5T6QFsJVecP
         Iw5K2Fb82ajQroRRUA0cqHrcul9Sqnu+8ixjSEWMWcF3Vj+2NuEJPtQUg/QAzgspSmM5
         bA2DpRwfz05IdnXSLXlECUTavF84PtR5kDkoYuF6woXWhCq1NkRxBh9CE2rZiNcUZqaV
         iklujXw4Y4/UOm+vuF0Zgnlram/0EOe2PZVpFBrAH6yzgUye4W2mscuuai7+kaP3Cebb
         hnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6RY2KcHBMdP5JmKRFPprGl+R49/zy/WuVzehXD6opUc=;
        b=nHuqRJJuIKRjHwYHX+wgPs13s+jCdjELN7ECSus5z5Q75cps7Yi9Ordnwvg2VgZCUg
         iNpNLDns5wy/+CukqTKWVaT2yFuvUuyEzTVS1BZKY8yDnkLPrNW1BAkDUl+1qT77g9Kv
         g45II87JX2TTytbUWuLPDBa37ph66ISD1RGTO4UOdOBQMvbsyFdDz30NVi/1wihmYDM9
         oCtWYlZvU0QDzc6kJ3utYybs77GZg2v+wbz3EusTuly9qCTJo0j2MHmpmL8nEsqT+4p4
         pGEKrEFx1k2psNVae/6MLY0NA/+KtPMrSowEfcEddBQ7RMZ0NnapjhyiaKI8MTriby5U
         3jPQ==
X-Gm-Message-State: APjAAAWyEpeveoXFQIdHmN+QoEh+sgSAXobWOeN9s4N2QdeaG+inED1w
        Y0rzk+I+EQKXiNdo7js+lmkcgfVY
X-Google-Smtp-Source: APXvYqw7fpBXpJXpT7zQwwi1hVSTlftjHyvonq1hWxBsPUhgOdvNnJGy3je/sbFgDQ8UYnFpHfRvaQ==
X-Received: by 2002:a17:902:6946:: with SMTP id k6mr25812778plt.26.1569936961289;
        Tue, 01 Oct 2019 06:36:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k66sm4526629pjb.11.2019.10.01.06.36.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:36:00 -0700 (PDT)
Subject: Re: [PATCH 5/7] usb: typec: tps6598x: Start using struct
 typec_operations
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-6-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8587aaaa-57be-809a-2cc3-cf98c8d42219@roeck-us.net>
Date:   Tue, 1 Oct 2019 06:35:59 -0700
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

Nitpick or not:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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

