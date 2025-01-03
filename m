Return-Path: <linux-usb+bounces-18955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6F5A004CE
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 08:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 720301883F6D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 07:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E151C0DED;
	Fri,  3 Jan 2025 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DTo9pNPz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24752101E6;
	Fri,  3 Jan 2025 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735888298; cv=none; b=CikI1tAqSH3lxq84E07WzZV+Z+ybLjY7HeSQ94AKaveItjMjdApTmMT9iw8ZUYYJuptxZGu7JNapTvbfBxMHslTt8aQMD+YLWmyGwOfk2Z+uoi+BxQLXsNlwfXBcCheOlP7FiiiXcTk4FI6p5VSweDJGMktUoBtXStszjih0EOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735888298; c=relaxed/simple;
	bh=Y+DRKa9AqnfYH+FArcmZBCPXdJdGp9azW6bPmuNF+k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQaQRNy0/H+FuzS3V0w88B+l9v9AdNuYj98n77zZ3oNiva1tjt4NVaHaiynqrvj0aG9Fpeu4a1SlDKeJrFi7VO2vfu2pcahjxlWHdyGm+tsoDzMM5aO5P+aDVjrUJuMVKj2bEPNL2YpJQzBsVnAmonAO3V38x+0qWkeSFgxKMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DTo9pNPz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D7AC4CECE;
	Fri,  3 Jan 2025 07:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735888297;
	bh=Y+DRKa9AqnfYH+FArcmZBCPXdJdGp9azW6bPmuNF+k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTo9pNPzRMHAl4A0qmHPPpGXygOvm4jYYfkWbRln7nM+guHg+NwKDzFu9z4nRTD/a
	 rLOzw75UbzeW6xszxvg/2cqUpbhl3KFt/VvRd1OmC+z5r6puij/iX4bXU/vrah7ZpV
	 DRdKWSk/GO9vq2E0fSdDX51iPzWhEDm1fbv44P4w=
Date: Fri, 3 Jan 2025 08:11:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fix pm usage counter imbalance in
 ucsi_ccg_sync_control()
Message-ID: <2025010313-trickery-agreeable-0157@gregkh>
References: <20241230093523.1237231-1-gongruiqi1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230093523.1237231-1-gongruiqi1@huawei.com>

On Mon, Dec 30, 2024 at 05:35:23PM +0800, GONG Ruiqi wrote:
> The error handling for the case `con_index == 0` should involve dropping
> the pm usage counter, as ucsi_ccg_sync_control() gets it at the
> beginning. Fix it.
> 
> Fixes: e56aac6e5a25 ("usb: typec: fix potential array underflow in ucsi_ccg_sync_control()")
> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index fcb8e61136cf..740171f24ef9 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -646,7 +646,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
>  			UCSI_CMD_CONNECTOR_MASK;
>  		if (con_index == 0) {
>  			ret = -EINVAL;
> -			goto unlock;
> +			goto err_put;
>  		}
>  		con = &uc->ucsi->connector[con_index - 1];
>  		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
> @@ -654,8 +654,8 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
>  
>  	ret = ucsi_sync_control_common(ucsi, command);
>  
> +err_put:
>  	pm_runtime_put_sync(uc->dev);
> -unlock:
>  	mutex_unlock(&uc->lock);
>  
>  	return ret;
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

