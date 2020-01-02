Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D201612E121
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 01:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgABABr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jan 2020 19:01:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:40590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727441AbgABABr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jan 2020 19:01:47 -0500
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FE4720842;
        Thu,  2 Jan 2020 00:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577923306;
        bh=NNW21yi33N2aUcENbkJe9TpJuBLUTYtKbgpvJrV808M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SV9itvqEMh0uSKteStMs9ZOY+iP5EQtJhrR1Bw4v0nSCWgoR5/OCIJMTXHGtheocm
         DaNUPBbyB/a1Myr/cbn9bwZgNRZOKyXlrc2lqF+mJR9jlTrerEpvBcjdZpuEebMVs7
         1EwsWn+vNbrG0MzLjHdESQ7Q65qtLO3uVOiCndKk=
Subject: Re: [PATCH] usbip: Remove unaligned pointer usage from usbip tools
To:     Vadim Troshchinskiy <vtroshchinskiy@qindel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        shuah <shuah@kernel.org>
References: <5176009.64u6Zm7RkX@gverdu.qindel.com>
From:   shuah <shuah@kernel.org>
Message-ID: <86e6dfbf-cf51-1467-3a78-fd72377385b7@kernel.org>
Date:   Wed, 1 Jan 2020 17:01:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5176009.64u6Zm7RkX@gverdu.qindel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Vadim,

On 12/10/19 8:50 AM, Vadim Troshchinskiy wrote:
> The usbip tools use packed structs for network communication. Taking the
> address of a packed member of a struct can crash the program with SIGBUS
> on architectures with strict alignment requirements.
> 

Can you be more specific on which architectures?

> Also, recent versions of GCC detect this situation and emit a warning that
> is fatal due to -Werror being used.
> 
> error: taking address of packed member of ‘struct
> usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
> of-packed-member]
> 
> Fix this by copying the data to an aligned location and operating there.
> 
> Signed-off-by: Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
> ---
>   tools/usb/usbip/src/usbip_network.c | 30 +++++++++++++++--------------
>   tools/usb/usbip/src/usbip_network.h | 12 ++++++------
>   2 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbip_network.c b/tools/usb/usbip/src/usbip_network.c
> index d595d72693fb..1c0038ee0abd 100644
> --- a/tools/usb/usbip/src/usbip_network.c
> +++ b/tools/usb/usbip/src/usbip_network.c
> @@ -50,39 +50,41 @@ void usbip_setup_port_number(char *arg)
>   	info("using port %d (\"%s\")", usbip_port, usbip_port_string);
>   }
>   
> -void usbip_net_pack_uint32_t(int pack, uint32_t *num)
> +void usbip_net_pack_uint32_t(int pack, uint8_t *num)

Is there a reason to change this to uint8_t?

>   {
>   	uint32_t i;
> +	memcpy(&i, num, sizeof(i));
>   
>   	if (pack)
> -		i = htonl(*num);
> +		i = htonl(i);
>   	else
> -		i = ntohl(*num);
> +		i = ntohl(i);
>   
> -	*num = i;
> +	memcpy(num, &i, sizeof(i));
>   }
>   
> -void usbip_net_pack_uint16_t(int pack, uint16_t *num)
> +void usbip_net_pack_uint16_t(int pack, uint8_t *num)

Is there a reason to change this to uint8_t?

>   {
>   	uint16_t i;
> +	memcpy(&i, num, sizeof(i));
>   
>   	if (pack)
> -		i = htons(*num);
> +		i = htons(i);
>   	else
> -		i = ntohs(*num);
> +		i = ntohs(i);
>   
> -	*num = i;
> +	memcpy(num, &i, sizeof(i));
>   }
>   
>   void usbip_net_pack_usb_device(int pack, struct usbip_usb_device *udev)
>   {
> -	usbip_net_pack_uint32_t(pack, &udev->busnum);
> -	usbip_net_pack_uint32_t(pack, &udev->devnum);
> -	usbip_net_pack_uint32_t(pack, &udev->speed);
> +	usbip_net_pack_uint32_t(pack, (uint8_t*)&udev->busnum);
> +	usbip_net_pack_uint32_t(pack, (uint8_t*)&udev->devnum);
> +	usbip_net_pack_uint32_t(pack, (uint8_t*)&udev->speed);
>   
> -	usbip_net_pack_uint16_t(pack, &udev->idVendor);
> -	usbip_net_pack_uint16_t(pack, &udev->idProduct);
> -	usbip_net_pack_uint16_t(pack, &udev->bcdDevice);
> +	usbip_net_pack_uint16_t(pack, (uint8_t*)&udev->idVendor);
> +	usbip_net_pack_uint16_t(pack, (uint8_t*)&udev->idProduct);
> +	usbip_net_pack_uint16_t(pack, (uint8_t*)&udev->bcdDevice);
>   }
>   
>   void usbip_net_pack_usb_interface(int pack __attribute__((unused)),
> diff --git a/tools/usb/usbip/src/usbip_network.h b/tools/usb/usbip/src/usbip_network.h
> index 555215eae43e..821dd65877cc 100644
> --- a/tools/usb/usbip/src/usbip_network.h
> +++ b/tools/usb/usbip/src/usbip_network.h
> @@ -33,9 +33,9 @@ struct op_common {
>   } __attribute__((packed));
>   
>   #define PACK_OP_COMMON(pack, op_common)  do {\
> -	usbip_net_pack_uint16_t(pack, &(op_common)->version);\
> -	usbip_net_pack_uint16_t(pack, &(op_common)->code);\
> -	usbip_net_pack_uint32_t(pack, &(op_common)->status);\
> +	usbip_net_pack_uint16_t(pack, (uint8_t*)&(op_common)->version);\
> +	usbip_net_pack_uint16_t(pack, (uint8_t*)&(op_common)->code);\
> +	usbip_net_pack_uint32_t(pack, (uint8_t*)&(op_common)->status);\
>   } while (0)
>   
>   /* ---------------------------------------------------------------------- */
> @@ -163,11 +163,11 @@ struct op_devlist_reply_extra {
>   } while (0)
>   
>   #define PACK_OP_DEVLIST_REPLY(pack, reply)  do {\
> -	usbip_net_pack_uint32_t(pack, &(reply)->ndev);\
> +	usbip_net_pack_uint32_t(pack, (uint8_t*)&(reply)->ndev);\
>   } while (0)
>   
> -void usbip_net_pack_uint32_t(int pack, uint32_t *num);
> -void usbip_net_pack_uint16_t(int pack, uint16_t *num);
> +void usbip_net_pack_uint32_t(int pack, uint8_t *num);
> +void usbip_net_pack_uint16_t(int pack, uint8_t *num);
>   void usbip_net_pack_usb_device(int pack, struct usbip_usb_device *udev);
>   void usbip_net_pack_usb_interface(int pack, struct usbip_usb_interface *uinf);
>   
> 

thanks,
-- Shuah
