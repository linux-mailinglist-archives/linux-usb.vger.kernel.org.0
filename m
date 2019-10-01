Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8250FC3611
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388331AbfJANms (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:42:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37460 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfJANms (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:42:48 -0400
Received: by mail-pg1-f194.google.com with SMTP id c17so9697935pgg.4;
        Tue, 01 Oct 2019 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z/nEIV3mGVbnMYj+TcOnxXxirSxVJhg4ol4Ju3KGU2o=;
        b=fhQzAE+otiWupYULuurd4mNB4uqGTiDnbJsOjfS9Fdher1PdNV+8b3AJcPfONf7iNi
         nFnPCzp86wUZ/IYJLcD++aa6ijrRmx1NGWt5gky1Uft2jmghgugrDd34XJG253aEo+o+
         ra6mpqBWSTadRwmvTAiHdsvCoVqE/CpUBEgYaWpSZIXh6iMeQMNR1pzok81fVRkscVa1
         T14L28ZZWBy3Fi5O3amnbHi3DoRbfCEfjNmTmPnEr73AFZ/5hrzSeSMPpnbXKs73iEJK
         UCCk/rM3SZLS9PmNUjnxogebC+RQSiCRKtn1m8Vhg7N7kLIrVCzN2JuqFkZDwjG6do0K
         5Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z/nEIV3mGVbnMYj+TcOnxXxirSxVJhg4ol4Ju3KGU2o=;
        b=k+akrAOOD8OGExoQTRTRmp5Ag6FWf6yNp4EryJye8WX02qm5RH+0T84VUbAMPckmWP
         pzbdlEXGjiPBBDJ395RBh9RSaWTS9MP2QV9J0IWEnKRn27E4tTMmjuZO1IlduiwGui9k
         60H51S0bUJRiT7YaZMHi7WLIMM9VZ8NNK6w9fUKtFAId/ikZKiLXvi1BdlPb4nBlAVz3
         kAnebKcrpFPAk2/6IFaIOVicKPDtun7j40qGaXEFQhBa4d5YmPlb5XT8UZe7HQTD0qGi
         1aQYBSqGiRSXdtJsXhfT76CZ3x4CmK9vUPk8RhjPpOHuJIiYxYJT7ZEJbD//7AdeYRBP
         qcdQ==
X-Gm-Message-State: APjAAAVDLQOwbH4cIZyHVRf9rOhLUJpUUjXfgkCtQcQUIT+5AiZmn056
        AlkFnKHXhflcWO8ToINYKf1wCY3v
X-Google-Smtp-Source: APXvYqw87tZE98E0owqFYpsHGYLQIQdmGPi3bMlRuSxtYCGpBYJosELqFY2XEMHWDvk19opnY3KQHg==
X-Received: by 2002:a63:2b8e:: with SMTP id r136mr30480517pgr.191.1569937365804;
        Tue, 01 Oct 2019 06:42:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b3sm16014524pfd.125.2019.10.01.06.42.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:42:45 -0700 (PDT)
Subject: Re: [PATCH v2] usb: typec: tcpm: usb: typec: tcpm: Fix a signedness
 bug in tcpm_fw_get_caps()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20191001120117.GA23528@mwanda>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f406dee6-fe4a-f8c8-179f-59a9bf1ae0e3@roeck-us.net>
Date:   Tue, 1 Oct 2019 06:42:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001120117.GA23528@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/1/19 5:01 AM, Dan Carpenter wrote:
> The "port->typec_caps.data" and "port->typec_caps.type" variables are
> enums and in this context GCC will treat them as an unsigned int so they
> can never be less than zero.
> 
> Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2: preserve the error code
> 
>   drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 96562744101c..5f61d9977a15 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4409,18 +4409,20 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>   	/* USB data support is optional */
>   	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
>   	if (ret == 0) {
> -		port->typec_caps.data = typec_find_port_data_role(cap_str);
> -		if (port->typec_caps.data < 0)
> -			return -EINVAL;
> +		ret = typec_find_port_data_role(cap_str);
> +		if (ret < 0)
> +			return ret;
> +		port->typec_caps.data = ret;
>   	}
>   
>   	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
>   	if (ret < 0)
>   		return ret;
>   
> -	port->typec_caps.type = typec_find_port_power_role(cap_str);
> -	if (port->typec_caps.type < 0)
> -		return -EINVAL;
> +	ret = typec_find_port_power_role(cap_str);
> +	if (ret < 0)
> +		return ret;
> +	port->typec_caps.type = ret;
>   	port->port_type = port->typec_caps.type;
>   
>   	if (port->port_type == TYPEC_PORT_SNK)
> 

