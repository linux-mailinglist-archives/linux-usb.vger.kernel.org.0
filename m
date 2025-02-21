Return-Path: <linux-usb+bounces-20912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E871A3ECFD
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 07:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E08E19C2C14
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 06:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311661F9F51;
	Fri, 21 Feb 2025 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1mMr5VD1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCCA70807
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740120376; cv=none; b=JjuEqtUY1tjsPCh3m9/0xwdbifVsIVxdUH03JMo4iqHy5C6EzXQQcI5svUfjZB6YkBYwAYvhd5tGxOd3tU8WCYhk8w8AZOkEuQ5UwRaHYtmNSpDNeANNqdbGyZ+9h8xZZ00nAMBD1XDEWcjp4JjSRIAwGQs80mPgH+ssiepS26o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740120376; c=relaxed/simple;
	bh=yaIEk4YPFdVr2J3WYYAGlmXSLPXxyqIMstQCZh1xWss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USpkrKA0ykF0hRCRuQykoe/9BYLncqmyyq3910tEeakznBW3kf440JzOBqz/8i6FPBaUhUDuuaWATadbVgFQWvzWLlcXpDorlZQKkE0mVaOMGGu9+bQMIFSv9RlTqQjEG8by+bMW1yCL8bGTSBf7rN9tyF+ppCVes7uoQHUe+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1mMr5VD1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABD9C4CED6;
	Fri, 21 Feb 2025 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740120376;
	bh=yaIEk4YPFdVr2J3WYYAGlmXSLPXxyqIMstQCZh1xWss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1mMr5VD1GTW5pNdmOQ6g/Yc7BzgA8Ys4n1vMcpsHylytvWpCAueyKFxvnthm+UbO+
	 K18MNgsqpMpJPuqV+aIZ9SYXEgnqiMlBgQ17FO003eRGrK5eZArVh8aOewp4I7DI0W
	 G2m7unHwSEhTNVPi14QMGVb5VOwmNQxE1zJ7UQbY=
Date: Fri, 21 Feb 2025 07:45:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, heikki.krogerus@linux.intel.com,
	ajayg@nvidia.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] ucsi_ccg: Don't show failed to get FW build
 information error
Message-ID: <2025022157-result-cranial-7c83@gregkh>
References: <20250221054137.1631765-1-superm1@kernel.org>
 <20250221054137.1631765-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221054137.1631765-2-superm1@kernel.org>

On Thu, Feb 20, 2025 at 11:40:03PM -0600, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The error `failed to get FW build information` is added for what looks
> to be for misdetection of the device property firmware-name.
> 
> If the property is missing (such as on non-nvidia HW) this error shows up.
> Move the error into the scope of the property parser for "firmware-name"
> to avoid showing errors on systems without the firmware-name property.
> 
> Fixes: 5c9ae5a87573d ("usb: typec: ucsi: ccg: add firmware flashing support")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 740171f24ef9f..663aca9421410 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1432,11 +1432,10 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>  			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
>  		else if (!strcmp(fw_name, "nvidia,gpu"))
>  			uc->fw_build = CCG_FW_BUILD_NVIDIA;
> +		if (!uc->fw_build)
> +			dev_err(uc->dev, "failed to get FW build information\n");
>  	}
>  
> -	if (!uc->fw_build)
> -		dev_err(uc->dev, "failed to get FW build information\n");
> -
>  	/* reset ccg device and initialize ucsi */
>  	status = ucsi_ccg_init(uc);
>  	if (status < 0) {
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

