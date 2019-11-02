Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDE63ECFC5
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 17:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfKBQbc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 12:31:32 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46472 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfKBQbb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 12:31:31 -0400
Received: by mail-pf1-f194.google.com with SMTP id 193so7786901pfc.13
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5iaKzerYMUzB1c98lb4TvFVnn/xx4MS1uhq0mslrb5c=;
        b=g2UPoija4WZmkyc5OJ46pFlul951Zi88TRU9+McO4bSz4CdFapCit8jhcP0fCnjg6M
         z6AAQlQ5xWSc5b8ARHvMyCvL1uyieoGm4uDRPG1B7ar53rYJvD9CWOOS0RYlcJB9L/cg
         oH9IVsPpFFuuS6WgV6pTShzv+/aMEV/CdouhtfPYELgA+DUMgfUQHzVktmrTpCKLyg59
         0z6g1PqI327QBpDpRria7ZwgJDNwx3qh1ZUA3qnIRycUxJmPeYwX2fe3x/edLHr47cUY
         hYFIbC//dFNtw8O8C1NuJ4TQQd1F09sPQbiQrwPNwrYIyna1CaemHl0qxTv8IO3jEplc
         A1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5iaKzerYMUzB1c98lb4TvFVnn/xx4MS1uhq0mslrb5c=;
        b=IHmAChJtVwiNC0W4cn15usKamtjF2Qr8CW5JA3QzEcweZMNOK5CsiGM6ESpHW9pLUd
         z/iVV6ZBtfSU3Drkwt6pWymUaWoZlSgA73GSBO//0w47fl6REVuFfdpgGAqvr/yFinpB
         S/IvmNqNQ0ZZHHpwteWxuwpxRt9H0WGvXQLwZFwhKOjws9dINmBjYfQifMWj8BQQ/0/L
         kfQOuNyg+Z2WLYVnhPhbqdwg9MrnVkc/x8x1ffJMY4yQ5toUVAbXqGD5hwcOJNQGlVjH
         jdsz9oTX3X5d0kcLKroF1hInAPbdesHt7a676ACWlZwxyHBADQnt7p2AEYtAtiEgMUhk
         10/w==
X-Gm-Message-State: APjAAAVUSTGYe9vlHdZ7dIGqKxxVU+Xszv9BPxo4q/ju4F11nhPJ380g
        O3tE+4IQAUqMlqqSCii2ZftNFGA0
X-Google-Smtp-Source: APXvYqxSneka3bnoGdIv3BKPEhps68C5sIsmIKW+jbMVtNK0vwBeecpIY+bAnrwT1KUSUggR9to+gg==
X-Received: by 2002:a62:7c52:: with SMTP id x79mr20893326pfc.18.1572712290683;
        Sat, 02 Nov 2019 09:31:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a29sm14649271pfr.49.2019.11.02.09.31.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Nov 2019 09:31:30 -0700 (PDT)
Subject: Re: [PATCH v3 12/18] usb: typec: ucsi: acpi: Move to the new API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
References: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
 <20191025082324.75731-13-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d40c258c-790a-2412-94f2-c664a11eade2@roeck-us.net>
Date:   Sat, 2 Nov 2019 09:31:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025082324.75731-13-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/25/19 1:23 AM, Heikki Krogerus wrote:
> Replacing the old "cmd" and "sync" callbacks with an
> implementation of struct ucsi_operations. The ACPI
> notification (interrupt) handler will from now on read the
> CCI (Command Status and Connector Change Indication)
> register, and call ucsi_connector_change() function and/or
> complete pending command completions based on it.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/ucsi/ucsi_acpi.c | 93 ++++++++++++++++++++++++------
>   1 file changed, 74 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index a18112a83fae..88d2401e3e61 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -19,7 +19,9 @@
>   struct ucsi_acpi {
>   	struct device *dev;
>   	struct ucsi *ucsi;
> -	struct ucsi_ppm ppm;
> +	void __iomem *base;
> +	struct completion complete;
> +	unsigned long flags;
>   	guid_t guid;
>   };
>   
> @@ -39,27 +41,75 @@ static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
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

Would it be better to use memcpy_fromio() and memcpy_toio() if
ua->base indeed points to iomem ?

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
> +	if (ret) {
> +		dev_err(ua->dev, "failed to read CCI\n");

If I follow the call chain correctly, this would be from ucsi_acpi_dsm(),
which already logs an error message.

> +		return;
> +	}
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
> @@ -90,35 +140,39 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
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
> @@ -130,7 +184,8 @@ static int ucsi_acpi_remove(struct platform_device *pdev)
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

