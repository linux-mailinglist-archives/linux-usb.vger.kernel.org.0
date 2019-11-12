Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2296FF965D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 17:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfKLQ4n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 11:56:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:47752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbfKLQ4m (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Nov 2019 11:56:42 -0500
Received: from [192.168.1.9] (unknown [117.200.28.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 319FB214E0;
        Tue, 12 Nov 2019 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573577802;
        bh=6j5B8EOBlcCNV4IKrrFvvYIa+MTHPCuMc3Mzyw3vaKs=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=NPkCzo6BRbRWutbPW3U6w5EEvQTeewbHg+6CilbNXWnZDLqTWBeZmhDZ/yzl4bRhF
         CToCFpwj3SmePRzAYHgFPQW26iuCHijek5lwpM8E90nFKm+Vug3Hx4UbFh9swdweUQ
         4UYSLIuY/0AKINgGkxCEN8Wh0N+bAQMq3B8MSKXQ=
Subject: Re: [PATCH] USBIP: add config dependency for SGL_ALLOC
To:     Oliver Neukum <oneukum@suse.com>, valentina.manea.m@gmail.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <20191112154939.21217-1-oneukum@suse.com>
From:   shuah <shuah@kernel.org>
Message-ID: <4831c6d0-2395-2149-3a02-d396d820880d@kernel.org>
Date:   Tue, 12 Nov 2019 09:56:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112154939.21217-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/12/19 8:49 AM, Oliver Neukum wrote:
> USBIP uses lib/scatterlist.h
> Hence it needs to set CONFIG_SGL_ALLOC
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/usb/usbip/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/usbip/Kconfig b/drivers/usb/usbip/Kconfig
> index 2f86b28fa3da..7bbae7a08642 100644
> --- a/drivers/usb/usbip/Kconfig
> +++ b/drivers/usb/usbip/Kconfig
> @@ -4,6 +4,7 @@ config USBIP_CORE
>   	tristate "USB/IP support"
>   	depends on NET
>   	select USB_COMMON
> +	select SGL_ALLOC
>   	---help---
>   	  This enables pushing USB packets over IP to allow remote
>   	  machines direct access to USB devices. It provides the
> 

Thanks for catching this.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
