Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58F376BD0F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 15:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfGQNcP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 09:32:15 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43213 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfGQNcP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 09:32:15 -0400
Received: by mail-pg1-f194.google.com with SMTP id f25so11171810pgv.10
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2019 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u26Fai7lHv3nkVtjjE5k4aBy44JSMb2FIFGp5N5fLwA=;
        b=p5IghuqSJhbOaRQYgq+JeruIeq/2nSyezkYiqAlpg9QGz7eL0sPOpACn99VBlmofZe
         PdNpmhLi0uJ63cGOD3h44d6VDnaj36aHq3/OkGUamDDJApzHNym9fIfyORic4AzCMaEr
         XvUsIRVeL6nQf0qIUIcEAk0kgFqIClloO2Vu1wjEErLTpmdkfPRK6Xt6eaJZ3v+kw8bO
         3q9tWZskknl7cfOlChzyJ6shV2bIsgwyyTrHydrTwQ8SvPyprLuhrIjci+K6ryM21m1r
         bOIvAMjKcebBfONWjOQgZADNQvL2J4J9qJAjsL7xf96/+LIosWxqJeX5yaDXPAAjAUOg
         Wytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u26Fai7lHv3nkVtjjE5k4aBy44JSMb2FIFGp5N5fLwA=;
        b=F9eHm+bF+9fxfkKCo1oJDtg+4kgEf0tRKuuzrElnw4pJepIBo9RsVLJPEmYldCS51m
         5bYkiN2bYSS0snx+D1hhYxkmywuaN/D6WIgvqubD2cCHjFuBO979l43kCclEHIv0/xRV
         zJrtwr/urDakCKH5ZWblDyCRAWr0Bo2lEomQJH9Njkr/L4FRu80gSmztFPb2cV7RHhAU
         7CC6uoUxGjFYhttKnnU5pvS1KhojpKr7HZe5wsuORj+6rmJuYBKqRpKMepi0yjCXTDWi
         +xSunY+xy09MrwxTG+9vq7kKqIFoxtKK7ABQBjIEY4ZEJKsiQT6UsB2hdIHjt89qjeF4
         hd8w==
X-Gm-Message-State: APjAAAXrZWmVCaRipKFm2SQ8eLbmtp+ix8wW31rO4/XbODBvvpM8CMO2
        VewlpiFL2S9msYmKzDi9mIl5HrRJ
X-Google-Smtp-Source: APXvYqzEWQaGWdM8fvuShcd1SUDnGbKQvIDuy2fD+xXq+rQ0wibeteoYcfROfO0ASPhnhC4C62wFwA==
X-Received: by 2002:a65:4189:: with SMTP id a9mr15497162pgq.399.1563370334250;
        Wed, 17 Jul 2019 06:32:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g2sm32337867pfb.95.2019.07.17.06.32.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 06:32:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: typec: tcpm: free log buf memory when remove
 debug file
To:     jun.li@nxp.com, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
References: <20190717080646.30421-1-jun.li@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <72dd5da0-5e17-04aa-c586-8e4972b16fe3@roeck-us.net>
Date:   Wed, 17 Jul 2019 06:32:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717080646.30421-1-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/17/19 1:06 AM, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> The logbuffer memory should be freed when remove debug file.
> 
> Cc: stable@vger.kernel.org # v4.15+
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index fba32d8..1249d8e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -586,6 +586,15 @@ static void tcpm_debugfs_init(struct tcpm_port *port)
>   
>   static void tcpm_debugfs_exit(struct tcpm_port *port)
>   {
> +	int i;
> +
> +	mutex_lock(&port->logbuffer_lock);
> +	for (i = 0; i < LOG_BUFFER_ENTRIES; i++) {
> +		kfree(port->logbuffer[i]);
> +		port->logbuffer[i] = NULL;
> +	}
> +	mutex_unlock(&port->logbuffer_lock);
> +
>   	debugfs_remove(port->dentry);
>   }
>   
> 

