Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1DB072097
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 22:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730651AbfGWURz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 16:17:55 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44051 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728389AbfGWURz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 16:17:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so19963458pgl.11
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019 13:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xWgi2RrZwXGLAF/bFJqb6ErOAWoLT3KxgaH7llJHJI8=;
        b=bcfFvtY7jyLHEiE1fWWKCYkaWDuXXLQeBHpwd2gL+ptw32/Qw2cVwcK26E8KUz+pMN
         133hz4mdOBH5icyUQB/2HzdAKaHOe8MBWMZOmj8BO7z5DinvZ9/Dl3eFUeH3HsrAe4XR
         iHH/Nd6jB1cpH8szEcZoJ/6SfIZj+7AeKHduF2HHfH84WecSaSfyEmsdGbflOF1e7o83
         GLtHIR/pTCPJRn5m1YusQWtRRyTeO52+PfV8ETNTWelSxoUkiHeUDvuVjwE4k6jqqz6X
         pWCu6omagKkMDkuhgQMSkoDZqExaV6lGP3eLEAd02xrnqheU3ddndAZX+m3jgjaiwH2v
         YuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xWgi2RrZwXGLAF/bFJqb6ErOAWoLT3KxgaH7llJHJI8=;
        b=aZ/4yq5kLGn5jXT+Oa+ldGt95e4A4Qa/kIHW11TSR9DX1Hij58NRkYYIWQrQgbrtNz
         DpdqhYTcIt4eP8sttMTQOoilvbftHZn2CVyjAdubiSIliFBwpPUbn9idO+eoSCWkwLH4
         aHLqSm4IFGAp+NSYaS97M5GLfsP45b8IjdXD8yvq+I3g5GU9GoN1jhQos6LR84xUkdr+
         bJ5TWbedQjdES9n2z/CQ3KzvlkI1mCv6eHqeazUTc6GE4n+6wco+3ntjCyHS3xA8cmlU
         q+gcyqpA1GIy7y5H1pqBRHeB612QzZLab8O2WerJR7xbD/yZf8eQVldWAcjJEayR+qYE
         puKA==
X-Gm-Message-State: APjAAAX9UPNjxY7nx0GrweJcBJa8IVciESpMjh1Ghd3biEOn9tmr1eHG
        u2Zka5XIe5HrAbynKCuMOjk=
X-Google-Smtp-Source: APXvYqzn7UAtjlCc6TJj2XM2BIOmzAtG2sx7B19KxLTpTafDeARCm1gc3dj3k4RofQfREpLCAJbZtw==
X-Received: by 2002:a63:520f:: with SMTP id g15mr73881783pgb.28.1563913074845;
        Tue, 23 Jul 2019 13:17:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v138sm50782909pfc.15.2019.07.23.13.17.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 13:17:54 -0700 (PDT)
Date:   Tue, 23 Jul 2019 13:17:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] usb: typec: tcpm: Switch to use
 fwnode_property_count_uXX()
Message-ID: <20190723201753.GB15560@roeck-us.net>
References: <20190723193750.69038-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723193750.69038-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 10:37:50PM +0300, Andy Shevchenko wrote:
> Use use fwnode_property_count_uXX() directly, that makes code neater.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index fba32d84e578..ec525811a9eb 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4410,8 +4410,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  		goto sink;
>  
>  	/* Get source pdos */
> -	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> -					     NULL, 0);
> +	ret = fwnode_property_count_u32(fwnode, "source-pdos");
>  	if (ret <= 0)
>  		return -EINVAL;
>  
> @@ -4435,8 +4434,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  		return -EINVAL;
>  sink:
>  	/* Get sink pdos */
> -	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
> -					     NULL, 0);
> +	ret = fwnode_property_count_u32(fwnode, "sink-pdos");
>  	if (ret <= 0)
>  		return -EINVAL;
>  
> -- 
> 2.20.1
> 
