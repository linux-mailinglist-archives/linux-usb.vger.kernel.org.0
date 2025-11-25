Return-Path: <linux-usb+bounces-30890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2FC83FD6
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 09:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E899A3AB637
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 08:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8614B2D9EE6;
	Tue, 25 Nov 2025 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X9FH4+a1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A61DF273;
	Tue, 25 Nov 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059578; cv=none; b=tMb9Qq/sumSNFh+RuvWn7shc8Ur8LHFDGIfgSBJCoLpXyvj/QaxqzN9gB6Xl6JJo7IAargPN8FAxw6euot5rFpmBmYliaj3TbqylB5FPiEol7YSXvHDHZ1Ga4vSWlIY0A31UR2YBU3skn+C75XcX7x85Eoh1RCictWg+T9qM+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059578; c=relaxed/simple;
	bh=RVnrbj5dVUlDNMj0lYNciyb3/B5xxeWEQzwXe3cIHvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+8HZRvQCRZcpjnx1zcTiyKbPfj7mOzjf13vWY8dWfn/OuNgqDFTSVaD2J+LEE97B/FA5GsGGDyCZTyexg2EyFJr6nhFg+yPaL49+HvyhL85G/G1KMG9YqO0nu28REdiHwnv6EhEL/eV2wSpRYQASWWV1n5MSdt+7wUQ8Gpf6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X9FH4+a1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CF2C4CEF1;
	Tue, 25 Nov 2025 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764059577;
	bh=RVnrbj5dVUlDNMj0lYNciyb3/B5xxeWEQzwXe3cIHvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9FH4+a1JqQzM9OqPq5zhok1lSLyzQ7NPpaPxRegNJt5jBZuuivFohu5S9JiPRuwm
	 r8w7CSsi+Wr7sTakD3T7MLDQP64ja4NdRhv2ctqFNvJtzYnjhf0Z4Zi14pDwma1EcO
	 qS83FHW5htcj1A3Bpk3mQCgcVTBzsPujDe/NjF0c=
Date: Tue, 25 Nov 2025 09:32:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
	mitltlatltl@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: fix probe failure in
 gaokun_ucsi_probe()
Message-ID: <2025112544-chair-quintet-8810@gregkh>
References: <20251125082505.52249-1-duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125082505.52249-1-duoming@zju.edu.cn>

On Tue, Nov 25, 2025 at 04:25:05PM +0800, Duoming Zhou wrote:
> The gaokun_ucsi_probe() uses ucsi_create() to allocate a UCSI instance.
> The ucsi_create() validates whether ops->poll_cci is defined, and if not,
> it directly returns -EINVAL. However, the gaokun_ucsi_ops structure dose
> not define the poll_cci, causing ucsi_create() always fail with -EINVAL.
> This issue can be observed in the kernel log with the following error:
> 
> ucsi_huawei_gaokun.ucsi huawei_gaokun_ec.ucsi.0: probe with driver
> ucsi_huawei_gaokun.ucsi failed with error -22
> 
> Fix the issue by adding the missing poll_cci callback to gaokun_ucsi_ops.
> 
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index 7b5222081bb..8401ab414bd 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -196,6 +196,7 @@ static void gaokun_ucsi_connector_status(struct ucsi_connector *con)
>  const struct ucsi_operations gaokun_ucsi_ops = {
>  	.read_version = gaokun_ucsi_read_version,
>  	.read_cci = gaokun_ucsi_read_cci,
> +	.poll_cci = gaokun_ucsi_read_cci,
>  	.read_message_in = gaokun_ucsi_read_message_in,
>  	.sync_control = ucsi_sync_control_common,
>  	.async_control = gaokun_ucsi_async_control,
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

