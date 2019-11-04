Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D53BAEE7BD
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 19:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbfKDSyy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 13:54:54 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38027 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbfKDSyy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 13:54:54 -0500
Received: by mail-pg1-f195.google.com with SMTP id j30so8485943pgn.5
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 10:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6SavKVbcrdsBnA6+qJmWEV7q/8BR4+P8CfKFsXudkI4=;
        b=Zz0wpN2ctrirsur9+ggU7YgfyIES8u98QyAHzLVHfs/rlKuFvHVfcHDjfP1SrmBbHF
         f5KMYwS1UAWZLuslQX1f2T8/vfUpGfoSOGVzkYdWnslcbEHjacG6tA2ipeK4wis9IpNb
         yfFcjjbw2KyQiz7nvM1228EJZ3TrjAlG+wbuwNyV+9b/OJJ9Lg/11/tk0pr2zAQk2nt4
         Am+fB0fNa29IdYwNlxg+fmNGfrP24JNMxOFtPWl6CqgVgNPCi/gJp8XEvhZNxhYCDIdg
         Kz7dPPHM/Vwtf5oSe4CDqxPl8UJPB0LMXNTBIyQL3P97CiWjULkgz7MtTG8pM0VJU78B
         PYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6SavKVbcrdsBnA6+qJmWEV7q/8BR4+P8CfKFsXudkI4=;
        b=LyF1VNGOwFV2gJqUrFLgWrS7JEgdKLTqL8n2b71dwgxTaLqdUN72FFIGwgPH2GA/Je
         EofmctkhZKZ9sF83eQxMKzAFun4agV42ielbTN2zk5315GXaJaOv9RqLpnTcVn9pjf9a
         vAxq2f1u2ipdQBuEnB7CoWTffDx0B5kwRyQ5tUtZuL0kp/MrQpjev1wGLEZDUsTP/9Qq
         o4u8mHjSPTlH5QTUBDB8Lz0Us7bMrkfwWnVckhqSKxGdbixrgwPl5GwXWDcmOaEeDURb
         j6a8M6pszo87FsOoJmkknPVsQHXvbvsE7VQsPBCbJpkU7JfzyKfChewJQMWWmVgujpjL
         qmqw==
X-Gm-Message-State: APjAAAVm6sUuDXqgsE8ILyCvVfXj6HYPgNHEN3nrhcqAPoWewSyjWhNP
        pN/VDA+j1vaPRUO6vyMA+UQ=
X-Google-Smtp-Source: APXvYqzxkAbEpq8tVQjUp2rm25pHgQIEzn8wV8d4fY1WdcWlUGR9L5kXsb9CJ/a6xWlZZVM7hQKFQA==
X-Received: by 2002:a63:480c:: with SMTP id v12mr27710181pga.385.1572893693185;
        Mon, 04 Nov 2019 10:54:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k24sm15636130pgl.6.2019.11.04.10.54.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 10:54:52 -0800 (PST)
Date:   Mon, 4 Nov 2019 10:54:51 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 12/18] usb: typec: ucsi: acpi: Move to the new API
Message-ID: <20191104185451.GA5351@roeck-us.net>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104142435.29960-13-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104142435.29960-13-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 05:24:29PM +0300, Heikki Krogerus wrote:
> Replacing the old "cmd" and "sync" callbacks with an
> implementation of struct ucsi_operations. The ACPI
> notification (interrupt) handler will from now on read the
> CCI (Command Status and Connector Change Indication)
> register, and call ucsi_connector_change() function and/or
> complete pending command completions based on it.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

FTR, my request for better (non-)iomem documentation isn't really
that important.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 91 +++++++++++++++++++++++-------
>  1 file changed, 72 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index a18112a83fae..3f1786170098 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -19,7 +19,9 @@
>  struct ucsi_acpi {
>  	struct device *dev;
>  	struct ucsi *ucsi;
> -	struct ucsi_ppm ppm;
> +	void __iomem *base;
> +	struct completion complete;
> +	unsigned long flags;
>  	guid_t guid;
>  };
>  
> @@ -39,27 +41,73 @@ static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
>  	return 0;
>  }
>  
> -static int ucsi_acpi_cmd(struct ucsi_ppm *ppm, struct ucsi_control *ctrl)
> +static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
> +			  void *val, size_t val_len)
>  {
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
>  	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
>  }
>  
> -static int ucsi_acpi_sync(struct ucsi_ppm *ppm)
> +static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
> +				const void *val, size_t val_len)
>  {
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
>  }
>  
> +static const struct ucsi_operations ucsi_acpi_ops = {
> +	.read = ucsi_acpi_read,
> +	.sync_write = ucsi_acpi_sync_write,
> +	.async_write = ucsi_acpi_async_write
> +};
> +
>  static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
>  {
>  	struct ucsi_acpi *ua = data;
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
>  }
>  
>  static int ucsi_acpi_probe(struct platform_device *pdev)
> @@ -90,35 +138,39 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
>  	 * it can not be requested here, and we can not use
>  	 * devm_ioremap_resource().
>  	 */
> -	ua->ppm.data = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> -	if (!ua->ppm.data)
> +	ua->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	if (!ua->base)
>  		return -ENOMEM;
>  
> -	if (!ua->ppm.data->version)
> -		return -ENODEV;
> -
>  	ret = guid_parse(UCSI_DSM_UUID, &ua->guid);
>  	if (ret)
>  		return ret;
>  
> -	ua->ppm.cmd = ucsi_acpi_cmd;
> -	ua->ppm.sync = ucsi_acpi_sync;
> +	init_completion(&ua->complete);
>  	ua->dev = &pdev->dev;
>  
> +	ua->ucsi = ucsi_create(&pdev->dev, &ucsi_acpi_ops);
> +	if (IS_ERR(ua->ucsi))
> +		return PTR_ERR(ua->ucsi);
> +
> +	ucsi_set_drvdata(ua->ucsi, ua);
> +
>  	status = acpi_install_notify_handler(ACPI_HANDLE(&pdev->dev),
>  					     ACPI_DEVICE_NOTIFY,
>  					     ucsi_acpi_notify, ua);
>  	if (ACPI_FAILURE(status)) {
>  		dev_err(&pdev->dev, "failed to install notify handler\n");
> +		ucsi_destroy(ua->ucsi);
>  		return -ENODEV;
>  	}
>  
> -	ua->ucsi = ucsi_register_ppm(&pdev->dev, &ua->ppm);
> -	if (IS_ERR(ua->ucsi)) {
> +	ret = ucsi_register(ua->ucsi);
> +	if (ret) {
>  		acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev),
>  					   ACPI_DEVICE_NOTIFY,
>  					   ucsi_acpi_notify);
> -		return PTR_ERR(ua->ucsi);
> +		ucsi_destroy(ua->ucsi);
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, ua);
> @@ -130,7 +182,8 @@ static int ucsi_acpi_remove(struct platform_device *pdev)
>  {
>  	struct ucsi_acpi *ua = platform_get_drvdata(pdev);
>  
> -	ucsi_unregister_ppm(ua->ucsi);
> +	ucsi_unregister(ua->ucsi);
> +	ucsi_destroy(ua->ucsi);
>  
>  	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev), ACPI_DEVICE_NOTIFY,
>  				   ucsi_acpi_notify);
