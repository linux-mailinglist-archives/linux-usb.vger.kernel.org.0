Return-Path: <linux-usb+bounces-4725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE3823FA9
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 11:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DAF81F24CAC
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA7F210E1;
	Thu,  4 Jan 2024 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="eUKn6+q8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="urrnNhIb"
X-Original-To: linux-usb@vger.kernel.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216DC20DDD
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7BA4D3200BD3;
	Thu,  4 Jan 2024 05:44:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 04 Jan 2024 05:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1704365078; x=1704451478; bh=i8KkgsRQbo
	KH+swbFMyz2yUbk82rV++RQb2o4ejJ/qc=; b=eUKn6+q89hUjec7niikLZlr2PF
	OhvaYFIoZgy81Vc8xSTLYBQ7LuD8Zrx04r7phVt3LLoK8br/GFEcIPOeXmm8Zelr
	cVM0Ijfqh5aCMUHPID1q+ILyVOO/5p6kiSb8n8yDavJH5007hYlXMDLGgLzl9KhH
	PawaJPwpk5BVwmRNhQCBiSInOLGRQRt6gSJdSWjL2e1W7YnL/uji8uLOHIxefZot
	mKmo2oZF/QsPtTkvdc4wNZLFtbxVrKGO4UGCp0AB9XghdS7JIdvd9XxHH3YfOlYv
	g2dAeG/0bxc0hgV5jDfEzC70Pxehc7VX5FMPXBiekjwFVUCgxckklMfcqEtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704365078; x=1704451478; bh=i8KkgsRQboKH+swbFMyz2yUbk82r
	V++RQb2o4ejJ/qc=; b=urrnNhIbsw3Fo9OF9ikUqxftvkotH3FE1sWy4/HrxjJb
	howdzP6mYmINLOZxzBoj2DVV8gOyJio+n79bTigE96fcWmhqPfqoa782zQayZzL/
	dSYbg8KwW/uzErS7Jjm0UcbEaYCLreW0uiMlcg0VFgcfLx0ZBxcDiBuODbEIPyyC
	WSuQGbfQsnHHoMjUgJapxTDDaPpPg6ee3tYZufV2i3BKJg1T0ZOwBs7WP0HunAQV
	uiKyAwpRu2bwhs2VRghIOgBrQZqfKUwrdCgke//+xBYtDfs7ZWDXdbhe+VtONZMd
	ZK8p85mBNcQ1vYgeBsEGBcCq7JMD8J7sU6UqbC4bqg==
X-ME-Sender: <xms:FYyWZZAn2l3NahFfxyU-J6Dy3epwzNF1k2E8QXCBivL75mticm8jqQ>
    <xme:FYyWZXhUJJaT3QIUQUHbYd4Ip-BITGbi4--i8R3WW5ghkm8Q4SN_0XouF2pbW7oVU
    u7hWKPaNDwv8g>
X-ME-Received: <xmr:FYyWZUkfXHcUC-hEJwmW55yeL9AzXGIC7-YYZJXARVeJ0U63BWRK3i7aV-_yx-m9nNb4B42FlIQaqF0dm1RbDKLPS4kshAqQdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:FYyWZTxUhAAfN0WlU_F5xzKaa2nX7vWmzg7qB5aMOUBy4cuwIqbWog>
    <xmx:FYyWZeSJmQfsSX7VHO11XpPy_YW745fZmv9DIW9RQeDivNCq261H4Q>
    <xmx:FYyWZWYqWYXypbFDCHAh50Jo3iHreCcndTkqZEODBw5JAV29qiR1xw>
    <xmx:FoyWZUO8B1oKNdzyKxWGtketZdx-_gmXgKWP0QN118ySztXMt4hndg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jan 2024 05:44:36 -0500 (EST)
Date: Thu, 4 Jan 2024 11:44:35 +0100
From: Greg KH <greg@kroah.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: bjorn@mork.no, linux-usb@vger.kernel.org
Subject: Re: [RFC] usb: r8152: interface driver before device driver
Message-ID: <2024010426-ruby-credibly-c56f@gregkh>
References: <20240104103811.2318-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104103811.2318-1-oneukum@suse.com>

On Thu, Jan 04, 2024 at 11:37:59AM +0100, Oliver Neukum wrote:
> The r8152 interface driver is preferred over the generic
> class driver because it provides more features. Hence
> we now have a device driver that switches the configuration.
> 
> That device driver is sensible only if an interface driver
> for the selected configuration exists.
> However, the initialization for this module first reisters
> the device driver and after that the interface driver.
> That screws up error handling. Both registrations return
> error codes. That means that the registration of the
> device driver can currently work, but the interface
> driver can fail.
> In that case we switch the devices to a configuration
> we have no driver for. That must not happen. The easiest
> fix is to register the interface driver first and
> bail out if that fails. That way if the device driver
> fails, nothing needs to be undone.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Fixes: ec51fbd1b8a2 ("r8152: add USB device driver for config selection")
> ---
>  drivers/net/usb/r8152.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 9bf2140fd0a1..e856ef83cef0 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -10117,10 +10117,13 @@ static int __init rtl8152_driver_init(void)
>  {
>  	int ret;
>  
> -	ret = usb_register_device_driver(&rtl8152_cfgselector_driver, THIS_MODULE);
> +	ret = usb_register(&rtl8152_driver);
>  	if (ret)
>  		return ret;
> -	return usb_register(&rtl8152_driver);
> +
> +	ret = usb_register_device_driver(&rtl8152_cfgselector_driver, THIS_MODULE);
> +	return ret;
> +
>  }
>  
>  static void __exit rtl8152_driver_exit(void)
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

