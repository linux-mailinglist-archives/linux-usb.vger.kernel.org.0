Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0A43FD384
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 07:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242361AbhIAF5O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 01:57:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:48416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242368AbhIAF5D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 01:57:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8909C60F23;
        Wed,  1 Sep 2021 05:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630475767;
        bh=3XoMMABazip5Pdie/ihLagEB12j+RZRXKFqHWEuJJqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VQhvNiA/sL8Ckc5/WmosrGpCT++CEu5Pf4OqFDk9/tEPyRoCoKlY7xxqXv+MqcnA2
         g22CYIsw9AJPS3ABlqgXdZzeRY+gAk5bSrWknUkBUglDHCY7VxwueqJPacMQRMpR2V
         ZWsaXOd6ycdiIizZzDZCAMtUV3218qzZKwtohTr4=
Date:   Wed, 1 Sep 2021 07:56:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "faizel.kb" <faizel.kb@dicortech.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: testusb: Fix for showing the connection speed
Message-ID: <YS8V9Jz/MivXiaZc@kroah.com>
References: <20210831174742.105621-1-faizel.kb@dicortech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831174742.105621-1-faizel.kb@dicortech.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 31, 2021 at 11:17:42PM +0530, faizel.kb wrote:
> 'testusb' application which uses 'usbtest' driver reports 'unknown speed'
> from the function 'find_testdev'. The variable 'entry->speed' was not
> updated from  the application. The IOCTL mentioned in the FIXME comment can
> only report whether the connection is low speed or not. Speed is read using
> the IOCTL USBDEVFS_GET_SPEED which reports the proper speed grade.  The
> call is implemented in the function 'handle_testdev' where the file
> descriptor was availble locally. Sample output is given below where 'high
> speed' is printed as the connected speed.
> 
> sudo ./testusb -a
> high speed      /dev/bus/usb/001/011    0
> /dev/bus/usb/001/011 test 0,    0.000015 secs
> /dev/bus/usb/001/011 test 1,    0.194208 secs
> /dev/bus/usb/001/011 test 2,    0.077289 secs
> /dev/bus/usb/001/011 test 3,    0.170604 secs
> /dev/bus/usb/001/011 test 4,    0.108335 secs
> /dev/bus/usb/001/011 test 5,    2.788076 secs
> /dev/bus/usb/001/011 test 6,    2.594610 secs
> /dev/bus/usb/001/011 test 7,    2.905459 secs
> /dev/bus/usb/001/011 test 8,    2.795193 secs
> /dev/bus/usb/001/011 test 9,    8.372651 secs
> /dev/bus/usb/001/011 test 10,    6.919731 secs
> /dev/bus/usb/001/011 test 11,   16.372687 secs
> /dev/bus/usb/001/011 test 12,   16.375233 secs
> /dev/bus/usb/001/011 test 13,    2.977457 secs
> /dev/bus/usb/001/011 test 14 --> 22 (Invalid argument)
> /dev/bus/usb/001/011 test 17,    0.148826 secs
> /dev/bus/usb/001/011 test 18,    0.068718 secs
> /dev/bus/usb/001/011 test 19,    0.125992 secs
> /dev/bus/usb/001/011 test 20,    0.127477 secs
> /dev/bus/usb/001/011 test 21 --> 22 (Invalid argument)
> /dev/bus/usb/001/011 test 24,    4.133763 secs
> /dev/bus/usb/001/011 test 27,    2.140066 secs
> /dev/bus/usb/001/011 test 28,    2.120713 secs
> /dev/bus/usb/001/011 test 29,    0.507762 secs
> 
> Signed-off-by: faizel.kb <faizel.kb@dicortech.com>
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
