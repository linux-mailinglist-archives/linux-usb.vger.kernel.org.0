Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E369ADF581
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 21:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbfJUTAg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 15:00:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:50000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727211AbfJUTAf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 15:00:35 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8BB92086D;
        Mon, 21 Oct 2019 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571684435;
        bh=A8goXvgDn+Q79XW6cFScFGcegGAkD1EmrCL/sjl4JP0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=N7uX0LA534Yt8PWeWWbeateLkMMDyzWCY/LPKCtf/uxYanstOy/12pHtCLpGc46Ra
         DrnFVRd22iIkHa5ZI9PWnVpwd4gr1iZVoT5jx4mRvQbdIhc1KxH4+Dvcg9nZTquNTW
         EMaF8zRXtN4j/ZkD97zk5p/S4tt87+AlEDIMYM7c=
Subject: Re: [PATCH v3] usbip: tools: Fix read_usb_vudc_device() error path
 handling
To:     GwanYeong Kim <gy741.kim@gmail.com>, valentina.manea.m@gmail.com
Cc:     gregkh@linuxfoundation.org, allison@lohutok.net,
        opensource@jilayne.com, changcheng.liu@intel.com,
        tglx@linutronix.de, linux-usb@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <948530c4-0f42-1244-faee-aad531074bf3@kernel.org>
 <20191018032223.4644-1-gy741.kim@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <87d9b18e-a7d3-5641-7dbd-31b9f44d3bf6@kernel.org>
Date:   Mon, 21 Oct 2019 12:59:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018032223.4644-1-gy741.kim@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/17/19 9:22 PM, GwanYeong Kim wrote:
> This isn't really accurate right. fread() doesn't always
> return 0 in error. It could return < number of elements
> and set errno.
> 
> Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
> ---
>   tools/usb/usbip/libsrc/usbip_device_driver.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 051d7d3f443b..927a151fa9aa 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -69,7 +69,7 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>   	FILE *fd = NULL;
>   	struct udev_device *plat;
>   	const char *speed;
> -	int ret = 0;
> +	size_t ret;
>   
>   	plat = udev_device_get_parent(sdev);
>   	path = udev_device_get_syspath(plat);
> @@ -79,8 +79,10 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>   	if (!fd)
>   		return -1;
>   	ret = fread((char *) &descr, sizeof(descr), 1, fd);
> -	if (ret < 0)
> +	if (ret != 1) {
> +		err("Cannot read vudc device descr file: %s", strerror(errno));
>   		goto err;
> +	}
>   	fclose(fd);
>   
>   	copy_descr_attr(dev, &descr, bDeviceClass);
> 

Looks good.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
