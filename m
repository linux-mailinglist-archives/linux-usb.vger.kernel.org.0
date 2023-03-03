Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C736A952F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Mar 2023 11:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjCCK2r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 05:28:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjCCK2q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 05:28:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A25149A7
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 02:28:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BAB35617C6
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 10:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE60EC433D2;
        Fri,  3 Mar 2023 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677839324;
        bh=EX/04gNQP+qW6JRjEbxXeOZngWlw+48uJ7spIKPvKxE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qx86xCqGpockmS9mXOqZo2XTdVjdJpbI8RTCLMhb4z9hpk/4YLxD7tXvYQpnj2h4y
         GC77J0JLJPyxdOnbOmcXe2kPSStqr8/KF6N9bau76mEp5n8Ces3sc5ptU+cN06ay7J
         Fh4bNsAaNJABpLLXzQ4Cha1GrNOuBY5DNMk2lptM=
Date:   Fri, 3 Mar 2023 11:28:41 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [RFC PATCH 1/2] usb: urb: show pipe information of warning
 message in usb_submit_urb()
Message-ID: <ZAHL2Xs7MO2h25Ff@kroah.com>
References: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 03, 2023 at 05:28:37PM +0800, Linyu Yuan wrote:
> it will show the urb information for debugging.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/core/urb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 9f3c540..b258203 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -376,7 +376,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>  	if (!urb || !urb->complete)
>  		return -EINVAL;
>  	if (urb->hcpriv) {
> -		WARN_ONCE(1, "URB %pK submitted while active\n", urb);
> +		WARN_ONCE(1, "URB %pK pipe %x submitted while active\n", urb, urb->pipe);
>  		return -EBUSY;
>  	}
>  
> -- 
> 2.7.4
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
