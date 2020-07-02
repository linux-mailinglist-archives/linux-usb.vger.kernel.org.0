Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77204211D23
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 09:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgGBHiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 03:38:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:33936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgGBHiY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 03:38:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D367620899;
        Thu,  2 Jul 2020 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593675504;
        bh=2kqEZgOn+zbQL4Nv96XtNz0ZOuty16P4oLSrKnqr9NE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c75+bvaWLmfhQXlWT/ID5XFesa6tDjqwty63O+6R9/Ss6F5x9xO4sPKa+CLN80xLH
         s6vZKtoYWq3z6yXPFCjPKA97DLaFBlytKmHDF9hlOnjt+SusgEDQEW2NV4MvSujV+9
         R53wyh2R6gPro3oIx2WUXN67qLcO8Rkak3r/4Ik8=
Date:   Thu, 2 Jul 2020 09:38:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: console: add support for enabling flow
 control
Message-ID: <20200702073828.GF1073011@kroah.com>
References: <20200701173722.4536-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701173722.4536-1-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 01, 2020 at 07:37:22PM +0200, Johan Hovold wrote:
> Add support for enabling hardware flow control using the 'r' command
> line option.
> 
> This also avoids a W=1 (-Wunused-but-set-variable) warning.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> 
> Missed this one at first... The white space change is done on purpose to
> remove a stray tab.
> 
> Johan
> 
> 
>  drivers/usb/serial/console.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
> index 7d289302ff6c..b97aa40ca4d1 100644
> --- a/drivers/usb/serial/console.c
> +++ b/drivers/usb/serial/console.c
> @@ -79,7 +79,7 @@ static int usb_console_setup(struct console *co, char *options)
>  		if (*s)
>  			doflow = (*s++ == 'r');
>  	}
> -	
> +
>  	/* Sane default */
>  	if (baud == 0)
>  		baud = 9600;
> @@ -102,6 +102,9 @@ static int usb_console_setup(struct console *co, char *options)
>  		break;
>  	}
>  
> +	if (doflow)
> +		cflag |= CRTSCTS;
> +
>  	/*
>  	 * no need to check the index here: if the index is wrong, console
>  	 * code won't call us
> -- 
> 2.26.2
> 

Nice fix!

And I think one of the first real "bugfixes" that have come out of the
recent W=1 work...

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
