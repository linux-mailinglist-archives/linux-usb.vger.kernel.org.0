Return-Path: <linux-usb+bounces-30818-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB5C7CE58
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 398D5344087
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 11:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA372FE58C;
	Sat, 22 Nov 2025 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LU2uuhV8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F72FE05B;
	Sat, 22 Nov 2025 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811088; cv=none; b=tEYPAiGI5HEHdWRFpT2kc6pK9imYoZXDhug5bVDxXDqV4hfENhpk8QJy5bw0lMK3z12uRcHVoX/VVOqstVMJPrJUUuaHqsgzDodOr+GV69/aBq6PKoT9dv1RuEyWE+rtnnOnCN9VbMIS2xIGjx+2MRIhQeIyhlofqHhxfC6bCaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811088; c=relaxed/simple;
	bh=pXkpMRDugmqBXwbb4UHq/H05upKNfOUOPWe67gbMaTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAiOcv6nqHGWLR+kJfiiNzdM0nCMxsEUGt+coNw0JHChEcOyjp7EGeu1cQxqyohAsnj6uTMU8031HpbXAgBCwkVrXH3WCYKGyAZI6a3+NMqz0266Z+LcWaqCTPYuNh7WFogCFHMqb3hEcP3Lde75n515hL/cj/hhts4ZXWT9YQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LU2uuhV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BA9C4CEF5;
	Sat, 22 Nov 2025 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763811087;
	bh=pXkpMRDugmqBXwbb4UHq/H05upKNfOUOPWe67gbMaTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LU2uuhV8/REtk2sm6QwWpxD5B/VIa2v9b7VFOMSTFUGToHrpwmFLn/w9ws+tzsl8t
	 6iC9gHzI0xQrTYmO5ZhhIxBlX/y7/6FL4J4S0YHnp+Tu+Hk21dQyQExBnBNF9b4JF7
	 03QXCmYWCwofkimKl7Sj9qTijo0VAl1k8AmwRTvw=
Date: Sat, 22 Nov 2025 12:31:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhengqiao Xia <jerry.xzq@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: of: filter disabled device node
Message-ID: <2025112200-gala-predict-9de8@gregkh>
References: <20251122112539.4130712-1-jerry.xzq@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122112539.4130712-1-jerry.xzq@gmail.com>

On Sat, Nov 22, 2025 at 07:25:39PM +0800, Zhengqiao Xia wrote:
> We should not point the of_node of a USB device to a disabled devicetree
> node. Otherwise, the interface under this USB device will not be able
> to register.
> 
> Signed-off-by: Zhengqiao Xia <jerry.xzq@gmail.com>
> ---
>  drivers/usb/core/of.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> index 763e4122ed5b3..6bb577e711811 100644
> --- a/drivers/usb/core/of.c
> +++ b/drivers/usb/core/of.c
> @@ -31,6 +31,9 @@ struct device_node *usb_of_get_device_node(struct usb_device *hub, int port1)
>  		if (of_property_read_u32(node, "reg", &reg))
>  			continue;
>  
> +		if (!of_device_is_available(node))
> +			continue;
> +
>  		if (reg == port1)
>  			return node;
>  	}
> -- 
> 2.34.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

