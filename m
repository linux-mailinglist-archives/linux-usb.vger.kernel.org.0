Return-Path: <linux-usb+bounces-5598-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11F840966
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 16:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D30FB26723
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 15:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2F1153517;
	Mon, 29 Jan 2024 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W6vwmZ/w"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D460DEF
	for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706541127; cv=none; b=VSRtFO3g2iw7Y8yhkqgInn7wOBevZUuToigz9h62+MoOjz+t6hEodX9j5EhYuXpnzYsW4UcbrQyNXlpOw0ZH35Ecp4OYGW3dDW0U816D0EFk7Hrw80C2M7hSSDBkXXo/Inht+09ra+cQTAiQcJK9pOfn3PFcxE71yrqWcSlYXpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706541127; c=relaxed/simple;
	bh=TFtXTZ7Dcwu6/fYzAjEVqCmasNq05TpkHtiBO/F6+U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RIm7QxIZlg3VyFd2xCh7ujwWf6WEihTXnDImkIdJEOz5iTudCvQVlRdXnj7hXDhYw/hGsruM/A1c4op6PvekE4FPZty8HWDLNohKQ3RBKlQEOlXmz3nziOxFEW58PTjENdtHLvLM28gkxT7AOXmpnM8ubeYYVWfMK8PDN8lO0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W6vwmZ/w; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706541124;
	bh=TFtXTZ7Dcwu6/fYzAjEVqCmasNq05TpkHtiBO/F6+U8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=W6vwmZ/wfWEcjJqFx7KU1/ISqh/RzAfGKbb0ZpcRuVIo1jTxLw9lwl2+odG6gl9GX
	 86u9rFZFTvtfCISvBcp9eCZzdp+9GHC0LIGIyTaYa5yyFE1jFXcaz4d7qAKGF3p09W
	 JwqZal8s198ts2HQ1A0Jmj+zSYWfF4PNyHPqagfFsdNKunAhqSeXx0uQd+tSDVuLR4
	 ulChtD415Mlsl/8WKGPllx3zvp27+eQ+Ct23U0gfT57t/XAaUrmbhIH3rKNXul+irF
	 RdZoSFmA/7CZwPvlc4IIOdP5jHH0CJNR3UWEzNU7zwqs38u/pG2vic1VS8v7tkEd2Y
	 A4S+OA16TtQ7Q==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0047E3781F9C;
	Mon, 29 Jan 2024 15:12:03 +0000 (UTC)
Message-ID: <fa2aa158-e6c8-4eac-8432-fbfb9c905726@collabora.com>
Date: Mon, 29 Jan 2024 16:12:02 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: gadget: f_fs: expose ready state in configfs
To: Peter Korsgaard <peter@korsgaard.com>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Nazarewicz <mina86@mina86.com>
References: <20240126203208.2482573-1-peter@korsgaard.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20240126203208.2482573-1-peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 26.01.2024 o 21:32, Peter Korsgaard pisze:
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

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
> Changes since v3:
> - Take ffs_dev_lock as requested by Andrzej.
> 
> Changes since v2:
> - Add ABI documentation as requested by Greg.
> 
> Changes since v1:
> - Add documentation snippet as requested by Greg.
> 
>   .../ABI/testing/configfs-usb-gadget-ffs       | 12 +++++++++--
>   Documentation/usb/gadget-testing.rst          |  8 ++++++++
>   drivers/usb/gadget/function/f_fs.c            | 20 +++++++++++++++++++
>   3 files changed, 38 insertions(+), 2 deletions(-)
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
> index 8cd62c466d20..4ec6b775ebba 100644
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
> index 6bff6cb93789..be3851cffb73 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3445,6 +3445,25 @@ static inline struct f_fs_opts *to_ffs_opts(struct config_item *item)
>   			    func_inst.group);
>   }
>   
> +static ssize_t f_fs_opts_ready_show(struct config_item *item, char *page)
> +{
> +	struct f_fs_opts *opts = to_ffs_opts(item);
> +	int ready;
> +
> +	ffs_dev_lock();
> +	ready = opts->dev->desc_ready;
> +	ffs_dev_unlock();
> +
> +	return sprintf(page, "%d\n", ready);
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
> @@ -3458,6 +3477,7 @@ static struct configfs_item_operations ffs_item_ops = {
>   
>   static const struct config_item_type ffs_func_type = {
>   	.ct_item_ops	= &ffs_item_ops,
> +	.ct_attrs	= ffs_attrs,
>   	.ct_owner	= THIS_MODULE,
>   };
>   


