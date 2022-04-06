Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979F54F6586
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 18:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237687AbiDFQfq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 12:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237831AbiDFQfd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 12:35:33 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 2304F385326
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 08:09:59 -0700 (PDT)
Received: (qmail 189995 invoked by uid 1000); 6 Apr 2022 11:09:59 -0400
Date:   Wed, 6 Apr 2022 11:09:59 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Lin Ma <linma@zju.edu.cn>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, mdharm-usb@one-eyed-alien.net
Subject: Re: [PATCH v0] USB: storage: karma: fix rio_karma_init return
Message-ID: <Yk2tR4iEr5/T6o+h@rowland.harvard.edu>
References: <20220406100259.6483-1-linma@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406100259.6483-1-linma@zju.edu.cn>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 06, 2022 at 06:02:59PM +0800, Lin Ma wrote:
> The function rio_karam_init() should return USB_STOR_TRANSPORT_ERROR
> instead of 0 (USB_STOR_TRANSPORT_GOOD) when allocation fails.

Not exactly.  rio_karma_init() is a usb-storage initFunction (see 
the usb_stor_acquire_resources() routine in usb.c), and these functions 
are supposed to return either 0 or a negative error code.

So you should make the routine return -ENOMEM, not 
USB_STOR_TRANSPORT_ERROR.  You can simplify the patch by changing the 
line where ret is defined; initialize it to -ENOMEM rather than to 0.

And don't forget the error code for when the rio_karma_send_command() 
call fails.  In that case the return value should be -EIO.

> Fixes: dfe0d3ba20e8 ("USB Storage: add rio karma eject support")

Shouldn't this also be marked for the stable kernels?

Alan Stern

> Signed-off-by: Lin Ma <linma@zju.edu.cn>
> ---
>  drivers/usb/storage/karma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/storage/karma.c b/drivers/usb/storage/karma.c
> index 05cec81dcd3f..b8a4ae1aa22a 100644
> --- a/drivers/usb/storage/karma.c
> +++ b/drivers/usb/storage/karma.c
> @@ -178,19 +178,19 @@ static int rio_karma_init(struct us_data *us)
>  	struct karma_data *data = kzalloc(sizeof(struct karma_data), GFP_NOIO);
>  
>  	if (!data)
> -		goto out;
> +		return USB_STOR_TRANSPORT_ERROR;
>  
>  	data->recv = kmalloc(RIO_RECV_LEN, GFP_NOIO);
>  	if (!data->recv) {
>  		kfree(data);
> -		goto out;
> +		return USB_STOR_TRANSPORT_ERROR;
>  	}
>  
>  	us->extra = data;
>  	us->extra_destructor = rio_karma_destructor;
>  	ret = rio_karma_send_command(RIO_ENTER_STORAGE, us);
>  	data->in_storage = (ret == 0);
> -out:
> +
>  	return ret;
>  }
>  
> -- 
> 2.35.1
> 
