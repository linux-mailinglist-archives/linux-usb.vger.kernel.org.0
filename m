Return-Path: <linux-usb+bounces-3951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADDD80BED2
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 02:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 712811C20950
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 01:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3C5C8E8;
	Mon, 11 Dec 2023 01:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enojSTRb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD58A950;
	Mon, 11 Dec 2023 01:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2004CC433C8;
	Mon, 11 Dec 2023 01:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702259106;
	bh=/jf3ec7E9hlGrUOPKNv/BrysUMxQfNuXUfDv4GGeYHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enojSTRbQ2ytH0mpAXRcNTAjmXjNW8o47GiBqpr8cmGghNgi6FAB4C98bbDplpe0v
	 /mfy8cjzUNSJFD4Ec8puzAsgN8nveFuDlGYuYuMb9XrbYNLrq+yKzrxWyw2tFvDt4C
	 A0Ts6xN4pQnMwXOCdZY84ACaTfd1eGt/S2JmBhCNZR9NYfwheby76BcTVc7Z09W8WL
	 ojM0ymPHGPAumZT0sp9N7cuHCleHH0Nr1yYt5SE9MoYpb0QznL1PEfP9kmydmUPRlB
	 LIzvN9RH5x8pZMGUi3jaNwzF9+U8yDeGPt823iWxOgkbAE+vY6shxUYNqNcVozKKfC
	 I3fFERD/cLQDQ==
Date: Mon, 11 Dec 2023 09:44:56 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: Remove usage of the deprecated
 ida_simple_xx() API
Message-ID: <20231211014456.GA1197808@nchen-desktop>
References: <8bf382976c0ba0986c0dbe93427266273f0776ef.1702230217.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bf382976c0ba0986c0dbe93427266273f0776ef.1702230217.git.christophe.jaillet@wanadoo.fr>

On 23-12-10 18:43:56, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/chipidea/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 7ac39a281b8c..0af9e68035fb 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -862,7 +862,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> -	id = ida_simple_get(&ci_ida, 0, 0, GFP_KERNEL);
> +	id = ida_alloc(&ci_ida, GFP_KERNEL);
>  	if (id < 0)
>  		return ERR_PTR(id);
>  
> @@ -892,7 +892,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
>  err:
>  	platform_device_put(pdev);
>  put_id:
> -	ida_simple_remove(&ci_ida, id);
> +	ida_free(&ci_ida, id);
>  	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(ci_hdrc_add_device);
> @@ -901,7 +901,7 @@ void ci_hdrc_remove_device(struct platform_device *pdev)
>  {
>  	int id = pdev->id;
>  	platform_device_unregister(pdev);
> -	ida_simple_remove(&ci_ida, id);
> +	ida_free(&ci_ida, id);
>  }
>  EXPORT_SYMBOL_GPL(ci_hdrc_remove_device);
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen

