Return-Path: <linux-usb+bounces-5216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592C831926
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 13:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C0EE1C22573
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 12:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0E924A18;
	Thu, 18 Jan 2024 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="APx1eJ1o"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C9D241EB
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705580899; cv=none; b=G5ejzpVOIEEBAwtL8wZtg20mbtDFAYg8//u2JUp2J/IRn5HkU7uljOpoijcNbAWJc9SBrK/HfsfbNMma1byT+pcDIN/PFTCTGwXqnb6oolUpHD9SJC+n0/BXfhhStF1ISWblEs2tX9zomXLwnhOmXn4xU+WtYsx25sPNeQ1hiws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705580899; c=relaxed/simple;
	bh=03+3TrugtBoJlZyPArPEyS8mydR5wlXXOpoI6XvPDf4=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=p2UnHgHhyEENgq4VzvEO7uCbKnz9CG8z8tHvgcV5j/5hgJZPuPiORrhRaCeR7QGURhRAlVUkh4Byo2K7EA03z2j3rnYYgYBBGvGCbIWHJurrZvavtg0zmjdVPfuPHza/MufuOyTXRYwMj2XGoLbxidkDTo4NfOktZgIGFCGc8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=APx1eJ1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19819C433F1;
	Thu, 18 Jan 2024 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705580898;
	bh=03+3TrugtBoJlZyPArPEyS8mydR5wlXXOpoI6XvPDf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APx1eJ1o6eqYTX5EcwpF7TGYB8MBfyYw/jVnKWgx3tFBWDssJkPbnMT1rIzOG4Tg8
	 kIXlEwe73jesu3XYdEvY4RZDSA9attk8vBAN5dCf29hvUvjdU0X5nf6tm3oi5UQinE
	 /XlRPMgaUjs9P6Ybn7iyhdCZoC7ZbhnJqk4ag51M=
Date: Thu, 18 Jan 2024 13:28:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-usb@vger.kernel.org, Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH] usb: gadget: f_fs: expose ready state in configfs
Message-ID: <2024011857-existing-shucking-97d4@gregkh>
References: <20240118121816.3992645-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118121816.3992645-1-peter@korsgaard.com>

On Thu, Jan 18, 2024 at 01:18:16PM +0100, Peter Korsgaard wrote:
> When a USB gadget is configured through configfs with 1 or more f_fs
> functions, then the logic setting up the gadget configuration has to wait
> until the user space code (typically separate applications) responsible for
> those functions have written their descriptors before the gadget can be
> activated.
> 
> The f_fs instance already knows if this has been done, so expose it through
> a "ready" attribute in configfs for easier synchronization.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index fdd0fc7b8f25..ae44dd5f3a94 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3446,6 +3446,20 @@ static inline struct f_fs_opts *to_ffs_opts(struct config_item *item)
>  			    func_inst.group);
>  }
>  
> +static ssize_t f_fs_opts_ready_show(struct config_item *item, char *page)
> +{
> +	struct f_fs_opts *opts = to_ffs_opts(item);
> +
> +	return sprintf(page, "%d\n", opts->dev->desc_ready);
> +}
> +
> +CONFIGFS_ATTR_RO(f_fs_opts_, ready);
> +
> +static struct configfs_attribute *ffs_attrs[] = {
> +	&f_fs_opts_attr_ready,
> +	NULL,
> +};

No documentation entry for this new attribute?

thanks,

greg k-h

