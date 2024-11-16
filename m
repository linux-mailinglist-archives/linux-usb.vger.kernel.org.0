Return-Path: <linux-usb+bounces-17640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4939CFD50
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2024 09:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6515DB26BB5
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2024 08:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F64193079;
	Sat, 16 Nov 2024 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EyrSskUv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC00190685
	for <linux-usb@vger.kernel.org>; Sat, 16 Nov 2024 08:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731745441; cv=none; b=Ju4ubc0K2E0X3NZzU4F/26nlT2+aqj374Y2GGizGVxfvOoBw5dGVGQLIYNH7dsCpfpFDeyF3n21gmFe9vWmPkrZVKB1pX5dKZvmXlC6eDKRfDkyiXmTELJEPXa9yczt2bN113qn9zjF+JlhXJwur4VZVsTXKZurBLz1WtVTkz0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731745441; c=relaxed/simple;
	bh=dZiUR+r8qKxrdFgFe2a7DIqql7llknPV34NAAVcIbxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1u+zGu9/fg8uxJAppF09woPXWDy40jW9siEhXqV3kVfxl2MG/j0b+Md32xc7j05SDd/7LKm4NC7PkQk+cAaceZI7D9e/AXXp6CbNThZKZyNwN4ZciPhro29D/W208xI2P7aBjURsgM9h8vbPJ2XDFTz6bxrShjqEZE1NdhqC1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EyrSskUv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAED7C4CED2;
	Sat, 16 Nov 2024 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731745441;
	bh=dZiUR+r8qKxrdFgFe2a7DIqql7llknPV34NAAVcIbxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyrSskUvgoPm0uZ2bPtMlz/ChH/Szrrnf6L526k7FUFkQxQ9TPoqxbce0qgKhlJ8I
	 1AwvnEIt38laPXL1YN/C2NcRSzUSzDJOVU0iEjVyvseMpDO6uOazH1jWkvbdiU+8PE
	 DnWNQod1d8k63VH0buyFc7Ba1xfKsxI4Od++uQKI=
Date: Sat, 16 Nov 2024 09:23:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fix OF node reference leaks in
 anx7411_typec_switch_probe()
Message-ID: <2024111629-tubby-authentic-1e3f@gregkh>
References: <20241116080938.3798365-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116080938.3798365-1-joe@pf.is.s.u-tokyo.ac.jp>

On Sat, Nov 16, 2024 at 05:09:38PM +0900, Joe Hattori wrote:
> The refcounts of the OF nodes obtained in by of_get_child_by_name()
> calls in anx7411_typec_switch_probe() are not decremented, so add
> fwnode_handle_put() calls to anx7411_unregister_switch() and
> anx7411_unregister_mux().
> 
> Fixes: e45d7337dc0e ("usb: typec: anx7411: Use of_get_child_by_name() instead of of_find_node_by_name()")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/usb/typec/anx7411.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index d1e7c487ddfb..7e61c3ac8777 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -29,6 +29,8 @@
>  #include <linux/workqueue.h>
>  #include <linux/power_supply.h>
>  
> +#include "mux.h"
> +
>  #define TCPC_ADDRESS1		0x58
>  #define TCPC_ADDRESS2		0x56
>  #define TCPC_ADDRESS3		0x54
> @@ -1088,6 +1090,7 @@ static void anx7411_unregister_mux(struct anx7411_data *ctx)
>  {
>  	if (ctx->typec.typec_mux) {
>  		typec_mux_unregister(ctx->typec.typec_mux);
> +		fwnode_handle_put(ctx->typec.typec_mux->dev.fwnode);
>  		ctx->typec.typec_mux = NULL;
>  	}
>  }
> @@ -1096,6 +1099,7 @@ static void anx7411_unregister_switch(struct anx7411_data *ctx)
>  {
>  	if (ctx->typec.typec_switch) {
>  		typec_switch_unregister(ctx->typec.typec_switch);
> +		fwnode_handle_put(ctx->typec.typec_switch->dev.fwnode);
>  		ctx->typec.typec_switch = NULL;
>  	}
>  }
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

