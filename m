Return-Path: <linux-usb+bounces-5545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0007483E305
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 21:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E381F25C59
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 20:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B2A2261F;
	Fri, 26 Jan 2024 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="psh9ycZB"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94712260B
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706299317; cv=none; b=LY4ic1VUZdAfgWtow5nn+5XZJ2dwJM03GRXfCRiqyC0StNxkMlxpEK0dPV9CMj0Z5EXXu53jmc4blQCmCzHWAs39Szk9jhMVQinr+wvQQqft6nEul7zs7KrOUyNBvYyWVDmUKct97c3CwbIqFuvpCtFyEjpwy5MfeieDScFSSJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706299317; c=relaxed/simple;
	bh=Oc1d+JTbYQ8bHzzFoET4gL1U/EpPO1rbc+gte4DJPb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q6vvpMDCmCVMEEyAGiKHDfQNlRCIHkQp5e00Mm+noe+VlCexVbBYc9XqC0WhC8U91mr1njnAlmzcHRli2DZUoOvwJm5AW6V6YqUvCCMdr79z0NmkX0fSVFE+zbKF9e+PSP1LUJEFHcgHUEKraOZNhL1T8jzrOv8ljKlkL7oE6Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=psh9ycZB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706299314;
	bh=Oc1d+JTbYQ8bHzzFoET4gL1U/EpPO1rbc+gte4DJPb8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=psh9ycZBJw+M53O3KTy01uzZrrOH129TjY0YzeGEkVCzlkcJKqf8/Jf7FIO3dk6eP
	 ZX+hS8nJqth6UT7ORKLapUk7X1XJ9kJls/pewGGL48hIOCkXu2seMXibTm2pXyGk9R
	 AMG7mLtQIqRx5Qtqph09SazZl6+XtnDCn0ZmzXIRBR82p5h1q/NA7CitTbO094yhe+
	 dU1+qqyrFsLbpV06JB1Q3G/pTDNdhLI33rOtNh+uCQTbkaftpf+ZMfhJAwxLoPpt4S
	 Wa7xEsBeTIx7E9iiOCjVKXkKEkbw9yuD3wstACBjbmqfxxh0NLiuRigCkg2tju93b1
	 lZ+hlRfJufEjA==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CC8113780629;
	Fri, 26 Jan 2024 20:01:53 +0000 (UTC)
Message-ID: <fc910229-81f6-48eb-acc9-f4899ccecc5d@collabora.com>
Date: Fri, 26 Jan 2024 21:01:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: gadget: f_fs: expose ready state in configfs
To: Peter Korsgaard <peter@korsgaard.com>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Nazarewicz <mina86@mina86.com>
References: <20240118144808.4010679-1-peter@korsgaard.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20240118144808.4010679-1-peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Peter,

W dniu 18.01.2024 o 15:48, Peter Korsgaard pisze:
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
> Changes since v2:
> - Add ABI documentation as requested by Greg
> 
> Changes since v1:
> - Add documentation snippet as requested by Greg.
> 
>   Documentation/ABI/testing/configfs-usb-gadget-ffs | 12 ++++++++++--
>   Documentation/usb/gadget-testing.rst              |  8 ++++++++
>   drivers/usb/gadget/function/f_fs.c                | 15 +++++++++++++++
>   3 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-ffs b/Documentation/ABI/testing/configfs-usb-gadget-ffs
> index e39b27653c65..bf8936ff6d38 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-ffs
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-ffs
> @@ -4,6 +4,14 @@ KernelVersion:	3.13
>   Description:	The purpose of this directory is to create and remove it.
>   
>   		A corresponding USB function instance is created/removed.
> -		There are no attributes here.
>   
> -		All parameters are set through FunctionFS.
> +		All attributes are read only:
> +
> +		=============	============================================
> +		ready		1 if the function is ready to be used, E.G.
> +				if userspace has written descriptors and
> +				strings to ep0, so the gadget can be
> +				enabled - 0 otherwise.
> +		=============	============================================
> +
> +		All other parameters are set through FunctionFS.
> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> index 29072c166d23..fcbd8bb22db4 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -206,6 +206,14 @@ the standard procedure for using FunctionFS (mount it, run the userspace
>   process which implements the function proper). The gadget should be enabled
>   by writing a suitable string to usb_gadget/<gadget>/UDC.
>   
> +The FFS function provides just one attribute in its function directory:
> +
> +	ready
> +
> +The attribute is read-only and signals if the function is ready (1) to be
> +used, E.G. if userspace has written descriptors and strings to ep0, so
> +the gadget can be enabled.
> +
>   Testing the FFS function
>   ------------------------
>   
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index fdd0fc7b8f25..ae44dd5f3a94 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3446,6 +3446,20 @@ static inline struct f_fs_opts *to_ffs_opts(struct config_item *item)
>   			    func_inst.group);
>   }
>   
> +static ssize_t f_fs_opts_ready_show(struct config_item *item, char *page)
> +{
> +	struct f_fs_opts *opts = to_ffs_opts(item);
> +
> +	return sprintf(page, "%d\n", opts->dev->desc_ready);

Don't we need some locking here? "desc_ready" seems to be manipulated always 
under ffs_dev_lock().

Regards,

Andrzej

> +}
> +
> +CONFIGFS_ATTR_RO(f_fs_opts_, ready);
> +
> +static struct configfs_attribute *ffs_attrs[] = {
> +	&f_fs_opts_attr_ready,
> +	NULL,
> +};
> +
>   static void ffs_attr_release(struct config_item *item)
>   {
>   	struct f_fs_opts *opts = to_ffs_opts(item);
> @@ -3459,6 +3473,7 @@ static struct configfs_item_operations ffs_item_ops = {
>   
>   static const struct config_item_type ffs_func_type = {
>   	.ct_item_ops	= &ffs_item_ops,
> +	.ct_attrs	= ffs_attrs,
>   	.ct_owner	= THIS_MODULE,
>   };
>   


