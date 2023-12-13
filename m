Return-Path: <linux-usb+bounces-4135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0679F8119FF
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 950951F2146A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0966239FCE;
	Wed, 13 Dec 2023 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nonG48jp"
X-Original-To: linux-usb@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2128D8E;
	Wed, 13 Dec 2023 08:47:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1735166F;
	Wed, 13 Dec 2023 17:46:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702486003;
	bh=Xb0hnvp6j1flRuOPnAQ9U+s1v//0z7ARgZLX3J6aAdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nonG48jpReFfU9nioA7SEY8/B/b8cPO27dm6vAnGLllBYmkvw6UDT+Tqn9o0/li24
	 02vpkfT/gZjB73g2S6t4uPkr/Uog5RS460tHrASq3lYaDUqwGRt8hprZO6yUo7T712
	 nU9Px36aGlxxux47Im8b7nm2G0YlEqVshoepawdE=
Date: Wed, 13 Dec 2023 18:47:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lee Jones <lee@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH 04/12] usb: gadget: uvc: Replace snprintf() with the
 safer scnprintf() variant
Message-ID: <20231213164735.GA17912@pendragon.ideasonboard.com>
References: <20231213164246.1021885-1-lee@kernel.org>
 <20231213164246.1021885-5-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231213164246.1021885-5-lee@kernel.org>

Hi Lee,

Thank you for the patch.

On Wed, Dec 13, 2023 at 04:42:33PM +0000, Lee Jones wrote:
> There is a general misunderstanding amongst engineers that {v}snprintf()
> returns the length of the data *actually* encoded into the destination
> array.  However, as per the C99 standard {v}snprintf() really returns
> the length of the data that *would have been* written if there were
> enough space for it.  This misunderstanding has led to buffer-overruns
> in the past.  It's generally considered safer to use the {v}scnprintf()
> variants in their place (or even sprintf() in simple cases).  So let's
> do that.
> 
> Link: https://lwn.net/Articles/69419/
> Link: https://github.com/KSPP/linux/issues/105
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Daniel Scally <dan.scally@ideasonboard.com>
> Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 9bf0e985acfab..7e704b2bcfd1c 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -3414,7 +3414,7 @@ static ssize_t f_uvc_opts_string_##cname##_show(struct config_item *item,\
>  	int result;							\
>  									\
>  	mutex_lock(&opts->lock);					\
> -	result = snprintf(page, sizeof(opts->aname), "%s", opts->aname);\
> +	result = scnprintf(page, sizeof(opts->aname), "%s", opts->aname);\
>  	mutex_unlock(&opts->lock);					\
>  									\
>  	return result;							\

-- 
Regards,

Laurent Pinchart

