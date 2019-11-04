Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41636EE2A8
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbfKDOfq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:35:46 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46827 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbfKDOfq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 09:35:46 -0500
Received: by mail-pl1-f194.google.com with SMTP id l4so2408089plt.13
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 06:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nG81jMoViBv4yRurQIY7bis7/i4dpC8VE8koUb2azBI=;
        b=skm7uwSW2aXtizOHAV9oM4PR2Aw3Vl+MQWCL5t/JjaM0d4871Imt/D07kG9E089/AX
         1BZLqU9UGhLsy3OWOG831S7qfNgYYwgWpPpewOL0jHBELMv3VuiHI1DPDcxmZKgVevCQ
         z5fJnGuWHzqUhVwNi1nbbpHHRj+UTOIrWNB82zAdLuAw2jCS6GDBimzWoMmuu5ui6OR3
         a2r5o1mhcBAIoLwSfZaWCXfNEKipcsi4Z5bC66eXfAP0N+QQyMD6Rw5gwEH8nOEgzH7J
         /1mz6CcORHOMwZZMrDuP7TI4TN9TNiVLStZmCiOTJSircwTfkDfoZA/tu+EE2b+lzMCN
         QCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nG81jMoViBv4yRurQIY7bis7/i4dpC8VE8koUb2azBI=;
        b=WDEr8CfnHcPg5SOjpTo4o5HoMImr60L5b9PPgqpLeZv2hc6KcGMjDPeGck8GeoY2d0
         kHKQtmF3xueGHQ+Lwxkr6/eHQ6Ts9NrfkxRH2E8mTLAlBdkWkpORE00UEMGtIkOOCqLP
         M8nf1I90RDgo9l5O8HNPIvA8QaKymq3ctZNbD1/a5lbmSQ6DAnfTniqubpcXtivmSQGO
         IckQV+FGnYWdB0qEn4G37v0m/geOMqaSTfkfNV4s4F4rDqBUrLiWI9rNX3v/LfXSwMd1
         Rrl5Y4afFRDMm5a5FmtJh8irtKBMfXE5L0FC71Kievv/u0JRAPD4HcJNXvxMm1cXoj2G
         QJzg==
X-Gm-Message-State: APjAAAVvz3y32obymzFFRDPZZXLOJoUjn/SVr+uQJzpBCXZN4EAVdYFb
        2iC3qacVHLjr+5e0p9UVRuusXsuw
X-Google-Smtp-Source: APXvYqyrU29Xx7VCiZkAZ/QSRFcD0j5i/i/uF0K/UJ8jbsO0ulqhhctfVl0iEft+a/1KETWRBDs3DA==
X-Received: by 2002:a17:902:14f:: with SMTP id 73mr27934413plb.87.1572878145060;
        Mon, 04 Nov 2019 06:35:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h13sm18578670pfr.98.2019.11.04.06.35.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 06:35:44 -0800 (PST)
Subject: Re: [PATCH v4 12/18] usb: typec: ucsi: acpi: Move to the new API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104142435.29960-13-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <96e841fd-82bb-8f97-6952-aa75624da7a1@roeck-us.net>
Date:   Mon, 4 Nov 2019 06:35:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104142435.29960-13-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/4/19 6:24 AM, Heikki Krogerus wrote:
> Replacing the old "cmd" and "sync" callbacks with an
> implementation of struct ucsi_operations. The ACPI
> notification (interrupt) handler will from now on read the
> CCI (Command Status and Connector Change Indication)
> register, and call ucsi_connector_change() function and/or
> complete pending command completions based on it.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/ucsi/ucsi_acpi.c | 91 +++++++++++++++++++++++-------
>   1 file changed, 72 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index a18112a83fae..3f1786170098 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -19,7 +19,9 @@
>   struct ucsi_acpi {
>   	struct device *dev;
>   	struct ucsi *ucsi;
> -	struct ucsi_ppm ppm;
> +	void __iomem *base;

I think it would be a good idea to mention in a comment somewhere that this is not
really iomem and thus doesn't require memcpy_io functions.

Guenter

> +	struct completion complete;
> +	unsigned long flags;
>   	guid_t guid;
>   };
>   
> @@ -39,27 +41,73 @@ static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
>   	return 0;
>   }
>   
> -static int ucsi_acpi_cmd(struct ucsi_ppm *ppm, struct ucsi_control *ctrl)
> +static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
> +			  void *val, size_t val_len)
>   {
> -	struct ucsi_acpi *ua = container_of(ppm, struct ucsi_acpi, ppm);
> +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> +	int ret;
> +
> +	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> +	if (ret)
> +		return ret;
> +
> +	memcpy(val, (const void __force *)(ua->base + offset), val_len);
> +
> +	return 0;
> +}
> +
> +static int ucsi_acpi_async_write(struct ucsi *ucsi, unsigned int offset,
> +				 const void *val, size_t val_len)
> +{
> +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
>   
> -	ppm->data->ctrl.raw_cmd = ctrl->raw_cmd;
> +	memcpy((void __force *)(ua->base + offset), val, val_len);
>   
>   	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
>   }
>   
> -static int ucsi_acpi_sync(struct ucsi_ppm *ppm)
> +static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
> +				const void *val, size_t val_len)
>   {
> -	struct ucsi_acpi *ua = container_of(ppm, struct ucsi_acpi, ppm);
> +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> +	int ret;
> +
> +	set_bit(COMMAND_PENDING, &ua->flags);
> +
> +	ret = ucsi_acpi_async_write(ucsi, offset, val, val_len);
> +	if (ret)
> +		goto out_clear_bit;
>   
> -	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> +	if (!wait_for_completion_timeout(&ua->complete, msecs_to_jiffies(5000)))
> +		ret = -ETIMEDOUT;
> +
> +out_clear_bit:
> +	clear_bit(COMMAND_PENDING, &ua->flags);
> +
> +	return ret;
>   }
>   
> +static const struct ucsi_operations ucsi_acpi_ops = {
> +	.read = ucsi_acpi_read,
> +	.sync_write = ucsi_acpi_sync_write,
> +	.async_write = ucsi_acpi_async_write
> +};
> +
>   static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
>   {
>   	struct ucsi_acpi *ua = data;
> +	u32 cci;
> +	int ret;
> +
> +	ret = ucsi_acpi_read(ua->ucsi, UCSI_CCI, &cci, sizeof(cci));
> +	if (ret)
> +		return;
>   
> -	ucsi_notify(ua->ucsi);
> +	if (test_bit(COMMAND_PENDING, &ua->flags) &&
> +	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> +		complete(&ua->complete);
> +	else if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(ua->ucsi, UCSI_CCI_CONNECTOR(cci));
>   }
>   
>   static int ucsi_acpi_probe(struct platform_device *pdev)
> @@ -90,35 +138,39 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
>   	 * it can not be requested here, and we can not use
>   	 * devm_ioremap_resource().
>   	 */
> -	ua->ppm.data = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> -	if (!ua->ppm.data)
> +	ua->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	if (!ua->base)
>   		return -ENOMEM;
>   
> -	if (!ua->ppm.data->version)
> -		return -ENODEV;
> -
>   	ret = guid_parse(UCSI_DSM_UUID, &ua->guid);
>   	if (ret)
>   		return ret;
>   
> -	ua->ppm.cmd = ucsi_acpi_cmd;
> -	ua->ppm.sync = ucsi_acpi_sync;
> +	init_completion(&ua->complete);
>   	ua->dev = &pdev->dev;
>   
> +	ua->ucsi = ucsi_create(&pdev->dev, &ucsi_acpi_ops);
> +	if (IS_ERR(ua->ucsi))
> +		return PTR_ERR(ua->ucsi);
> +
> +	ucsi_set_drvdata(ua->ucsi, ua);
> +
>   	status = acpi_install_notify_handler(ACPI_HANDLE(&pdev->dev),
>   					     ACPI_DEVICE_NOTIFY,
>   					     ucsi_acpi_notify, ua);
>   	if (ACPI_FAILURE(status)) {
>   		dev_err(&pdev->dev, "failed to install notify handler\n");
> +		ucsi_destroy(ua->ucsi);
>   		return -ENODEV;
>   	}
>   
> -	ua->ucsi = ucsi_register_ppm(&pdev->dev, &ua->ppm);
> -	if (IS_ERR(ua->ucsi)) {
> +	ret = ucsi_register(ua->ucsi);
> +	if (ret) {
>   		acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev),
>   					   ACPI_DEVICE_NOTIFY,
>   					   ucsi_acpi_notify);
> -		return PTR_ERR(ua->ucsi);
> +		ucsi_destroy(ua->ucsi);
> +		return ret;
>   	}
>   
>   	platform_set_drvdata(pdev, ua);
> @@ -130,7 +182,8 @@ static int ucsi_acpi_remove(struct platform_device *pdev)
>   {
>   	struct ucsi_acpi *ua = platform_get_drvdata(pdev);
>   
> -	ucsi_unregister_ppm(ua->ucsi);
> +	ucsi_unregister(ua->ucsi);
> +	ucsi_destroy(ua->ucsi);
>   
>   	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev), ACPI_DEVICE_NOTIFY,
>   				   ucsi_acpi_notify);
> 

