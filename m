Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B157987EC
	for <lists+linux-usb@lfdr.de>; Fri,  8 Sep 2023 15:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbjIHNdi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Sep 2023 09:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjIHNdi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Sep 2023 09:33:38 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E143B19BC
        for <linux-usb@vger.kernel.org>; Fri,  8 Sep 2023 06:33:33 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0AAAD6607285;
        Fri,  8 Sep 2023 14:33:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694180012;
        bh=Lp3yrWmsuw7zYtnDeFOd0fOkcvCaKd/nUCToPKDAoz8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Z3/F4RT26XNURCUMTOB34vo5tVSSiVUvRCWdb1oUblk0oh5qFA3ZU+MspMZqgEHHG
         SktnrPKi2+JlVnEx8bFIyE2TgOFCho0Z9U9PeDRCE9JNGiPYVvYxxne89NbddWbpnW
         HdeD/Fwxj2tx1cWTNO5m4Excs/Fy3oO/Nqc8uxz9Dj5KQ3wWnJFFKKVipn6qBEyHVY
         B8aDiBIHsTLj1ULfGHya01VKjcsNvaqFgo9brYWVIDnWEbRZUg8pYL5QOWkuat8QNA
         4MnAoFGiI1BpSB28ke79BCkvXkw2fWidNkkRmC9rbjo8Dg7x9PflHz4YV/t+zpstXt
         B+OpnHP3EhbJg==
Message-ID: <aaef84e5-4845-eeab-3d72-0b95966ac001@collabora.com>
Date:   Fri, 8 Sep 2023 15:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH -next] usb: gadget: function: Remove unused declarations
Content-Language: en-US
To:     Yue Haibing <yuehaibing@huawei.com>, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Cc:     linux-usb@vger.kernel.org
References: <20230818124025.51576-1-yuehaibing@huawei.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230818124025.51576-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Nice catches!

You probably want 4 separate patches. In particular...

W dniu 18.08.2023 o 14:40, Yue Haibing pisze:
> These declarations are not implemented anymore, remove them.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>   drivers/usb/gadget/function/u_phonet.h | 1 -
>   drivers/usb/gadget/function/u_serial.h | 4 ----
>   drivers/usb/gadget/function/uvc.h      | 2 --
>   3 files changed, 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_phonet.h b/drivers/usb/gadget/function/u_phonet.h
> index c53233b37192..ff62ca22c40d 100644
> --- a/drivers/usb/gadget/function/u_phonet.h
> +++ b/drivers/usb/gadget/function/u_phonet.h
> @@ -20,7 +20,6 @@ struct f_phonet_opts {
>   struct net_device *gphonet_setup_default(void);
>   void gphonet_set_gadget(struct net_device *net, struct usb_gadget *g);
>   int gphonet_register_netdev(struct net_device *net);
> -int phonet_bind_config(struct usb_configuration *c, struct net_device *dev);

...this fixes 0383070e8d904f006b6eaffceb3fae4cdd25c01a

>   void gphonet_cleanup(struct net_device *dev);
>   
>   #endif /* __U_PHONET_H */
> diff --git a/drivers/usb/gadget/function/u_serial.h b/drivers/usb/gadget/function/u_serial.h
> index 102a7323a1fd..901d99310bc4 100644
> --- a/drivers/usb/gadget/function/u_serial.h
> +++ b/drivers/usb/gadget/function/u_serial.h
> @@ -71,8 +71,4 @@ void gserial_disconnect(struct gserial *);
>   void gserial_suspend(struct gserial *p);
>   void gserial_resume(struct gserial *p);
>   
> -/* functions are bound to configurations by a config or gadget driver */
> -int gser_bind_config(struct usb_configuration *c, u8 port_num);

... this fixes 9786b4561228099f579ad88912aa305812526ea1

> -int obex_bind_config(struct usb_configuration *c, u8 port_num);

... and this fixes 9b2252cace741e4843983d77ead80c3cf1d74e20
> -
>   #endif /* __U_SERIAL_H */
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 100475b1363e..6751de8b63ad 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -178,8 +178,6 @@ struct uvc_file_handle {
>    */
>   
>   extern void uvc_function_setup_continue(struct uvc_device *uvc);
> -extern void uvc_endpoint_stream(struct uvc_device *dev);
> -

@Laurent: I was unable to track this one.

Regards,

Andrzej

>   extern void uvc_function_connect(struct uvc_device *uvc);
>   extern void uvc_function_disconnect(struct uvc_device *uvc);
>   

