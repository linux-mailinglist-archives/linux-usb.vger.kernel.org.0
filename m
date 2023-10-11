Return-Path: <linux-usb+bounces-1444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC347C4F3C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 11:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C841C20E5D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 09:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2001D529;
	Wed, 11 Oct 2023 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N44/Ja7k"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C6B354FE
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 09:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E817C433C7;
	Wed, 11 Oct 2023 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697017132;
	bh=Y76TDt33I97bzSw1nXn1NZilnt71zYt4bkqpRWEzabE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N44/Ja7ksmBEceyzJoqV9WahAvh/90uVJ1UFsfgqjN4EZk1TETNdxAPT8XT4JT+cu
	 3ZeFzH4IIdpSQgV2YzZa2mMp6e/7k727P7BW/NZX3SXsO7Su55wYbmy8ikEB9oKO+Z
	 CP985163WlYe5DIW++LzX758ZDZw3+kV4z81Qubg=
Date: Wed, 11 Oct 2023 11:38:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Douglas Gilbert <dgilbert@interlog.com>
Subject: Re: [PATCH] usb: typec: ucsi: Fix missing link removal
Message-ID: <2023101134-division-sift-c471@gregkh>
References: <20231010141749.3912016-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010141749.3912016-1-heikki.krogerus@linux.intel.com>

On Tue, Oct 10, 2023 at 05:17:49PM +0300, Heikki Krogerus wrote:
> The link between the partner device and its USB Power
> Delivery instance was never removed which prevented the
> device from being released. Removing the link always when
> the partner is unregistered.
> 
> Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
> Reported-by: Douglas Gilbert <dgilbert@interlog.com>
> Closes: https://lore.kernel.org/linux-usb/ZSUMXdw9nanHtnw2@kuha.fi.intel.com/
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index f3ba2997004a..c9a032a5dbd0 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -787,6 +787,7 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
>  
>  	typec_set_mode(con->port, TYPEC_STATE_SAFE);
>  
> +	typec_partner_set_usb_power_delivery(con->partner, NULL);
>  	ucsi_unregister_partner_pdos(con);
>  	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_SOP);
>  	typec_unregister_partner(con->partner);
> -- 
> 2.40.1
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

