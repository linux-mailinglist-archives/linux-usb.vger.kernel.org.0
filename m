Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D758E40CBEF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Sep 2021 19:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhIORvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Sep 2021 13:51:04 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:26449 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbhIORvD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Sep 2021 13:51:03 -0400
Received: from [192.168.1.18] ([90.126.248.220])
        by mwinf5d05 with ME
        id uHpg2500H4m3Hzu03Hpg24; Wed, 15 Sep 2021 19:49:42 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 Sep 2021 19:49:42 +0200
X-ME-IP: 90.126.248.220
Subject: Re: [PATCH] usb: musb: tusb6010: uninitialized data in
 tusb_fifo_write_unaligned()
To:     Dan Carpenter <dan.carpenter@oracle.com>, Bin Liu <b-liu@ti.com>,
        Felipe Balbi <felipe.balbi@nokia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210915103659.GB7060@kili>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <e3ce24c3-477f-5a55-a89a-a0cdff564d8e@wanadoo.fr>
Date:   Wed, 15 Sep 2021 19:49:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915103659.GB7060@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le 15/09/2021 à 12:36, Dan Carpenter a écrit :
> This is writing to the first 1 - 3 bytes of "len" and then writing all
> four bytes to musb_writel().  The last byte is always going to be
> garbage.  Zero out the last bytes instead.
> 
> Fixes: 550a7375fe72 ("USB: Add MUSB and TUSB support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/usb/musb/tusb6010.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
> index c42937692207..c510fb84faa6 100644
> --- a/drivers/usb/musb/tusb6010.c
> +++ b/drivers/usb/musb/tusb6010.c
> @@ -190,6 +190,7 @@ tusb_fifo_write_unaligned(void __iomem *fifo, const u8 *buf, u16 len)
>   	}
>   	if (len > 0) {
>   		/* Write the rest 1 - 3 bytes to FIFO */
> +		len = 0;

+		val = 0;
?

>   		memcpy(&val, buf, len);
>   		musb_writel(fifo, 0, val);
>   	}
> 


CJ
