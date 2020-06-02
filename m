Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B601EBD20
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 15:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgFBNcp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 09:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgFBNco (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jun 2020 09:32:44 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33040C061A0E
        for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2020 06:32:44 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k2so1370153pjs.2
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2020 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3ri+zb81i9gzZ7dYqUna8zb79QsqmRu/5nyMRqOog2Y=;
        b=Uk5SShZYtLejdxnnRXjt8kfiUI+JP1sDZtpq1e4mdAmNI5VjT6X8PdFjhYuVuAl7i7
         bPRYYiZa8r/uMT7pdzfocQBCCYjeQ1cdA85MLw0kbHXcuYiRFwads04PK+7PtXBXOm8t
         NPdd1+PeIzGBg4zU/eZFMDBshLwf555GAmUy+N6T3ZenMSZ5jEFE3JCQaEys8gf9Oz9B
         F/g2OCCqJRrCSXA87kNhclzYmtIhOvkt/EV71E0tk+oINrg2UGATyFeyAl49KsTej16a
         Mi3rFKd1vr6XnxKZ1zXa5IxjkrAAdLQ1KDu6lF/yNkHydWThijSmH5yD03PpB2gAhri3
         uZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3ri+zb81i9gzZ7dYqUna8zb79QsqmRu/5nyMRqOog2Y=;
        b=rw4895a6TFeavTqu6H++tPdaFto9kWu14zhAxFq+u7TANUXR+1K3U38+6H1WH/aXn2
         Yymv7Nc3wZB7NWUaNuX/O5jQ4RuDqahpCZ4Xzmi2HbbCx0A2C8rhpuBp4Zxelpm/Bq/D
         RVTEVlv1Rgj/IoACcXn+5x6FBylFnFXB7OoFIWYnHD8ElXRB1lDd/o+WBKUak+8psRH/
         g7vfmst+uPTbmSu7CkLHy5INTJg37yhARna16NM7FQEdhZaYnTL0iEKtdglGiy8oeWqA
         K4Qy0c9xJMyjSvqB3zbl0ZzKyVtMW7aCAQ+fUgA+jwsWWy6xUAJsemgyiUTJTEfibY1m
         B0fQ==
X-Gm-Message-State: AOAM533z2iyZrqqcrZ9W3A6jVPJX5nl1ZsfILjeUMzGYhdpb4jb1kUSU
        F7ueIK2qIxc4X8wsWTcZSrhO4B/d
X-Google-Smtp-Source: ABdhPJyRyg/vUsZTS1wfPOujek1Uq4fjhQ93F1Da+V/JJwZ7dEPV+GKNTyRrM37eGMGwHCh9UMcxhQ==
X-Received: by 2002:a17:90a:a616:: with SMTP id c22mr3199785pjq.14.1591104763414;
        Tue, 02 Jun 2020 06:32:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t4sm2349983pgj.39.2020.06.02.06.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 06:32:42 -0700 (PDT)
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: avoid screaming irq causing
 boot hangs
To:     jun.li@nxp.com, heikki.krogerus@linux.intel.com
Cc:     john.stultz@linaro.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20200602071208.12120-1-jun.li@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <f43eb13f-1b20-3f35-89d1-bef63acf6f97@roeck-us.net>
Date:   Tue, 2 Jun 2020 06:32:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200602071208.12120-1-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/2/20 12:12 AM, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> John reported screaming irq caused by rt1711h when system boot[1],
> this is because irq request is done before tcpci_register_port(),
> so the chip->tcpci has not been setup, irq handler is entered but
> can't do anything, this patch is to address this by moving the irq
> request after tcpci_register_port().
> 
> [1] https://lkml.org/lkml/2020/5/30/1
> 
> Cc: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index 0173890..b56a088 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -179,26 +179,6 @@ static irqreturn_t rt1711h_irq(int irq, void *dev_id)
>  	return tcpci_irq(chip->tcpci);
>  }
>  
> -static int rt1711h_init_alert(struct rt1711h_chip *chip,
> -			      struct i2c_client *client)
> -{
> -	int ret;
> -
> -	/* Disable chip interrupts before requesting irq */
> -	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, 0);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = devm_request_threaded_irq(chip->dev, client->irq, NULL,
> -					rt1711h_irq,
> -					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> -					dev_name(chip->dev), chip);
> -	if (ret < 0)
> -		return ret;
> -	enable_irq_wake(client->irq);
> -	return 0;
> -}
> -
>  static int rt1711h_sw_reset(struct rt1711h_chip *chip)
>  {
>  	int ret;
> @@ -260,7 +240,8 @@ static int rt1711h_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = rt1711h_init_alert(chip, client);
> +	/* Disable chip interrupts before requesting irq */
> +	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, 0);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -271,6 +252,14 @@ static int rt1711h_probe(struct i2c_client *client,
>  	if (IS_ERR_OR_NULL(chip->tcpci))
>  		return PTR_ERR(chip->tcpci);
>  
> +	ret = devm_request_threaded_irq(chip->dev, client->irq, NULL,
> +					rt1711h_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +					dev_name(chip->dev), chip);
> +	if (ret < 0)
> +		return ret;
> +	enable_irq_wake(client->irq);
> +
>  	return 0;
>  }
>  
> 

