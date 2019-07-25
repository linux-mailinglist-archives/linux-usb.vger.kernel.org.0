Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 399F0750D4
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 16:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfGYOTc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 10:19:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:33090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbfGYOTc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Jul 2019 10:19:32 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B5F2322C7B;
        Thu, 25 Jul 2019 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564064371;
        bh=+SREVNLN8YNTldBQ2PvPDCC97GjzPF5jeHRJups4VgM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MgRnie9DoL9TlCbDgJ30z+SwK+qgW+2XLl+OOr3KVVUSV0yVlZtUx1wnUFHkjxY5B
         pHRCG+hRw9mC+J4mKDFq1xmGqguwMiwUa4QETXowHzoeqOS1jewPFEa1H3haLlzhUU
         dcS028+3QrnRGPmy6iStaNpDTRqC1rw2CoTsZ6pc=
Subject: Re: [PATCH v2] usbip: tools: fix GCC8 warning for strncpy
To:     "Liu, Changcheng" <changcheng.liu@intel.com>,
        valentina.manea.m@gmail.com
Cc:     linux-usb@vger.kernel.org, shuah <shuah@kernel.org>
References: <20190725132209.GA27590@jerryopenix>
From:   shuah <shuah@kernel.org>
Message-ID: <2cac538b-3806-8b1f-9dce-34be9d862102@kernel.org>
Date:   Thu, 25 Jul 2019 08:19:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725132209.GA27590@jerryopenix>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/25/19 7:22 AM, Liu, Changcheng wrote:
> GCC8 started emitting warning about using strncpy with number of bytes
> exactly equal destination size which could lead to non-zero terminated
> string being copied. Use "SYSFS_PATH_MAX - 1" & "SYSFS_BUS_ID_SIZE - 1"
> as number of bytes to ensure name is always zero-terminated.
> 
> Signed-off-by: Changcheng Liu <changcheng.liu@aliyun.com>
> ---
> v1 -> v2:
>   * Correct array tail index
> ---
>   tools/usb/usbip/libsrc/usbip_common.c        | 6 ++++--
>   tools/usb/usbip/libsrc/usbip_device_driver.c | 6 ++++--
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
> index bb424638d75b..b8d7d480595a 100644
> --- a/tools/usb/usbip/libsrc/usbip_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_common.c
> @@ -226,8 +226,10 @@ int read_usb_device(struct udev_device *sdev, struct usbip_usb_device *udev)
>   	path = udev_device_get_syspath(sdev);
>   	name = udev_device_get_sysname(sdev);
>   
> -	strncpy(udev->path,  path,  SYSFS_PATH_MAX);
> -	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE);
> +	strncpy(udev->path,  path,  SYSFS_PATH_MAX - 1);
> +	udev->path[SYSFS_PATH_MAX - 1] = '\0';
> +	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE - 1);
> +	udev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';

strlcpy() would be better choice here. Any reason to not use that?

>   
>   	sscanf(name, "%u-%u", &busnum, &devnum);
>   	udev->busnum = busnum;
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 5a3726eb44ab..051d7d3f443b 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -91,7 +91,8 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>   	copy_descr_attr16(dev, &descr, idProduct);
>   	copy_descr_attr16(dev, &descr, bcdDevice);
>   
> -	strncpy(dev->path, path, SYSFS_PATH_MAX);
> +	strncpy(dev->path, path, SYSFS_PATH_MAX - 1);
> +	dev->path[SYSFS_PATH_MAX - 1] = '\0';
>   
>   	dev->speed = USB_SPEED_UNKNOWN;
>   	speed = udev_device_get_sysattr_value(sdev, "current_speed");
> @@ -110,7 +111,8 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>   	dev->busnum = 0;
>   
>   	name = udev_device_get_sysname(plat);
> -	strncpy(dev->busid, name, SYSFS_BUS_ID_SIZE);
> +	strncpy(dev->busid, name, SYSFS_BUS_ID_SIZE - 1);
> +	dev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';

strlcpy() would be better choice here. Any reason to not use that?

>   	return 0;
>   err:
>   	fclose(fd);
> 

thanks,
-- Shuah
