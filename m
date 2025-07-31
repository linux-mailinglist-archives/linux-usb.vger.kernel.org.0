Return-Path: <linux-usb+bounces-26281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0260B16B1E
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 06:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2902E18C59DC
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 04:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07F221CA07;
	Thu, 31 Jul 2025 04:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sjF4Q1i1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338613AA3C
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 04:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753935533; cv=none; b=PxWiWPTh/ebVmnFaXP5AqG+d/48QMkxukQkaKc44oxIhCwQRQsHAmOo4+mgsHJpZ05hV5PVGem06KZNriCG3I4S+k/84urSG7iQVMQUZmqfgmlTcOyOVz/xRq7pytKudYLpkIYqFxbTF5dQdgOM8fTfj27DbEg6svzQV0OIhDh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753935533; c=relaxed/simple;
	bh=XP8CeZPZHY779q6lRlx0cJBmj2GqAF9XUtKqTf+vqb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4fnv7acvu0rOgrf5v+BQdrJtZHJveJ5i6WyjKqMtwSjP95YSkxT1OoU3EK/5cLaCNUfZQ39S6dDcN+UTNbHnqvWyNayQFASavZ9qxMaDEzkZZkzkZYmDDhrgm7Ec07t8J3Xk28qopqQsDOXiY1OayDLYU4xw4z3BDwUFZ7dLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sjF4Q1i1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61F0C4CEEF;
	Thu, 31 Jul 2025 04:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753935532;
	bh=XP8CeZPZHY779q6lRlx0cJBmj2GqAF9XUtKqTf+vqb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjF4Q1i1zZoj5kJe6G/2FjcNmbTBS66c6Ica3Z1MZl4cBoYQheL8g2J3YKv+Yv9Xx
	 PFGnxv4vLL+EdiMo+0frihEY/nyKUFfhZZEjLCwOzUJ8shysimctC17/vm84oqpaVT
	 otJSnuf2uGO3ih695uZh3eBzQuGuuLZHcw/1xid8=
Date: Thu, 31 Jul 2025 06:18:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Li Jun <lijun01@kylinos.cn>
Cc: mingo@kernel.org, tglx@linutronix.de, nathan@kernel.org,
	n.zhandarovich@fintech.ru, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: atm: Fix kernel coding style
Message-ID: <2025073135-wake-edging-5f00@gregkh>
References: <20250731014134.535119-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731014134.535119-1-lijun01@kylinos.cn>

On Thu, Jul 31, 2025 at 09:41:34AM +0800, Li Jun wrote:
> These changes just fix Linux Kernel Coding Style, no functuional
> improve.
> 
> -Space prohibited after that open parenthesis '(',
> -Macros with complex values should be enclosed in parentheses.
> 
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  drivers/usb/atm/cxacru.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
> index 68a8e9de8b4f..57d59fff8142 100644
> --- a/drivers/usb/atm/cxacru.c
> +++ b/drivers/usb/atm/cxacru.c
> @@ -196,13 +196,13 @@ static void cxacru_poll_status(struct work_struct *work);
>  
>  /* Card info exported through sysfs */
>  #define CXACRU__ATTR_INIT(_name) \
> -static DEVICE_ATTR_RO(_name)
> +(static DEVICE_ATTR_RO(_name))
>  
>  #define CXACRU_CMD_INIT(_name) \
> -static DEVICE_ATTR_RW(_name)
> +(static DEVICE_ATTR_RW(_name))
>  
>  #define CXACRU_SET_INIT(_name) \
> -static DEVICE_ATTR_WO(_name)
> +(static DEVICE_ATTR_WO(_name))
>  
>  #define CXACRU_ATTR_INIT(_value, _type, _name) \
>  static ssize_t _name##_show(struct device *dev, \
> @@ -513,7 +513,7 @@ CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_RATE,           u32,  downstream_rate); \
>  CXACRU_ATTR_##_action(CXINF_UPSTREAM_RATE,             u32,  upstream_rate); \
>  CXACRU_ATTR_##_action(CXINF_LINK_STATUS,               LINK, link_status); \
>  CXACRU_ATTR_##_action(CXINF_LINE_STATUS,               LINE, line_status); \
> -CXACRU__ATTR_##_action(                                      mac_address); \
> +CXACRU__ATTR_##_action(mac_address); \
>  CXACRU_ATTR_##_action(CXINF_UPSTREAM_SNR_MARGIN,       dB,   upstream_snr_margin); \
>  CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_SNR_MARGIN,     dB,   downstream_snr_margin); \
>  CXACRU_ATTR_##_action(CXINF_UPSTREAM_ATTENUATION,      dB,   upstream_attenuation); \
> @@ -533,8 +533,8 @@ CXACRU_ATTR_##_action(CXINF_MODULATION,                MODU, modulation); \
>  CXACRU_ATTR_##_action(CXINF_ADSL_HEADEND,              u32,  adsl_headend); \
>  CXACRU_ATTR_##_action(CXINF_ADSL_HEADEND_ENVIRONMENT,  u32,  adsl_headend_environment); \
>  CXACRU_ATTR_##_action(CXINF_CONTROLLER_VERSION,        u32,  adsl_controller_version); \
> -CXACRU_CMD_##_action(                                        adsl_state); \
> -CXACRU_SET_##_action(                                        adsl_config);
> +CXACRU_CMD_##_action(adsl_state); \
> +CXACRU_SET_##_action(adsl_config);
>  
>  CXACRU_ALL_FILES(INIT);
>  
> -- 
> 2.25.1
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

