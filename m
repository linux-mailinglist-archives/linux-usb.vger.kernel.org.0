Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7512625A506
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 07:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgIBF26 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 01:28:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:36164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbgIBF26 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 01:28:58 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5B42206C0;
        Wed,  2 Sep 2020 05:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599024537;
        bh=u56V47kdvbxSZB3MYtzI20aTBAt2bNxOtJ7Bft11JzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uHbIcuLagw9ANLAta9UOPdzQiB3y0BmHVld54wbxiYUNRD/hZx6zyKQ20p++Na8IQ
         qz2F7PbibKq6YTzh35JxnGjLjaGBcw8Wvdrx6Omuuev56VNPQ7R8OR2nKrEHyfXM65
         85nss8ylKnnOT7LbULg+pWURqdh1rFr6H8+wukeg=
Date:   Wed, 2 Sep 2020 07:28:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jean-Francois Pirus <jfp@clearfield.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
Subject: Re: copy/paste error in unusual_uas.h  from commit bc3bdb1
Message-ID: <20200902052853.GA138608@kroah.com>
References: <8b0d02a71c781c1325a491f6450df0876d724d85.camel@clearfield.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b0d02a71c781c1325a491f6450df0876d724d85.camel@clearfield.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 02, 2020 at 05:14:12PM +1200, Jean-Francois Pirus wrote:
> Looks like a copy/paste error from the previous entry.
> 
> patch:
> 
> --- unusual_uas.h.org	2020-09-02 17:00:32.295919812 +1200
> +++ unusual_uas.h	2020-09-02 17:01:02.596173298 +1200
> @@ -69,7 +69,7 @@
>  /* Reported-by: David Kozub <zub@linux.fjfi.cvut.cz> */
>  UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>  		"JMicron",
> -		"JMS567",
> +		"JMS578",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_BROKEN_FUA),
> 
> Thanks.
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

- Your patch was sent privately to Greg.  Kernel development is done in
  public, please always cc: a public mailing list with a patch
  submission.  Using the tool, scripts/get_maintainer.pl on the patch
  will tell you what mailing list to cc.

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
