Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26769195789
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 13:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgC0Mxc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 08:53:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:46474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgC0Mxc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Mar 2020 08:53:32 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A70C206F2;
        Fri, 27 Mar 2020 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585313608;
        bh=6ro6CMWaMjOON82CVmXwD9E5aPtOtQYIAbTfXSfoVzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AAWps3E0RUDZnDMf4We2Lrnp933Tw/hd9Xa1rCdkY4sp0wN7ytHx33YNN87re82UF
         Q+yOi9tLQoaTOasoBeVXQN9SWgmc0HZqbIMhjmk9qHmriIzVPWw42YhUYzgPtAq3WB
         i8YCATnHS3HsYX4y3S3I2ThlZrx3QgjbCsuMT97Y=
Date:   Fri, 27 Mar 2020 13:53:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Reichl <hias@horus.com>
Cc:     Anthony Mallet <anthony.mallet@laas.fr>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL
Message-ID: <20200327125326.GC1921196@kroah.com>
References: <20200312133101.7096-1-anthony.mallet@laas.fr>
 <20200312133101.7096-2-anthony.mallet@laas.fr>
 <20200327123722.GA3051@lenny.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327123722.GA3051@lenny.lan>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 27, 2020 at 01:37:24PM +0100, Matthias Reichl wrote:
> On Thu, Mar 12, 2020 at 02:31:01PM +0100, Anthony Mallet wrote:
> > By default, tty_port_init() initializes those parameters to a multiple
> > of HZ. For instance in line 69 of tty_port.c:
> >    port->close_delay = (50 * HZ) / 100;
> > https://github.com/torvalds/linux/blob/master/drivers/tty/tty_port.c#L69
> > 
> > With e.g. CONFIG_HZ = 250 (as this is the case for Ubuntu 18.04
> > linux-image-4.15.0-37-generic), the default setting for close_delay is
> > thus 125.
> > 
> > When ioctl(fd, TIOCGSERIAL, &s) is executed, the setting returned in
> > user space is '12' (125/10). When ioctl(fd, TIOCSSERIAL, &s) is then
> > executed with the same setting '12', the value is interpreted as '120'
> > which is different from the current setting and a EPERM error may be
> > raised by set_serial_info() if !CAP_SYS_ADMIN.
> > https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L919
> > 
> > Fixes: ba2d8ce9db0a6 ("cdc-acm: implement TIOCSSERIAL to avoid blocking close(2)")
> > Signed-off-by: Anthony Mallet <anthony.mallet@laas.fr>
> > ---
> > Changed in v2: fix typo (extra closing brace)
> > Changed in v3: version this patch series
> > Changed in v4: diffed against e6e6ec4 from github.com/torvalds/linux.git
> > ---
> >  drivers/usb/class/cdc-acm.c | 27 +++++++++++++++++----------
> >  1 file changed, 17 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> > index da619176deca..a41a3d27016c 100644
> > --- a/drivers/usb/class/cdc-acm.c
> > +++ b/drivers/usb/class/cdc-acm.c
> > @@ -907,6 +907,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
> >  {
> >  	struct acm *acm = tty->driver_data;
> >  	unsigned int closing_wait, close_delay;
> > +	unsigned int old_closing_wait, old_close_delay;
> >  	int retval = 0;
> >  
> >  	close_delay = msecs_to_jiffies(ss->close_delay * 10);
> > @@ -914,18 +915,24 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
> >  			ASYNC_CLOSING_WAIT_NONE :
> >  			msecs_to_jiffies(ss->closing_wait * 10);
> >  
> > +	/* we must redo the rounding here, so that the values match */
> > +	old_close_delay	= jiffies_to_msecs(acm->port.close_delay) / 10;
> > +	old_closing_wait = acm->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
> > +				ASYNC_CLOSING_WAIT_NONE :
> > +				jiffies_to_msecs(acm->port.closing_wait) / 10;
> > +
> >  	mutex_lock(&acm->port.mutex);
> >  
> > -	if (!capable(CAP_SYS_ADMIN)) {
> > -		if ((close_delay != acm->port.close_delay) ||
> > -		    (closing_wait != acm->port.closing_wait))
> > +	if ((ss->close_delay != old_close_delay) ||
> > +            (ss->closing_wait != old_closing_wait)) {
> > +		if (!capable(CAP_SYS_ADMIN))
> >  			retval = -EPERM;
> > -		else
> > -			retval = -EOPNOTSUPP;
> > -	} else {
> > -		acm->port.close_delay  = close_delay;
> > -		acm->port.closing_wait = closing_wait;
> > -	}
> > +		else {
> > +			acm->port.close_delay  = close_delay;
> > +			acm->port.closing_wait = closing_wait;
> > +		}
> > +	} else
> > +		retval = -EOPNOTSUPP;
> 
> Swapping the order of the capability / close settings checks introduced
> a rather unexpected regression: when running with CAP_SYS_ADMIN we now
> get -EOPNOTSUPP when the close settings are unchanged.
> 
> This will break programs / scripts that set these settings to fixed
> values.
> 
> eg (tested on vanilla 5.4.28) changing the settings works, but
> setting the same value again fails:
> 
> # setserial -a /dev/ttyACM0
> /dev/ttyACM0, Line 0, UART: unknown, Port: 0x0000, IRQ: 0
> 	Baud_base: 9600, close_delay: 50, divisor: 0
> 	closing_wait: 3000
> 	Flags: spd_normal
> 
> # setserial /dev/ttyACM0 closing_wait 2000
> # setserial /dev/ttyACM0 closing_wait 2000
> Cannot set serial info: Operation not supported
> 
> >From the commit message it's not clear why this behaviour was changed
> so I suspect this might be a bug.

Looks like a bug :(

Care to send a patch to fix this up?

thanks,

greg k-h
