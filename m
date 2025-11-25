Return-Path: <linux-usb+bounces-30904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECCC84CA6
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 12:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D228349159
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 11:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6523164B1;
	Tue, 25 Nov 2025 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ipfXwjB6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DDF2F39B9;
	Tue, 25 Nov 2025 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764071158; cv=none; b=Z9JMvDGx3CHcv4TIAadDdWIvxFwqwMgd0yA5C9iiNXl6U7k/knDh01x5pHmyTQY8QVF8mJX1vv089HFp1dxdPNC9IwOO4S4XL+u+8VMGsrjiDUPT7z5kWFqepYwchjTTjQIhFJDeV+SVYP2kV5h7zdSWqOotnWxs0TAgIYndWbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764071158; c=relaxed/simple;
	bh=rpgWE1KAbx4TA5LPXq/GgIAxNRMq0ehT01Gd+aNtxq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6tSpwznMLc8EjN6HjvNC/4RepCFFz3eosUtP8qOZk7B9WUWIt+m3Ax65E8SucS65XmEj+askcn2wGmPrMigsuMF54MDPLBoaXxMR8e4w+woLcpnSOLkdYa+JSFocjL2Rhiqd7MXs2rVjWK891Ecce/UCQfM+onVQdbeDZ0a3Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ipfXwjB6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB754C4CEF1;
	Tue, 25 Nov 2025 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764071158;
	bh=rpgWE1KAbx4TA5LPXq/GgIAxNRMq0ehT01Gd+aNtxq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipfXwjB6+Tr1NjCiBo9Q2INQf5n+lwpBT8RPValz2jpuCK5iyh+yYi17iwy3/f/Yr
	 gd38V8cW8kTI4vIhgh38a56zIwVdZEkJoi+e+AOEV9NN0VeyWrlbl7rVae1pJYXz26
	 e8tEe/Ltes/97EZ9+sENjJGEYvQG4bgXu8z0VFkU=
Date: Tue, 25 Nov 2025 12:45:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Treat alt mode and status failures
 as non-fatal
Message-ID: <2025112542-affection-estranged-b67c@gregkh>
References: <20251124122030.1759-1-vulab@iscas.ac.cn>
 <20251125092039.524-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125092039.524-1-vulab@iscas.ac.cn>

On Tue, Nov 25, 2025 at 05:20:39PM +0800, Haotian Zhang wrote:
> The ucsi_register_altmodes() and ucsi_get_connector_status() can fail
> for reasons that should not prevent the port from being registered.
> These failures should be logged but should not cause the entire port
> registration to fail.
> 
> Set ret to 0 in these error paths to allow registration to continue.
> 
> Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking")
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
> - Instead of unregistering the port on alt mode/status failures,
>   treat these errors as non-fatal by setting ret = 0
> - Changed Fixes tag to b9aa02ca39a4.
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 3f568f790f39..77b05cd3917e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1656,6 +1656,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  	if (ret) {
>  		dev_err(ucsi->dev, "con%d: failed to register alt modes\n",
>  			con->num);
> +		ret = 0;
>  		goto out;
>  	}
>  
> @@ -1663,6 +1664,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  	ret = ucsi_get_connector_status(con, false);
>  	if (ret) {
>  		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
> +		ret = 0;
>  		goto out;
>  	}
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

