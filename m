Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABD74956F6
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 00:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347419AbiATX04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 18:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237349AbiATX0z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 18:26:55 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BAEC06173F
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 15:26:55 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so7002649pju.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 15:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E4jTS0hzTbaXOxMszgYOI6HxWGtS6utH0hTeSFPdaW0=;
        b=mA5/U9dKnIwhf50QEn+qaQgEtZNumfBZk6HPiqajr4Yvjj3aTmSMjKaCLRjdf/Oc1Z
         Bt4TlG6lHDJP6lU7f2OZkwuJc1N0N4q4Jx6u2Uq+ldROEnlP6g1eYx62z5V5USnE4K+2
         vQt3eTP67zcEqfP3rqTJ79eLWWnsMGGkqCEPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E4jTS0hzTbaXOxMszgYOI6HxWGtS6utH0hTeSFPdaW0=;
        b=Thr15xHo34DGGP4ZV64U78E52xYFsuSdvAEbfn0JV1aian2zq2/GSRIVZvMn9shq26
         d99QbjH80xZ2sOadm6x/LnwjYmsl6+JyzxZNFqCzmQzwsR0w6vnVChxu1kU9HEv+vL6e
         Yc/Xs+xWcXrL9T905cOtJ6HDEus/19GNhMTsbQnSGbWbGZvcgF5WZFMFU4m3bm6u9+At
         obo5f95qvkC29GGOjaXu5AuqJxmCO5kPLZgmJZrgZd3WhYZaNsmF/5jvbNtqNDanjab/
         yDDxa7zV06fdDfFgr0PwrMo1oefhnGoP5jaCFUsh5bMq4utaXnfrobejbfE8rfkqb69X
         J4PA==
X-Gm-Message-State: AOAM533AMGn1W5KfMtZkzalzaLkLcVWlISTqxJWxkof1yr+LJ9nn1lPT
        jFn8xQ56OB/pxpygS1vq4Tiv5A==
X-Google-Smtp-Source: ABdhPJxSJ9eqPJqMwbxURkdoAEcixxfln7sly/lADazdSPZgQAxAh00k8ttHV/EGfQVtRYIcJE8GwQ==
X-Received: by 2002:a17:90b:4a04:: with SMTP id kk4mr1609497pjb.44.1642721214646;
        Thu, 20 Jan 2022 15:26:54 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p38sm2610601pgb.36.2022.01.20.15.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 15:26:54 -0800 (PST)
Date:   Thu, 20 Jan 2022 15:26:53 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] usb: gadget: f_fs: Use struct_size() and
 flex_array_size() helpers
Message-ID: <202201201526.CE3DB41@keescook>
References: <20220120222933.GA35155@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120222933.GA35155@embeddedor>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 20, 2022 at 04:29:33PM -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() and flex_array_size() helpers instead of
> an open-coded version, in order to avoid any potential type mistakes
> or integer overflows that, in the worst scenario, could lead to heap
> overflows.
> 
> Also, address the following sparse warnings:
> drivers/usb/gadget/function/f_fs.c:922:23: warning: using sizeof on a flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/usb/gadget/function/f_fs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 25ad1e97a458..7461d27e9604 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -919,12 +919,12 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
>  		data_len, ret);
>  
>  	data_len -= ret;
> -	buf = kmalloc(sizeof(*buf) + data_len, GFP_KERNEL);
> +	buf = kmalloc(struct_size(buf, storage, data_len), GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
>  	buf->length = data_len;
>  	buf->data = buf->storage;
> -	memcpy(buf->storage, data + ret, data_len);
> +	memcpy(buf->storage, data + ret, flex_array_size(buf, storage, data_len));

Looks good to me. This is a place where I think we'll be back later to
fix up the alloc/deserialize-from-memory pattern with a future helper,
but in the meantime, yes, let's get this covered by struct_size().

Reviewed-by: Kees Cook <keescook@chromium.org>

>  
>  	/*
>  	 * At this point read_buffer is NULL or READ_BUFFER_DROP (if
> -- 
> 2.27.0
> 

-- 
Kees Cook
