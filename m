Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49E95BAFD1
	for <lists+linux-usb@lfdr.de>; Fri, 16 Sep 2022 17:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbiIPPEF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Sep 2022 11:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbiIPPEE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Sep 2022 11:04:04 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5AD728F95C
        for <linux-usb@vger.kernel.org>; Fri, 16 Sep 2022 08:04:03 -0700 (PDT)
Received: (qmail 47468 invoked by uid 1000); 16 Sep 2022 11:04:02 -0400
Date:   Fri, 16 Sep 2022 11:04:02 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Liang He <windhl@126.com>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: console: Fix potential use-after-free in
 usb_console_setup()
Message-ID: <YySQYi1S7GSDw7hQ@rowland.harvard.edu>
References: <20220916073552.4093048-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916073552.4093048-1-windhl@126.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 16, 2022 at 03:35:52PM +0800, Liang He wrote:
> In usb_console_setup(), if we goto error_get_interface and the
> usb_serial_put() may finally call kfree(serial). However, the next
> line will call 'mutex_unlock(&serial->disc_mutex)' which can cause
> a potential UAF bug.

Why not just move the mutex_unlock() call up one line, before the 
usb_serial_put()?

> Fixes: 7bd032dc2793 ("USB serial: update the console driver")
> Signed-off-by: Liang He <windhl@126.com>
> ---
> 
>  I don't know if the refcount can be zero here, so if it cannot be zero,
> this code is safe and please ignore my patch.
> 
>  drivers/usb/serial/console.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
> index b97aa40ca4d1..21ac2dd6baca 100644
> --- a/drivers/usb/serial/console.c
> +++ b/drivers/usb/serial/console.c
> @@ -62,6 +62,7 @@ static int usb_console_setup(struct console *co, char *options)
>  	int cflag = CREAD | HUPCL | CLOCAL;
>  	char *s;
>  	struct usb_serial *serial;
> +	struct mutex *s_mutex;
>  	struct usb_serial_port *port;
>  	int retval;
>  	struct tty_struct *tty = NULL;
> @@ -116,7 +117,7 @@ static int usb_console_setup(struct console *co, char *options)
>  		return -ENODEV;
>  	}
>  	serial = port->serial;
> -
> +	s_mutex = &serial->disc_mutex;
>  	retval = usb_autopm_get_interface(serial->interface);
>  	if (retval)
>  		goto error_get_interface;
> @@ -190,7 +191,7 @@ static int usb_console_setup(struct console *co, char *options)
>  	usb_autopm_put_interface(serial->interface);
>   error_get_interface:
>  	usb_serial_put(serial);
> -	mutex_unlock(&serial->disc_mutex);
> +	mutex_unlock(s_mutex);

If the old code was unsafe then so is this, because s_mutex points to a 
mutex that is embedded within the serial structure.  If the structure 
was deallocated by usb_serial_put() then so was the mutex.

Alan Stern

>  	return retval;
>  }
>  
> -- 
> 2.25.1
> 
