Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38C0DA3D5
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 04:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392042AbfJQCdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 22:33:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390279AbfJQCdm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Oct 2019 22:33:42 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93B4F2053B;
        Thu, 17 Oct 2019 02:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571279621;
        bh=YMinDGi9yVQwHzGVSBtzIuzF7yrvPM+vMOAYEps32AQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RFHOe7F+/oGuGWL8QW9vhAnolEh4AMRyJYLoSovylaiezr7+xx7Jw0Pnuizec6LuJ
         igKyfvFX3jUSzJ9gfh7OsrlNragyjEPCEDOlrSY1LBdfWElCl+b14y+FDo9WBBtsmL
         8BgoMim7UMz6H9DrSSQcBifIG9eBD9ht07weVupQ=
Subject: Re: [PATCH v2] usbip: tools: Fix read_usb_vudc_device() error path
 handling
To:     GwanYeong Kim <gy741.kim@gmail.com>, valentina.manea.m@gmail.com
Cc:     gregkh@linuxfoundation.org, allison@lohutok.net,
        opensource@jilayne.com, changcheng.liu@intel.com,
        tglx@linutronix.de, linux-usb@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <20191016131832.GC56859@kroah.com>
 <20191017022512.3809-1-gy741.kim@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <e460e4fb-cefa-9dea-f0f6-7e92f3727034@kernel.org>
Date:   Wed, 16 Oct 2019 20:33:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017022512.3809-1-gy741.kim@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/16/19 8:25 PM, GwanYeong Kim wrote:
> cannot be less than 0 - fread() returns 0 on error.
> 

This isn't really accurate right. fread() doesn't always
return 0 in error. It could return < number of elements
and set errno.

Please make changes to reflect that.

> Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
> ---
>   tools/usb/usbip/libsrc/usbip_device_driver.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 051d7d3f443b..959bb29d0477 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -69,7 +69,7 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>   	FILE *fd = NULL;
>   	struct udev_device *plat;
>   	const char *speed;
> -	int ret = 0;
> +	size_t ret = 0;

You don't need to initialize this.

>   
>   	plat = udev_device_get_parent(sdev);
>   	path = udev_device_get_syspath(plat);
> @@ -79,7 +79,7 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>   	if (!fd)
>   		return -1;
>   	ret = fread((char *) &descr, sizeof(descr), 1, fd);
> -	if (ret < 0)
> +	if (ret != 1)

Why not print error message?

>   		goto err;
>   	fclose(fd);
>   
> 

thanks,
-- Shuah
