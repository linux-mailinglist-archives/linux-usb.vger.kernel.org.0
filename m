Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E3DD844C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 01:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389624AbfJOXOp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 19:14:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:49878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbfJOXOp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Oct 2019 19:14:45 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7209820663;
        Tue, 15 Oct 2019 23:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571181285;
        bh=u/1Fs8cS6EGzipNVQGWJ8bROGkIumox9o4udTWVE61A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=a9Sta15j5R1fY+UxtsRWDdIbRY26PchNOGgxhCajbLNmVwEcDVQ7uNTdsYOFYRsx4
         WDInuGnCI3enq/G+phU4Ltr5lHJPzPID/ZksZt7B1lfBZY9w428ngAPIYhCVm6t6dT
         p2LH0Kf8siCTiG8G26hKAvxAZIZidFQp9Leg/ASs=
Subject: Re: [PATCH] usbip: tools: Fix read_usb_vudc_device() error path
 handling
To:     GwanYeong Kim <gy741.kim@gmail.com>, valentina.manea.m@gmail.com
Cc:     gregkh@linuxfoundation.org, allison@lohutok.net,
        opensource@jilayne.com, changcheng.liu@intel.com,
        tglx@linutronix.de, linux-usb@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <20191015131437.525-1-gy741.kim@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <bb2bef23-336a-2f28-8faa-00e4adbb76d9@kernel.org>
Date:   Tue, 15 Oct 2019 17:14:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015131437.525-1-gy741.kim@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/15/19 7:14 AM, GwanYeong Kim wrote:
> cannot be less than 0 - fread() returns 0 on error.
> 
> Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
> ---
>   tools/usb/usbip/libsrc/usbip_device_driver.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 051d7d3f443b..49760b98aabc 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -79,7 +79,7 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
>   	if (!fd)
>   		return -1;
>   	ret = fread((char *) &descr, sizeof(descr), 1, fd);
> -	if (ret < 0) > +	if (ret != sizeof(descr))

Are you sure this check is correct? fread() returns the number
of elements read, # elements = 1  in this case.

fread() returns 0 when size or # of elements is 0 and in other
error cases it will return < # of elements. I would think you
want to check ret != 1 here.

thanks,
-- Shuah
