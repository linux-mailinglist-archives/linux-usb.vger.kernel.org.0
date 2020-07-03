Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F078D21355D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgGCHpt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:45:49 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41229 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgGCHps (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 03:45:48 -0400
Received: by mail-lf1-f66.google.com with SMTP id c11so17924302lfh.8
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 00:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9yOJcKgqR68FNoGPBIA88L+rqrI5u1cDt5c2AywGptM=;
        b=qobhh3FyQWwkX0EkOjA9yIBJEz88v/k+iD3tqHLV/77p7Q5+SPxN7LOxwb6oV2ah1Y
         SnjLfToC0sJcSmqCScIEiY+4Wo/Rlt+CSdws1ShJau8gQCLtfgErS5z0DHFPlvPMqEi3
         mwvLokDnZqo71GJe8aa6G5WyvvlfVRjk1//X8u+HghKenDlrUowwRlHscLDNlbLb0UQj
         qsDhW35FqGdNxlWJ7PzUO8OXmRro0IQAtbXJnrw++QqOV/gD+v+ZHFSfXFxIpyKdOt8g
         Hcb7GmTam0Bque6ZiDsC3FOpMM/E3h/oiHDUWgM+ZUpK9+m/YKYJlzKo4wzIi96EH5Lh
         7qTQ==
X-Gm-Message-State: AOAM5338BlZ6ys9YaK+7kurAjAYjWF3HNiGlwee6Uij8sHWfvX/beXZz
        sq96GjCM8RNZChxGHehXhXA2ur6Kcj0=
X-Google-Smtp-Source: ABdhPJzHA1yKZ3hAB5G3dXyLp9fM0qNDlFsNEFr5iLr3u1kCzurG7LW7zPomvJmf5+WSgm5+KO4kXg==
X-Received: by 2002:ac2:5619:: with SMTP id v25mr21214976lfd.117.1593762345315;
        Fri, 03 Jul 2020 00:45:45 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o201sm4346696lff.8.2020.07.03.00.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 00:45:44 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jrGOB-0005vB-Hp; Fri, 03 Jul 2020 09:45:40 +0200
Date:   Fri, 3 Jul 2020 09:45:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200703074539.GB3453@localhost>
References: <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
 <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 01, 2020 at 09:28:25PM +0200, Jerry wrote:
> Johan Hovold wrote on 7/1/20 5:42 PM:
> > It would be better if could detect both types of overrun.
> >
> > Did you try moving the purge command at close to after disabling the
> > uart?
> >
> > Or perhaps we can add a "dummy" comm-status command after disabling the
> > uart?

> I try to describe more details about this overrun problem:
> 1) I tried only CP2102 because our company uses it, I have no idea whether 
> the same apply for CP2104,2105... or not, I don't have another chip.
> 2) Maybe I should note I'm always using even parity (because of STM32 
> bootloader protocol).
> 3) I thought the problem is created by unreaded data when closing because 
> overrun was reported after closing if GET_COMM_STATUS shown positive 
> ulAmountInInQueue before closing. Later I discovered that if I close the 
> port, wait, send some data from outside, then open it, I will also get 
> HW_OVERRUN flag.
> 4) So currently I suppose that problem is usually created by any incoming 
> data after disabling interface. If I remove UART_DISABLE from close method, 
> no overrun ever reported.
> 5) Unfortunately this overrun is not reported immediately after port 
> opening but later after receiving first byte. I didn't find any way how to 
> purge nor dummy read this flag before transmitting data.
> 6) I didn't find this problem in a chip errata and nobody complaining about it.
> 7) I successfully reproduced the same problem in MS Windows 10. If some 
> data arrived to closed port, then I open it, everything is OK but after 
> sending request and receiving reply I often get overrun indication from 
> Win32 API ClearCommError()
> 8) I removed HW_OVERRUN checking because I don't want to break anything but 
> maybe Linux driver should work the same way as Windows and don't hide this 
> problem?
> 9) I needed just to detect parity error from user space and things 
> complicate.  :-)

Heh, yeah, it tends to be that way. :) But thanks for the great summary
of your findings!

I think it probably makes most sense to keep the error in as it's a
quirk of the device rather than risk missing an actual overrun.

The problem here is that we're sort of violating the API and turning
TIOCGICOUNT into a polling interface instead of just returning our error
and interrupt counters. This means will always undercount any errors for
a start.

The chip appears to have a mechanism for reporting errors in-band, but
that would amount to processing every character received to look for the
escape char, which adds overhead. I'm guessing that interface would also
insert an overrun error when returning the first character.

But perhaps that it was we should be using as it allows parity the
errors to be reported using the normal in-band methods. If we only
enable it when parity checking is enabled then the overhead seems
justified.

I did a quick test here and the event insertion appears to work well for
parity errors. Didn't manage to get it to report break events yet, and
modem-status changes are being buffered and not reported until the next
character. But in theory we could expand the implementation to provide
more features later.

I'll see if I can cook something up quickly.

> >>    /*
> >> - * Read how many bytes are waiting in the TX queue.
> >> + * Read how many bytes are waiting in the TX queue and update error counters.
> >>     */
> >> -static int cp210x_get_tx_queue_byte_count(struct usb_serial_port *port,
> >> -		u32 *count)
> >> +static int cp210x_get_comm_status(struct usb_serial_port *port,
> >> +		u32 *tx_count)
> >>    {
> >>    	struct usb_serial *serial = port->serial;
> >>    	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
> >> @@ -855,7 +865,17 @@ static int cp210x_get_tx_queue_byte_coun
> >>    			0, port_priv->bInterfaceNumber, sts, sizeof(*sts),
> >>    			USB_CTRL_GET_TIMEOUT);
> >>    	if (result == sizeof(*sts)) {
> >> -		*count = le32_to_cpu(sts->ulAmountInOutQueue);
> >> +		u32 flags = le32_to_cpu(sts->ulErrors);
> >> +		if (flags & CP210X_SERIAL_ERR_BREAK)
> >> +			port->icount.brk++;
> >> +		if (flags & CP210X_SERIAL_ERR_FRAME)
> >> +			port->icount.frame++;
> >> +		if (flags & CP210X_SERIAL_ERR_QUEUE_OVERRUN)
> >> +			port->icount.overrun++;
> >> +		if (flags & CP210X_SERIAL_ERR_PARITY)
> >> +			port->icount.parity++;
> >> +		if (tx_count)
> >> +			*tx_count = le32_to_cpu(sts->ulAmountInOutQueue);
> >>    		result = 0;
> >>    	} else {
> >>    		dev_err(&port->dev, "failed to get comm status: %d\n", result);
> >> @@ -873,13 +893,26 @@ static bool cp210x_tx_empty(struct usb_s
> >>    	int err;
> >>    	u32 count;
> >>    
> >> -	err = cp210x_get_tx_queue_byte_count(port, &count);
> >> +	err = cp210x_get_comm_status(port, &count);
> >>    	if (err)
> >>    		return true;
> >>    
> >>    	return !count;
> >>    }
> > It seems a bit weird to be updating the error counters while polling
> > for tx-empty during close. How about having cp210x_get_comm_status()
> > take two u32 pointers for tx_count and errors and only pass in one or
> > the other from cp210x_tx_empty() and cp210x_get_icount() respectively?

> I suppose that GET_COMM_STATUS reads and CLEAR pending error flags (not 
> explained in datasheet but behaves that way). So if some errors are 
> reported during cp210x_tx_empty() it can be either counted immediately or 
> lost. I'm not sure if cp210x_tx_empty() is called ONLY during close but 
> seems be more consistent to count every detected error regardless who calls 
> GET_COMM_STATUS.

tx_empty() is called when waiting for data to be drained for example
during close but also on when changing terminal settings with TCSADRAIN
or on tcdrain().

Since we wouldn't be counting errors during normal operation it seems
arbitrary to be counting during these seemingly unrelated calls. Better
to only poll from TIOCGICOUNT, if we decide to go with that approach at
all.

> >> +static int cp210x_get_icount(struct tty_struct *tty,
> >> +		struct serial_icounter_struct *icount)
> >> +{
> >> +	struct usb_serial_port *port = tty->driver_data;
> >> +	int result;
> >> +
> >> +	result = cp210x_get_comm_status(port, NULL);
> >> +	if (result)
> >> +		return result;
> > And then you update the error counters here, preferably under the port
> > lock.

> I wasn't sure about port lock. I looked in several usb drivers (ftdi, 
> pl2303) and it seems that port->icount.xxx increments are usually done out 
> of lock. But if you wish I put increments into 
> spin_lock_irqsave(&port->lock, flags), correct?

Correct.

It's quite possible that that's missing elsewhere, but at least those
counters are updated in completion callbacks which do not run in
parallel unlike ioctls(), which are not serialised.

Johan
