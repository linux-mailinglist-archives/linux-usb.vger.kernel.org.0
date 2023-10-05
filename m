Return-Path: <linux-usb+bounces-1121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7F7B9C86
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 12:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id D06451C209E9
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 10:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571DCF4FD;
	Thu,  5 Oct 2023 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fjEwZzK1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A501D1C3D
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 10:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E296C3277B;
	Thu,  5 Oct 2023 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696502337;
	bh=3NfsHn19rETXkk2lYFVHIBJwrkdAAXqnw2MNhVV6r1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjEwZzK1bsTHG5s4POhFz05txxRyuNj/LPmCyJz9+FSHhtVfzsTlgAY0K8P1yRzwp
	 MBz6b3vJIQBC/afgdoQWPLZrPCFOlsCBbQCW7o1YkQrzNARSY+OQlbtFolWJrLZPLy
	 tyX+MnHFoisOutzjizurpc6RXn6i/rcye8HkjSXU=
Date: Thu, 5 Oct 2023 12:38:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: michal.simek@amd.com, Thinh.Nguyen@synopsys.com, robh@kernel.org,
	herve.codina@bootlin.com, yangbin@rock-chips.com,
	pgwipeout@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH] usb: dwc3: core: disable 3.0 clock when operating in 2.0
 device mode
Message-ID: <2023100541-iodize-turbofan-1434@gregkh>
References: <20231005102725.8458-1-piyush.mehta@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005102725.8458-1-piyush.mehta@amd.com>

On Thu, Oct 05, 2023 at 03:57:25PM +0530, Piyush Mehta wrote:
> The GUCTL1.DEV_FORCE_20_CLK_FOR_30_CLK bit enable the feature of internal
> 2.0(utmi/ulpi) clock to be routed as the 3.0 (pipe) clock. This feature is
> applicable when core is operating in 2.0 device mode.
> 
> When this bit is set in host mode and core is in 2.0 device mode (maximum
> speed = high-speed) then usb super speed devices not detected on host.
> 
> To address the above issue added usb device mode conditional check.
> 
> Fixes: 62b20e6e0dde ("usb: dwc3: core: do not use 3.0 clock when operating in 2.0 mode")
> Signed-off-by: Piyush Mehta <piyush.mehta@amd.com>
> ---
> DWC3 Register Map Link:
> https://docs.xilinx.com/r/en-US/ug1087-zynq-ultrascale-registers/GUCTL1-USB3_XHCI-Register
> Register Name	GUCTL1
> Bit: 26 
> Bit Name: DEV_FORCE_20_CLK_FOR_30_CLK
> ---
>  drivers/usb/dwc3/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 9c6bf054f15d..0cf1fe60628b 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1202,6 +1202,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  			reg |= DWC3_GUCTL1_PARKMODE_DISABLE_HS;
>  
>  		if (DWC3_VER_IS_WITHIN(DWC3, 290A, ANY) &&
> +		    (dwc->dr_mode == USB_DR_MODE_PERIPHERAL) &&
>  		    (dwc->maximum_speed == USB_SPEED_HIGH ||
>  		     dwc->maximum_speed == USB_SPEED_FULL))
>  			reg |= DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
> -- 
> 2.17.1
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
  Documetnation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

