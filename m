Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822F13302B4
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 16:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhCGPee (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 10:34:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:34534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231255AbhCGPe0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Mar 2021 10:34:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC6DC64FF2;
        Sun,  7 Mar 2021 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615131266;
        bh=Oi1REi9xF/Phx7g48pUqGdpB9+a2fOAwURK/nM0UL+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AVTQBbi4/n321c1B70cFeBM1iqQmKktDaH7rUGpScbfIVtNvndyB0x5Do6FzEiaEr
         AQYgKPxWngDups7HZlJp64QpAOXOucS6m9CiAad34PcXS7lG5YOyYPrKBy1daqeswG
         A8FfyX0TDRH5/l6ccUVWbOlsbJFOJHyflC77PkxM=
Date:   Sun, 7 Mar 2021 16:34:24 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Aaron Dewes <aaron.dewes@web.de>
Cc:     hdegoede@redhat.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Add unusal uas devices reported by Umbrel users
Message-ID: <YETygHPBxwGb22Vq@kroah.com>
References: <aaron.dewes@web.de>
 <20210307151830.38070-1-aaron.dewes@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307151830.38070-1-aaron.dewes@web.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 07, 2021 at 04:18:30PM +0100, Aaron Dewes wrote:
> ---
>  drivers/usb/storage/unusual_uas.h | 70 +++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)

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
