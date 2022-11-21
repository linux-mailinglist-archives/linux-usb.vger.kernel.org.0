Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02171632852
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 16:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbiKUPeT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 10:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbiKUPd4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 10:33:56 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B69CE09;
        Mon, 21 Nov 2022 07:32:57 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 051D56600014;
        Mon, 21 Nov 2022 15:32:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1669044776;
        bh=17GTCflbo8BWuklmQRQq055N9cwYV+wqCUtsgqHsCUE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kMSUAJ6v8fcm0zAT+WLjt58eGUcbzHhfd/EYc4KD3ei3LV0v/vWCY+jvhyzukPSRM
         /SJxfePWrb1CMEtYoapMj1qYbXwSqdSNgywCgHkMtbM3Cf2UjQCKRt4yIOIen/kt9Y
         7UlkQthESX6CvfgdITxK6JQV4aB43utiPJhstXhWhw5GfIceiGo0U3ofWIsJCUK0Rm
         6WoV/5PKJ4VJsSNVi9iZYuwQxT4gOe/vihHdiR89mlbJylwjTLx+nAvRbdwV2OTswC
         1SsBW0obzh+ABomBWyRGWnsEMwpoWAYYPv/AtE3Ndwbp2VDyhpPMWg7O9gX3YNdl2S
         eOD7pajJcfw3A==
Message-ID: <b7dcf498-51ea-3aaf-211f-09fa59c38768@collabora.com>
Date:   Mon, 21 Nov 2022 16:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] usb: gadget: function: use after free in printer_close()
To:     Dan Carpenter <error27@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Albert Briscoe <albertsbriscoe@gmail.com>,
        Zqiang <qiang.zhang@windriver.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <Y3uOxcvowFq75Tzv@kili>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <Y3uOxcvowFq75Tzv@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

I'm fine with either symmetrically removing the DBG() from "printer_open()"
or with this version of the patch.

It seems to me that this version better fits "fixing UAF", though.
Whether the driver is too verbose is another matter, and if it is,
it deserves its own patch because DBG() invocations are sprinkled
here and there.

W dniu 21.11.2022 o 15:44, Dan Carpenter pisze:
> The printer_dev_free() function frees "dev" but then it is dereferenced
> by the debug code on the next line.  Flip the order to avoid the use after
> free.
> 
> Fixes: e8d5f92b8d30 ("usb: gadget: function: printer: fix use-after-free in __lock_acquire")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>


> ---
> v2: In the v1, I just deleted the printk but Andrzej thought it was
> worth preserving.
> 
>   drivers/usb/gadget/function/f_printer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
> index a881c69b1f2b..01e842e1ba2f 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -381,8 +381,8 @@ printer_close(struct inode *inode, struct file *fd)
>   	dev->printer_status &= ~PRINTER_SELECTED;
>   	spin_unlock_irqrestore(&dev->lock, flags);
>   
> -	kref_put(&dev->kref, printer_dev_free);
>   	DBG(dev, "printer_close\n");
> +	kref_put(&dev->kref, printer_dev_free);
>   
>   	return 0;
>   }

