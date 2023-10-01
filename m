Return-Path: <linux-usb+bounces-856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0C7B458B
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 08:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 7A0E7282B43
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 06:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D18947B;
	Sun,  1 Oct 2023 06:12:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00A517FD
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 06:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93810C433C7;
	Sun,  1 Oct 2023 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696140758;
	bh=BtweuTP2ebz518qYDdqy+lEdbw9lopsAOZ3LV703vvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrLILoeTTldQvNVlrbae0oASW9ag099oZqfzFO8AZtq+qmiJo5xrmR5TG83ll7AFd
	 ge4vPxelee/TYf2wqbz+KW9sGWqQ7whSkRQD250qqlcePtbaaN3TSAhsupJl64qzt1
	 ztrSNY83VInXIhH4oB9ZGBKGckezGjB7xoz4LH4g=
Date: Sun, 1 Oct 2023 08:12:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: usb: Remove unnecessary whitespace in function
 pointer declaration
Message-ID: <2023100116-headscarf-dreaded-cf8e@gregkh>
References: <20230930204136.62015-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930204136.62015-1-bergh.jonathan@gmail.com>

On Sat, Sep 30, 2023 at 10:41:36PM +0200, Jonathan Bergh wrote:
> Fixed a formatting issue flagged by checkpatch where unnecessary
> whitespace was included before the parameter list in the function
> pointer declaration.
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/usb/c67x00/c67x00.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/c67x00/c67x00.h b/drivers/usb/c67x00/c67x00.h
> index a4456d0fffa9..3673357818b4 100644
> --- a/drivers/usb/c67x00/c67x00.h
> +++ b/drivers/usb/c67x00/c67x00.h
> @@ -193,7 +193,7 @@ struct c67x00_sie {
>  	/* Entries to be used by the subdrivers */
>  	spinlock_t lock;	/* protect this structure */
>  	void *private_data;
> -	void (*irq) (struct c67x00_sie *sie, u16 int_status, u16 msg);
> +	void (*irq)(struct c67x00_sie *sie, u16 int_status, u16 msg);

Same comment as on the other patches, subject line is incorrect, and why
do this?

thanks,

greg k-h

