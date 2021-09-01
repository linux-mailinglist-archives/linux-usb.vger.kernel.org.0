Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0AD3FE251
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 20:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhIASZI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 14:25:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:55850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229679AbhIASZH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 14:25:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1358860F6F;
        Wed,  1 Sep 2021 18:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630520650;
        bh=k1LZvyZuTSucT9DCEGimwpnMcyXCqyFC9NES9zb169o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AiAlBck7aKHUyX3Wwq8rg9n1pyPGjQTz242LCnBIPSoCBxOMiO8gjxhJVkeHLxJDo
         VypfVlimkLNiAOy7aDsCq7b/vL88/GiU/Xypp6dFFSBUiokkJvLGmUJKufmvv2D1l/
         l36ni5m3aF9wk5yQK5CwqYRhVNsH+O+3JyrnmXUw=
Date:   Wed, 1 Sep 2021 20:24:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Faizel K B <faizel.kb@dicortech.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: testusb: Fix for showing the connection speed
Message-ID: <YS/FSNrJ1xyO/ydm@kroah.com>
References: <YS8V9Jz/MivXiaZc@kroah.com>
 <20210901181351.131378-1-faizel.kb@dicortech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901181351.131378-1-faizel.kb@dicortech.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 01, 2021 at 11:43:51PM +0530, Faizel K B wrote:
> Signed-off-by: Faizel K B <faizel.kb@dicortech.com>
> ---
>  tools/usb/testusb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
> index ee8208b2f946..69c3ead25313 100644
> --- a/tools/usb/testusb.c
> +++ b/tools/usb/testusb.c
> @@ -265,12 +265,6 @@ static int find_testdev(const char *name, const struct stat *sb, int flag)
>  	}
>  
>  	entry->ifnum = ifnum;
> -
> -	/* FIXME update USBDEVFS_CONNECTINFO so it tells about high speed etc */
> -
> -	fprintf(stderr, "%s speed\t%s\t%u\n",
> -		speed(entry->speed), entry->name, entry->ifnum);
> -
>  	entry->next = testdevs;
>  	testdevs = entry;
>  	return 0;
> @@ -299,6 +293,14 @@ static void *handle_testdev (void *arg)
>  		return 0;
>  	}
>  
> +	status  =  ioctl(fd, USBDEVFS_GET_SPEED, NULL);
> +	if (status < 0)
> +		fprintf(stderr, "USBDEVFS_GET_SPEED failed %d\n", status);
> +	else
> +		dev->speed = status;
> +	fprintf(stderr, "%s speed\t%s\t%u\n",
> +			speed(dev->speed), dev->name, dev->ifnum);
> +
>  restart:
>  	for (i = 0; i < TEST_CASES; i++) {
>  		if (dev->test != -1 && dev->test != i)
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

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
