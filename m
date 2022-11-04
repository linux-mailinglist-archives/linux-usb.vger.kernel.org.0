Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18258619A4E
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 15:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbiKDOlj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 10:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232269AbiKDOlK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 10:41:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D703D31F9E
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 07:40:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 64F03B82E2E
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 14:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7480C433C1;
        Fri,  4 Nov 2022 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667572799;
        bh=FZHcKJtH1nWGlUxJceSsA0/MN+cQyWvrRA3fPDtqXLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OmE2B6zx9iLJYezWDtZlnpTo4R7utGZVGk8hNs0GCk7yuuJ5mi3+6bNHgL8ZcG35M
         Sd1CH8PKKhtamMaA3FibEEiDlh2pwWyzxf+qEYDa6fQ5RHhlp8/WWwlm9tuRPrNlFg
         Br/BTZfFvgPIafoeRCfC2S+/cg/4u99JPakPA9zI=
Date:   Fri, 4 Nov 2022 15:39:55 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Albert Zhou <albert.zhou.50@gmail.com>
Cc:     linux-usb@vger.kernel.org, nic_swsd@realtek.com
Subject: Re: [PATCH net-next 1/2] Reverse
 744d49daf8bd3b17b345c836f2e6f97d49fa6ae8 so that the v2 r8152 driver can use
 netif_set_gso_max_*
Message-ID: <Y2UkO7N0+A4zH4nu@kroah.com>
References: <20221104132526.64530-1-albert.zhou.50@gmail.com>
 <20221104132526.64530-2-albert.zhou.50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104132526.64530-2-albert.zhou.50@gmail.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 05, 2022 at 12:25:25AM +1100, Albert Zhou wrote:
> ---
>  include/linux/netdevice.h | 21 +++++++++++++++++++++
>  net/core/dev.h            | 21 ---------------------
>  2 files changed, 21 insertions(+), 21 deletions(-)

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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
