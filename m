Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7DB48783F
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 14:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347576AbiAGNcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 08:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347592AbiAGNcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jan 2022 08:32:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7ABDC061574
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 05:32:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3CAB8B825EC
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 13:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A28C36AE0;
        Fri,  7 Jan 2022 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641562349;
        bh=UPAmDhDICw4iRh8vJc7o1fT8jZ5bRltV1kZlxLS2pRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=skaGmwwX7bVAxhaZyHnVntRii3lN/oQE4jOyw8IWk7UXi7R3s+v1Me0Tl5e80C0X2
         PyXNbWoMCFeN9unu2Cx2uh//FtUktnCVsowcoTPQM38lM0/izHLEIoGwXXglbvwPKY
         dqx2w/yDlcEgnuuFXmrzGNf2WV6vVym+Xe45p8hg=
Date:   Fri, 7 Jan 2022 14:32:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2] docs: ABI: fixed formatting in
 configfs-usb-gadget-uac2
Message-ID: <YdhA6jekjUDRiRe1@kroah.com>
References: <20220107131527.376364-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107131527.376364-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 07, 2022 at 02:15:27PM +0100, Pavel Hofman wrote:
> Added missing tab, line breaks.
> 
> Fixes: e3088ebc1b97 ("docs: ABI: added missing num_requests param to UAC2")
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/ABI/testing/configfs-usb-gadget-uac2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> index 9cddadc53e0b..7fb3dbe26857 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> @@ -30,6 +30,6 @@ Description:
>  					(in 1/256 dB)
>  		p_volume_res		playback volume control resolution
>  					(in 1/256 dB)
> -		req_number	the number of pre-allocated requests for both capture
> -					and playback
> +		req_number		the number of pre-allocated requests
> +					for both capture and playback
>  		=====================	=======================================
> -- 
> 2.25.1
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
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
