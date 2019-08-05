Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 645DC82600
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 22:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730527AbfHEUWV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 16:22:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbfHEUWV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 16:22:21 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68219208E3;
        Mon,  5 Aug 2019 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565036539;
        bh=IpI7Y4cs5bWdi0xtLMMRBwHosB6g1EiI7kj0W5gZ5QI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=j4TLfz9YJ/40Od7Hbz0u3/WTOX/P8tLSvIEjAmoZFtnEYjKX2CN3aME6wcioVQd9q
         xBUEFI1cmnLOvRmeWK5yXvVb65Lvln6yTPQmOqHpM/T4rbGCeOUeV9oWf+AVccxJcL
         3L6zKgv2oPap+F/Y/jE3OoXQeI/hp6xHLldeeQfg=
Subject: Re: [PATCH] USB: usbip: convert platform driver to use dev_groups
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        shuah <shuah@kernel.org>
References: <20190805193636.25560-5-gregkh@linuxfoundation.org>
From:   shuah <shuah@kernel.org>
Message-ID: <06d3e73f-ac2f-9ba5-047e-e99834b4860b@kernel.org>
Date:   Mon, 5 Aug 2019 14:22:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805193636.25560-5-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/5/19 1:36 PM, Greg Kroah-Hartman wrote:
> Platform drivers now have the option to have the platform core create
> and remove any needed sysfs attribute files.  So take advantage of that
> and do not register "by hand" any sysfs files.
> 
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/usb/usbip/vudc.h       | 2 +-
>   drivers/usb/usbip/vudc_dev.c   | 9 ---------
>   drivers/usb/usbip/vudc_main.c  | 1 +
>   drivers/usb/usbip/vudc_sysfs.c | 7 ++++++-
>   4 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
> index cf968192e59f..1bd4bc005829 100644
> --- a/drivers/usb/usbip/vudc.h
> +++ b/drivers/usb/usbip/vudc.h
> @@ -115,7 +115,7 @@ struct vudc_device {
>   	struct list_head dev_entry;
>   };
>   
> -extern const struct attribute_group vudc_attr_group;
> +extern const struct attribute_group *vudc_groups[];
>   
>   /* visible everywhere */
>   
> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> index a72c17ff1c6a..c8eeabdd9b56 100644
> --- a/drivers/usb/usbip/vudc_dev.c
> +++ b/drivers/usb/usbip/vudc_dev.c
> @@ -616,18 +616,10 @@ int vudc_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_add_udc;
>   
> -	ret = sysfs_create_group(&pdev->dev.kobj, &vudc_attr_group);
> -	if (ret) {
> -		dev_err(&udc->pdev->dev, "create sysfs files\n");
> -		goto err_sysfs;
> -	}
> -
>   	platform_set_drvdata(pdev, udc);
>   
>   	return ret;
>   
> -err_sysfs:
> -	usb_del_gadget_udc(&udc->gadget);
>   err_add_udc:
>   	cleanup_vudc_hw(udc);
>   err_init_vudc_hw:
> @@ -640,7 +632,6 @@ int vudc_remove(struct platform_device *pdev)
>   {
>   	struct vudc *udc = platform_get_drvdata(pdev);
>   
> -	sysfs_remove_group(&pdev->dev.kobj, &vudc_attr_group);
>   	usb_del_gadget_udc(&udc->gadget);
>   	cleanup_vudc_hw(udc);
>   	kfree(udc);
> diff --git a/drivers/usb/usbip/vudc_main.c b/drivers/usb/usbip/vudc_main.c
> index 390733e6937e..678faa82598c 100644
> --- a/drivers/usb/usbip/vudc_main.c
> +++ b/drivers/usb/usbip/vudc_main.c
> @@ -22,6 +22,7 @@ static struct platform_driver vudc_driver = {
>   	.remove		= vudc_remove,
>   	.driver		= {
>   		.name	= GADGET_NAME,
> +		.dev_groups = vudc_groups,
>   	},
>   };
>   
> diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
> index 6dcd3ff655c3..100f680c572a 100644
> --- a/drivers/usb/usbip/vudc_sysfs.c
> +++ b/drivers/usb/usbip/vudc_sysfs.c
> @@ -215,7 +215,12 @@ static struct bin_attribute *dev_bin_attrs[] = {
>   	NULL,
>   };
>   
> -const struct attribute_group vudc_attr_group = {
> +static const struct attribute_group vudc_attr_group = {
>   	.attrs = dev_attrs,
>   	.bin_attrs = dev_bin_attrs,
>   };
> +
> +const struct attribute_group *vudc_groups[] = {
> +	&vudc_attr_group,
> +	NULL,
> +};
> 

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
