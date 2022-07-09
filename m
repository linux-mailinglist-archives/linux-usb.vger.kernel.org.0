Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32AB56CB9F
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jul 2022 23:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiGIVpI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Jul 2022 17:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiGIVpH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Jul 2022 17:45:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CA3FD0E
        for <linux-usb@vger.kernel.org>; Sat,  9 Jul 2022 14:45:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C1DD47C;
        Sat,  9 Jul 2022 23:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657403103;
        bh=p2gOzlgIwJpFrTfFKL27m8rmnrdxuchMrSM5KHdlxs0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c3TPKg1SHvIPQP7jgmtBjzpmMizu8flpOvkEaVlTNzNmP7RnUXxzHUjGDyb8Og1eD
         36W48PHeodm0apdhJDRcgXh3VEizIJ9O8ZaVlYDU1E0NZQoDV2KmJJy1YBDyYG8b0f
         xW8TWVley6Z+wcRj9OY/PHZdg9C4+Djz+qKCiTxo=
Date:   Sun, 10 Jul 2022 00:44:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, w36195@motorola.com, kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: fix changing interface name via
 configfs
Message-ID: <Ysn2xJXgK8491Pwo@pendragon.ideasonboard.com>
References: <20220707115612.2760569-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220707115612.2760569-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Jul 07, 2022 at 01:56:12PM +0200, Michael Grzeschik wrote:
> When setting the function name, it is always truncated by one char since
> snprintf is always including the null-termination in the len parameter.
> We use strscpy and fix the size setting to use len + 1 instead.
> 
> Fixes: 324e4f85070f ("usb: gadget: uvc: allow changing interface name via configfs")
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index e5a6b6e36b3dd8..4303a3283ba0a3 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -2371,6 +2371,7 @@ static ssize_t f_uvc_opts_string_##cname##_store(struct config_item *item,\
>  					  const char *page, size_t len)	\
>  {									\
>  	struct f_uvc_opts *opts = to_f_uvc_opts(item);			\
> +	int size = min(sizeof(opts->aname), len + 1);			\

>  	int ret = 0;							\
>  									\
>  	mutex_lock(&opts->lock);					\
> @@ -2379,8 +2380,9 @@ static ssize_t f_uvc_opts_string_##cname##_store(struct config_item *item,\
>  		goto end;						\
>  	}								\
>  									\
> -	ret = snprintf(opts->aname, min(sizeof(opts->aname), len),	\
> -			"%s", page);					\
> +	ret = strscpy(opts->aname, page, size);				\
> +	if (ret == -E2BIG)						\
> +		ret = size - 1;						\
>  									\
>  end:									\
>  	mutex_unlock(&opts->lock);					\

-- 
Regards,

Laurent Pinchart
